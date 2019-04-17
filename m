Return-Path: <SRS0=oECs=ST=nxp.com=aisheng.dong@kernel.org>
From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH V12 1/5] dt-bindings: fsl: scu: add thermal binding
Date: Wed, 17 Apr 2019 03:31:55 +0000
Message-ID: 
 <AM0PR04MB42118E59E441BE043A3BE54F80250@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1555384609-7030-1-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1555384609-7030-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
To: Anson Huang <anson.huang@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "rui.zhang@intel.com" <rui.zhang@intel.com>, "edubezval@gmail.com" <edubezval@gmail.com>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, Daniel Baluta <daniel.baluta@nxp.com>, Peng Fan <peng.fan@nxp.com>, "heiko@sntech.de" <heiko@sntech.de>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "agross@kernel.org" <agross@kernel.org>, "olof@lixom.net" <olof@lixom.net>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>, "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, "marc.w.gonzalez@free.fr" <marc.w.gonzalez@free.fr>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

PiBGcm9tOiBBbnNvbiBIdWFuZw0KPiBTZW50OiBUdWVzZGF5LCBBcHJpbCAxNiwgMjAxOSAxMToy
MiBBTQ0KPiANCj4gTlhQIGkuTVg4UVhQIGlzIGFuIEFSTXY4IFNvQyB3aXRoIGEgQ29ydGV4LU00
IGNvcmUgaW5zaWRlIGFzIHN5c3RlbQ0KPiBjb250cm9sbGVyLCB0aGUgc3lzdGVtIGNvbnRyb2xs
ZXIgaXMgaW4gY2hhcmdlIG9mIHN5c3RlbSBwb3dlciwgY2xvY2sgYW5kDQo+IHRoZXJtYWwgc2Vu
c29ycyBldGMuIG1hbmFnZW1lbnQsIExpbnV4IGtlcm5lbCBoYXMgdG8gY29tbXVuaWNhdGUgd2l0
aA0KPiBzeXN0ZW0gY29udHJvbGxlciB2aWEgTVUgKG1lc3NhZ2UgdW5pdCkgSVBDIHRvIGdldCB0
ZW1wZXJhdHVyZSBmcm9tIHRoZXJtYWwNCj4gc2Vuc29ycywgdGhpcyBwYXRjaCBhZGRzIGJpbmRp
bmcgZG9jIGZvciBpLk1YIHN5c3RlbSBjb250cm9sbGVyIHRoZXJtYWwgZHJpdmVyLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogQW5zb24gSHVhbmcgPEFuc29uLkh1YW5nQG54cC5jb20+DQo+IC0tLQ0K
PiBObyBjaGFuZ2VzLg0KPiAtLS0NCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9mcmVl
c2NhbGUvZnNsLHNjdS50eHQgICAgICAgIHwgMTYNCj4gKysrKysrKysrKysrKysrKw0KPiAgMSBm
aWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2ZyZWVzY2FsZS9mc2wsc2N1LnR4dA0KPiBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vZnJlZXNjYWxlL2ZzbCxzY3Uu
dHh0DQo+IGluZGV4IDVkN2RiYWIuLmY0ZmI2ZDUgMTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vZnJlZXNjYWxlL2ZzbCxzY3UudHh0DQo+ICsrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vZnJlZXNjYWxlL2ZzbCxzY3Uu
dHh0DQo+IEBAIC0xMzMsNiArMTMzLDE3IEBAIFJUQyBiaW5kaW5ncyBiYXNlZCBvbiBTQ1UgTWVz
c2FnZSBQcm90b2NvbA0KPiBSZXF1aXJlZCBwcm9wZXJ0aWVzOg0KPiAgLSBjb21wYXRpYmxlOiBz
aG91bGQgYmUgImZzbCxpbXg4cXhwLXNjLXJ0YyI7DQo+IA0KPiArVGhlcm1hbCBiaW5kaW5ncyBi
YXNlZCBvbiBTQ1UgTWVzc2FnZSBQcm90b2NvbA0KPiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICsNCj4gK1JlcXVpcmVkIHBy
b3BlcnRpZXM6DQo+ICstIGNvbXBhdGlibGU6CQkJU2hvdWxkIGJlIDoNCj4gKwkJCQkgICJmc2ws
aW14OHF4cC1zYy10aGVybWFsIg0KPiArCQkJCWZvbGxvd2VkIGJ5ICJmc2wsaW14LXNjLXRoZXJt
YWwiOw0KPiArDQo+ICstICN0aGVybWFsLXNlbnNvci1jZWxsczoJU2VlDQo+IERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy90aGVybWFsL3RoZXJtYWwudHh0DQo+ICsJCQkJZm9yIGEg
ZGVzY3JpcHRpb24uDQoNCkJldHRlciB0byBoYXZlIGFuIGV4cGxpY2l0IHZhbHVlIGhlcmUuDQpl
LmcuDQpNdXN0IGJlIDEuIFNlZSB4eHggZm9yIGEgZGVzY3JpcHRpb24uDQoNCk90aGVyd2lzZToN
ClJldmlld2VkLWJ5OiBEb25nIEFpc2hlbmcgPGFpc2hlbmcuZG9uZ0BueHAuY29tPg0KDQpSZWdh
cmRzDQpEb25nIEFpc2hlbmcNCg==
