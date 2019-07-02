Return-Path: <SRS0=J/Os=U7=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr00047.outbound.protection.outlook.com ([40.107.0.47]:43396
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725868AbfGBJKK (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 2 Jul 2019 05:10:10 -0400
From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH RESEND V4 1/5] clocksource: timer-of: Support getting
 clock frequency from DT
Date: Tue, 2 Jul 2019 09:10:07 +0000
Message-ID: <DB3PR0402MB3916D80505D5C5CBA82348B3F5F80@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <20190702075513.17451-1-Anson.Huang@nxp.com>
 <c7ff76e5-d73d-e71e-c3f4-445bdd2c5b93@linaro.org>
 <DB3PR0402MB39166F04BAF9BA9D6C75B3A8F5F80@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <0540a255-93e5-d68f-5bf5-31f9043fb3ad@linaro.org>
In-Reply-To: <0540a255-93e5-d68f-5bf5-31f9043fb3ad@linaro.org>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, Leonard Crestez <leonard.crestez@nxp.com>, "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>, Daniel Baluta <daniel.baluta@nxp.com>, Jacky Bai <ping.bai@nxp.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, "andrew.smirnov@gmail.com" <andrew.smirnov@gmail.com>, "ccaione@baylibre.com" <ccaione@baylibre.com>, "angus@akkea.ca" <angus@akkea.ca>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

SGksIERhbmllbA0KDQo+IE9uIDAyLzA3LzIwMTkgMTE6MDMsIEFuc29uIEh1YW5nIHdyb3RlOg0K
PiA+IEhpLCBEYW5pZWwNCj4gPg0KPiA+PiBIaSBBbnNvbiwNCj4gPj4NCj4gPj4gd2h5IGRpZCB5
b3UgcmVzZW5kIHRoZSBzZXJpZXM/DQo+ID4NCj4gPiBQcmV2aW91cyBwYXRjaCBzZXJpZXMgaGFz
IGJ1aWxkIHdhcm5pbmcgYW5kIEkgZGlkIE5PVCBub3RpY2UsIHNvcnJ5DQo+ID4gZm9yIHRoYXQs
DQo+ID4NCj4gPiBkcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLW9mLmM6IEluIGZ1bmN0aW9uIOKA
mHRpbWVyX29mX2luaXTigJk6DQo+ID4gZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1vZi5jOjE4
NTozMDogd2FybmluZzogc3VnZ2VzdCBwYXJlbnRoZXNlcw0KPiBhcm91bmQgY29tcGFyaXNvbiBp
biBvcGVyYW5kIG9mIOKAmCbigJkgWy1XcGFyZW50aGVzZXNdDQo+ID4gICBpZiAodG8tPmZsYWdz
ICYgY2xvY2tfZmxhZ3MgPT0gY2xvY2tfZmxhZ3MpDQo+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXg0KPiA+DQo+ID4gc28gSSByZXNlbmQgdGhlIHBhdGNoIHNlcmllcyB3aXRoIGJl
bG93LCBzb3JyeSBmb3IgbWlzc2luZyBtZW50aW9uIG9mIHRoZQ0KPiBjaGFuZ2VzIGluIHJlc2Vu
dCBwYXRjaCBzZXJpZXMuDQo+ID4NCj4gPiAgKwlpZiAoKHRvLT5mbGFncyAmIGNsb2NrX2ZsYWdz
KSA9PSBjbG9ja19mbGFncykNCj4gPg0KPiA+IFNvcnJ5IGZvciBtYWlsIHN0b3JtLi4uDQo+IA0K
PiBObyBwcm9ibGVtIGF0IGFsbCwgSSBwcmVmZXIgdGhpcyBjYXVnaHQgYW5kIGZpeGVkIGVhcmx5
IDopDQo+IA0KPiBOZXh0IHRpbWUganVzdCBzZW5kIGEgVjUgYmVjYXVzZSAncmVzZW5kJyBtZWFu
cyB0aGVyZSBpcyBubyBjaGFuZ2UgYnV0DQo+IHRoZXJlIHdhcyBhIHByb2JsZW0gd2l0aCB0aGUg
ZW1haWwgKGNvdWxkIGJlIGFsc28gaW50ZXJwcmV0ZWQgYXMgYSBnZW50bGUNCj4gcGluZykuDQoN
Ck9LLCB3aWxsIGtlZXAgaXQgaW4gbWluZCwgdGhhbmtzIGZvciBzaGFyaW5nIHVzZWZ1bCBleHBl
cmllbmNlIQ0KDQpUaGFua3MsDQpBbnNvbg0KDQo=
