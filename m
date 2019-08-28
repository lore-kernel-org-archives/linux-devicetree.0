Return-Path: <SRS0=78rz=WY=nxp.com=anson.huang@kernel.org>
From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH V15 1/5] dt-bindings: fsl: scu: add thermal binding
Date: Wed, 28 Aug 2019 09:20:58 +0000
Message-ID: 
 <DB3PR0402MB3916DF85E27F417C0A0BD93CF5A30@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <20190618021820.14885-1-Anson.Huang@nxp.com>
	 <DB3PR0402MB39162C5B5AF828B127DD871EF5E00@DB3PR0402MB3916.eurprd04.prod.outlook.com>
	 <DB3PR0402MB39162EB555CD7AE75D58C582F5C60@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <ff3fd0ab2ba659e98070760be8e7c0f223e921f9.camel@intel.com>
In-Reply-To: <ff3fd0ab2ba659e98070760be8e7c0f223e921f9.camel@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
To: Zhang Rui <rui.zhang@intel.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "corbet@lwn.net" <corbet@lwn.net>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "edubezval@gmail.com" <edubezval@gmail.com>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, Aisheng Dong <aisheng.dong@nxp.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, Peng Fan <peng.fan@nxp.com>, "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>, "linux@roeck-us.net" <linux@roeck-us.net>, Daniel Baluta <daniel.baluta@nxp.com>, "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "olof@lixom.net" <olof@lixom.net>, "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, Leonard Crestez <leonard.crestez@nxp.com>, "dinguyen@kernel.org" <dinguyen@kernel.org>, "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

SGksIFJ1aQ0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggVjE1IDEvNV0gZHQtYmluZGluZ3M6IGZz
bDogc2N1OiBhZGQgdGhlcm1hbCBiaW5kaW5nDQo+IA0KPiBIaSwgQW5zb24sDQo+IA0KPiBXZSdy
ZSBtaXNzaW5nIEFDSyBmcm9tIHRoZSBtYWludGFpbmVycyBmb3IgcGF0Y2ggNC81IGFuZCA1LzUs
IGlmIHdlIHdhbnQgdG8NCj4gc2hpcHBlZCB0aGUgcGF0Y2ggdmlhIHRoZXJtYWwgdHJlZS4NCg0K
SSB0aGluayA0LzUgYW5kIDUvNSBjYW4gYmUgdGFrZW4gYnkgU2hhd24gR3VvIG9uY2UgdGhlIGRy
aXZlciBwYXJ0IGlzIHRha2VuLCBoZQ0Kbm9ybWFsbHkgZG8gaXQgaW4gdGhpcyB3YXksIG9uY2Ug
ZHJpdmVyIGFuZCBkdC1iaW5kaW5nIGFyZSB0YWtlbiwgSSB3aWxsIG5vdGlmeSBoaW0uDQoNCj4g
DQo+IEZvciBwYXRjaCAyLzUsIGFzIGl0IGludHJvZHVjZXMgYSBuZXcgQVBJIGZvciBPRl9USEVS
TUFMLCBJJ2QgbGlrZSB0byBnZXQNCj4gRWR1YXJkbycgZmVlZGJhY2sgYmVmb3JlIHRha2luZyB0
aGVtLg0KDQpPSywgTk9UIHN1cmUgd2hlbiBoZSBjYW4gdGFrZSBhIGxvb2sgYXQgaXQsIHdlIGFy
ZSBraW5kIG9mIHBlbmRpbmcgb24gdGhpcyBmb3Igc29tZQ0KdGltZSwgbGV0J3Mgd2FpdC4gSWYg
eW91IGhhdmUgY2hhbmNlIHRvIHRhbGsgdG8gaGltLCBwbGVhc2UgaGVscCBhc2sgZm9yIGhlbHAg
ZnJvbSBoaW0gYWJvdXQNCnRoaXMgcGF0Y2ggc2VyaWVzLCB0aGFua3MgYSBsb3QhDQoNCnRoYW5r
cywNCkFuc29uDQoNCg0K
