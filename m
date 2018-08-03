From: Jolly Shah <JOLLYS@xilinx.com>
Subject: RE: [PATCH v10 00/10] drivers: Introduce firmware dnd clock river for
 ZynqMP core
Date: Fri, 3 Aug 2018 17:59:35 +0000
Message-ID: <CY1PR02MB2138A6BBE829400CEABA5AAFB8230@CY1PR02MB2138.namprd02.prod.outlook.com>
References: <1531857547-16652-1-git-send-email-jollys@xilinx.com>
 <2c3aad45-37ce-2446-4b90-bddb477286ed@xilinx.com>
 <CY1PR02MB2138E21A3FFBD5FEEAA7D6D4B8550@CY1PR02MB2138.namprd02.prod.outlook.com>
 <19376df2-fdd4-12e3-da4c-37106fffed19@xilinx.com>
 <153262301567.48062.15432354725863055071@swboyd.mtv.corp.google.com>
 <e5448935-770a-5c14-438c-23a652b17822@xilinx.com>
 <153324358299.10763.8724416723915219268@swboyd.mtv.corp.google.com>
 <d153598d-8d09-fb32-f68e-6fc4975eb9ce@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d153598d-8d09-fb32-f68e-6fc4975eb9ce@xilinx.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michals@xilinx.com>, Stephen Boyd <sboyd@kernel.org>, "ard.biesheuvel@linaro.org" <ard.biesheuvel@linaro.org>, "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "hkallweit1@gmail.com" <hkallweit1@gmail.com>, "keescook@chromium.org" <keescook@chromium.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "matt@codeblueprint.co.uk" <matt@codeblueprint.co.uk>, "mingo@kernel.org" <mingo@kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "sboyd@codeaurora.org" <sboyd@codeaurora.org>, "sudeep.holla@arm.com" <sudeep.holla@arm.com>Michal Simek <michals@xilinx.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rajan Vaja <RAJANV@xilinx.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

SGkgTWljaGFsLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGxpbnV4
LWtlcm5lbC1vd25lckB2Z2VyLmtlcm5lbC5vcmcgW21haWx0bzpsaW51eC1rZXJuZWwtDQo+IG93
bmVyQHZnZXIua2VybmVsLm9yZ10gT24gQmVoYWxmIE9mIE1pY2hhbCBTaW1law0KPiBTZW50OiBU
aHVyc2RheSwgQXVndXN0IDAyLCAyMDE4IDExOjE0IFBNDQo+IFRvOiBTdGVwaGVuIEJveWQgPHNi
b3lkQGtlcm5lbC5vcmc+OyBhcmQuYmllc2hldXZlbEBsaW5hcm8ub3JnOw0KPiBkbWl0cnkudG9y
b2tob3ZAZ21haWwuY29tOyBncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZzsNCj4gaGthbGx3ZWl0
MUBnbWFpbC5jb207IGtlZXNjb29rQGNocm9taXVtLm9yZzsgbGludXgtY2xrQHZnZXIua2VybmVs
Lm9yZzsNCj4gbWFyay5ydXRsYW5kQGFybS5jb207IG1hdHRAY29kZWJsdWVwcmludC5jby51azsg
bWluZ29Aa2VybmVsLm9yZzsNCj4gbXR1cnF1ZXR0ZUBiYXlsaWJyZS5jb207IHJvYmgrZHRAa2Vy
bmVsLm9yZzsgc2JveWRAY29kZWF1cm9yYS5vcmc7DQo+IHN1ZGVlcC5ob2xsYUBhcm0uY29tOyBK
b2xseSBTaGFoIDxKT0xMWVNAeGlsaW54LmNvbT47IE1pY2hhbCBTaW1law0KPiA8bWljaGFsc0B4
aWxpbnguY29tPg0KPiBDYzogZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IFJhamFuIFZhamEg
PFJBSkFOVkB4aWxpbnguY29tPjsgbGludXgtDQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxp
bnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENI
IHYxMCAwMC8xMF0gZHJpdmVyczogSW50cm9kdWNlIGZpcm13YXJlIGRuZCBjbG9jayByaXZlciBm
b3INCj4gWnlucU1QIGNvcmUNCj4gDQo+IE9uIDIuOC4yMDE4IDIyOjU5LCBTdGVwaGVuIEJveWQg
d3JvdGU6DQo+ID4gUXVvdGluZyBNaWNoYWwgU2ltZWsgKDIwMTgtMDctMzAgMDU6NTA6NDIpDQo+
ID4+IE9uIDI2LjcuMjAxOCAxODozNiwgU3RlcGhlbiBCb3lkIHdyb3RlOg0KPiA+Pj4gUXVvdGlu
ZyBNaWNoYWwgU2ltZWsgKDIwMTgtMDctMjUgMDI6NTE6MTQpDQo+ID4+Pj4gT24gMjQuNy4yMDE4
IDIwOjE0LCBKb2xseSBTaGFoIHdyb3RlOg0KPiA+Pj4+Pj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy9maXJtd2FyZS94aWxpbngvenlucW1wLWRlYnVnLmgNCj4gPj4+Pj4+PiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IGRyaXZlcnMvZmlybXdhcmUveGlsaW54L3p5bnFtcC5jICBjcmVhdGUNCj4g
Pj4+Pj4+PiBtb2RlDQo+ID4+Pj4+Pj4gMTAwNjQ0IGluY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2sv
eGxueCx6eW5xbXAtY2xrLmgNCj4gPj4+Pj4+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUv
bGludXgvZmlybXdhcmUveGxueC16eW5xbXAuaA0KPiA+Pj4+Pj4+DQo+ID4+Pj4+Pg0KPiA+Pj4+
Pj4gSXQgbG9va3MgcHJldHR5IGNhbG0gb3ZlciB0aGUgbGFzdCBzZXZlcmFsIHNlcmllcyB0aGF0
J3Mgd2h5IHdoZW4NCj4gPj4+Pj4+IEkgZ2V0IGFuIGFuc3dlciBmcm9tIFN0ZXBoZW4gb3IgTWlr
ZSBJIHdpbGwgdGFrZSB0aGlzIHNlcmllcyB2aWEgbXkgdHJlZQ0KPiBhbmQgYXJtLXNvYyB0cmVl
Lg0KPiA+Pj4+Pj4NCj4gPj4+Pj4+IEkgaGF2ZSBhcHBsaWVkIDAxLTA4IGhlcmUNCj4gPj4+Pj4+
ICBodHRwczovL2dpdGh1Yi5jb20vWGlsaW54L2xpbnV4LXhsbngvY29tbWl0cy96eW5xbXAvc29j
DQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gVGhhbmtzLA0KPiA+Pj4+Pj4gTWljaGFsDQo+ID4+Pj4+DQo+
ID4+Pj4+DQo+ID4+Pj4+IFRoYW5rcyBmb3IgbWVyZ2luZyB0aGUgcGF0Y2hlcy4NCj4gPj4+Pj4g
QnkgbWlzdGFrZSBJIGFkZGVkIOKAnFJldmlld2VkLWJ5OiBTdGVwaGVuIEJveWQgc2JveWRAa2Vy
bmVsLm9yZ+KAnSBmb3INCj4gZmlybXdhcmUgYmluZGluZ3MgKFBhdGNoMDEpLiAgU3RlcGhlbiBo
YWQgcmV2aWV3ZWQgY2xvY2sgYmluZGluZ3Mgb25seS4gIFBsZWFzZQ0KPiBzdWdnZXN0IGlmIEkg
c2hvdWxkIHNlbmQgYSBuZXcgdmVyc2lvbiB3aXRoIHRoYXQgZml4Lg0KPiA+Pj4+DQo+ID4+Pj4g
SSBoYXZlIGZpeGVkIHRoYXQgaW4gbXkgYnJhbmNoIGFuZCBJIGhhdmUgYXNrZWQgU2hlcGhlbiB0
byBsb29rIGF0DQo+ID4+Pj4gY2xrIG92ZXIgY2hhdC4NCj4gPj4+Pg0KPiA+Pj4NCj4gPj4+IEkg
aGF2ZSBzb21lIHVucmVzb2x2ZWQgcmV2aWV3IGNvbW1lbnRzIG9uIHY5LiBJJ2xsIGdpdmUgcmV2
aWV3ZWQtYnkNCj4gPj4+IHdoZW4gdGhhdCBkaXNjdXNzaW9uIGlzIHJlc29sdmVkLg0KPiA+Pg0K
PiA+PiBvay4gRG8geW91IHdhbnQgdG8gdGFrZSB0aGVtIHZpYSBjbGsgdHJlZSBvciB2aWEgYXJt
LXNvYyB0cmVlPw0KPiA+Pg0KPiA+DQo+ID4gSSdtIGZpbmUgZm9yIHRoZSBjbGsgcGF0Y2ggdG8g
Z28gdmlhIGFybS1zb2MgaWYgdGhhdCBtYWtlcyBpdCBlYXNpZXIuDQo+ID4NCj4gDQo+IG9rLiBH
cmVhdC4NCj4gSm9sbHk6IFBsZWFzZSBhZGRyZXNzIGFsbCBTdGVwaGVuJ3MgY29tbWVudHMgdGhh
dCB3ZSBjYW4gbW92ZS4NCj4gDQo+IFRoYW5rcywNCj4gTWljaGFsDQoNClBvc3RlZCBWMTEgcGF0
Y2ggc2V0IHdpdGggYWxsIGhpcyBjb21tZW50cyBhZGRyZXNzZWQuIA0KDQpUaGFua3MsDQpKb2xs
eSBTaGFoDQo=
