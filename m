From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: Re: [PATCH v3 10/21] ARM: dts: imx6qdl-colibri: Add missing pin
 declaration in iomuxc
Date: Fri, 9 Aug 2019 15:00:49 +0000
Message-ID: <c0fa7267d6741ebfc5936e7650388f364dfc63c9.camel@toradex.com>
References: <20190807082556.5013-1-philippe.schenker@toradex.com>
         <20190807082556.5013-11-philippe.schenker@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190807082556.5013-11-philippe.schenker@toradex.com>
Content-Language: en-US
Content-ID: <8959A8F1E13A494281877C2426FEB519@eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Max Krummenacher <max.krummenacher@toradex.com>, "stefan@agner.ch" <stefan@agner.ch>, Philippe Schenker <philippe.schenker@toradex.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "michal.vokac@ysoft.com" <michal.vokac@ysoft.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-imx@nxp.com" <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

T24gV2VkLCAyMDE5LTA4LTA3IGF0IDA4OjI2ICswMDAwLCBQaGlsaXBwZSBTY2hlbmtlciB3cm90
ZToNCj4gVGhpcyBhZGRzIHRoZSBtdXhpbmcgZm9yIHRoZSBvcHRpb25hbCBwaW5zIHVzYi1vYyAo
b3ZlcmN1cnJlbnQpIGFuZA0KPiB1c2ItaWQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXBw
ZSBTY2hlbmtlciA8cGhpbGlwcGUuc2NoZW5rZXJAdG9yYWRleC5jb20+DQoNCkFja2VkLWJ5OiBN
YXJjZWwgWmlzd2lsZXIgPG1hcmNlbC56aXN3aWxlckB0b3JhZGV4LmNvbT4NCg0KPiAtLS0NCj4g
DQo+IENoYW5nZXMgaW4gdjM6IE5vbmUNCj4gQ2hhbmdlcyBpbiB2MjogTm9uZQ0KPiANCj4gIGFy
Y2gvYXJtL2Jvb3QvZHRzL2lteDZxZGwtY29saWJyaS5kdHNpIHwgMTQgKysrKysrKysrKysrKysN
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
YXJjaC9hcm0vYm9vdC9kdHMvaW14NnFkbC1jb2xpYnJpLmR0c2kNCj4gYi9hcmNoL2FybS9ib290
L2R0cy9pbXg2cWRsLWNvbGlicmkuZHRzaQ0KPiBpbmRleCAwMTlkZGE2Yjg4YWQuLjlhNjNkZWJh
YjBiNSAxMDA2NDQNCj4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvaW14NnFkbC1jb2xpYnJpLmR0
c2kNCj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvaW14NnFkbC1jb2xpYnJpLmR0c2kNCj4gQEAg
LTYxNSw2ICs2MTUsMTMgQEANCj4gIAkJPjsNCj4gIAl9Ow0KPiAgDQo+ICsJcGluY3RybF91c2Jo
X29jXzE6IHVzYmhfb2MtMSB7DQo+ICsJCWZzbCxwaW5zID0gPA0KPiArCQkJLyogVVNCSF9PQyAq
Lw0KPiArCQkJTVg2UURMX1BBRF9FSU1fRDMwX19HUElPM19JTzMwCQkweDFiMA0KPiBiMA0KPiAr
CQk+Ow0KPiArCX07DQo+ICsNCj4gIAlwaW5jdHJsX3NwZGlmOiBzcGRpZmdycCB7DQo+ICAJCWZz
bCxwaW5zID0gPA0KPiAgCQkJTVg2UURMX1BBRF9HUElPXzE3X19TUERJRl9PVVQgMHgxYjBiMA0K
PiBAQCAtNjgxLDYgKzY4OCwxMyBAQA0KPiAgCQk+Ow0KPiAgCX07DQo+ICANCj4gKwlwaW5jdHJs
X3VzYmNfaWRfMTogdXNiY19pZC0xIHsNCj4gKwkJZnNsLHBpbnMgPSA8DQo+ICsJCQkvKiBVU0JD
X0lEICovDQo+ICsJCQlNWDZRRExfUEFEX05BTkRGX0QyX19HUElPMl9JTzAyCQkweDFiMA0KPiBi
MA0KPiArCQk+Ow0KPiArCX07DQo+ICsNCj4gIAlwaW5jdHJsX3VzZGhjMTogdXNkaGMxZ3JwIHsN
Cj4gIAkJZnNsLHBpbnMgPSA8DQo+ICAJCQlNWDZRRExfUEFEX1NEMV9DTURfX1NEMV9DTUQJMHgx
NzA3MQ0K
