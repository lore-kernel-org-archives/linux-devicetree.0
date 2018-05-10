Return-Path: <SRS0=9rWN=H5=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr10065.outbound.protection.outlook.com ([40.107.1.65]:4256
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S964863AbeEJAny (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 9 May 2018 20:43:54 -0400
From: Jun Li <jun.li@nxp.com>
Subject: RE: [PATCH v5 01/14] dt-bindings: connector: add properties for typec
Date: Thu, 10 May 2018 00:43:50 +0000
Message-ID: <VI1PR0402MB3917BBA4F1D037B34BF3401789980@VI1PR0402MB3917.eurprd04.prod.outlook.com>
References: <1525307094-27402-1-git-send-email-jun.li@nxp.com>
         <1525307094-27402-2-git-send-email-jun.li@nxp.com>
         <1525332431.12348.1.camel@suse.com>
         <VI1PR0402MB3917DA4B3789475540E38E4989870@VI1PR0402MB3917.eurprd04.prod.outlook.com>
         <1525339063.12348.4.camel@suse.com>
         <VI1PR0402MB3917C957925B7175A8A16A6F89860@VI1PR0402MB3917.eurprd04.prod.outlook.com>
 <1525773790.24345.12.camel@suse.com>
In-Reply-To: <1525773790.24345.12.camel@suse.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Oliver Neukum <oneukum@suse.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux@roeck-us.net" <linux@roeck-us.net>
Cc: "gsomlo@gmail.com" <gsomlo@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, Peter Chen <peter.chen@nxp.com>, "shufan_lee@richtek.com" <shufan_lee@richtek.com>, "a.hajda@samsung.com" <a.hajda@samsung.com>, "cw00.choi@samsung.com" <cw00.choi@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

SGkNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogT2xpdmVyIE5ldWt1bSBb
bWFpbHRvOm9uZXVrdW1Ac3VzZS5jb21dDQo+IFNlbnQ6IDIwMTjlubQ15pyIOOaXpSAxODowMw0K
PiBUbzogSnVuIExpIDxqdW4ubGlAbnhwLmNvbT47IHJvYmgrZHRAa2VybmVsLm9yZzsNCj4gaGVp
a2tpLmtyb2dlcnVzQGxpbnV4LmludGVsLmNvbTsgZ3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc7
DQo+IGxpbnV4QHJvZWNrLXVzLm5ldA0KPiBDYzogZ3NvbWxvQGdtYWlsLmNvbTsgZGwtbGludXgt
aW14IDxsaW51eC1pbXhAbnhwLmNvbT47IFBldGVyIENoZW4NCj4gPHBldGVyLmNoZW5AbnhwLmNv
bT47IHNodWZhbl9sZWVAcmljaHRlay5jb207IGEuaGFqZGFAc2Ftc3VuZy5jb207DQo+IGN3MDAu
Y2hvaUBzYW1zdW5nLmNvbTsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LXVz
YkB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NSAwMS8xNF0gZHQtYmlu
ZGluZ3M6IGNvbm5lY3RvcjogYWRkIHByb3BlcnRpZXMgZm9yIHR5cGVjDQo+IA0KPiBBbSBGcmVp
dGFnLCBkZW4gMDQuMDUuMjAxOCwgMDg6NTkgKzAwMDAgc2NocmllYiBKdW4gTGk6DQo+ID4NCj4g
PiA+ID4gPiBDYW4gb25lIGltcGxlbWVudCBhIGRldmljZSB0aGF0IGNhbiBvcGVyYXRlIGFzIGVp
dGhlciBERlAgb3INCj4gPiA+ID4gPiBVRlAsIGJ1dCBub3QgaW1wbGVtZW50cyB0aGUgZHluYW1p
YyByb2xlIHN3aXRjaCB0aGF0IGEgRFJQIG11c3QNCj4gc3VwcG9ydD8NCj4gPiA+ID4NCj4gPiA+
ID4gWW91IG1lYW4gYSBwb3J0IHdpdGggRFJEIG9uIGRhdGEgYnV0IG5vdCBEUlAgb24gcG93ZXI/
DQo+ID4gPiA+DQo+ID4gPiA+IFRoZSBkYXRhLXJvbGUgaXMgbmV3bHkgYWRkZWQgYXMgdGhlIGRh
dGEgcm9sZSBpcyBub3QgY291cGxlZCB3aXRoDQo+ID4gPiA+IHBvd2VyDQo+ID4gPg0KPiA+ID4g
Tm8sIEkgbWVhbnQgZGF0YSByb2xlLiBBcyBmYXIgYXMgSSBjYW4gdGVsbCBmb3IgYSBEUlAgeW91
IG5lZWQgdG8NCj4gPiA+IGltcGxlbWVudCB0aGUgZGV0ZWN0aW9uIGxvZ2ljIGRlc2NyaWJlZCBp
biBjaGFwdGVyIDQgb2YgdGhlIHNwZWMuDQo+ID4NCj4gPiBDb3VsZCB5b3UgcGxlYXNlIHBvaW50
IG1lIHRoZSAiZGV0ZWN0aW9uIGxvZ2ljIiBvZiB0eXBlYyBzcGVjIGNoYXB0ZXINCj4gPiA0IHlv
dSBhcmUgcmVmZXJyaW5nIHRvPw0KPiANCj4gQ2hhcHRlciA0LjUuMi4yLCBlc3BlY2lhbGx5IHN0
YXRlIGRpYWdyYW1tcyA0LjE1IGFuZCA0LjE2DQoNCkZpZ3VyZSA0LTE1IENvbm5lY3Rpb24gU3Rh
dGUgRGlhZ3JhbTogRFJQDQpUaGF0J3MgRFJQIGNhc2Ugd2l0aG91dCB0cnktcG93ZXItcm9sZSBw
cmVzZW50LCBhIHNpbXBsZSBEUlAoRHVhbC1Sb2xlLVBvd2VyKS4NCg0KRmlndXJlIDQtMTYgQ29u
bmVjdGlvbiBTdGF0ZSBEaWFncmFtOiBEUlAgd2l0aCBBY2Nlc3NvcnkgYW5kIFRyeS5TUkMgU3Vw
cG9ydA0KVGhhdCdzIERSUCB3aXRoIHRyeS1wb3dlci1yb2xlID0gInNvdXJjZSINCg0KPiANCj4g
SXQganVzdCBzZWVtcyB0byBtZSB0aGF0IGEgRFJQIGFuZCBhIHBoeXNpY2FsIHBvcnQgdGhhdCBj
YW4gYmUgc3dpdGNoZWQNCj4gYmV0d2VlbiBVRlAgYW5kIERGUCBhcmUgbm90IHRoZSBzYW1lIHRo
aW5nLCBidXQgY2FuIGJlIGltcGxlbWVudGVkLg0KDQpZZXMsIHRoZXkgYXJlIGRpZmZlcmVudCwg
dGhlIGZvcm1lciBpcyBEUlAoRHVhbC1Sb2xlLVBvd2VyLCBwb3dlci1yb2xlID0gImR1YWwiKSwN
CmFuZCB0aGUgbGF0dGVyIGlzIERSRChEdWFsLVJvbGUtRGF0YSwgZGF0YS1yb2xlID0gImR1YWwi
KS4gSWYgYSBwb3J0IGNhbiBzdXBwb3J0DQpib3RoIERSUCBhbmQgRFJELCBJIHRoaW5rIGN1cnJl
bnQgdGNwbSBhbHJlYWR5IGNhbiBzdXBwb3J0IGl0Lg0KSWYgYSB0eXBlYyBwb3J0IG9ubHkgY2Fu
IHNpbmsgcG93ZXIocG93ZXItcm9sZSA9ICJzaW5rIikgYnV0IGNhbiBzdXBwb3J0IFVGUA0KYW5k
IFVGUCBzd2l0Y2ggb24gZGF0YSAoZGF0YS1yb2xlID0gImR1YWwiKSwgaW4gdGhpcyBjYXNlLCB3
ZSBvbmx5IGNhbiBzd2l0Y2gNCnRoZSBkYXRhIHJvbGVzIHZpYSBkcl9zd2FwIG9yIHN5cywgY3Vy
cmVudCB0Y3BtIG1heSBuZWVkIG1vcmUgY2hhbmdlIHRvDQphZGFwdCB0aGUgc2VwYXJhdGlvbiBv
ZiBwb3dlciByb2xlIGFuZCBkYXRhIHJvbGUsIGJ1dCBhbnl3YXkgYWxsIHRoaXMgY2FuIGJlDQpp
bXBsZW1lbnRlZCBhcyB5b3Ugc2FpZC4NCg0KVGhhbmtzDQpMaSBKdW4NCj4gDQo+IAlSZWdhcmRz
DQo+IAkJT2xpdmVyDQoNCg==
