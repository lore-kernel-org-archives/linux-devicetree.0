From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [PATCH v2 07/19] ARM: dts: aspeed: Add flash controller clocks
Date: Mon, 18 Dec 2017 10:03:01 +0100
Message-ID: <36771f62-35d0-94c9-a0ac-cfaf35e6ff4f@kaod.org>
References: <20171215062443.23059-1-joel@jms.id.au>
 <20171215062443.23059-8-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20171215062443.23059-8-joel@jms.id.au>
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
c3BlZWQtZzQuZHRzaQo+IGluZGV4IDJlMzY2NmQ0ZmJlYi4uYWZhYzBjYTBjYjEwIDEwMDY0NAo+
IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1nNC5kdHNpCj4gKysrIGIvYXJjaC9hcm0v
Ym9vdC9kdHMvYXNwZWVkLWc0LmR0c2kKPiBAQCAtNTYsNiArNTYsNyBAQAo+ICAJCQkjYWRkcmVz
cy1jZWxscyA9IDwxPjsKPiAgCQkJI3NpemUtY2VsbHMgPSA8MD47Cj4gIAkJCWNvbXBhdGlibGUg
PSAiYXNwZWVkLGFzdDI0MDAtZm1jIjsKPiArCQkJY2xvY2tzID0gPCZzeXNjb24gQVNQRUVEX0NM
S19BSEI+Owo+ICAJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwo+ICAJCQlpbnRlcnJ1cHRzID0gPDE5
PjsKPiAgCQkJZmxhc2hAMCB7Cj4gQEAgLTcxLDYgKzcyLDcgQEAKPiAgCQkJI2FkZHJlc3MtY2Vs
bHMgPSA8MT47Cj4gIAkJCSNzaXplLWNlbGxzID0gPDA+Owo+ICAJCQljb21wYXRpYmxlID0gImFz
cGVlZCxhc3QyNDAwLXNwaSI7Cj4gKwkJCWNsb2NrcyA9IDwmc3lzY29uIEFTUEVFRF9DTEtfQUhC
PjsKPiAgCQkJc3RhdHVzID0gImRpc2FibGVkIjsKPiAgCQkJZmxhc2hAMCB7Cj4gIAkJCQlyZWcg
PSA8IDAgPjsKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWc1LmR0c2kg
Yi9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzUuZHRzaQo+IGluZGV4IDI0YmIyZDE2YjkwMC4u
ZjM2ODljYWY2ZmUyIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1nNS5k
dHNpCj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWc1LmR0c2kKPiBAQCAtNTYsNiAr
NTYsNyBAQAo+ICAJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKPiAgCQkJI3NpemUtY2VsbHMgPSA8
MD47Cj4gIAkJCWNvbXBhdGlibGUgPSAiYXNwZWVkLGFzdDI1MDAtZm1jIjsKPiArCQkJY2xvY2tz
ID0gPCZzeXNjb24gQVNQRUVEX0NMS19BSEI+Owo+ICAJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwo+
ICAJCQlpbnRlcnJ1cHRzID0gPDE5PjsKPiAgCQkJZmxhc2hAMCB7Cj4gQEAgLTgxLDYgKzgyLDcg
QEAKPiAgCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4gIAkJCSNzaXplLWNlbGxzID0gPDA+Owo+
ICAJCQljb21wYXRpYmxlID0gImFzcGVlZCxhc3QyNTAwLXNwaSI7Cj4gKwkJCWNsb2NrcyA9IDwm
c3lzY29uIEFTUEVFRF9DTEtfQUhCPjsKPiAgCQkJc3RhdHVzID0gImRpc2FibGVkIjsKPiAgCQkJ
Zmxhc2hAMCB7Cj4gIAkJCQlyZWcgPSA8IDAgPjsKPiBAQCAtMTAwLDYgKzEwMiw3IEBACj4gIAkJ
CSNhZGRyZXNzLWNlbGxzID0gPDE+Owo+ICAJCQkjc2l6ZS1jZWxscyA9IDwwPjsKPiAgCQkJY29t
cGF0aWJsZSA9ICJhc3BlZWQsYXN0MjUwMC1zcGkiOwo+ICsJCQljbG9ja3MgPSA8JnN5c2NvbiBB
U1BFRURfQ0xLX0FIQj47Cj4gIAkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4gIAkJCWZsYXNoQDAg
ewo+ICAJCQkJcmVnID0gPCAwID47Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJt
LWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
