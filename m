From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [PATCH v2 06/19] ARM: dts: aspeed: Add watchdog clocks
Date: Mon, 18 Dec 2017 10:02:55 +0100
Message-ID: <a4018717-0ffa-e7cc-1a8d-e6937ac0a57c@kaod.org>
References: <20171215062443.23059-1-joel@jms.id.au>
 <20171215062443.23059-7-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20171215062443.23059-7-joel@jms.id.au>
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

T24gMTIvMTUvMjAxNyAwNzoyNCBBTSwgSm9lbCBTdGFubGV5IHdyb3RlOgo+IFNpZ25lZC1vZmYt
Ynk6IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+CgoKUmV2aWV3ZWQtYnk6IEPDqWRyaWMg
TGUgR29hdGVyIDxjbGdAa2FvZC5vcmc+CgoKPiAtLS0KPiAgYXJjaC9hcm0vYm9vdC9kdHMvYXNw
ZWVkLWc0LmR0c2kgfCAyICsrCj4gIGFyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1nNS5kdHNpIHwg
MyArKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0
IGEvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWc0LmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9h
c3BlZWQtZzQuZHRzaQo+IGluZGV4IGNmNDA3YjRkYjYzMC4uMmUzNjY2ZDRmYmViIDEwMDY0NAo+
IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1nNC5kdHNpCj4gKysrIGIvYXJjaC9hcm0v
Ym9vdC9kdHMvYXNwZWVkLWc0LmR0c2kKPiBAQCAtMTc3LDExICsxNzcsMTMgQEAKPiAgCQkJd2R0
MTogd2F0Y2hkb2dAMWU3ODUwMDAgewo+ICAJCQkJY29tcGF0aWJsZSA9ICJhc3BlZWQsYXN0MjQw
MC13ZHQiOwo+ICAJCQkJcmVnID0gPDB4MWU3ODUwMDAgMHgxYz47Cj4gKwkJCQljbG9ja3MgPSA8
JnN5c2NvbiBBU1BFRURfQ0xLX0FQQj47Cj4gIAkJCX07Cj4gIAo+ICAJCQl3ZHQyOiB3YXRjaGRv
Z0AxZTc4NTAyMCB7Cj4gIAkJCQljb21wYXRpYmxlID0gImFzcGVlZCxhc3QyNDAwLXdkdCI7Cj4g
IAkJCQlyZWcgPSA8MHgxZTc4NTAyMCAweDFjPjsKPiArCQkJCWNsb2NrcyA9IDwmc3lzY29uIEFT
UEVFRF9DTEtfQVBCPjsKPiAgCQkJfTsKPiAgCj4gIAkJCXZ1YXJ0OiBzZXJpYWxAMWU3ODcwMDAg
ewo+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzUuZHRzaSBiL2FyY2gv
YXJtL2Jvb3QvZHRzL2FzcGVlZC1nNS5kdHNpCj4gaW5kZXggYWIyNjE1NmQ2ODIyLi4yNGJiMmQx
NmI5MDAgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWc1LmR0c2kKPiAr
KysgYi9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzUuZHRzaQo+IEBAIC0yMTksMTYgKzIxOSwx
OSBAQAo+ICAJCQl3ZHQxOiB3YXRjaGRvZ0AxZTc4NTAwMCB7Cj4gIAkJCQljb21wYXRpYmxlID0g
ImFzcGVlZCxhc3QyNTAwLXdkdCI7Cj4gIAkJCQlyZWcgPSA8MHgxZTc4NTAwMCAweDIwPjsKPiAr
CQkJCWNsb2NrcyA9IDwmc3lzY29uIEFTUEVFRF9DTEtfQVBCPjsKPiAgCQkJfTsKPiAgCj4gIAkJ
CXdkdDI6IHdhdGNoZG9nQDFlNzg1MDIwIHsKPiAgCQkJCWNvbXBhdGlibGUgPSAiYXNwZWVkLGFz
dDI1MDAtd2R0IjsKPiAgCQkJCXJlZyA9IDwweDFlNzg1MDIwIDB4MjA+Owo+ICsJCQkJY2xvY2tz
ID0gPCZzeXNjb24gQVNQRUVEX0NMS19BUEI+Owo+ICAJCQl9Owo+ICAKPiAgCQkJd2R0Mzogd2F0
Y2hkb2dAMWU3ODUwNDAgewo+ICAJCQkJY29tcGF0aWJsZSA9ICJhc3BlZWQsYXN0MjUwMC13ZHQi
Owo+ICAJCQkJcmVnID0gPDB4MWU3ODUwNDAgMHgyMD47Cj4gKwkJCQljbG9ja3MgPSA8JnN5c2Nv
biBBU1BFRURfQ0xLX0FQQj47Cj4gIAkJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwo+ICAJCQl9Owo+
ICAKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hcm0ta2VybmVsCg==
