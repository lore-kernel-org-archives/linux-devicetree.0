From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH V3 2/5] thermal: qoriq: Fix error path of calling
 qoriq_tmu_register_tmu_zone fail
Date: Mon, 5 Aug 2019 07:01:16 +0000
Message-ID: <AM0PR04MB4211DB8BE9466954147295BA80DA0@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <20190730022126.17883-1-Anson.Huang@nxp.com>
 <20190730022126.17883-2-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190730022126.17883-2-Anson.Huang@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>, "rui.zhang@intel.com" <rui.zhang@intel.com>, "edubezval@gmail.com" <edubezval@gmail.com>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

PiBGcm9tOiBBbnNvbi5IdWFuZ0BueHAuY29tIDxBbnNvbi5IdWFuZ0BueHAuY29tPg0KPiBTZW50
OiBUdWVzZGF5LCBKdWx5IDMwLCAyMDE5IDEwOjIxIEFNDQo+IA0KPiBXaGVuIHJlZ2lzdGVyaW5n
IHRtdSB6b25lIGZhaWxlZCwgdGhlIGVycm9yIHBhdGggc2hvdWxkIGJlIGVycl90bXUgaW5zdGVh
ZCBvZg0KPiBlcnJfaW9tYXAsIGFzIGlvdW5tYXAoKSBuZWVkcyB0byBiZSBjYWxsZWQuDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBBbnNvbiBIdWFuZyA8QW5zb24uSHVhbmdAbnhwLmNvbT4NCg0KUmV2
aWV3ZWQtYnk6IERvbmcgQWlzaGVuZyA8YWlzaGVuZy5kb25nQG54cC5jb20+DQoNClJlZ2FyZHMN
CkFpc2hlbmcNCg==
