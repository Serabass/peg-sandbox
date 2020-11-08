import { Injectable } from '@angular/core';
import * as _ from 'underscore';

@Injectable({
  providedIn: 'root'
})
export class StorageService {
  private _peg: string;
  private _file: string;

  constructor() { }

  public get peg() {
    return this._peg = localStorage.getItem('peg') || '';
  }

  public get file() {
    return this._file = localStorage.getItem('file') || '';
  }

  public set peg(value: string) {
    this._peg = value;

    localStorage.setItem('peg', value);
  }

  public set file(value: string) {
    this._file = value;

    localStorage.setItem('file', value);
  }
}
