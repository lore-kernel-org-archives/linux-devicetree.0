From: Robert Chiras <robert.chiras@nxp.com>
Subject: Re: [PATCH v3 00/15] Improvements and fixes for mxsfb DRM driver
Date: Wed, 28 Aug 2019 06:49:44 +0000
Message-ID: <1566974984.3209.113.camel@nxp.com>
References: <1566382555-12102-1-git-send-email-robert.chiras@nxp.com>
 <20190826120548.GA14316@bogon.m.sigxcpu.org>
 <3bd35686e046048d35cd4987567a13cf@agner.ch>
 <VI1PR04MB70233374E91F85119FD21FD5EEA10@VI1PR04MB7023.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <VI1PR04MB70233374E91F85119FD21FD5EEA10@VI1PR04MB7023.eurprd04.prod.outlook.com>
Content-Language: en-US
Content-ID: <E488AAC1DAC36A4C8BD7B8F69517A21B@eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "stefan@agner.ch" <stefan@agner.ch>, Leonard Crestez <leonard.crestez@nxp.com>
Cc: "marex@denx.de" <marex@denx.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "airlied@linux.ie" <airlied@linux.ie>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "festevam@gmail.com" <festevam@gmail.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

SGkgTGVvbmFyZCwNCg0KT24gTHUsIDIwMTktMDgtMjYgYXQgMTk6MTkgKzAwMDAsIExlb25hcmQg
Q3Jlc3RleiB3cm90ZToNCj4gT24gMjYuMDguMjAxOSAxNzozNSwgU3RlZmFuIEFnbmVyIHdyb3Rl
Og0KPiA+IA0KPiA+IE9uIDIwMTktMDgtMjYgMTQ6MDUsIEd1aWRvIEfDvG50aGVyIHdyb3RlOg0K
PiA+ID4gDQo+ID4gPiBIaSwNCj4gPiA+IE9uIFdlZCwgQXVnIDIxLCAyMDE5IGF0IDAxOjE1OjQw
UE0gKzAzMDAsIFJvYmVydCBDaGlyYXMgd3JvdGU6DQo+ID4gPiA+IA0KPiA+ID4gPiBUaGlzIHBh
dGNoLXNldCBpbXByb3ZlcyB0aGUgdXNlIG9mIGVMQ0RJRiBibG9jayBvbiBpTVggOCBTb0NzDQo+
ID4gPiA+IChsaWtlIDhNUSwgOE1NDQo+ID4gPiA+IGFuZCA4UVhQKS4gRm9sbG93aW5nLCBhcmUg
dGhlIG5ldyBmZWF0dXJlcyBhZGRlZCBhbmQgZml4ZXMgZnJvbQ0KPiA+ID4gPiB0aGlzDQo+ID4g
PiA+IHBhdGNoLXNldDoNCj4gPiA+IEkndmUgYXBwbGllZCB0aGlzIHdob2xlIHNlcmllcyBvbiB0
b3Agb2YgbXkgTldMIHdvcmsgYW5kIGl0IGxvb2tzDQo+ID4gPiBnb29kDQo+ID4gPiB3aXRoIGEg
RFNJIHBhbmVsLiBBcHBseWluZyB0aGUgd2hvbGUgc2VyaWVzIGFsc28gZml4ZXMgYW4gaXNzdWUN
Cj4gPiA+IHdoZXJlDQo+ID4gPiBhZnRlciB1bmJsYW5rIHRoZSBvdXRwdXQgd2FzIHNvbWV0aW1l
cyBzaGlmdGVkIGFib3V0IGhhbGYgYQ0KPiA+ID4gc2NyZWVuIHdpZHRoDQo+ID4gPiB0byB0aGUg
cmlnaHQgKHdoaWNoIGRpZG4ndCBoYXBwZW4gd2l0aCBEQ1NTKS4gU28gYXQgbGVhc3QgZnJvbQ0K
PiA+ID4gdGhlIHBhcnRzDQo+ID4gPiBJIGNvdWxkIHRlc3Q6DQo+ID4gPiANCj4gPiA+IMKgwqDC
oFRlc3RlZC1ieTogR3VpZG8gR8O8bnRoZXIgPGFneEBzaWd4Y3B1Lm9yZz4NCj4gPiA+IA0KPiA+
ID4gZm9yIHRoZSB3aG9sZSB0aGluZy4NCj4gPiBUaGFua3MgZm9yIHRlc3RpbmchIFdoYXQgU29D
IGRpZCB5b3UgdXNlPyBJIHRoaW5rIGl0IHdvdWxkIGJlIGdvb2QNCj4gPiB0bw0KPiA+IGFsc28g
Z2l2ZSB0aGlzIGEgdHJ5IG9uIGkuTVggNyBvciBpLk1YIDZVTEwgYmVmb3JlIG1lcmdpbmcuDQo+
IEkgZGlkIGEgcXVpY2sgdGVzdCBvbiBpbXg2c3gtc2RiIGFuZCBpdCBzZWVtcyB0aGF0IFtQQVRD
SCAwNy8xNV3CoA0KPiAiZHJtL214c2ZiOiBGaXggdGhlIHZibGFuayBldmVudHMiIGNhdXNlcyBh
IGhhbmcgb24gYm9vdCwgZXZlbg0KPiB3aXRob3V0IGHCoA0KPiBwYW5lbC4NCj4gDQo+IElmIEkg
cmV2ZXJ0IHRoYXQgcGFydGljdWxhciBwYXRjaCBpdCBzZWVtcyB0byBiZSBmaW5lOiB0aGUgbmV3
IHBpeGVswqANCj4gZm9ybWF0cyBzZWVtIHRvIHdvcmsgaW4gbW9kZXRlc3QgKGNoZWNrZWQgd2l0
aCBzaWksNDN3dmYxZyBwYW5lbCkuDQpUaGFua3MgZm9yIGZlZWRiYWNrLiBJIHRlc3RlZCB0aGlz
IGFuZCwgaW5kZWVkIHRoZXJlIGFyZSBpc3N1ZXMgb24gNlNYDQp3aXRoIHRoaXMgcGFydGljdWxh
ciBwYXRjaC4gSXQgc2VlbXMgdGhhdCB0aGVyZSBpcyBhIHJhY2UtY29uZGl0aW9uDQpjYXVzZWQg
YnkgdGhlIHZibGFua19vbiBjYWxsIGluIGVuYWJsZSBhbmQgSVJRIHJvdXRpbmUuIFNpbmNlIHRo
aXMgaXMNCm5vdCBoYXBwZW5pbmcgb24gYW55IG9mIGkuTVg4IFNvQywgSSBzdXNwZWN0IHRoZSBh
eGkgY2xvY2sgdXNhZ2UuDQpJIHRoaW5rIEkgd2lsbCBqdXN0IHJlbW92ZSB0aGlzIHBhdGNoIGZy
b20gdGhlIHBhdGNoLXNldCBhbmQgaGFuZGxlDQp0aGlzIGNhc2Ugc2VwYXJhdGVseS4NCj4gDQo+
IC0tDQo+IFJlZ2FyZHMsDQo+IExlb25hcmQNCg0KUmVnYXJkcywNClJvYmVydApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1h
aWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
