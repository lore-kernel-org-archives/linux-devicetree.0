From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [PATCH V2 2/2] clk: imx: scu: add cpu frequency scaling support
Date: Wed, 13 Feb 2019 13:53:04 +0000
Message-ID: <59b181b77605f516b0e3a896ddce0224b4504b30.camel@nxp.com>
References: <1550064410-28417-1-git-send-email-Anson.Huang@nxp.com>
         <1550064410-28417-2-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550064410-28417-2-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Content-ID: <DFFAC317CCAA5545B90CE2DCE255FAB8@eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: dl-linux-imx <linux-imx@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, Aisheng Dong <aisheng.dong@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>"viresh.kumar@linaro.org" <vi>
List-Id: devicetree@vger.kernel.org

T24gV2VkLCAyMDE5LTAyLTEzIGF0IDEzOjMyICswMDAwLCBBbnNvbiBIdWFuZyB3cm90ZToNCj4g
T24gTlhQJ3MgaS5NWCBTb0NzIHdpdGggc3lzdGVtIGNvbnRyb2xsZXIgaW5zaWRlLCBDUFUgZnJl
cXVlbmN5DQo+IHNjYWxpbmcgY2FuIE9OTFkgYmUgZG9uZSBieSBzeXN0ZW0gY29udHJvbGxlciBm
aXJtd2FyZSwgYW5kIGl0DQo+IGNhbiBPTkxZIGJlIHJlcXVlc3RlZCBmcm9tIHNlY3VyZSBtb2Rl
LCBzbyBMaW51eCBrZXJuZWwgaGFzIHRvDQo+IGNhbGwgQVJNIFNNQyB0byB0cmFwIHRvIEFSTS1U
cnVzdGVkLUZpcm13YXJlIHRvIHJlcXVlc3Qgc3lzdGVtDQo+IGNvbnRyb2xsZXIgZmlybXdhcmUg
dG8gZG8gQ1BVIGZyZXF1ZW5jeSBzY2FsaW5nLg0KDQo+ICsjaWZkZWYgQ09ORklHX0NQVUZSRVFf
RFQNCj4gKyNkZWZpbmUgSU1YX1NJUF9DUFVGUkVRCQkJMHhDMjAwMDAwMQ0KPiArI2RlZmluZSBJ
TVhfU0lQX1NFVF9DUFVGUkVRCQkweDAwDQo+ICsNCj4gIHN0YXRpYyBzdHJ1Y3QgaW14X3NjX2lw
YyAqY2NtX2lwY19oYW5kbGU7DQoNCldpdGhvdXQgQ09ORklHX0NQVUZSRVFfRFQgdGhlIGNjbV9p
cGNfaGFuZGxlIHdvbid0IGJlIGRlZmluZWQgYW5kIGJ1aWxkDQp3aWxsIGJyZWFrLg0KDQpCdXQg
aXMgdGhlcmUgYSBnb29kIHJlYXNvbiBmb3IgaWZkZWY/IEluIGdlbmVyYWwgY2xvY2sgZnVuY3Rp
b24gYXJlDQpjb21waWxlZCBldmVuIGlmIG5vIGRyaXZlciBpcyBjYWxsaW5nIHRoZW0uDQoNCj4g
KyNpZmRlZiBDT05GSUdfQ1BVRlJFUV9EVA0KPiArCS8qIENQVSBjbG9jayBjYW4gT05MWSBiZSBk
b25lIGJ5IFRGLUEgKi8NCj4gKwlpZiAoY2xrLT5jbGtfdHlwZSA9PSBJTVhfU0NfUE1fQ0xLX0NQ
VSkgew0KPiArCQlzdHJ1Y3QgYXJtX3NtY2NjX3JlcyByZXM7DQo+ICsJCXVuc2lnbmVkIGludCBj
bHVzdGVyX2lkOw0KPiArCQlpbnQgaTsNCj4gKw0KPiArCQlmb3IgKGkgPSAwOyBpIDwgQVJSQVlf
U0laRShpbXhfc2NfY3B1ZnJlcV9kYXRhKTsgaSsrKSB7DQo+ICsJCQlpZiAoIXN0cmNtcChjbGtf
aHdfZ2V0X25hbWUoaHcpLA0KPiArCQkJCWlteF9zY19jcHVmcmVxX2RhdGFbaV0uY2xrX25hbWUp
KSB7DQo+ICsJCQkJY2x1c3Rlcl9pZCA9IGlteF9zY19jcHVmcmVxX2RhdGFbaV0uY2x1c3Rlcl9p
ZDsNCj4gKwkJCQlicmVhazsNCj4gKwkJCX0NCj4gKwkJfQ0KPiArDQo+ICsJCS8qDQo+ICsJCSAq
IEFzIHNvbWUgb3RoZXIgY2xvY2sgdHlwZXMgaGF2ZSBzYW1lIHZhbHVlIGFzDQo+ICsJCSAqIElN
WF9TQ19QTV9DTEtfQ1BVLCBzbyB3ZSBuZWVkIHRvIGRvdWJsZSBjaGVjaw0KPiArCQkgKiB0aGUg
Y2xvY2sgYmVpbmcgc2NhbGVkIGlzIGluZGVlZCBDUFUgY2xvY2sgd2hpY2gNCj4gKwkJICogbWF0
Y2hlcyB0aGUgdGFibGUgd2UgZGVmaW5lLg0KPiArCQkgKi8NCj4gKwkJaWYgKGkgPCBBUlJBWV9T
SVpFKGlteF9zY19jcHVmcmVxX2RhdGEpKSB7DQo+ICsJCQlhcm1fc21jY2Nfc21jKElNWF9TSVBf
Q1BVRlJFUSwgSU1YX1NJUF9TRVRfQ1BVRlJFUSwNCj4gKwkJCQljbHVzdGVyX2lkLCByYXRlLCAw
LCAwLCAwLCAwLCAmcmVzKTsNCj4gKwkJCXJldHVybiAwOw0KPiArCQl9DQo+ICsJfQ0KPiArI2Vu
ZGlmDQoNClRoZSBjb2RlIGluc2lkZSB0aGUgaWZkZWYgd291bGQgbG9vayBiZXR0ZXIgaW4gYSBz
ZXBhcmF0ZQ0KaW14X2Nsa19hdGZfc2V0X3JhdGUgZnVuY3Rpb24uIE1heWJlIGV2ZW4gc2VwYXJh
dGUgY2xrX29wcz8NCg0K
