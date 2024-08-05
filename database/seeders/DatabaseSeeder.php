<?php

namespace Database\Seeders;

use App\Models\Article;
use App\Models\User;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        User::factory()->state([
            'email' => 'admin@admin.com',
        ])->has(
            Article::factory()->published()->count(2)
        )->has(
            Article::factory()->count(2)
        )->create();

        User::factory()->state([
            'email' => 'admin2@admin.com',
        ])->has(
            Article::factory()->published()->count(2)
        )->has(
            Article::factory()->count(2)
        )->create();

        User::factory()
            ->count(2)
            ->has(Article::factory()->count(3))
            ->create();
    }
}
