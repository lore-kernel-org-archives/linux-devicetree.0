From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH V3 3/5] thermal: qoriq: Use
 devm_platform_ioremap_resource() instead of of_iomap()
Date: Mon, 5 Aug 2019 07:01:42 +0000
Message-ID: <AM0PR04MB42118D4ECDEDA63B6CCA4C4D80DA0@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <20190730022126.17883-1-Anson.Huang@nxp.com>
 <20190730022126.17883-3-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190730022126.17883-3-Anson.Huang@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>, "rui.zhang@intel.com" <rui.zhang@intel.com>, "edubezval@gmail.com" <edubezval@gmail.com>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

PiBGcm9tOiBBbnNvbi5IdWFuZ0BueHAuY29tIDxBbnNvbi5IdWFuZ0BueHAuY29tPg0KPiBTZW50
OiBUdWVzZGF5LCBKdWx5IDMwLCAyMDE5IDEwOjIxIEFNDQo+IA0KPiBVc2UgZGV2bV9wbGF0Zm9y
bV9pb3JlbWFwX3Jlc291cmNlKCkgaW5zdGVhZCBvZiBvZl9pb21hcCgpIHRvIHNhdmUgdGhlDQo+
IGlvdW5tYXAoKSBjYWxsIGluIGVycm9yIGhhbmRsZSBwYXRoOw0KPiANCj4gU2lnbmVkLW9mZi1i
eTogQW5zb24gSHVhbmcgPEFuc29uLkh1YW5nQG54cC5jb20+DQoNClJldmlld2VkLWJ5OiBEb25n
IEFpc2hlbmcgPGFpc2hlbmcuZG9uZ0BueHAuY29tPg0KDQpSZWdhcmRzDQpBaXNoZW5nDQo=
