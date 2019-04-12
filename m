From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [EXT] Re: [PATCH V7 2/4] firmware: imx: enable imx scu general
 irq function
Date: Fri, 12 Apr 2019 02:32:54 +0000
Message-ID: <DB3PR0402MB39162D194A2B5B79211C1774F5280@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1554785675-8090-1-git-send-email-Anson.Huang@nxp.com>
 <1554785675-8090-2-git-send-email-Anson.Huang@nxp.com>
 <20190411073252.GC3050@dragon>
 <DB3PR0402MB3916B67E6DA995AB70C29799F5280@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <AM0PR04MB4211816EDBEF23F7B330CCCB80280@AM0PR04MB4211.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <AM0PR04MB4211816EDBEF23F7B330CCCB80280@AM0PR04MB4211.eurprd04.prod.outlook.com>
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
To: Aisheng Dong <aisheng.dong@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "a.zummo@towertech.it" <a.zummo@towertech.it>, "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "sboyd@kernel.org" <sboyd@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

DQoNCkJlc3QgUmVnYXJkcyENCkFuc29uIEh1YW5nDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gRnJvbTogQWlzaGVuZyBEb25nDQo+IFNlbnQ6IDIwMTnE6jTUwjEyyNUgMTA6MjYN
Cj4gVG86IEFuc29uIEh1YW5nIDxhbnNvbi5odWFuZ0BueHAuY29tPjsgU2hhd24gR3VvDQo+IDxz
aGF3bmd1b0BrZXJuZWwub3JnPjsgYWxleGFuZHJlLmJlbGxvbmlAYm9vdGxpbi5jb20NCj4gQ2M6
IHJvYmgrZHRAa2VybmVsLm9yZzsgbWFyay5ydXRsYW5kQGFybS5jb207IHMuaGF1ZXJAcGVuZ3V0
cm9uaXguZGU7DQo+IGtlcm5lbEBwZW5ndXRyb25peC5kZTsgZmVzdGV2YW1AZ21haWwuY29tOyBh
Lnp1bW1vQHRvd2VydGVjaC5pdDsNCj4gYWxleGFuZHJlLmJlbGxvbmlAYm9vdGxpbi5jb207IHVs
Zi5oYW5zc29uQGxpbmFyby5vcmc7IHNib3lkQGtlcm5lbC5vcmc7DQo+IFBlbmcgRmFuIDxwZW5n
LmZhbkBueHAuY29tPjsgRGFuaWVsIEJhbHV0YSA8ZGFuaWVsLmJhbHV0YUBueHAuY29tPjsNCj4g
ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7
IGxpbnV4LWFybS0NCj4ga2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LXJ0Y0B2Z2Vy
Lmtlcm5lbC5vcmc7IGRsLWxpbnV4LWlteCA8bGludXgtDQo+IGlteEBueHAuY29tPg0KPiBTdWJq
ZWN0OiBSRTogW0VYVF0gUmU6IFtQQVRDSCBWNyAyLzRdIGZpcm13YXJlOiBpbXg6IGVuYWJsZSBp
bXggc2N1IGdlbmVyYWwNCj4gaXJxIGZ1bmN0aW9uDQo+IA0KPiA+IEZyb206IEFuc29uIEh1YW5n
DQo+ID4gU2VudDogRnJpZGF5LCBBcHJpbCAxMiwgMjAxOSA5OjA2IEFNDQo+ID4NCj4gPiBIZWxs
bywgQWxleGFuZHJlDQo+ID4gCUFzIGkuTVggU0NVIGdlbmVyYWwgaXJxIGZ1bmN0aW9uIGlzIHBp
Y2tlZCB1cCBieSBTaGF3biwgY291bGQgeW91DQo+ID4gcGxlYXNlIGFsc28gcGljayB1cCBiZWxv
dyBpLk1YIFNDIFJUQyBhbGFybSBzdXBwb3J0IHBhdGNoID8NCj4gPiAJaHR0cHM6Ly9wYXRjaHdv
cmsua2VybmVsLm9yZy9wYXRjaC8xMDg5MDUyNS8NCj4gPg0KPiANCj4gTm8sIGl0IGNhbid0IGdv
IHRocm91Z2ggQWxleGFuZHJlJ3MgdHJlZSBkdWUgdG8gZGVwZW5kZW5jeSBpc3N1ZS4NCj4gDQo+
IFNoYXduLA0KPiBEbyB5b3UgdGhpbmsgeW91IGNhbiBwaWNrIGl0IHVwPyBBbGV4YW5kcmUgYWxy
ZWFkeSBnYXZlIHRoZSBBY2suDQo+IA0KPiBBRkFJSyB0aGVyZSdzIG5vIG90aGVyIFNDVSBSVEMg
cGF0Y2hlcyBzaW5jZSB2NS4xLXJjMSBpbiBBbGV4YW5kcmUncyB0cmVlLg0KDQpZZXMsIG5lZWQg
dG8gbWFrZSBzdXJlIHRoZSBkZXBlbmRlbmN5IGlzIGhhbmRsZWQsIHRoZSBSVEMgYWxhcm0gcGF0
Y2ggTVVTVCBiZSBwaWNrZWQgdXANCk9OTFkgd2hlbiBzY3UgaXJxIHBhdGNoIGlzIHJlYWR5LCBO
T1Qgc3VyZSBob3cgdG8gaGFuZGxlIHRoaXMgY2FzZSBmb3Igc3VjaCBzY2VuYXJpbz8NCg0KQW5z
b24uDQoNCj4gDQo+IFJlZ2FyZHMNCj4gRG9uZyBBaXNoZW5nDQo+IA0KPiA+ID4gT24gVHVlLCBB
cHIgMDksIDIwMTkgYXQgMDQ6NTk6NTVBTSArMDAwMCwgQW5zb24gSHVhbmcgd3JvdGU6DQo+ID4g
PiA+IFRoZSBTeXN0ZW0gQ29udHJvbGxlciBGaXJtd2FyZSAoU0NGVykgY29udHJvbHMgUlRDLCB0
aGVybWFsIGFuZA0KPiA+ID4gPiBXRE9HIGV0Yy4sIHRoZXNlIHJlc291cmNlcycgaW50ZXJydXB0
IGZ1bmN0aW9uIGFyZSBtYW5hZ2VkIGJ5IFNDVS4NCj4gPiA+ID4gV2hlbiBhbnkgSVJRIHBlbmRp
bmcsIFNDVSB3aWxsIG5vdGlmeSBMaW51eCB2aWEgTVUgZ2VuZXJhbA0KPiA+ID4gPiBpbnRlcnJ1
cHQgY2hhbm5lbCAjMywgYW5kIExpbnV4IGtlcm5lbCBuZWVkcyB0byBjYWxsIFNDVSBBUElzIHRv
DQo+ID4gPiA+IGdldCBJUlEgc3RhdHVzIGFuZCBub3RpZnkgZWFjaCBtb2R1bGUgdG8gaGFuZGxl
IHRoZSBpbnRlcnJ1cHQuDQo+ID4gPiA+DQo+ID4gPiA+IFNpbmNlIHRoZXJlIGlzIG5vIGRhdGEg
dHJhbnNtaXNzaW9uIGZvciBTQ1UgSVJRIG5vdGlmaWNhdGlvbiwgc28NCj4gPiA+ID4gZG9vcmJl
bGwgbW9kZSBpcyB1c2VkIGZvciB0aGlzIE1VIGNoYW5uZWwsIGFuZCBTQ1UgZHJpdmVyIHdpbGwg
dXNlDQo+ID4gPiA+IG5vdGlmaWVyIG1lY2hhbmlzbSB0byBicm9hZGNhc3QgdG8gZXZlcnkgbW9k
dWxlIHdoaWNoIHJlZ2lzdGVycw0KPiA+ID4gPiB0aGUgU0NVIGJsb2NrIG5vdGlmaWVyLg0KPiA+
ID4gPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbnNvbiBIdWFuZyA8QW5zb24uSHVhbmdAbnhw
LmNvbT4NCj4gPiA+ID4gUmV2aWV3ZWQtYnk6IERvbmcgQWlzaGVuZyA8YWlzaGVuZy5kb25nQG54
cC5jb20+DQo+ID4gPg0KPiA+ID4gQXBwbGllZCwgdGhhbmtzLg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxp
c3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
