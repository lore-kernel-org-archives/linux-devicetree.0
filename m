From: Philippe Schenker <philippe.schenker@toradex.com>
Subject: Re: [PATCH v3 09/21] ARM: dts: imx6qdl-colibri: add phy to fec
Date: Thu, 8 Aug 2019 08:03:22 +0000
Message-ID: <9849ffad4a07b4ce90b412ccdada93ee45c5bc5d.camel@toradex.com>
References: <20190807082556.5013-1-philippe.schenker@toradex.com>
         <20190807082556.5013-10-philippe.schenker@toradex.com>
         <20190807105107.nqqltv64tjxprow6@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190807105107.nqqltv64tjxprow6@pengutronix.de>
Content-Language: en-US
Content-ID: <8092D70CEC74144BB6A1B117940CE27E@eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>
Cc: "stefan@agner.ch" <stefan@agner.ch>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, "linux-imx@nxp.com" <linux-imx@nxp.com>, Max Krummenacher <max.krummenacher@toradex.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "michal.vokac@ysoft.com" <michal.vokac@ysoft.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "festevam@gmail.com" <festevam@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

T24gV2VkLCAyMDE5LTA4LTA3IGF0IDEyOjUxICswMjAwLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90
ZToNCj4gT24gV2VkLCBBdWcgMDcsIDIwMTkgYXQgMDg6MjY6MjNBTSArMDAwMCwgUGhpbGlwcGUg
U2NoZW5rZXIgd3JvdGU6DQo+ID4gQWRkIHRoZSBwaHktbm9kZSBhbmQgbWRpbyBidXMgdG8gdGhl
IGZlYy1ub2RlLCByZXByZXNlbnRlZCBhcyBpcyBvbg0KPiA+IGhhcmR3YXJlLg0KPiA+IFRoaXMg
Y29tbWl0IGluY2x1ZGVzIG1pY3JlbCxsZWQtbW9kZSB0aGF0IGlzIHNldCB0byB0aGUgZGVmYXVs
dA0KPiA+IHZhbHVlLCBwcmVwYXJlZCBmb3Igc29tZW9uZSB3aG8gd2FudHMgdG8gY2hhbmdlIHRo
aXMuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgU2NoZW5rZXIgPHBoaWxpcHBl
LnNjaGVua2VyQHRvcmFkZXguY29tPg0KPiA+IC0tLQ0KPiA+IA0KPiA+IENoYW5nZXMgaW4gdjM6
IE5vbmUNCj4gPiBDaGFuZ2VzIGluIHYyOiBOb25lDQo+ID4gDQo+ID4gIGFyY2gvYXJtL2Jvb3Qv
ZHRzL2lteDZxZGwtY29saWJyaS5kdHNpIHwgMTEgKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNo
YW5nZWQsIDExIGluc2VydGlvbnMoKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0v
Ym9vdC9kdHMvaW14NnFkbC1jb2xpYnJpLmR0c2kNCj4gPiBiL2FyY2gvYXJtL2Jvb3QvZHRzL2lt
eDZxZGwtY29saWJyaS5kdHNpDQo+ID4gaW5kZXggMWJlYWMyMjI2NmVkLi4wMTlkZGE2Yjg4YWQg
MTAwNjQ0DQo+ID4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvaW14NnFkbC1jb2xpYnJpLmR0c2kN
Cj4gPiArKysgYi9hcmNoL2FybS9ib290L2R0cy9pbXg2cWRsLWNvbGlicmkuZHRzaQ0KPiA+IEBA
IC0xNDAsNyArMTQwLDE4IEBADQo+ID4gIAlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOw0KPiA+
ICAJcGluY3RybC0wID0gPCZwaW5jdHJsX2VuZXQ+Ow0KPiA+ICAJcGh5LW1vZGUgPSAicm1paSI7
DQo+ID4gKwlwaHktaGFuZGxlID0gPCZldGhwaHk+Ow0KPiA+ICAJc3RhdHVzID0gIm9rYXkiOw0K
PiA+ICsNCj4gPiArCW1kaW8gew0KPiA+ICsJCSNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KPiA+ICsJ
CSNzaXplLWNlbGxzID0gPDA+Ow0KPiA+ICsNCj4gPiArCQlldGhwaHk6IGV0aGVybmV0LXBoeUAw
IHsNCj4gPiArCQkJcmVnID0gPDA+Ow0KPiA+ICsJCQltaWNyZWwsbGVkLW1vZGUgPSA8MD47DQo+
IA0KPiBEb2Vzbid0IHRoYXQgbmVlZCBhIGNvbXBhdGlibGUgZW50cnkgdG8gYmUgYWN0dWFsbHkg
dXNlZD8NCj4gDQo+IEJlc3QgcmVnYXJkcw0KPiBVd2UNCg0KSGkgVXdlIGFuZCB0aGFua3MgZm9y
IHBvaW50aW5nIHRoaXMgb3V0LiBJIGp1c3QgdHJpZWQgaXQgYW5kIGl0IHdvcmtzDQpmaW5lIHdp
dGhvdXQgdGhlIGNvbXBhdGlibGUuDQoNClBoaWxpcHBlDQoNCj4gPiANCg==
