From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH 2/2] arm64: dts: imx8mm: Correct OPP table according to
 latest datasheet
Date: Fri, 28 Jun 2019 06:17:02 +0000
Message-ID: <DB3PR0402MB39167143DD42C6A76B2A2A7BF5FC0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <20190628032800.8428-1-Anson.Huang@nxp.com>
 <20190628032800.8428-2-Anson.Huang@nxp.com>
 <VI1PR04MB50555399D8A3E4890D8C91E6EEFC0@VI1PR04MB5055.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <VI1PR04MB50555399D8A3E4890D8C91E6EEFC0@VI1PR04MB5055.eurprd04.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Leonard Crestez <leonard.crestez@nxp.com>, Jacky Bai <ping.bai@nxp.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>, Daniel Baluta <daniel.baluta@nxp.com>, Abel Vesa <abel.vesa@nxp.com>, "andrew.smirnov@gmail.com" <andrew.smirnov@gmail.com>, "ccaione@baylibre.com" <ccaione@baylibre.com>, "angus@akkea.ca" <angus@akkea.ca>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kern>
List-Id: devicetree@vger.kernel.org

SGksIExlb25hcmQNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMZW9u
YXJkIENyZXN0ZXoNCj4gU2VudDogRnJpZGF5LCBKdW5lIDI4LCAyMDE5IDI6MDEgUE0NCj4gVG86
IEFuc29uIEh1YW5nIDxhbnNvbi5odWFuZ0BueHAuY29tPjsgSmFja3kgQmFpIDxwaW5nLmJhaUBu
eHAuY29tPjsNCj4gbC5zdGFjaEBwZW5ndXRyb25peC5kZQ0KPiBDYzogcm9iaCtkdEBrZXJuZWwu
b3JnOyBtYXJrLnJ1dGxhbmRAYXJtLmNvbTsgc2hhd25ndW9Aa2VybmVsLm9yZzsNCj4gcy5oYXVl
ckBwZW5ndXRyb25peC5kZTsga2VybmVsQHBlbmd1dHJvbml4LmRlOyBmZXN0ZXZhbUBnbWFpbC5j
b207DQo+IHZpcmVzaC5rdW1hckBsaW5hcm8ub3JnOyBEYW5pZWwgQmFsdXRhIDxkYW5pZWwuYmFs
dXRhQG54cC5jb20+OyBBYmVsDQo+IFZlc2EgPGFiZWwudmVzYUBueHAuY29tPjsgYW5kcmV3LnNt
aXJub3ZAZ21haWwuY29tOw0KPiBjY2Fpb25lQGJheWxpYnJlLmNvbTsgYW5ndXNAYWtrZWEuY2E7
IGFneEBzaWd4Y3B1Lm9yZzsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFy
bS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgtDQo+IGtlcm5lbEB2Z2VyLmtlcm5l
bC5vcmc7IGRsLWxpbnV4LWlteCA8bGludXgtaW14QG54cC5jb20+DQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggMi8yXSBhcm02NDogZHRzOiBpbXg4bW06IENvcnJlY3QgT1BQIHRhYmxlIGFjY29yZGlu
ZyB0bw0KPiBsYXRlc3QgZGF0YXNoZWV0DQo+IA0KPiBPbiAyOC4wNi4yMDE5IDA2OjM3LCBBbnNv
bi5IdWFuZ0BueHAuY29tIHdyb3RlOg0KPiANCj4gPiBBY2NvcmRpbmcgdG8gbGF0ZXN0IGRhdGFz
aGVldCAoUmV2LjAuMiwgMDQvMjAxOSkgZnJvbSBiZWxvdyBsaW5rcywNCj4gPiAxLjhHSHogaXMg
T05MWSBhdmFpbGFibGUgZm9yIGNvbnN1bWVyIHBhcnQsIHNvIHRoZSBtYXJrZXQgc2VnbWVudCBi
aXRzDQo+ID4gZm9yIDEuOEdIeiBvcHAgc2hvdWxkIE9OTFkgYXZhaWxhYmxlIGZvciBjb25zdW1l
ciBwYXJ0IGFjY29yZGluZ2x5Lg0KPiA+DQo+ID4gICAJCQlvcHAtaHogPSAvYml0cy8gNjQgPDE4
MDAwMDAwMDA+Ow0KPiA+ICAgCQkJb3BwLW1pY3Jvdm9sdCA9IDwxMDAwMDAwPjsNCj4gPiAgIAkJ
CS8qIENvbnN1bWVyIG9ubHkgYnV0IHJlbHkgb24gc3BlZWQgZ3JhZGluZyAqLw0KPiA+IC0JCQlv
cHAtc3VwcG9ydGVkLWh3ID0gPDB4OD4sIDwweDc+Ow0KPiA+ICsJCQlvcHAtc3VwcG9ydGVkLWh3
ID0gPDB4OD4sIDwweDM+Ow0KPiANCj4gT25seSBjb25zdW1lciBwYXJ0cyBzaG91bGQgYmUgZnVz
ZWQgZm9yIHRoaXMgaGlnaGVzdCBPUFAuIElmIHlvdSBkb24ndCB3YW50DQo+IHRvIHJlbHkgb24g
dGhpcyB0aGVuIG1heWJlIGFsc28gZGVsZXRlIHRoZSBjb21tZW50IGFib3ZlPw0KDQpBcyBJIHJl
cGxpZWQgaW4gcHJldmlvdXMgaS5NWDhNUSBwYXRjaCwgaWYgdGhlIGNvbW1lbnRzIG1ha2UgcmVh
ZGVyIGNvbmZ1c2VkLA0Kc2hvdWxkIHdlIGp1c3QgcmVtb3ZlIGFsbCB0aG9zZSBjb21tZW50cz8N
Cg0KVGhhbmtzLA0KQW5zb24uDQoNCj4gDQo+IC0tDQo+IFJlZ2FyZHMsDQo+IGxlb25hcmQNCg==
