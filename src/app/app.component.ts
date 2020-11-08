import {Component, OnInit} from '@angular/core';
import {StorageService} from './services/storage.service';
import * as peg from 'pegjs';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent implements OnInit {
  public output: string;
  public error: any = null;

  public editorOptions = {
    lineNumbers: true,
    theme: 'default',
    mode: 'pegjs'
  }

  public editor2Options = {
    lineNumbers: true,
    theme: 'default',
    mode: 'plain'
  }

  public constructor(public storage: StorageService) {
  }

  ngOnInit(): void {
    this.parse();
  }

  public parse() {
    this.error = null;
    let parser = peg.generate(this.storage.peg);
    try {
      this.output = parser.parse(this.storage.file).toString();
      debugger;
    } catch (e) {
      this.error = e;
    }
  }
}
