import {Component, OnInit, ViewChild} from '@angular/core';
import {StorageService} from './services/storage.service';
import * as peg from 'pegjs';
import { CodemirrorComponent } from '@ctrl/ngx-codemirror';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent implements OnInit {
  public output: string;
  public error: any = null;

  @ViewChild('file')
  public file: CodemirrorComponent;

  @ViewChild('peg')
  public peg: CodemirrorComponent;

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
    setTimeout(() => this.parse(), 500);
  }

  public parse() {
    this.error = null;
    try {
      let parser = peg.generate(this.storage.peg);
      try {
        let result = parser.parse(this.storage.file);
        debugger;
        this.output = JSON.stringify(result, null, 2);
      } catch (e) {
        this.error = e;

        let cm = this.file.codeMirror;
        for (let i = 0; i < cm.lineCount(); i++) {
          cm.removeLineClass(i, 'wrap', 'error-line');
          cm.removeLineClass(i, 'background', 'error-line');
          cm.removeLineClass(i, 'gutter', 'error-line');
        }

        cm.addLineClass(e.location.start.line - 1, "wrap", 'error-line');
        cm.addLineClass(e.location.start.line - 1, "background", 'error-line');
        cm.addLineClass(e.location.start.line - 1, "gutter", 'error-line');
      }
    } catch (e) {
      this.error = e;
      let cm = this.peg.codeMirror;
      for (let i = 0; i < cm.lineCount(); i++) {
        cm.removeLineClass(i, 'wrap', 'error-line');
        cm.removeLineClass(i, 'background', 'error-line');
        cm.removeLineClass(i, 'gutter', 'error-line');
      }

      cm.addLineClass(e.location.start.line - 1, "wrap", 'error-line');
      cm.addLineClass(e.location.start.line - 1, "background", 'error-line');
      cm.addLineClass(e.location.start.line - 1, "gutter", 'error-line');

    }
  }
}
