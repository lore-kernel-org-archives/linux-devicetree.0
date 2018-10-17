From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [PATCH v4 2/4] crypto: mxs-dcp - Add support for dcp clk
Date: Wed, 17 Oct 2018 12:59:39 +0000
Message-ID: <a97517bf72f649915bccf555ab7d3c8c4551298d.camel@nxp.com>
References: <cover.1539779579.git.leonard.crestez@nxp.com>
         <95dce7010676581691b1ac9906e9298470e0aa1a.1539779579.git.leonard.crestez@nxp.com>
         <CAOMZO5BMeHjsyZWhUb5RmEBRCYViUN-Vx8KyLBWtDJGKBHHpCg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOMZO5BMeHjsyZWhUb5RmEBRCYViUN-Vx8KyLBWtDJGKBHHpCg@mail.gmail.com>
Content-Language: en-US
Content-ID: <F0D4898771DE40499701E9026682387F@eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "festevam@gmail.com" <festevam@gmail.com>
Cc: dl-linux-imx <linux-imx@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Aymen Sghaier <aymen.sghaier@nxp.com>, Franck Lenormand <franck.lenormand@nxp.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "davem@davemloft.net" <davem@davemloft.net>, Horia Geanta <horia.geanta@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>, "marek.vasut@gmail.com" <marek.vasut@gmail.com>"linux-crypto@vger.kernel.org" <l>
List-Id: devicetree@vger.kernel.org

T24gV2VkLCAyMDE4LTEwLTE3IGF0IDA5OjQ4IC0wMzAwLCBGYWJpbyBFc3RldmFtIHdyb3RlOg0K
PiBPbiBXZWQsIE9jdCAxNywgMjAxOCBhdCA5OjM4IEFNIExlb25hcmQgQ3Jlc3RleiA8bGVvbmFy
ZC5jcmVzdGV6QG54cC5jb20+IHdyb3RlOg0KPiA+IA0KPiA+IE9uIDZ1bGwgYW5kIDZzbGwgdGhl
IERDUCBibG9jayBoYXMgYSBjbG9jayB3aGljaCBuZWVkcyB0byBiZSBleHBsaWNpdGx5DQo+ID4g
ZW5hYmxlZC4NCj4gPiANCj4gPiBBZGQgbWluaW1hbCBoYW5kbGluZyBmb3IgdGhpcyBhdCBwcm9i
ZS9yZW1vdmUgdGltZS4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBMZW9uYXJkIENyZXN0ZXog
PGxlb25hcmQuY3Jlc3RlekBueHAuY29tPg0KPiANCj4gUGxlYXNlIGFsd2F5cyBleHBsYWluIHdo
YXQgY2hhbmdlZCBmcm9tIHRoZSBwcmV2aW91cyBwYXRjaCB2ZXJzaW9uLg0KDQpUaGVyZSBpcyBh
IGNoYW5nZWxvZyBpbiB0aGUgY292ZXIgbGV0dGVyLg0KDQo+ID4gKyAgICAgICAvKiBSZXN0YXJ0
IHRoZSBEQ1AgYmxvY2suICovDQo+ID4gKyAgICAgICByZXQgPSBzdG1wX3Jlc2V0X2Jsb2NrKHNk
Y3AtPmJhc2UpOw0KPiA+ICsgICAgICAgaWYgKHJldCkgew0KPiA+ICsgICAgICAgICAgICAgICBk
ZXZfZXJyKGRldiwgIkZhaWxlZCByZXNldFxuIik7DQo+ID4gKyAgICAgICAgICAgICAgIGdvdG8g
ZXJyX2Rpc2FibGVfdW5wcmVwYXJlX2NsazsNCj4gPiArICAgICAgIH0NCj4gDQo+IFRoaXMgc2Vl
bXMgbGlrZSBhbiB1bnJlbGF0ZWQgY2hhbmdlIHRoYXQgc2hvdWxkIGJlIGluIGEgc2VwYXJhdGUg
cGF0Y2guDQo+IA0KPiBBbHNvLCB0aGlzIHdhcyBub3QgcHJlc2VudCBpbiB2Mywgc28gaXQgaXMg
YmV0dGVyIHRvIGV4cGxhaW4gdGhhdCB0aGlzDQo+IGhhcyBiZWVuIGludHJvZHVjZWQgaW4gdjQu
DQoNClRoaXMgb25seSBsb29rcyBzbGlnaHRseSBvZGQgaW4gZ2l0IGRpZmYgYnV0IGl0J3Mgbm90
IHVucmVsYXRlZC4NCg0KSSBwbGFjZWQgY2xrIGdldC9wcmVwYXJlL2VuYWJsZSBqdXN0IGJlZm9y
ZSBzdG1wX3Jlc2V0X2Jsb2NrIGFuZCBtYWRlDQpzdG1wX3Jlc2V0X2Jsb2NrIHByaW50IGEgbWVz
c2FnZSBhbmQgZ290byBlcnJfZGlzYWJsZV91bnByZXBhcmVfY2xrIG9uDQpmYWlsdXJlIGluc3Rl
YWQgb2YganVzdCAiaWYgKHJldCkgcmV0dXJuIHJldDsiDQo=
