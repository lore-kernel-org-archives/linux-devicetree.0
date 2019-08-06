Return-Path: <SRS0=S1SN=WC=nxp.com=anson.huang@kernel.org>
From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH V4 1/4] dt-bindings: arm: imx: Add the soc binding for
 i.MX8MN
Date: Tue, 6 Aug 2019 05:42:05 +0000
Message-ID: 
 <DB3PR0402MB39162CCE914A9C250CC203BFF5D50@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <20190619022145.42398-1-Anson.Huang@nxp.com>
In-Reply-To: <20190619022145.42398-1-Anson.Huang@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "andrew.smirnov@gmail.com" <andrew.smirnov@gmail.com>, "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>, "j.neuschaefer@gmx.net" <j.neuschaefer@gmx.net>, "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>, Leo Li <leoyang.li@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, Vabhav Sharma <vabhav.sharma@nxp.com>, Bhaskar Upadhaya <bhaskar.upadhaya@nxp.com>, Jacky Bai <ping.bai@nxp.com>, Pramod Kumar <pramod.kumar_1@nxp.com>, Leonard Crestez <leonard.crestez@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

UGluZyBmb3IgdGhpcyBwYXRjaCBzZXJpZXMuLi4NCg0KPiBGcm9tOiBBbnNvbiBIdWFuZyA8QW5z
b24uSHVhbmdAbnhwLmNvbT4NCj4gDQo+IFRoaXMgcGF0Y2ggYWRkcyB0aGUgc29jICYgYm9hcmQg
YmluZGluZyBmb3IgaS5NWDhNTi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFuc29uIEh1YW5nIDxB
bnNvbi5IdWFuZ0BueHAuY29tPg0KPiBSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2Vy
bmVsLm9yZz4NCj4gLS0tDQo+IE5vIGNoYW5nZS4NCj4gLS0tDQo+ICBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvYXJtL2ZzbC55YW1sIHwgNiArKysrKysNCj4gIDEgZmlsZSBjaGFu
Z2VkLCA2IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvYXJtL2ZzbC55YW1sDQo+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2FybS9mc2wueWFtbA0KPiBpbmRleCA0MDcxMzhlLi5iMzVhYmIxIDEwMDY0
NA0KPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2ZzbC55YW1s
DQo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vZnNsLnlhbWwN
Cj4gQEAgLTE3Nyw2ICsxNzcsMTIgQEAgcHJvcGVydGllczoNCj4gICAgICAgICAgICAgICAgLSBm
c2wsaW14OG1tLWV2ayAgICAgICAgICAgICMgaS5NWDhNTSBFVksgQm9hcmQNCj4gICAgICAgICAg
ICAtIGNvbnN0OiBmc2wsaW14OG1tDQo+IA0KPiArICAgICAgLSBkZXNjcmlwdGlvbjogaS5NWDhN
TiBiYXNlZCBCb2FyZHMNCj4gKyAgICAgICAgaXRlbXM6DQo+ICsgICAgICAgICAgLSBlbnVtOg0K
PiArICAgICAgICAgICAgICAtIGZzbCxpbXg4bW4tZGRyNC1ldmsgICAgICAgICAgICAjIGkuTVg4
TU4gRERSNCBFVksgQm9hcmQNCj4gKyAgICAgICAgICAtIGNvbnN0OiBmc2wsaW14OG1uDQo+ICsN
Cj4gICAgICAgIC0gZGVzY3JpcHRpb246IGkuTVg4UVhQIGJhc2VkIEJvYXJkcw0KPiAgICAgICAg
ICBpdGVtczoNCj4gICAgICAgICAgICAtIGVudW06DQo+IC0tDQo+IDIuNy40DQoNCg==
