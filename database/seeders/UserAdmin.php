<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use DB;

class UserAdmin extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('model_has_roles')->insert([
            'role_id'=>'3',
            'model_type'=>'App\Models\User',
            'model_id'=>'1'
        ]);
    }
}
