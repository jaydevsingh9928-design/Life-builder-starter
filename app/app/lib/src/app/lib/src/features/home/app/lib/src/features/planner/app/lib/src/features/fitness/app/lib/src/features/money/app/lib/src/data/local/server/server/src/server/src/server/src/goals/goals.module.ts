import { Module } from '@nestjs/common';
import { GoalsService } from './goals.service.js';
import { GoalsController } from './goals.controller.js';

@Module({ controllers: [GoalsController], providers: [GoalsService] })
export class GoalsModule {}
