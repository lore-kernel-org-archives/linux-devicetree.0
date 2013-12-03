From: Peter Chen <Peter.Chen@freescale.com>
Subject: RE: [PATCH v4 17/17] usb: phy-mxs: do not set PWD.RXPWD1PT1 for low
 speed connection
Date: Tue, 3 Dec 2013 09:48:36 +0000
Message-ID: <F281D0F91ED19E4D8E63A7504E8A6498041410CD@039-SN2MPN1-021.039d.mgd.msft.net>
References: <1386056231-17258-1-git-send-email-peter.chen@freescale.com>
 <1386056231-17258-18-git-send-email-peter.chen@freescale.com>
 <529D9BF7.1080707@pengutronix.de>
 <F281D0F91ED19E4D8E63A7504E8A649804141031@039-SN2MPN1-021.039d.mgd.msft.net>
 <529DA44C.9090702@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <529DA44C.9090702@pengutronix.de>
Content-Language: en-US
Sender: linux-doc-owner@vger.kernel.org
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: "balbi@ti.com" <balbi@ti.com>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "festevam@gmail.com" <festevam@gmail.com>, "marex@denx.de" <marex@denx.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "m.grzeschik@pengutronix.de" <m.grzeschik@pengutronix.de>, Frank Li <Frank.Li@freescale.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

IA0KPiANCj4gT24gMTIvMDMvMjAxMyAxMDoxOSBBTSwgUGV0ZXIgQ2hlbiB3cm90ZToNCj4gPj4g
T24gMTIvMDMvMjAxMyAwODozNyBBTSwgUGV0ZXIgQ2hlbiB3cm90ZToNCj4gPj4+IEF0IHZlcnkg
cmFyZSBjYXNlcywgdGhlIFNvRiB3aWxsIG5vdCBzZW5kIG91dCBhZnRlciByZXN1bWUgd2l0aA0K
PiA+Pj4gbG93IHNwZWVkIGNvbm5lY3Rpb24uIFRoZSB3b3JrYXJvdW5kIGlzIGRvIG5vdCBwb3dl
ciBkb3duDQo+ID4+PiBQV0QuUlhQV0QxUFQxIGJpdCBkdXJpbmcgdGhlIHN1c3BlbmQuDQo+ID4+
DQo+ID4+IElzIHRoaXMgYWxzbyBhIGZpeCBmb3IgbmV3bHkgYWRkZWQgY29kZT8gSWYgc28gcGxl
YXNlIGFsc28gc3F1YXNoLg0KPiANCj4gPiBObywgaXQgaXMgYSB3b3JrYXJvdW5kIGZvciBuZXcg
cHJvYmxlbS4NCj4gDQo+IElmIHRoaXMgd291bGQgYmUgYSBmaXgsIGl0J3MgYmV0dGVyIHRvIHB1
dCB0aGlzIGFzIGZpcnN0IHBhdGNoIGludG8gYQ0KPiBzZXJpZXMsIHNvIHRoYXQgaXQgY2FuIGJl
IGFwcGxpZWQgdG8gdGhlIHN0YWJsZSB0cmVlcyBlYXNpZXIuDQo+IA0KDQpJdCBpcyBpbnRyb2R1
Y2VkIGJ5IFszLzE3XSwgd2l0aG91dCBbMy8xN10gaXQgbmVlZHMgYW5vdGhlciBmaXggd2hpY2gN
CndlIGhhdmUgbm90IGludGVuZGVkIHRvIHVzZS4gSSB3aWxsIHNxdWFzaCB0aGVtLCB0aGFua3Mu
DQoNClBldGVyDQoNCiANCg0KDQo=

