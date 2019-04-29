Return-Path: <SRS0=BKL8=S7=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr80083.outbound.protection.outlook.com ([40.107.8.83]:25248
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727621AbfD2K3Z (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 29 Apr 2019 06:29:25 -0400
From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH v2 3/3] mmc: add HS400 support for iMX7ULP
Date: Mon, 29 Apr 2019 10:29:21 +0000
Message-ID: <AM0PR04MB42116553966D9E00C09D382A80390@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <20190429090310.25484-1-haibo.chen@nxp.com>
 <20190429090310.25484-4-haibo.chen@nxp.com>
In-Reply-To: <20190429090310.25484-4-haibo.chen@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: BOUGH CHEN <haibo.chen@nxp.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, "adrian.hunter@intel.com" <adrian.hunter@intel.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
Cc: "kernel@pengutronix.de" <kernel@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

PiBGcm9tOiBCT1VHSCBDSEVODQo+IFNlbnQ6IE1vbmRheSwgQXByaWwgMjksIDIwMTkgNDo1NiBQ
TQ0KPiBTdWJqZWN0OiBbUEFUQ0ggdjIgMy8zXSBtbWM6IGFkZCBIUzQwMCBzdXBwb3J0IGZvciBp
TVg3VUxQDQo+IA0KPiBBZGQgSFM0MDAgc3VwcG9ydCBmb3IgaU1YN1VMUCBCMC4NCj4gDQo+IEFj
Y29yZGluZyB0byBJQyBzdWdnZXN0LCBuZWVkIHRvIGNsZWFyIHRoZSBTVFJPQkVfRExMX0NUUkxf
UkVTRVQgYmVmb3JlIGFueQ0KPiBzZXR0aW5nIG9mIFNUUk9CRV9ETExfQ1RSTCByZWdpc3Rlci4N
Cj4gDQo+IFVTREhDIGhhcyByZWdpc3RlciBiaXRzKGJpdFsyN34yMF0gb2YgcmVnaXN0ZXIgU1RS
T0JFX0RMTF9DVFJMKSBmb3Igc2xhdmUgc2VsDQo+IHZhbHVlLiBJZiB0aGlzIHJlZ2lzdGVyIGJp
dHMgdmFsdWUgaXMgMCwgIGl0IG5lZWRzDQo+IDI1NiByZWZfY2xrIGN5Y2xlcyB0byB1cGRhdGUg
c2xhdmUgc2VsIHZhbHVlLiBJQyBzdWdnZXN0IHRvIHNldCBiaXRbMjd+MjBdIHRvIDB4NCwNCj4g
aXQgb25seSBuZWVkIDQgcmVmX2NsayBjeWNsZSB0byB1cGRhdGUgc2xhdmUgc2VsIHZhbHVlLiBU
aGlzIHdpbGwgc2hvcnQgdGhlIGxvY2sNCj4gdGltZSBvZiBzbGF2ZS4NCj4gDQo+IGkuTVg3VUxQ
IEIwIHdpbGwgbmVlZCBtb3JlIHRpbWUgdG8gbG9jayB0aGUgUkVGIGFuZCBTTFYsIHNvIGNoYW5n
ZSB0byBhZGQNCj4gNXVzIGRlbGF5Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSGFpYm8gQ2hlbiA8
aGFpYm8uY2hlbkBueHAuY29tPg0KDQptbWM6IHNkaGNpLWVzZGhjLWlteDogYWRkIEhTNDAwIHN1
cHBvcnQgZm9yIGlNWDdVTFANCg0Kb3RoZXJ3aXNlOg0KUmV2aWV3ZWQtYnk6IERvbmcgQWlzaGVu
ZyA8YWlzaGVuZy5kb25nQG54cC5jb20+DQoNClJlZ2FyZHMNCkRvbmcgQWlzaGVuZw0K
