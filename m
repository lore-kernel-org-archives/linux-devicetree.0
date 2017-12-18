From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [PATCH v2 13/19] ARM: dts: Add OpenBMC flash layout
Date: Mon, 18 Dec 2017 10:04:44 +0100
Message-ID: <1becbfbe-cc2b-78d6-dd3b-00cdefa9b799@kaod.org>
References: <20171215062443.23059-1-joel@jms.id.au>
 <20171215062443.23059-14-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20171215062443.23059-14-joel@jms.id.au>
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
To: Joel Stanley <joel@jms.id.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Andrew Jeffery <andrew@aj.id.au>, Patrick Venture <venture@google.com>, Xo Wang <xow@google.com>, Lei YU <mine260309@gmail.com>
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-kernel@vger.kernel.org, Jeremy Kerr <jk@ozlabs.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

T24gMTIvMTUvMjAxNyAwNzoyNCBBTSwgSm9lbCBTdGFubGV5IHdyb3RlOgo+IFRoaXMgaXMgYSBs
YXlvdXQgdXNlZCBieSBPcGVuQk1DIHN5c3RlbXMuIEl0IGRlc2NyaWJlcyB0aGUgZml4ZWQgZmxh
c2gKPiBsYXlvdXQgb2YgYSAzMk1CIG10ZCBkZXZpY2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogSm9l
bCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT4KCgpSZXZpZXdlZC1ieTogQ8OpZHJpYyBMZSBHb2F0
ZXIgPGNsZ0BrYW9kLm9yZz4KCgo+IC0tLQo+ICBhcmNoL2FybS9ib290L2R0cy9vcGVuYm1jLWZs
YXNoLWxheW91dC5kdHNpIHwgMzIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgMSBm
aWxlIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gv
YXJtL2Jvb3QvZHRzL29wZW5ibWMtZmxhc2gtbGF5b3V0LmR0c2kKPiAKPiBkaWZmIC0tZ2l0IGEv
YXJjaC9hcm0vYm9vdC9kdHMvb3BlbmJtYy1mbGFzaC1sYXlvdXQuZHRzaSBiL2FyY2gvYXJtL2Jv
b3QvZHRzL29wZW5ibWMtZmxhc2gtbGF5b3V0LmR0c2kKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+
IGluZGV4IDAwMDAwMDAwMDAwMC4uNjNhZDhkYjdhNDMxCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBi
L2FyY2gvYXJtL2Jvb3QvZHRzL29wZW5ibWMtZmxhc2gtbGF5b3V0LmR0c2kKPiBAQCAtMCwwICsx
LDMyIEBACj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wKwo+ICsKPiArcGFy
dGl0aW9ucyB7Cj4gKwljb21wYXRpYmxlID0gImZpeGVkLXBhcnRpdGlvbnMiOwo+ICsJI2FkZHJl
c3MtY2VsbHMgPSA8MT47Cj4gKwkjc2l6ZS1jZWxscyA9IDwxPjsKPiArCj4gKwl1LWJvb3RAMCB7
Cj4gKwkJcmVnID0gPDB4MCAweDYwMDAwPjsKPiArCQlsYWJlbCA9ICJ1LWJvb3QiOwo+ICsJfTsK
PiArCj4gKwl1LWJvb3QtZW52QDYwMDAwIHsKPiArCQlyZWcgPSA8MHg2MDAwMCAweDIwMDAwPjsK
PiArCQlsYWJlbCA9ICJ1LWJvb3QtZW52IjsKPiArCX07Cj4gKwo+ICsJa2VybmVsQDgwMDAwIHsK
PiArCQlyZWcgPSA8MHg4MDAwMCAweDQ0MDAwMD47Cj4gKwkJbGFiZWwgPSAia2VybmVsIjsKPiAr
CX07Cj4gKwo+ICsJcm9mc0AwYzAwMDAgewo+ICsJCXJlZyA9IDwweDRjMDAwMCAweDE3NDAwMDA+
Owo+ICsJCWxhYmVsID0gInJvZnMiOwo+ICsJfTsKPiArCj4gKwlyd2ZzQDFjMDAwMDAgewo+ICsJ
CXJlZyA9IDwweDFjMDAwMDAgMHg0MDAwMDA+Owo+ICsJCWxhYmVsID0gInJ3ZnMiOwo+ICsJfTsK
PiArfTsKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hcm0ta2VybmVsCg==
