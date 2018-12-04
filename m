From: =?utf-8?B?Vm9rw6HEjSBNaWNoYWw=?= <Michal.Vokac@ysoft.com>
Subject: [PATCH 2/4] video: ssd1307fb: Do not hard code active-low reset
 sequence
Date: Tue, 4 Dec 2018 15:03:37 +0000
Message-ID: <1543935806-94880-3-git-send-email-michal.vokac@ysoft.com>
References: <1543935806-94880-1-git-send-email-michal.vokac@ysoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1543935806-94880-1-git-send-email-michal.vokac@ysoft.com>
Content-Language: en-US
Content-ID: <DFEBB006D9A470479A0B03225DF6057F@eurprd04.prod.outlook.com>
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
aGUgcmVhbCB3b3JsZC4NCg0KU2lnbmVkLW9mZi1ieTogTWljaGFsIFZva8OhxI0gPG1pY2hhbC52
b2thY0B5c29mdC5jb20+DQotLS0NCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3NzZDEzMDdmYi5jIHwg
NCArKy0tDQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkN
Cg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvc3NkMTMwN2ZiLmMgYi9kcml2ZXJz
L3ZpZGVvL2ZiZGV2L3NzZDEzMDdmYi5jDQppbmRleCA0MDYxYTIwLi4zYjM2MWJjIDEwMDY0NA0K
LS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9zc2QxMzA3ZmIuYw0KKysrIGIvZHJpdmVycy92aWRl
by9mYmRldi9zc2QxMzA3ZmIuYw0KQEAgLTY2NywxMCArNjY3LDEwIEBAIHN0YXRpYyBpbnQgc3Nk
MTMwN2ZiX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQsDQogDQogCWlmIChwYXItPnJl
c2V0KSB7DQogCQkvKiBSZXNldCB0aGUgc2NyZWVuICovDQotCQlncGlvZF9zZXRfdmFsdWVfY2Fu
c2xlZXAocGFyLT5yZXNldCwgMCk7DQotCQl1ZGVsYXkoNCk7DQogCQlncGlvZF9zZXRfdmFsdWVf
Y2Fuc2xlZXAocGFyLT5yZXNldCwgMSk7DQogCQl1ZGVsYXkoNCk7DQorCQlncGlvZF9zZXRfdmFs
dWVfY2Fuc2xlZXAocGFyLT5yZXNldCwgMCk7DQorCQl1ZGVsYXkoNCk7DQogCX0NCiANCiAJaWYg
KHBhci0+dmJhdF9yZWcpIHsNCi0tIA0KMi4xLjQNCg0K
