<script setup>
import jquery from 'jquery';
import { Form, Field } from 'vee-validate';
import axios from 'axios';
import {ref, onMounted, reactive} from 'vue';
import * as yup from 'yup';
import { useToastr } from '../../toastr.js';

    const toastr = useToastr();
    window.$ = window.jQuery = jquery;
    const users = ref([]);
    const editing = ref(false);
    const formValues = ref();
    const form = ref(null);
    const userIdBeingDeleted = ref(null);

    const getUsers = () => {
        axios.get('/api/users')
        .then((response) => {
            users.value = response.data
        })
    };

    const createUserSchema = yup.object({
        name: yup.string().required(),
        email: yup.string().email().required(),
        password: yup.string().required().min(8),
    });

    const editUserSchema = yup.object({
        name: yup.string().required(),
        email: yup.string().email().required(),
        password: yup.string().notRequired().test('password', 'Passwords must be be minimum of 8 characters', function(value) {
            if (!!value) {
            const schema = yup.string().min(8);
            return schema.isValidSync(value);
            }
            return true;
        }),
        // password: yup.string().when((password, schema) => {
        //     return password ? schema.required().min(8) : schema
        // }),
    });

    const addUser = () => {
        editing.value = false;
        $('#userFormModal').modal('show');
    };

    const createUser = (values, { resetForm, setErrors }) => {
        axios.post('/api/users', values)
        .then((response) => {
            users.value.unshift(response.data);
            resetForm();
            $('#userFormModal').modal('hide');
            toastr.success('User created successfully!');
        })
        .catch((error) => {
            if (error.response.data.errors) {
                setErrors(error.response.data.errors);
            }
        })
    };

    const editUser = (user) => {
        editing.value = true;
        form.value.resetForm();
        $('#userFormModal').modal('show');
        formValues.value = {
            id: user.id,
            name: user.name,
            email: user.email
        };
    };

    const updateUser = (values, {setErrors}) => {
        axios.put('/api/users/' + formValues.value.id, values)
            .then((response) => {
                const index = users.value.findIndex(user => user.id === response.data.id);
                users.value[index] = response.data;
                $('#userFormModal').modal('hide');
                toastr.success('User updated successfully!');
            }).catch((error) => {
                setErrors(error.response.data.errors);
            })
            // .finally(() => {
            //     form.value.resetForm();
            // });
    };

    const handleSubmit = (values, actions) => {
        if (editing.value) {
            updateUser(values, actions);
        } else {
            createUser(values, actions);
        }
    };

    const confirmUserDeletion = (user) => {
        userIdBeingDeleted.value = user.id;
        $('#deleteUserModal').modal('show');
    };

    const deleteUser = () => {
        axios.delete(`/api/users/${userIdBeingDeleted.value}`)
        .then(() => {
            $('#deleteUserModal').modal('hide');
            users.value = users.value.filter(user => user.id !== userIdBeingDeleted.value);
            toastr.success('User deleted successfully!');
        });
    };

    onMounted(() => {
        getUsers();
    });
</script>
<template>
<div class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0">Users</h1>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                    <li class="breadcrumb-item active">Users</li>
                </ol>
            </div>
        </div>
    </div>
</div>

<div class="content">
    <div class="container-fluid">
        <button @click="addUser" type="button" class="btn btn-primary">
            Add New User
        </button>
        <div class="card">
            <div class="card-body">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th style="width: 10px;">#</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Registered</th>
                            <th>Role</th>
                            <th>Options</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="(user, index) in users" :key="users.id">
                            <td>{{ index + 1 }}</td>
                            <td>{{ user.name }}</td>
                            <td>{{ user.email }}</td>
                            <td>-</td>
                            <td>-</td>
                            <td>
                                <a href="#" @click.prevent="editUser(user)"><i class="fa fa-edit"></i></a>
                                <a href="#" @click.prevent="confirmUserDeletion(user)"><i class="fa fa-trash text-danger ml-2"></i></a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="userFormModal" data-backdrop="static" tabindex="-1" role="dialog"
    aria-labelledby="userFormModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="userFormModalLabel">
                    <span v-if="editing">Edit User</span>
                    <span v-else>Add New User</span>
                </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <Form ref="form" @submit="handleSubmit" :validation-schema="editing ? editUserSchema : createUserSchema" v-slot="{ errors }" :initial-values="formValues">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="name">Name</label>
                        <Field name="name" type="text" class="form-control" :class="{'is-invalid': errors.name }" id="name"
                            aria-describedby="nameHelp" placeholder="Enter full name" />
                            <span class="invalid-feedback">{{ errors.name }}</span>
                    </div>

                    <div class="form-group">
                        <label for="email">Email</label>
                        <Field name="email" type="email" class="form-control" :class="{'is-invalid': errors.email }" id="email"
                            aria-describedby="nameHelp" placeholder="Enter email" />
                            <span class="invalid-feedback">{{ errors.email }}</span>
                    </div>

                    <div class="form-group">
                        <label for="email">Password</label>
                        <Field name="password" type="password" class="form-control" :class="{'is-invalid': errors.password }" id="password"
                            aria-describedby="nameHelp" placeholder="Enter password" />
                            <span class="invalid-feedback">{{ errors.password }}</span>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary">Save</button>
                </div>
            </Form>
        </div>
    </div>
</div>

<div class="modal fade" id="deleteUserModal" data-backdrop="static" tabindex="-1" role="dialog"
    aria-labelledby="deleteUserModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteUserModalLabel">
                    <span>Delete User</span>
                </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <Form ref="form" @submit="handleSubmit" :validation-schema="editing ? editUserSchema : createUserSchema" v-slot="{ errors }" :initial-values="formValues">
                <div class="modal-body">
                    <p>Are you sure to you want to delete this user?</p>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <button @click.prevent="deleteUser" type="button" class="btn btn-danger">Delete</button>
                </div>
            </Form>
        </div>
    </div>
</div>

</template>