From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH RESEND V4 2/3] arm64: dts: imx8qxp: Move watchdog node
 into scu node
Date: Tue, 4 Jun 2019 09:06:28 +0000
Message-ID: <DB3PR0402MB39162F3811484D90546B4CC2F5150@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1557655528-12816-1-git-send-email-Anson.Huang@nxp.com>
 <1557655528-12816-2-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1557655528-12816-2-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "wim@linux-watchdog.org" <wim@linux-watchdog.org>, "linux@roeck-us.net" <linux@roeck-us.net>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, Aisheng Dong <aisheng.dong@nxp.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, Daniel Baluta <daniel.baluta@nxp.com>, Peng Fan <peng.fan@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm->
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

SGksIFNoYXduDQoJVGhlIGRyaXZlciBhbmQgYmluZGluZyBkb2MgYXJlIGFscmVhZHkgcmV2aWV3
ZWQgYW5kIHdhaXRpbmcgZm9yIERUIHBhdGNoLCB3aWxsIHlvdSBoZWxwIHJldmlldyB0aGlzIERU
IHBhdGNoPw0KDQpUaGFua3MsDQpBbnNvbg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+IEZyb206IEFuc29uIEh1YW5nDQo+IFNlbnQ6IFN1bmRheSwgTWF5IDEyLCAyMDE5IDY6MTEg
UE0NCj4gVG86IHJvYmgrZHRAa2VybmVsLm9yZzsgbWFyay5ydXRsYW5kQGFybS5jb207IHdpbUBs
aW51eC13YXRjaGRvZy5vcmc7DQo+IGxpbnV4QHJvZWNrLXVzLm5ldDsgc2hhd25ndW9Aa2VybmVs
Lm9yZzsgcy5oYXVlckBwZW5ndXRyb25peC5kZTsNCj4ga2VybmVsQHBlbmd1dHJvbml4LmRlOyBm
ZXN0ZXZhbUBnbWFpbC5jb207IEFpc2hlbmcgRG9uZw0KPiA8YWlzaGVuZy5kb25nQG54cC5jb20+
OyB1bGYuaGFuc3NvbkBsaW5hcm8ub3JnOyBEYW5pZWwgQmFsdXRhDQo+IDxkYW5pZWwuYmFsdXRh
QG54cC5jb20+OyBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT47DQo+IGRldmljZXRyZWVAdmdl
ci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4gd2F0
Y2hkb2dAdmdlci5rZXJuZWwub3JnOyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5v
cmcNCj4gQ2M6IGRsLWxpbnV4LWlteCA8bGludXgtaW14QG54cC5jb20+DQo+IFN1YmplY3Q6IFtQ
QVRDSCBSRVNFTkQgVjQgMi8zXSBhcm02NDogZHRzOiBpbXg4cXhwOiBNb3ZlIHdhdGNoZG9nIG5v
ZGUNCj4gaW50byBzY3Ugbm9kZQ0KPiANCj4gaS5NWCBzeXN0ZW0gY29udHJvbGxlciB3YXRjaGRv
ZyBoYXMgcHJldGltZW91dCBmdW5jdGlvbiB3aGljaCBkZXBlbmRzIG9uDQo+IGkuTVggU0NVIGRy
aXZlciwgc28gaXQgc2hvdWxkIGJlIGEgc3Vibm9kZSBvZiBTQ1UuDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBBbnNvbiBIdWFuZyA8QW5zb24uSHVhbmdAbnhwLmNvbT4NCj4gLS0tDQo+IE5vIGNoYW5n
ZSwganVzdCByZXNlbmQgcGF0Y2ggd2l0aCBjb3JyZWN0IGVuY29kaW5nLg0KPiAtLS0NCj4gIGFy
Y2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhxeHAuZHRzaSB8IDEwICsrKysrLS0tLS0N
Cj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OHF4cC5kdHNp
DQo+IGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OHF4cC5kdHNpDQo+IGluZGV4
IDA2ODNlZTIuLmIxN2MyMmUgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJl
ZXNjYWxlL2lteDhxeHAuZHRzaQ0KPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2Fs
ZS9pbXg4cXhwLmR0c2kNCj4gQEAgLTE0OSw2ICsxNDksMTEgQEANCj4gIAkJcnRjOiBydGMgew0K
PiAgCQkJY29tcGF0aWJsZSA9ICJmc2wsaW14OHF4cC1zYy1ydGMiOw0KPiAgCQl9Ow0KPiArDQo+
ICsJCXdhdGNoZG9nIHsNCj4gKwkJCWNvbXBhdGlibGUgPSAiZnNsLGlteDhxeHAtc2Mtd2R0Iiwg
ImZzbCxpbXgtc2Mtd2R0IjsNCj4gKwkJCXRpbWVvdXQtc2VjID0gPDYwPjsNCj4gKwkJfTsNCj4g
IAl9Ow0KPiANCj4gIAl0aW1lciB7DQo+IEBAIC01MTcsOSArNTIyLDQgQEANCj4gIAkJCXBvd2Vy
LWRvbWFpbnMgPSA8JnBkIElNWF9TQ19SX0dQSU9fNz47DQo+ICAJCX07DQo+ICAJfTsNCj4gLQ0K
PiAtCXdhdGNoZG9nIHsNCj4gLQkJY29tcGF0aWJsZSA9ICJmc2wsaW14OHF4cC1zYy13ZHQiLCAi
ZnNsLGlteC1zYy13ZHQiOw0KPiAtCQl0aW1lb3V0LXNlYyA9IDw2MD47DQo+IC0JfTsNCj4gIH07
DQo+IC0tDQo+IDIuNy40DQoNCg==
