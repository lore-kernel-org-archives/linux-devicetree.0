From: Joakim Zhang <qiangqing.zhang@nxp.com>
Subject: RE: [PATCH V1 1/4] ARM: dts: imx6sx: Add flexcan stop mode wakeup
 support
Date: Mon, 12 Nov 2018 01:58:35 +0000
Message-ID: <DB7PR04MB461869CFD28338F9A812F334E6C10@DB7PR04MB4618.eurprd04.prod.outlook.com>
References: <20181023052831.2553-1-qiangqing.zhang@nxp.com>
 <20181023052831.2553-2-qiangqing.zhang@nxp.com>
 <20181104073931.GC26016@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181104073931.GC26016@tiger>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: "A.s. Dong" <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFNoYXduIEd1byA8c2hhd25n
dW9Aa2VybmVsLm9yZz4NCj4gU2VudDogMjAxOMTqMTHUwjTI1SAxNTo0MA0KPiBUbzogSm9ha2lt
IFpoYW5nIDxxaWFuZ3FpbmcuemhhbmdAbnhwLmNvbT4NCj4gQ2M6IHMuaGF1ZXJAcGVuZ3V0cm9u
aXguZGU7IGtlcm5lbEBwZW5ndXRyb25peC5kZTsgRmFiaW8gRXN0ZXZhbQ0KPiA8ZmFiaW8uZXN0
ZXZhbUBueHAuY29tPjsgZGwtbGludXgtaW14IDxsaW51eC1pbXhAbnhwLmNvbT47DQo+IHJvYmgr
ZHRAa2VybmVsLm9yZzsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOw0KPiBk
ZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsg
QS5zLiBEb25nDQo+IDxhaXNoZW5nLmRvbmdAbnhwLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRD
SCBWMSAxLzRdIEFSTTogZHRzOiBpbXg2c3g6IEFkZCBmbGV4Y2FuIHN0b3AgbW9kZSB3YWtldXAN
Cj4gc3VwcG9ydA0KPiANCj4gT24gVHVlLCBPY3QgMjMsIDIwMTggYXQgMDU6MzA6NDRBTSArMDAw
MCwgSm9ha2ltIFpoYW5nIHdyb3RlOg0KPiA+IEZyb206IERvbmcgQWlzaGVuZyA8YWlzaGVuZy5k
b25nQG54cC5jb20+DQo+ID4NCj4gPiBBZGQgc3RvcC1tb2RlIHByb3BlcnR5IHdoaWNoIGlzIHJl
cXVpcmVkIGJ5IHN0b3AgbW9kZSB3YWtldXAgZmVhdHVyZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IERvbmcgQWlzaGVuZyA8YWlzaGVuZy5kb25nQG54cC5jb20+DQo+ID4gU2lnbmVkLW9mZi1i
eTogSm9ha2ltIFpoYW5nIDxxaWFuZ3FpbmcuemhhbmdAbnhwLmNvbT4NCj4gPiAtLS0NCj4gPiAg
YXJjaC9hcm0vYm9vdC9kdHMvaW14NnN4LmR0c2kgfCAyICsrDQo+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0
cy9pbXg2c3guZHRzaQ0KPiA+IGIvYXJjaC9hcm0vYm9vdC9kdHMvaW14NnN4LmR0c2kgaW5kZXgg
ODQ0Y2FhMzkzNjRmLi4zZjQ1OWQ2ZGE3ZmMNCj4gPiAxMDA2NDQNCj4gPiAtLS0gYS9hcmNoL2Fy
bS9ib290L2R0cy9pbXg2c3guZHRzaQ0KPiA+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDZz
eC5kdHNpDQo+ID4gQEAgLTQ0OCw2ICs0NDgsNyBAQA0KPiA+ICAJCQkJY2xvY2tzID0gPCZjbGtz
IElNWDZTWF9DTEtfQ0FOMV9JUEc+LA0KPiA+ICAJCQkJCSA8JmNsa3MgSU1YNlNYX0NMS19DQU4x
X1NFUklBTD47DQo+ID4gIAkJCQljbG9jay1uYW1lcyA9ICJpcGciLCAicGVyIjsNCj4gPiArCQkJ
CXN0b3AtbW9kZSA9IDwmZ3ByIDB4MTAgMSAweDEwIDE3PjsNCj4gDQo+IElzIGl0IHN1cHBvcnRl
ZCBieSB1cHN0cmVhbT8gIEkgY2Fubm90IGZpbmQgdGhpcyBwcm9wZXJ0eSBpbiBldGhlciBmbGV4
Y2FuDQo+IGJpbmRpbmdzIGRvYyBvciBrZXJuZWwgZHJpdmVyLg0KPiANCj4gU2hhd24NCg0KSGkg
U2hhd24sDQpUaGlzIHByb3BlcnR5IGhhcyBiZWVuIHJldmlld2VkIGJ5IG1haW50YWluZXIgaW4g
ZmxleGNhbiBiaW5kaW5ncyBhbmQga2VybmVsIGRyaXZlciBoYXMgc2VudCB0byByZXZpZXcuDQoN
CkJlc3QgUmVnYXJkcywNCkpvYWtpbSBaaGFuZw0KDQo+ID4gIAkJCQlzdGF0dXMgPSAiZGlzYWJs
ZWQiOw0KPiA+ICAJCQl9Ow0KPiA+DQo+ID4gQEAgLTQ1OCw2ICs0NTksNyBAQA0KPiA+ICAJCQkJ
Y2xvY2tzID0gPCZjbGtzIElNWDZTWF9DTEtfQ0FOMl9JUEc+LA0KPiA+ICAJCQkJCSA8JmNsa3Mg
SU1YNlNYX0NMS19DQU4yX1NFUklBTD47DQo+ID4gIAkJCQljbG9jay1uYW1lcyA9ICJpcGciLCAi
cGVyIjsNCj4gPiArCQkJCXN0b3AtbW9kZSA9IDwmZ3ByIDB4MTAgMiAweDEwIDE4PjsNCj4gPiAg
CQkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+ID4gIAkJCX07DQo+ID4NCj4gPiAtLQ0KPiA+IDIu
MTcuMQ0KPiA+DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hcm0ta2VybmVsCg==
