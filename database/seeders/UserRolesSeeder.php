<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use DB;

class UserRolesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        DB::table('roles')->insert([
            'name'=>'User',
            'guard_name'=>'web'
        ]);

        DB::table('roles')->insert([
            'name'=>'Staff',
            'guard_name'=>'web'
        ]);

        DB::table('roles')->insert([
            'name'=>'Admin',
            'guard_name'=>'web'
        ]);
    }
}
