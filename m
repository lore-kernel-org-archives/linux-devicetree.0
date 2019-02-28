From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH V2 2/3] ARM: dts: imx7ulp: add mmdc support
Date: Thu, 28 Feb 2019 03:00:08 +0000
Message-ID: <DB3PR0402MB39167B9C2EEA8546CE8FDED5F5750@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1551316741-7848-1-git-send-email-Anson.Huang@nxp.com>
 <1551316741-7848-2-git-send-email-Anson.Huang@nxp.com>
 <CAOMZO5DQM0-rBbWuWa7dZw8es1NbY8DwCGmU4_ZJ2FdFEXYC6Q@mail.gmail.com>
 <DB3PR0402MB391672641C4829C18DA0DB36F5750@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CAOMZO5BXCgj+uqA0xoOFYo3GxbN_HfbFyfQFmNRa4_AHL3nx0g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOMZO5BXCgj+uqA0xoOFYo3GxbN_HfbFyfQFmNRa4_AHL3nx0g@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

SGksIEZhYmlvDQoNCkJlc3QgUmVnYXJkcyENCkFuc29uIEh1YW5nDQoNCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRmFiaW8gRXN0ZXZhbSBbbWFpbHRvOmZlc3RldmFtQGdt
YWlsLmNvbV0NCj4gU2VudDogMjAxOeW5tDLmnIgyOOaXpSA5OjU3DQo+IFRvOiBBbnNvbiBIdWFu
ZyA8YW5zb24uaHVhbmdAbnhwLmNvbT4NCj4gQ2M6IHJvYmgrZHRAa2VybmVsLm9yZzsgbWFyay5y
dXRsYW5kQGFybS5jb207IHNoYXduZ3VvQGtlcm5lbC5vcmc7DQo+IHMuaGF1ZXJAcGVuZ3V0cm9u
aXguZGU7IGtlcm5lbEBwZW5ndXRyb25peC5kZTsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5v
cmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS0NCj4ga2VybmVsQGxp
c3RzLmluZnJhZGVhZC5vcmc7IGRsLWxpbnV4LWlteCA8bGludXgtaW14QG54cC5jb20+DQo+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggVjIgMi8zXSBBUk06IGR0czogaW14N3VscDogYWRkIG1tZGMgc3Vw
cG9ydA0KPiANCj4gSGkgQW5zb24sDQo+IA0KPiBPbiBXZWQsIEZlYiAyNywgMjAxOSBhdCAxMDo1
NCBQTSBBbnNvbiBIdWFuZyA8YW5zb24uaHVhbmdAbnhwLmNvbT4NCj4gd3JvdGU6DQo+IA0KPiA+
IElmIHNvLCBzaG91bGQgSSBjaGFuZ2Ugb3RoZXIgaS5NWDYgU29DcyB3aXRoIHNpbmdsZSBNTURD
IG5vZGUgYXMgd2VsbD8NCj4gPiBSZW1vdmUgdGhlbSBhcyB3ZWxsPw0KPiANCj4gT25seSBpbXg2
cXAgbmVlZHMgdGhlIG1tZGMgbGFiZWwuDQo+IA0KPiBJIGNhbiBzZW5kIGEgcGF0Y2ggcmVtb3Zp
bmcgaXQgZnJvbSB0aGUgb3RoZXIgaS5NWCBTb0NzLCBzbyBkb24ndCBuZWVkIHRvDQo+IHdvcnJ5
IGFib3V0IGl0IGluIHlvdXIgc2VyaWVzLg0KDQpPb3BzLCBJIGFscmVhZHkgc2VudCBvdXQgVjMg
cGF0Y2ggc2VyaWVzIGluY2x1ZGluZyBhbGwgaS5NWCBTb0MgTU1EQyBsYWJlbCByZW1vdmVkIGJl
Zm9yZQ0Kc2VlaW5nIHlvdXIgbWFpbCwgc28geW91IGNhbiByZW1vdmUgaXQgZnJvbSB5b3VyIFRP
RE8gbGlzdCwgcGxlYXNlIGhlbHAgcmV2aWV3IGl0LCB0aGFua3MhDQoNCkFuc29uLg0KDQo+IA0K
PiBUaGFua3MNCg==
