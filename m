From: =?utf-8?B?Vm9rw6HEjSBNaWNoYWw=?= <Michal.Vokac@ysoft.com>
Subject: [PATCH v2 2/4] video: ssd1307fb: Do not hard code active-low reset
 sequence
Date: Thu, 20 Dec 2018 12:13:55 +0000
Message-ID: <1545308005-51559-3-git-send-email-michal.vokac@ysoft.com>
References: <1545308005-51559-1-git-send-email-michal.vokac@ysoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1545308005-51559-1-git-send-email-michal.vokac@ysoft.com>
Content-Language: en-US
Content-ID: <08F1D6373BC021469D0A985A8791D70E@eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Ripard <maxime.ripard@bootlin.com>, "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, =?utf-8?B?Vm9rw6HEjSBNaWNoYWw=?= <Michal.Vokac@ysoft.com>
List-Id: devicetree@vger.kernel.org

VGhlIFNTRDEzMHggT0xFRMKgZGlzcGxheSByZXNldCBzaWduYWwgaXMgYWN0aXZlIGxvdy4gTm93
IHRoZSByZXNldA0Kc2VxdWVuY2UgaXMgaW1wbGVtZW50ZWQgaW4gc3VjaCBhIHdheSB0aGF0IHVz
ZXJzIGFyZSBmb3JjZWQgdG8NCmRlZmluZSByZXNldC1ncGlvcyBhcyBHUElPX0FDVElWRV9ISUdI
IGluIERUIHRvIG1ha2UgdGhlIHJlc2V0IHdvcmsuDQoNCkRvIG5vdCBoYXJkIGNvZGUgdGhlIGFj
dGl2ZS1sb3cgc2VxdWVuY2UgaW50byB0aGUgZHJpdmVyIGJ1dCBpbnN0ZWFkDQphbGxvdyB0aGUg
dXNlciB0byBzcGVjaWZ5IHRoZSBncGlvIGFzIEdQSU9fQUNUSVZFX0xPVyB0byByZWZsZWN0DQp0
aGUgcmVhbCB3b3JsZC4NCg0KUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5v
cmc+DQpTaWduZWQtb2ZmLWJ5OiBNaWNoYWwgVm9rw6HEjSA8bWljaGFsLnZva2FjQHlzb2Z0LmNv
bT4NCi0tLQ0KQ2hhbmdlcyBmcm9tIHYxOg0KIC0gQWRkIFItYnkgZnJvbSBSb2INCg0KIGRyaXZl
cnMvdmlkZW8vZmJkZXYvc3NkMTMwN2ZiLmMgfCA0ICsrLS0NCiAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRl
by9mYmRldi9zc2QxMzA3ZmIuYyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvc3NkMTMwN2ZiLmMNCmlu
ZGV4IDQwNjFhMjAuLjNiMzYxYmMgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3Nz
ZDEzMDdmYi5jDQorKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3NzZDEzMDdmYi5jDQpAQCAtNjY3
LDEwICs2NjcsMTAgQEAgc3RhdGljIGludCBzc2QxMzA3ZmJfcHJvYmUoc3RydWN0IGkyY19jbGll
bnQgKmNsaWVudCwNCiANCiAJaWYgKHBhci0+cmVzZXQpIHsNCiAJCS8qIFJlc2V0IHRoZSBzY3Jl
ZW4gKi8NCi0JCWdwaW9kX3NldF92YWx1ZV9jYW5zbGVlcChwYXItPnJlc2V0LCAwKTsNCi0JCXVk
ZWxheSg0KTsNCiAJCWdwaW9kX3NldF92YWx1ZV9jYW5zbGVlcChwYXItPnJlc2V0LCAxKTsNCiAJ
CXVkZWxheSg0KTsNCisJCWdwaW9kX3NldF92YWx1ZV9jYW5zbGVlcChwYXItPnJlc2V0LCAwKTsN
CisJCXVkZWxheSg0KTsNCiAJfQ0KIA0KIAlpZiAocGFyLT52YmF0X3JlZykgew0KLS0gDQoyLjEu
NA0KDQo=
