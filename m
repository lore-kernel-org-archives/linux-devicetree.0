From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH 2/2] ARM: dts: imx7ulp: add mmdc support
Date: Thu, 28 Feb 2019 01:24:34 +0000
Message-ID: <DB3PR0402MB3916BE64FA76F4145C368504F5750@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1551261844-23983-1-git-send-email-Anson.Huang@nxp.com>
 <1551261844-23983-2-git-send-email-Anson.Huang@nxp.com>
 <CAOMZO5Css2TvbbQ8cy6EA=2goHHDfDRzP1kVSe_vNaT0DtknLQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAOMZO5Css2TvbbQ8cy6EA=2goHHDfDRzP1kVSe_vNaT0DtknLQ@mail.gmail.com>
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
To: Fabio Estevam <festevam@gmail.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

SGksIEZhYmlvDQoNCkJlc3QgUmVnYXJkcyENCkFuc29uIEh1YW5nDQoNCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRmFiaW8gRXN0ZXZhbSBbbWFpbHRvOmZlc3RldmFtQGdt
YWlsLmNvbV0NCj4gU2VudDogMjAxOeW5tDLmnIgyOOaXpSAzOjUwDQo+IFRvOiBBbnNvbiBIdWFu
ZyA8YW5zb24uaHVhbmdAbnhwLmNvbT4NCj4gQ2M6IHJvYmgrZHRAa2VybmVsLm9yZzsgbWFyay5y
dXRsYW5kQGFybS5jb207IHNoYXduZ3VvQGtlcm5lbC5vcmc7DQo+IHMuaGF1ZXJAcGVuZ3V0cm9u
aXguZGU7IGtlcm5lbEBwZW5ndXRyb25peC5kZTsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5v
cmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS0NCj4ga2VybmVsQGxp
c3RzLmluZnJhZGVhZC5vcmc7IGRsLWxpbnV4LWlteCA8bGludXgtaW14QG54cC5jb20+DQo+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggMi8yXSBBUk06IGR0czogaW14N3VscDogYWRkIG1tZGMgc3VwcG9y
dA0KPiANCj4gT24gV2VkLCBGZWIgMjcsIDIwMTkgYXQgNzowOCBBTSBBbnNvbiBIdWFuZyA8YW5z
b24uaHVhbmdAbnhwLmNvbT4NCj4gd3JvdGU6DQo+IA0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2Fy
bS9ib290L2R0cy9pbXg3dWxwLmR0c2kNCj4gPiBiL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDd1bHAu
ZHRzaSBpbmRleCBmY2E2ZTUwLi5mY2E0YTAxIDEwMDY0NA0KPiA+IC0tLSBhL2FyY2gvYXJtL2Jv
b3QvZHRzL2lteDd1bHAuZHRzaQ0KPiA+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDd1bHAu
ZHRzaQ0KPiA+IEBAIC0yODYsNiArMjg2LDEyIEBADQo+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgc3RhdHVzID0gImRpc2FibGVkIjsNCj4gPiAgICAgICAgICAgICAgICAgfTsNCj4gPg0KPiA+
ICsgICAgICAgICAgICAgICBtbWRjOiBtbWRjQDQwYWIwMDAwIHsNCj4gDQo+IE5vZGUgbmFtZXMg
c2hvdWxkIGJlIGdlbmVyaWMsIHNvOg0KPiANCj4gbWVtb3J5LWNvbnRyb2xsZXJANDBhYjAwMDAN
Cg0KVGhhbmtzLCBJIGFsc28gdXBkYXRlIG90aGVyIGkuTVggU29DJ3MgTU1EQyBub2RlIG5hbWUg
aW4gVjIgcGF0Y2ggc2VyaWVzLg0KDQpBbnNvbi4NCg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGlu
dXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
