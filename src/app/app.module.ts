import 'reflect-metadata';
import '../polyfills';

import {BrowserModule} from '@angular/platform-browser';
import {NgModule} from '@angular/core';
import {FormsModule} from '@angular/forms';
import {HttpClientModule, HttpClient} from '@angular/common/http';
import {CoreModule} from './core/core.module';
import {SharedModule} from './shared/shared.module';

import {AppRoutingModule} from './app-routing.module';

// NG Translate
import {TranslateModule, TranslateLoader} from '@ngx-translate/core';
import {TranslateHttpLoader} from '@ngx-translate/http-loader';

import {HomeModule} from './home/home.module';
import {DetailModule} from './detail/detail.module';

import {AppComponent} from './app.component';
import {CodemirrorModule} from '@ctrl/ngx-codemirror';
import {IconsProviderModule} from './icons-provider.module';
import {NzLayoutModule} from 'ng-zorro-antd/layout';
import {NzMenuModule} from 'ng-zorro-antd/menu';
import {NzCollapseModule} from 'ng-zorro-antd/collapse';
import {NzButtonModule} from 'ng-zorro-antd/button';
import {NzGridModule} from 'ng-zorro-antd/grid';
import {BrowserAnimationsModule} from '@angular/platform-browser/animations';

// AoT requires an exported function for factories
export function HttpLoaderFactory(http: HttpClient): TranslateHttpLoader {
  return new TranslateHttpLoader(http, './assets/i18n/', '.json');
}

@NgModule({
  declarations: [AppComponent],
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    CoreModule,
    HttpClientModule,
    SharedModule,
    FormsModule,
    HomeModule,
    DetailModule,
    AppRoutingModule,
    TranslateModule.forRoot({
      loader: {
        provide: TranslateLoader,
        useFactory: HttpLoaderFactory,
        deps: [HttpClient]
      }
    }),
    IconsProviderModule,

    NzButtonModule,
    NzLayoutModule,
    NzMenuModule,
    NzGridModule,

    CodemirrorModule,
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule {
}
