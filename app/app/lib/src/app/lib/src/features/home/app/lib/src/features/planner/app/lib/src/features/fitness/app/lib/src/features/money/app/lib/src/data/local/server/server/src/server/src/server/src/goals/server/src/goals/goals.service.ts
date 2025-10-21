import { Injectable } from '@nestjs/common';
import { v4 as uuid } from 'uuid';

export type Goal = {
  id: string;
  type: 'fitness'|'income'|'routine';
  outcome: string;
  start: string;
  end: string;
};

@Injectable()
export class GoalsService {
  private goals: Goal[] = [];
  list() { return this.goals; }
  create(g: Omit<Goal, 'id'>) {
    const goal = { id: uuid(), ...g };
    this.goals.push(goal);
    return goal;
  }
}
