import {NgModule} from '@angular/core';
import {CommonModule} from '@angular/common';

import {DetailRoutingModule} from './detail-routing.module';

import {DetailComponent} from './detail.component';
import {SharedModule} from '../shared/shared.module';
import {CodemirrorModule} from '@ctrl/ngx-codemirror';

@NgModule({
  declarations: [DetailComponent],
  imports: [
    CommonModule,
    SharedModule,
    DetailRoutingModule,
    CodemirrorModule
  ]
})
export class DetailModule {
}
