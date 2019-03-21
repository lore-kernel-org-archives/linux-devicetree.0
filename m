From: Peng Fan <peng.fan@nxp.com>
Subject: RE: [PATCH] arm64: dts: imx8qxp: add lsio_mu2 node
Date: Thu, 21 Mar 2019 04:45:38 +0000
Message-ID: <AM0PR04MB44818E7C4A5128BD7993219A88420@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <20190313093650.18693-1-peng.fan@nxp.com>
 <AM0PR04MB4211FEB4C272759B84BCB6A180440@AM0PR04MB4211.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <AM0PR04MB4211FEB4C272759B84BCB6A180440@AM0PR04MB4211.eurprd04.prod.outlook.com>
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
To: Aisheng Dong <aisheng.dong@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, Anson Huang <anson.huang@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "van.freenix@gmail.com" <van.freenix@gmail.com>
List-Id: devicetree@vger.kernel.org

SGkgU2hhd24sDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWlzaGVu
ZyBEb25nDQo+IFNlbnQ6IDIwMTnE6jPUwjE1yNUgMTg6MjQNCj4gVG86IFBlbmcgRmFuIDxwZW5n
LmZhbkBueHAuY29tPjsgcm9iaCtkdEBrZXJuZWwub3JnOw0KPiBtYXJrLnJ1dGxhbmRAYXJtLmNv
bTsgc2hhd25ndW9Aa2VybmVsLm9yZzsgcy5oYXVlckBwZW5ndXRyb25peC5kZTsNCj4ga2VybmVs
QHBlbmd1dHJvbml4LmRlOyBmZXN0ZXZhbUBnbWFpbC5jb207IGRsLWxpbnV4LWlteA0KPiA8bGlu
dXgtaW14QG54cC5jb20+OyBBbnNvbiBIdWFuZyA8YW5zb24uaHVhbmdAbnhwLmNvbT47IERhbmll
bCBCYWx1dGENCj4gPGRhbmllbC5iYWx1dGFAbnhwLmNvbT47IGRldmljZXRyZWVAdmdlci5rZXJu
ZWwub3JnOw0KPiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gQ2M6IHZhbi5mcmVlbml4QGdtYWlsLmNvbQ0KPiBTdWJq
ZWN0OiBSRTogW1BBVENIXSBhcm02NDogZHRzOiBpbXg4cXhwOiBhZGQgbHNpb19tdTIgbm9kZQ0K
PiANCj4gPiBGcm9tOiBQZW5nIEZhbg0KPiA+DQo+ID4gQWRkIGxzaW9fbXUyIG5vZGUgd2hpY2gg
Y291bGQgYmUgdXNlZCBjb21tdW5pY2F0ZSB3aXRoIFNDVS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29tPg0KPiANCj4gUmV2aWV3ZWQtYnk6IERvbmcg
QWlzaGVuZyA8YWlzaGVuZy5kb25nQG54cC5jb20+DQoNCldvdWxkIHlvdSBwaWNrIHVwIHRoaXMg
cGF0Y2g/DQoNClRoYW5rcywNClBlbmcuDQoNCj4gDQo+IFJlZ2FyZHMNCj4gRG9uZyBBaXNoZW5n
DQo+IA0KPiA+IC0tLQ0KPiA+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4cXhw
LmR0c2kgfCA4ICsrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykN
Cj4gPg0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4
cXhwLmR0c2kNCj4gPiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhxeHAuZHRz
aQ0KPiA+IGluZGV4IDE2NzY2ODM4YWM3Ny4uNjRlZWNkNmNiMWU5IDEwMDY0NA0KPiA+IC0tLSBh
L2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhxeHAuZHRzaQ0KPiA+ICsrKyBiL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhxeHAuZHRzaQ0KPiA+IEBAIC0zMzksNiAr
MzM5LDE0IEBADQo+ID4gIAkJCSNtYm94LWNlbGxzID0gPDI+Ow0KPiA+ICAJCX07DQo+ID4NCj4g
PiArCQlsc2lvX211MjogbWFpbGJveEA1ZDFkMDAwMCB7DQo+ID4gKwkJCWNvbXBhdGlibGUgPSAi
ZnNsLGlteDhxeHAtbXUiLCAiZnNsLGlteDZzeC1tdSI7DQo+ID4gKwkJCXJlZyA9IDwweDVkMWQw
MDAwIDB4MTAwMDA+Ow0KPiA+ICsJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMTc4IElSUV9UWVBF
X0xFVkVMX0hJR0g+Ow0KPiA+ICsJCQkjbWJveC1jZWxscyA9IDwyPjsNCj4gPiArCQkJc3RhdHVz
ID0gImRpc2FibGVkIjsNCj4gPiArCQl9Ow0KPiA+ICsNCj4gPiAgCQlsc2lvX211MzogbWFpbGJv
eEA1ZDFlMDAwMCB7DQo+ID4gIAkJCWNvbXBhdGlibGUgPSAiZnNsLGlteDhxeHAtbXUiLCAiZnNs
LGlteDZzeC1tdSI7DQo+ID4gIAkJCXJlZyA9IDwweDVkMWUwMDAwIDB4MTAwMDA+Ow0KPiA+IC0t
DQo+ID4gMi4xNi40DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFybS1rZXJuZWwK
