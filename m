From: Claudiu Manoil <claudiu.manoil@nxp.com>
Subject: RE: [PATCH net-next v3 2/4] enetc: Add mdio bus driver for the PCIe
 MDIO endpoint
Date: Mon, 29 Jul 2019 15:46:17 +0000
Message-ID: <VI1PR04MB488060D95CFD31CB904CDF6796DD0@VI1PR04MB4880.eurprd04.prod.outlook.com>
References: <1564394627-3810-1-git-send-email-claudiu.manoil@nxp.com>
 <1564394627-3810-3-git-send-email-claudiu.manoil@nxp.com>
 <20190729153524.GG4110@lunn.ch>
 <VI1PR04MB48806AF2F6CEDE105B78086696DD0@VI1PR04MB4880.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <VI1PR04MB48806AF2F6CEDE105B78086696DD0@VI1PR04MB4880.eurprd04.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Claudiu Manoil <claudiu.manoil@nxp.com>, Andrew Lunn <andrew@lunn.ch>
Cc: "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Leo Li <leoyang.li@nxp.com>, Alexandru Marginean <alexandru.marginean@nxp.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogbmV0ZGV2LW93bmVyQHZnZXIua2Vy
bmVsLm9yZyA8bmV0ZGV2LW93bmVyQHZnZXIua2VybmVsLm9yZz4gT24NCj5CZWhhbGYgT2YgQ2xh
dWRpdSBNYW5vaWwNCj5TZW50OiBNb25kYXksIEp1bHkgMjksIDIwMTkgNjo0MCBQTQ0KPlRvOiBB
bmRyZXcgTHVubiA8YW5kcmV3QGx1bm4uY2g+DQo+Q2M6IERhdmlkIFMgLiBNaWxsZXIgPGRhdmVt
QGRhdmVtbG9mdC5uZXQ+OyBSb2IgSGVycmluZw0KPjxyb2JoK2R0QGtlcm5lbC5vcmc+OyBMZW8g
TGkgPGxlb3lhbmcubGlAbnhwLmNvbT47IEFsZXhhbmRydSBNYXJnaW5lYW4NCj48YWxleGFuZHJ1
Lm1hcmdpbmVhbkBueHAuY29tPjsgbmV0ZGV2QHZnZXIua2VybmVsLm9yZzsNCj5kZXZpY2V0cmVl
QHZnZXIua2VybmVsLm9yZzsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBs
aW51eC0NCj5rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+U3ViamVjdDogUkU6IFtQQVRDSCBuZXQt
bmV4dCB2MyAyLzRdIGVuZXRjOiBBZGQgbWRpbyBidXMgZHJpdmVyIGZvciB0aGUgUENJZQ0KPk1E
SU8gZW5kcG9pbnQNCj4NCj4+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4+RnJvbTogQW5k
cmV3IEx1bm4gPGFuZHJld0BsdW5uLmNoPg0KPj5TZW50OiBNb25kYXksIEp1bHkgMjksIDIwMTkg
NjozNSBQTQ0KPj5UbzogQ2xhdWRpdSBNYW5vaWwgPGNsYXVkaXUubWFub2lsQG54cC5jb20+DQo+
PkNjOiBEYXZpZCBTIC4gTWlsbGVyIDxkYXZlbUBkYXZlbWxvZnQubmV0PjsgUm9iIEhlcnJpbmcN
Cj4+PHJvYmgrZHRAa2VybmVsLm9yZz47IExlbyBMaSA8bGVveWFuZy5saUBueHAuY29tPjsgQWxl
eGFuZHJ1IE1hcmdpbmVhbg0KPj48YWxleGFuZHJ1Lm1hcmdpbmVhbkBueHAuY29tPjsgbmV0ZGV2
QHZnZXIua2VybmVsLm9yZzsNCj4+ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFy
bS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsNCj4+bGludXgtIGtlcm5lbEB2Z2VyLmtlcm5l
bC5vcmcNCj4+U3ViamVjdDogUmU6IFtQQVRDSCBuZXQtbmV4dCB2MyAyLzRdIGVuZXRjOiBBZGQg
bWRpbyBidXMgZHJpdmVyIGZvciB0aGUNCj4+UENJZSBNRElPIGVuZHBvaW50DQo+Pg0KPj4+ICsJ
aHctPnBvcnQgPSBwY2lfaW9tYXAocGRldiwgMCwgMCk7DQo+Pj4gKwlpZiAoIWJ1cy0+cHJpdikg
ew0KPj4NCj4+aHctPnBvcnQgPz8NCj4+DQo+DQo+WWVhaCwgYmV0dGVyIGlnbm9yZSB0aGlzIGZv
ciBub3cg8J+Yig0KPkl0J3MgZm9yIHRoZSBlbmV0YyBhY2Nlc3NvcnMsIGVuZXRjX3BvcnRfLi4o
KS4NCg0KT2ggSSBzZWUsIGl0J3MgYSBtaXN0YWtlLiAgSSdtIGNoZWNraW5nIHRoZSB3cm9uZyB0
aGluZy4NClNvcnJ5LiAgVGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0K
