From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH V3 4/5] thermal: qoriq: Use __maybe_unused instead of #if
 CONFIG_PM_SLEEP
Date: Mon, 5 Aug 2019 07:02:17 +0000
Message-ID: <AM0PR04MB42111BCE0526BADF6F5755C680DA0@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <20190730022126.17883-1-Anson.Huang@nxp.com>
 <20190730022126.17883-4-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190730022126.17883-4-Anson.Huang@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>, "rui.zhang@intel.com" <rui.zhang@intel.com>, "edubezval@gmail.com" <edubezval@gmail.com>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

PiBGcm9tOiBBbnNvbi5IdWFuZ0BueHAuY29tIDxBbnNvbi5IdWFuZ0BueHAuY29tPg0KPiBTZW50
OiBUdWVzZGF5LCBKdWx5IDMwLCAyMDE5IDEwOjIxIEFNDQo+IA0KPiBVc2UgX19tYXliZV91bnVz
ZWQgZm9yIHBvd2VyIG1hbmFnZW1lbnQgcmVsYXRlZCBmdW5jdGlvbnMgaW5zdGVhZCBvZiAjaWYN
Cj4gQ09ORklHX1BNX1NMRUVQIHRvIHNpbXBseSB0aGUgY29kZS4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IEFuc29uIEh1YW5nIDxBbnNvbi5IdWFuZ0BueHAuY29tPg0KDQpSZXZpZXdlZC1ieTogRG9u
ZyBBaXNoZW5nIDxhaXNoZW5nLmRvbmdAbnhwLmNvbT4NCg0KUmVnYXJkcw0KQWlzaGVuZw0K
