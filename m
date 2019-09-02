From: Philippe CORNU <philippe.cornu@st.com>
Subject: Re: [PATCH] ARM: dts: stm32: move ltdc pinctrl on stm32mp157a dk1
 board
Date: Mon, 2 Sep 2019 08:45:18 +0000
Message-ID: <50695b37-df51-08d6-a11e-99f9349aa481@st.com>
References: <1564754931-13861-1-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1564754931-13861-1-git-send-email-yannick.fertre@st.com>
Content-Language: en-US
Content-ID: <EEAD06A52162824F94647D53ADBE7BB7@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Yannick FERTRE <yannick.fertre@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Benjamin GAIGNARD <benjamin.gaignard@st.com>, Fabrice GASNIER <fabrice.gasnier@st.com>
List-Id: devicetree@vger.kernel.org

SGkgWWFubmljaywNCg0KT24gOC8yLzE5IDQ6MDggUE0sIFlhbm5pY2sgRmVydHLDqSB3cm90ZToN
Cj4gVGhlIGx0ZGMgcGluY3RybCBtdXN0IGJlIGluIHRoZSBkaXNwbGF5IGNvbnRyb2xsZXIgbm9k
ZSBhbmQNCj4gbm90IGluIHRoZSBwZXJpcGhlcmFsIG5vZGUgKGhkbWkgYnJpZGdlKS4NCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IFlhbm5pY2sgRmVydHLDqSA8eWFubmljay5mZXJ0cmVAc3QuY29tPg0K
PiAtLS0NCj4gICBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3YS1kazEuZHRzIHwgNiArKyst
LS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdhLWRrMS5kdHMg
Yi9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3YS1kazEuZHRzDQo+IGluZGV4IGYzZjBlMzcu
LjEyODVjZmMgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdhLWRr
MS5kdHMNCj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2EtZGsxLmR0cw0KPiBA
QCAtOTksOSArOTksNiBAQA0KPiAgIAkJcmVzZXQtZ3Bpb3MgPSA8JmdwaW9hIDEwIEdQSU9fQUNU
SVZFX0xPVz47DQo+ICAgCQlpbnRlcnJ1cHRzID0gPDEgSVJRX1RZUEVfRURHRV9GQUxMSU5HPjsN
Cj4gICAJCWludGVycnVwdC1wYXJlbnQgPSA8JmdwaW9nPjsNCj4gLQkJcGluY3RybC1uYW1lcyA9
ICJkZWZhdWx0IiwgInNsZWVwIjsNCj4gLQkJcGluY3RybC0wID0gPCZsdGRjX3BpbnNfYT47DQo+
IC0JCXBpbmN0cmwtMSA9IDwmbHRkY19waW5zX3NsZWVwX2E+Ow0KPiAgIAkJc3RhdHVzID0gIm9r
YXkiOw0KPiAgIA0KPiAgIAkJcG9ydHMgew0KPiBAQCAtMjc2LDYgKzI3Myw5IEBADQo+ICAgfTsN
Cj4gICANCj4gICAmbHRkYyB7DQo+ICsJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IiwgInNsZWVw
IjsNCj4gKwlwaW5jdHJsLTAgPSA8Jmx0ZGNfcGluc19hPjsNCj4gKwlwaW5jdHJsLTEgPSA8Jmx0
ZGNfcGluc19zbGVlcF9hPjsNCg0KUmV2aWV3ZWQtYnk6IFBoaWxpcHBlIENvcm51IDxwaGlsaXBw
ZS5jb3JudUBzdC5jb20+DQoNClRoYW5rcw0KUGhpbGlwcGUgOikNCg0KPiAgIAlzdGF0dXMgPSAi
b2theSI7DQo+ICAgDQo+ICAgCXBvcnQgew0KPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgt
YXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
