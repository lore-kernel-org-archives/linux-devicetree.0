Return-Path: <SRS0=Xnq8=HX=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-ve1eur01on0087.outbound.protection.outlook.com ([104.47.1.87]:48759
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751172AbeEDI7U (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 4 May 2018 04:59:20 -0400
From: Jun Li <jun.li@nxp.com>
Subject: RE: [PATCH v5 01/14] dt-bindings: connector: add properties for typec
Date: Fri, 4 May 2018 08:59:14 +0000
Message-ID: <VI1PR0402MB3917C957925B7175A8A16A6F89860@VI1PR0402MB3917.eurprd04.prod.outlook.com>
References: <1525307094-27402-1-git-send-email-jun.li@nxp.com>
         <1525307094-27402-2-git-send-email-jun.li@nxp.com>
         <1525332431.12348.1.camel@suse.com>
         <VI1PR0402MB3917DA4B3789475540E38E4989870@VI1PR0402MB3917.eurprd04.prod.outlook.com>
 <1525339063.12348.4.camel@suse.com>
In-Reply-To: <1525339063.12348.4.camel@suse.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Oliver Neukum <oneukum@suse.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux@roeck-us.net" <linux@roeck-us.net>
Cc: "gsomlo@gmail.com" <gsomlo@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, Peter Chen <peter.chen@nxp.com>, "shufan_lee@richtek.com" <shufan_lee@richtek.com>, "a.hajda@samsung.com" <a.hajda@samsung.com>, "cw00.choi@samsung.com" <cw00.choi@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

SGkNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogT2xpdmVyIE5ldWt1bSBb
bWFpbHRvOm9uZXVrdW1Ac3VzZS5jb21dDQo+IFNlbnQ6IDIwMTjlubQ15pyIM+aXpSAxNzoxOA0K
PiBUbzogSnVuIExpIDxqdW4ubGlAbnhwLmNvbT47IHJvYmgrZHRAa2VybmVsLm9yZzsNCj4gaGVp
a2tpLmtyb2dlcnVzQGxpbnV4LmludGVsLmNvbTsgZ3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc7
DQo+IGxpbnV4QHJvZWNrLXVzLm5ldA0KPiBDYzogZ3NvbWxvQGdtYWlsLmNvbTsgZGwtbGludXgt
aW14IDxsaW51eC1pbXhAbnhwLmNvbT47IFBldGVyIENoZW4NCj4gPHBldGVyLmNoZW5AbnhwLmNv
bT47IHNodWZhbl9sZWVAcmljaHRlay5jb207IGEuaGFqZGFAc2Ftc3VuZy5jb207DQo+IGN3MDAu
Y2hvaUBzYW1zdW5nLmNvbTsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LXVz
YkB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NSAwMS8xNF0gZHQtYmlu
ZGluZ3M6IGNvbm5lY3RvcjogYWRkIHByb3BlcnRpZXMgZm9yIHR5cGVjDQo+IA0KPiBBbSBEb25u
ZXJzdGFnLCBkZW4gMDMuMDUuMjAxOCwgMDg6MzUgKzAwMDAgc2NocmllYiBKdW4gTGk6DQo+ID4g
SGkNCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBPbGl2ZXIg
TmV1a3VtIFttYWlsdG86b25ldWt1bUBzdXNlLmNvbV0NCj4gPiA+IFNlbnQ6IDIwMTjlubQ15pyI
M+aXpSAxNToyNw0KPiA+ID4gVG86IEp1biBMaSA8anVuLmxpQG54cC5jb20+OyByb2JoK2R0QGtl
cm5lbC5vcmc7DQo+ID4gPiBoZWlra2kua3JvZ2VydXNAbGludXguaW50ZWwuY29tOyBncmVna2hA
bGludXhmb3VuZGF0aW9uLm9yZzsNCj4gPiA+IGxpbnV4QHJvZWNrLXVzLm5ldA0KPiA+ID4gQ2M6
IGdzb21sb0BnbWFpbC5jb207IGRsLWxpbnV4LWlteCA8bGludXgtaW14QG54cC5jb20+OyBQZXRl
ciBDaGVuDQo+ID4gPiA8cGV0ZXIuY2hlbkBueHAuY29tPjsgc2h1ZmFuX2xlZUByaWNodGVrLmNv
bTsNCj4gYS5oYWpkYUBzYW1zdW5nLmNvbTsNCj4gPiA+IGN3MDAuY2hvaUBzYW1zdW5nLmNvbTsg
ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7DQo+ID4gPiBsaW51eC11c2JAdmdlci5rZXJuZWwu
b3JnDQo+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHY1IDAxLzE0XSBkdC1iaW5kaW5nczogY29u
bmVjdG9yOiBhZGQgcHJvcGVydGllcw0KPiA+ID4gZm9yIHR5cGVjDQo+ID4gPg0KPiA+ID4gQW0g
RG9ubmVyc3RhZywgZGVuIDAzLjA1LjIwMTgsIDA4OjI0ICswODAwIHNjaHJpZWIgTGkgSnVuOg0K
PiA+ID4gPiArT3B0aW9uYWwgcHJvcGVydGllcyBmb3IgdXNiLWMtY29ubmVjdG9yOg0KPiA+ID4g
PiArLSBwb3dlci1yb2xlOiBzaG91bGQgYmUgb25lIG9mICJzb3VyY2UiLCAic2luayIgb3IgImR1
YWwiKERSUCkgaWYNCj4gPiA+ID4gK3R5cGVjDQo+ID4gPiA+ICvCoCBjb25uZWN0b3IgaGFzIHBv
d2VyIHN1cHBvcnQuDQo+ID4gPiA+ICstIHRyeS1wb3dlci1yb2xlOiBwcmVmZXJyZWQgcG93ZXIg
cm9sZSBpZiAiZHVhbCIoRFJQKSBjYW4gc3VwcG9ydA0KPiA+ID4gPiArVHJ5LlNOSw0KPiA+ID4g
PiArwqAgb3IgVHJ5LlNSQywgc2hvdWxkIGJlICJzaW5rIiBmb3IgVHJ5LlNOSyBvciAic291cmNl
IiBmb3IgVHJ5LlNSQy4NCj4gPiA+ID4gKy0gZGF0YS1yb2xlOiBzaG91bGQgYmUgb25lIG9mICJo
b3N0IiwgImRldmljZSIsICJkdWFsIihEUkQpIGlmDQo+ID4gPiA+ICt0eXBlYw0KPiA+ID4gPiAr
wqAgY29ubmVjdG9yIHN1cHBvcnRzIFVTQiBkYXRhLg0KPiA+ID4NCj4gPiA+IEhpLA0KPiA+ID4N
Cj4gPiA+IGlzIHRoaXMgcmVhbGx5IGNvcnJlY3Q/DQo+ID4gPg0KPiA+ID4gQ2FuIG9uZSBpbXBs
ZW1lbnQgYSBkZXZpY2UgdGhhdCBjYW4gb3BlcmF0ZSBhcyBlaXRoZXIgREZQIG9yIFVGUCwNCj4g
PiA+IGJ1dCBub3QgaW1wbGVtZW50cyB0aGUgZHluYW1pYyByb2xlIHN3aXRjaCB0aGF0IGEgRFJQ
IG11c3Qgc3VwcG9ydD8NCj4gPg0KPiA+IFlvdSBtZWFuIGEgcG9ydCB3aXRoIERSRCBvbiBkYXRh
IGJ1dCBub3QgRFJQIG9uIHBvd2VyPw0KPiA+DQo+ID4gVGhlIGRhdGEtcm9sZSBpcyBuZXdseSBh
ZGRlZCBhcyB0aGUgZGF0YSByb2xlIGlzIG5vdCBjb3VwbGVkIHdpdGgNCj4gPiBwb3dlcg0KPiAN
Cj4gTm8sIEkgbWVhbnQgZGF0YSByb2xlLiBBcyBmYXIgYXMgSSBjYW4gdGVsbCBmb3IgYSBEUlAg
eW91IG5lZWQgdG8gaW1wbGVtZW50IHRoZQ0KPiBkZXRlY3Rpb24gbG9naWMgZGVzY3JpYmVkIGlu
IGNoYXB0ZXIgNCBvZiB0aGUgc3BlYy4NCg0KQ291bGQgeW91IHBsZWFzZSBwb2ludCBtZSB0aGUg
ImRldGVjdGlvbiBsb2dpYyIgb2YgdHlwZWMgc3BlYyBjaGFwdGVyIDQNCnlvdSBhcmUgcmVmZXJy
aW5nIHRvPw0KDQo+IEkgY2FuIHNlZSBubyByZWFzb24gd2h5IHlvdSBjb3VsZG4ndCBidWlsZCBh
IHBvcnQgdGhhdCBjYW4gYmUgc3dpdGNoZWQgYmV0d2Vlbg0KPiB0aGUgZGF0YSByb2xlcyBidXQg
bm90IGltcGxlbWVudCB0aGF0IGxvZ2ljLg0KDQpJIHNlZSB0aGVyZSBpcyBkcl9zd2FwIGhhbmRs
aW5nIGZvciBkYXRhIHJvbGUgc3dhcCBpbiB0Y3BtIGFscmVhZHksIG1heWJlDQpJIG1pc3VuZGVy
c3Rvb2QgdGhlICJsb2dpYyIgeW91IHdhbnQgaGVyZS4NCg0KUmVnYXJkcw0KTGkgSnVuDQogDQo+
IA0KPiAJUmVnYXJkcw0KPiAJCU9saXZlcg0KDQo=
