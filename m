From: Peng Ma <peng.ma@nxp.com>
Subject: RE: [v11 1/7] dmaengine: fsldma: Replace DMA_IN/OUT by FSL_DMA_IN/OUT
Date: Thu, 6 Dec 2018 11:24:29 +0000
Message-ID: <VI1PR04MB44316BBB8821ACD7F9A348EEEDA90@VI1PR04MB4431.eurprd04.prod.outlook.com>
References: <20181030023604.34027-1-peng.ma@nxp.com>
 <20181205174923.GU2847@vkoul-mobl>
Mime-Version: 1.0
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181205174923.GU2847@vkoul-mobl>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "zw@zh-kernel.org" <zw@zh-kernel.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Wen He <wen.he_1@nxp.com>
List-Id: devicetree@vger.kernel.org

SGkgVmlub2QsDQoJDQoJVGhhbmtzIGZvciB5b3VyIGFwcGx5LCBJIGhhdmUgZmluaXNoZWQgdXBk
YXRlIERUUyBwYXRjaCwgcGxlYXNlIHJldmlldy4NCg0KQmVzdCBSZWdhcmRzLA0KCVBlbmcNCg0K
Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogVmlub2QgS291bCA8dmtvdWxAa2Vy
bmVsLm9yZz4NCj5TZW50OiAyMDE4xOoxMtTCNsjVIDE6NDkNCj5UbzogUGVuZyBNYSA8cGVuZy5t
YUBueHAuY29tPg0KPkNjOiByb2JoK2R0QGtlcm5lbC5vcmc7IG1hcmsucnV0bGFuZEBhcm0uY29t
OyBzaGF3bmd1b0BrZXJuZWwub3JnOyBMZW8NCj5MaSA8bGVveWFuZy5saUBueHAuY29tPjsgZGFu
Lmoud2lsbGlhbXNAaW50ZWwuY29tOyB6d0B6aC1rZXJuZWwub3JnOw0KPmRtYWVuZ2luZUB2Z2Vy
Lmtlcm5lbC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOw0KPmxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsNCj5s
aW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZzsgV2VuIEhlIDx3ZW4uaGVfMUBueHAuY29tPg0K
PlN1YmplY3Q6IFJlOiBbdjExIDEvN10gZG1hZW5naW5lOiBmc2xkbWE6IFJlcGxhY2UgRE1BX0lO
L09VVCBieQ0KPkZTTF9ETUFfSU4vT1VUDQo+DQo+T24gMzAtMTAtMTgsIDEwOjM1LCBQZW5nIE1h
IHdyb3RlOg0KPj4gRnJvbTogV2VuIEhlIDx3ZW4uaGVfMUBueHAuY29tPg0KPj4NCj4+IFRoaXMg
cGF0Y2ggaW1wbGVtZW50IGEgc3RhbmRhcmQgbWFjcm8gY2FsbCBmdW5jdGlvbnMgaXMgdXNlZCB0
byBOWFANCj4+IGRtYSBkcml2ZXJzLg0KPg0KPkFwcGxpZWQgYWxsIGV4Y2VwdCBEVFMgcGF0Y2hl
cywgdGhhbmtzDQo+LS0NCj5+Vmlub2QNCg==
