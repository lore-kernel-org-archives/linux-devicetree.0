From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [EXT] Re: [PATCH V7 2/4] firmware: imx: enable imx scu general
 irq function
Date: Fri, 12 Apr 2019 01:05:32 +0000
Message-ID: <DB3PR0402MB3916B67E6DA995AB70C29799F5280@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1554785675-8090-1-git-send-email-Anson.Huang@nxp.com>
 <1554785675-8090-2-git-send-email-Anson.Huang@nxp.com>
 <20190411073252.GC3050@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190411073252.GC3050@dragon>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "a.zummo@towertech.it" <a.zummo@towertech.it>, "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, Aisheng Dong <aisheng.dong@nxp.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, "sboyd@kernel.org" <sboyd@kernel.org>, Peng Fan <peng.fan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>"linux-rtc@vger.kernel.org" <linux>
List-Id: devicetree@vger.kernel.org

SGVsbG8sIEFsZXhhbmRyZQ0KCUFzIGkuTVggU0NVIGdlbmVyYWwgaXJxIGZ1bmN0aW9uIGlzIHBp
Y2tlZCB1cCBieSBTaGF3biwgY291bGQgeW91IHBsZWFzZSBhbHNvIHBpY2sgdXAgYmVsb3cgaS5N
WCBTQyBSVEMgYWxhcm0gc3VwcG9ydCBwYXRjaCA/DQoJaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVs
Lm9yZy9wYXRjaC8xMDg5MDUyNS8gDQoNCkJlc3QgUmVnYXJkcyENCkFuc29uIEh1YW5nDQoNCj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU2hhd24gR3VvIFttYWlsdG86c2hh
d25ndW9Aa2VybmVsLm9yZ10NCj4gU2VudDogMjAxOcTqNNTCMTHI1SAxNTozMw0KPiBUbzogQW5z
b24gSHVhbmcgPGFuc29uLmh1YW5nQG54cC5jb20+DQo+IENjOiByb2JoK2R0QGtlcm5lbC5vcmc7
IG1hcmsucnV0bGFuZEBhcm0uY29tOyBzLmhhdWVyQHBlbmd1dHJvbml4LmRlOw0KPiBrZXJuZWxA
cGVuZ3V0cm9uaXguZGU7IGZlc3RldmFtQGdtYWlsLmNvbTsgYS56dW1tb0B0b3dlcnRlY2guaXQ7
DQo+IGFsZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4uY29tOyBBaXNoZW5nIERvbmcgPGFpc2hlbmcu
ZG9uZ0BueHAuY29tPjsNCj4gdWxmLmhhbnNzb25AbGluYXJvLm9yZzsgc2JveWRAa2VybmVsLm9y
ZzsgUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+Ow0KPiBEYW5pZWwgQmFsdXRhIDxkYW5pZWwu
YmFsdXRhQG54cC5jb20+OyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgtDQo+IGtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9y
ZzsgbGludXgtDQo+IHJ0Y0B2Z2VyLmtlcm5lbC5vcmc7IGRsLWxpbnV4LWlteCA8bGludXgtaW14
QG54cC5jb20+DQo+IFN1YmplY3Q6IFtFWFRdIFJlOiBbUEFUQ0ggVjcgMi80XSBmaXJtd2FyZTog
aW14OiBlbmFibGUgaW14IHNjdSBnZW5lcmFsIGlycQ0KPiBmdW5jdGlvbg0KPiANCj4gV0FSTklO
RzogVGhpcyBlbWFpbCB3YXMgY3JlYXRlZCBvdXRzaWRlIG9mIE5YUC4gRE8gTk9UIENMSUNLIGxp
bmtzIG9yDQo+IGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgcmVjb2duaXplIHRoZSBzZW5kZXIgYW5k
IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4gDQo+IA0KPiANCj4gT24gVHVlLCBBcHIgMDks
IDIwMTkgYXQgMDQ6NTk6NTVBTSArMDAwMCwgQW5zb24gSHVhbmcgd3JvdGU6DQo+ID4gVGhlIFN5
c3RlbSBDb250cm9sbGVyIEZpcm13YXJlIChTQ0ZXKSBjb250cm9scyBSVEMsIHRoZXJtYWwgYW5k
IFdET0cNCj4gPiBldGMuLCB0aGVzZSByZXNvdXJjZXMnIGludGVycnVwdCBmdW5jdGlvbiBhcmUg
bWFuYWdlZCBieSBTQ1UuIFdoZW4gYW55DQo+ID4gSVJRIHBlbmRpbmcsIFNDVSB3aWxsIG5vdGlm
eSBMaW51eCB2aWEgTVUgZ2VuZXJhbCBpbnRlcnJ1cHQgY2hhbm5lbA0KPiA+ICMzLCBhbmQgTGlu
dXgga2VybmVsIG5lZWRzIHRvIGNhbGwgU0NVIEFQSXMgdG8gZ2V0IElSUSBzdGF0dXMgYW5kDQo+
ID4gbm90aWZ5IGVhY2ggbW9kdWxlIHRvIGhhbmRsZSB0aGUgaW50ZXJydXB0Lg0KPiA+DQo+ID4g
U2luY2UgdGhlcmUgaXMgbm8gZGF0YSB0cmFuc21pc3Npb24gZm9yIFNDVSBJUlEgbm90aWZpY2F0
aW9uLCBzbw0KPiA+IGRvb3JiZWxsIG1vZGUgaXMgdXNlZCBmb3IgdGhpcyBNVSBjaGFubmVsLCBh
bmQgU0NVIGRyaXZlciB3aWxsIHVzZQ0KPiA+IG5vdGlmaWVyIG1lY2hhbmlzbSB0byBicm9hZGNh
c3QgdG8gZXZlcnkgbW9kdWxlIHdoaWNoIHJlZ2lzdGVycyB0aGUNCj4gPiBTQ1UgYmxvY2sgbm90
aWZpZXIuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbnNvbiBIdWFuZyA8QW5zb24uSHVhbmdA
bnhwLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogRG9uZyBBaXNoZW5nIDxhaXNoZW5nLmRvbmdAbnhw
LmNvbT4NCj4gDQo+IEFwcGxpZWQsIHRoYW5rcy4NCg==
