From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: Re: [PATCH v1 3/3] ARM: dts: imx6qdl-apalis: Use enable-gpios
 property for backlight
Date: Fri, 16 Sep 2016 13:38:54 +0000
Message-ID: <1474033134.3103.27.camel@toradex.com>
References: <9d2c17aa2e00e6ff4349a53de8247860d2382607.1473833908.git.maitysanchayan@gmail.com>
 <dff8d58c4021719184af2c83773e86f175ad910e.1473833908.git.maitysanchayan@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <dff8d58c4021719184af2c83773e86f175ad910e.1473833908.git.maitysanchayan@gmail.com>
Content-Language: en-US
Content-ID: <B802137E4A1435409CF9860D5E5503A8@eurprd05.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>, "maitysanchayan@gmail.com" <maitysanchayan@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "stefan@agner.ch" <stefan@agner.ch>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

T24gV2VkLCAyMDE2LTA5LTE0IGF0IDEyOjA1ICswNTMwLCBTYW5jaGF5YW4gTWFpdHkgd3JvdGU6
DQo+IFVzZSBlbmFibGUtZ3Bpb3MgcHJvcGVydHkgb2YgUFdNIGJhY2tsaWdodCBkcml2ZXIgZm9y
IGJhY2tsaWdodA0KPiBjb250cm9sLiBXaGlsZSBhdCBpdCBhbHNvIGZpeCB0aGUgdXNlIG9mIGJy
aWdodG5lc3MgbGV2ZWxzIHJlcXVpcmVkDQo+IGJ5IEVEVCBkaXNwbGF5cyB3aGljaCByZXF1aXJl
IGludmVydGVkIFBXTSdzLg0KDQpUaGF0IHBhcnQgSSBhbSBtaXNzaW5nIGJlbG93LiBEaWQgeW91
IGZvcmdldCB0byBpbmNsdWRlIGl0Pw0KDQo+IFNpZ25lZC1vZmYtYnk6IFNhbmNoYXlhbiBNYWl0
eSA8bWFpdHlzYW5jaGF5YW5AZ21haWwuY29tPg0KPiAtLS0NCj4gwqBhcmNoL2FybS9ib290L2R0
cy9pbXg2cWRsLWFwYWxpcy5kdHNpIHwgOSArKysrKysrKysNCj4gwqAxIGZpbGUgY2hhbmdlZCwg
OSBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvaW14
NnFkbC1hcGFsaXMuZHRzaQ0KPiBiL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDZxZGwtYXBhbGlzLmR0
c2kNCj4gaW5kZXggOGM2N2RkOC4uOTEwMGJkZSAxMDA2NDQNCj4gLS0tIGEvYXJjaC9hcm0vYm9v
dC9kdHMvaW14NnFkbC1hcGFsaXMuZHRzaQ0KPiArKysgYi9hcmNoL2FybS9ib290L2R0cy9pbXg2
cWRsLWFwYWxpcy5kdHNpDQo+IEBAIC00OSw3ICs0OSwxMCBAQA0KPiDCoA0KPiDCoAliYWNrbGln
aHQ6IGJhY2tsaWdodCB7DQo+IMKgCQljb21wYXRpYmxlID0gInB3bS1iYWNrbGlnaHQiOw0KPiAr
CQlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOw0KPiArCQlwaW5jdHJsLTAgPSA8JnBpbmN0cmxf
Z3Bpb19ibF9vbj47DQo+IMKgCQlwd21zID0gPCZwd200IDAgNTAwMDAwMD47DQo+ICsJCWVuYWJs
ZS1ncGlvcyA9IDwmZ3BpbzMgMTMgR1BJT19BQ1RJVkVfSElHSD47DQo+IMKgCQlzdGF0dXMgPSAi
ZGlzYWJsZWQiOw0KPiDCoAl9Ow0KPiDCoA0KPiBAQCAtNjE0LDYgKzYxNywxMiBAQA0KPiDCoAkJ
PjsNCj4gwqAJfTsNCj4gwqANCj4gKwlwaW5jdHJsX2dwaW9fYmxfb246IGdwaW9ibG9uIHsNCj4g
KwkJZnNsLHBpbnMgPSA8DQo+ICsJCQlNWDZRRExfUEFEX0VJTV9EQTEzX19HUElPM19JTzEzIDB4
MWIwYjANCj4gKwkJPjsNCj4gKwl9Ow0KPiArDQo+IMKgCXBpbmN0cmxfZ3Bpb19rZXlzOiBncGlv
MWlvMDRncnAgew0KPiDCoAkJZnNsLHBpbnMgPSA8DQo+IMKgCQkJLyogUG93ZXIgYnV0dG9uICov
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFy
bS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1r
ZXJuZWwK
