import { Injectable } from '@nestjs/common';
import { v4 as uuid } from 'uuid';

export type Task = {
  id: string;
  title: string;
  start?: string;
  end?: string;
  status: 'pending'|'done'|'skipped';
  priority: 1|2|3;
};

@Injectable()
export class TasksService {
  private tasks: Task[] = [];
  list() { return this.tasks; }
  create(t: Omit<Task,'id'>) {
    const task = { id: uuid(), ...t };
    this.tasks.push(task);
    return task;
  }
}
