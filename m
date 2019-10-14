From: Wen He <wen.he_1@nxp.com>
Subject: RE: [EXT] Re: [v2 2/2] arm64: dts: ls1028a: Update the DT node
 definition for dpclk
Date: Mon, 14 Oct 2019 06:25:36 +0000
Message-ID: <DB7PR04MB51950A4F660184CF63189F9AE2900@DB7PR04MB5195.eurprd04.prod.outlook.com>
References: <20190920083419.5092-1-wen.he_1@nxp.com>
 <20190920083419.5092-2-wen.he_1@nxp.com> <20191007123512.GM7150@dragon>
 <DB7PR04MB5195760127B83B88B68CC602E29A0@DB7PR04MB5195.eurprd04.prod.outlook.com>
 <20191014062150.GC12262@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191014062150.GC12262@dragon>
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
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Leo Li <leoyang.li@nxp.com>, "linux-devel@linux.nxdi.nxp.com" <linux-devel@linux.nxdi.nxp.com>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU2hhd24gR3VvIDxzaGF3
bmd1b0BrZXJuZWwub3JnPg0KPiBTZW50OiAyMDE55bm0MTDmnIgxNOaXpSAxNDoyMg0KPiBUbzog
V2VuIEhlIDx3ZW4uaGVfMUBueHAuY29tPg0KPiBDYzogbGludXgtZGV2ZWxAbGludXgubnhkaS5u
eHAuY29tOyBMZW8gTGkgPGxlb3lhbmcubGlAbnhwLmNvbT47IFJvYiBIZXJyaW5nDQo+IDxyb2Jo
K2R0QGtlcm5lbC5vcmc+OyBNYXJrIFJ1dGxhbmQgPG1hcmsucnV0bGFuZEBhcm0uY29tPjsNCj4g
ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7
DQo+IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiBTdWJqZWN0OiBSZTog
W0VYVF0gUmU6IFt2MiAyLzJdIGFybTY0OiBkdHM6IGxzMTAyOGE6IFVwZGF0ZSB0aGUgRFQgbm9k
ZQ0KPiBkZWZpbml0aW9uIGZvciBkcGNsaw0KPiANCj4gQ2F1dGlvbjogRVhUIEVtYWlsDQo+IA0K
PiBPbiBUdWUsIE9jdCAwOCwgMjAxOSBhdCAwNDowODo1N0FNICswMDAwLCBXZW4gSGUgd3JvdGU6
DQo+ID4NCj4gPg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206
IFNoYXduIEd1byA8c2hhd25ndW9Aa2VybmVsLm9yZz4NCj4gPiA+IFNlbnQ6IDIwMTnlubQxMOac
iDfml6UgMjA6MzUNCj4gPiA+IFRvOiBXZW4gSGUgPHdlbi5oZV8xQG54cC5jb20+DQo+ID4gPiBD
YzogbGludXgtZGV2ZWxAbGludXgubnhkaS5ueHAuY29tOyBMZW8gTGkgPGxlb3lhbmcubGlAbnhw
LmNvbT47IFJvYg0KPiA+ID4gSGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPjsgTWFyayBSdXRs
YW5kIDxtYXJrLnJ1dGxhbmRAYXJtLmNvbT47DQo+ID4gPiBkZXZpY2V0cmVlQHZnZXIua2VybmVs
Lm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4gPiA+IGxpbnV4LWFybS1rZXJu
ZWxAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiA+ID4gU3ViamVjdDogW0VYVF0gUmU6IFt2MiAyLzJd
IGFybTY0OiBkdHM6IGxzMTAyOGE6IFVwZGF0ZSB0aGUgRFQgbm9kZQ0KPiA+ID4gZGVmaW5pdGlv
biBmb3IgZHBjbGsNCj4gPiA+DQo+ID4gPg0KPiA+ID4gT24gRnJpLCBTZXAgMjAsIDIwMTkgYXQg
MDQ6MzQ6MTlQTSArMDgwMCwgV2VuIEhlIHdyb3RlOg0KPiA+ID4gPiBVcGRhdGUgRFQgbm9kZSBu
YW1lIGNsb2NrLWNvbnRyb2xsZXIgdG8gY2xvY2stZGlzcGxheSwNCj4gPiA+DQo+ID4gPiBUaGUg
bm9kZSBuYW1lIGNsb2NrLWNvbnRyb2xsZXIgaXMgc28gZ29vZCwgYW5kIEkgZG8gbm90IHVuZGVy
c3RhbmQNCj4gPiA+IHdoeSB5b3UgbmVlZCB0byBjaGFuZ2UgaXQuDQo+ID4gPg0KPiA+DQo+ID4g
VGhlIG5vZGUgbmFtZSBjbG9jay1jb250cm9sbGVyIHVzZWQgZm9yIHRoZSBzeXN0ZW0gY2xvY2tn
ZW4gYW5kIHRoaXMNCj4gPiBjbG9jayBvbmx5IHVzZWQgZm9yIHRoZSBEaXNwbGF5IGNvcmUuDQo+
ID4gVG8gY2xlYXJseSB0aGUgbm9kZSwgdGhhdCB3aHkgSSBoYXZlIHRvIHVzZSBjbG9jay1kaXNw
bGF5IHRvIGluc3RlYWQNCj4gPiBvZiB0aGUgY2xvY2stY29udHJvbGxlcg0KPiANCj4gTGFiZWwg
aXMgYmVpbmcgdXNlZCB0byBzcGVjaWZ5IHRoaW5ncywgYW5kIG5vZGUgbmFtZSBzaG91bGQganVz
dCBiZSBhcyBnZW5lcmljDQo+IGFzIHBvc3NpYmxlLg0KDQpVbmRlcnN0YW5kLCB3aWxsIGNvcnJl
Y3Rpb24gaXQuDQoNClRoYW5rcyAmJiBCZXN0IFJlZ2FyZHMsDQpXZW4NCg0KPiANCj4gU2hhd24N
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFy
bS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1r
ZXJuZWwK
