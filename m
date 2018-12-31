From: Pawel Laszczak <pawell@cadence.com>
Subject: RE: [PATCH v2 5/5] usb:cdns3 Add Cadence USB3 DRD Driver
Date: Mon, 31 Dec 2018 05:32:20 +0000
Message-ID: <BYAPR07MB4709D8F210206B31093F9ACDDDB20@BYAPR07MB4709.namprd07.prod.outlook.com>
References: <1545577992-4013-1-git-send-email-pawell@cadence.com>
 <1545577992-4013-6-git-send-email-pawell@cadence.com>
 <CAL411-rj0mRMfPCZOHw04q3s-9oJx7Os9Jz83bO=RgPZKLrB1g@mail.gmail.com>
 <CAL411-omVL2rwoQP6GwKZa9f_1TLBbEAkyLdxNkJZqaQu9cvsA@mail.gmail.com>
 <BYAPR07MB4709F8A00A13390235BA4BE1DDB60@BYAPR07MB4709.namprd07.prod.outlook.com>
 <VI1PR04MB53274270615A700AB36967F78BB70@VI1PR04MB5327.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <VI1PR04MB53274270615A700AB36967F78BB70@VI1PR04MB5327.eurprd04.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Chen <peter.chen@nxp.com>, Peter Chen <hzpeterchen@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "rogerq@ti.com" <rogerq@ti.com>, lkml <linux-kernel@vger.kernel.org>, Alan Douglas <adouglas@cadence.com>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, Pawel Jez <pjez@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org

SGkgUGV0ZXIsDQo+DQo+PiA+DQo+PiA+QEAgLTI5OSw2ICszMDYsNyBAQCBpbnQgY2RuczNfZHJk
X2luaXQoc3RydWN0IGNkbnMzICpjZG5zKQ0KPj4gPiAgICAgICAgICAgICAgICBjZG5zLT52ZXJz
aW9uICA9IENETlMzX0NPTlRST0xMRVJfVjA7DQo+PiA+ICAgICAgICAgICAgICAgIGNkbnMtPm90
Z192MV9yZWdzID0gTlVMTDsNCj4+ID4gICAgICAgICAgICAgICAgY2Rucy0+b3RnX3JlZ3MgPSBy
ZWdzOw0KPj4gPisgICAgICAgICAgICAgICB3cml0ZWwoMHgxLCAmY2Rucy0+b3RnX3YwX3JlZ3Mt
PnNpbXVsYXRlKTsNCj4+ID4gICAgICAgICAgICAgICAgZGV2X2luZm8oY2Rucy0+ZGV2LCAiRFJE
IHZlcnNpb24gdjAgKCUwOHgpXG4iLA0KPj4gPiAgICAgICAgICAgICAgICAgICAgICAgICByZWFk
bCgmY2Rucy0+b3RnX3YwX3JlZ3MtPnZlcnNpb24pKTsNCj4+ID4gICAgICAgIH0gZWxzZSB7DQo+
Pg0KPj4gSSBoYXZlIGNvbmZpcm1hdGlvbiBmcm9tIEhXIHRlYW0gdGhhdCB0aW1lIHRoYXQgZHJp
dmVyIHNob3VsZCB3YWl0IGFmdGVyIGRlLQ0KPj4gc2VsZWN0aW5nIG1vZGUgaXMgMi0zbXMgZm9y
IHNpbXVsYXRlIG1vZGUuIEl0J3MgdGltZSB3aGVuIEZTTSBpcyBpbg0KPj4gRFJEX0hfV0FJVF9W
QlVTX0ZBSUwuDQo+PiBEcml2ZXIgY2Fubm90IHJlLWVuYWJsZSB0aGUgaG9zdC9kZXZpY2UgbW9k
ZSBiZWZvcmUgdGhpcyB0aW1lIGhhcyBlbGFwc2VkLg0KPj4NCj4+IDMgbXMgaXMgdGhlIG1heGlt
dW0gdGltZS4gQWRkaXRpb25hbGx5LCB5b3UgY2FuIGNvbmZpcm0gdGhlIGN1cnJlbnQgRlNNIHN0
YXRlIGJ5DQo+PiByZWFkaW5nIHRoZSBob3N0X290Z19zdGF0ZSAoYml0IDU6Mykgb3IgZGV2X290
Z19zdGF0ZSAoMjowKSAgZnJvbSBPVEdTVEFURQ0KPj4gcmVnaXN0ZXIuDQo+Pg0KPj4gSWYgYml0
IDAgaW4gc2ltdWxhdGUgcmVnaXN0ZXIgaXMgY2xlYXJlZCB0aGUgdGltZSBpcyBleGFjdGx5IDFz
Lg0KPj4NCj4NCj5UaGFua3MsIFBhd2VsLg0KPg0KPldvdWxkIHlvdSBwbGVhc2UgYWRkIGJlbG93
IGNoYW5nZXMgaW4geW91ciBuZXh0IHJldmlzaW9uPw0KPi0gU2V0IGJpdCAwIGluIHNpbXVsYXRl
IHJlZ2lzdGVyDQpCdXQgaXQncyB1c2VkIG9ubHkgZm9yIHNpbXVsYXRpb24gZW52aXJvbm1lbnRz
IHRvIHNwZWVkIHVwIHNpbXVsYXRpb24uIA0KT24gcmVhbCBwbGF0Zm9ybXMgdGhpcyBiaXQgc2hv
dWxkIGJlIGNsZWFyZWQuIEknbSBub3Qgc3VyZSBpZiBJIGNhbiANCmFkZCBzb21lIGNvZGUgcmVs
YXRlZCB0byBzaW11bGF0aW9uIGVudmlyb25tZW50IHRvIGRyaXZlci4gDQpJZiB5ZXMgdGhlbiBJ
IG11c3QgaW50cm9kdWNlIHRoZSB3YXksIHRoYXQgYWxsb3cgdG8gcmVjb2duaXplIHRoaXMgdHdv
IG1vZGVzLiANCkkgY291bGQgYWRkIG1vZHVsZSBwYXJhbWV0ZXIgb3IgYWRkIGFkZGl0aW9uYWwg
Y29uZmlnIGluIEtjb25maWcgZmlsZS4NCg0KPi0gdGltZW91dCBsb2dpYyBmb3Igd2FpdGluZyBo
b3N0X290Z19zdGF0ZSBvciBkZXZfb3RnX3N0YXRlIGF0IE9UR1NUQVRFDQo+d2hlbiBzd2l0Y2gg
dG8gaG9zdCBvciBkZXZpY2UuDQoNCkkgd2lsbCBhZGQgc3VjaCBjb2RlLiANCg0KUGF3ZWwNCg0K
