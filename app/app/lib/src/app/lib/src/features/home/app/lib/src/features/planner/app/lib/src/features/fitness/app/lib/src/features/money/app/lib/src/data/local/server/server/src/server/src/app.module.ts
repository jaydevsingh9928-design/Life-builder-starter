import { Module } from '@nestjs/common';
import { GoalsModule } from './goals/goals.module.js';
import { TasksModule } from './tasks/tasks.module.js';
import { AiModule } from './ai/ai.module.js';

@Module({
  imports: [GoalsModule, TasksModule, AiModule],
})
export class AppModule {}
