From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [PATCH v2 11/19] ARM: dts: aspeed: Remove skeleton.dtsi
Date: Mon, 18 Dec 2017 10:08:47 +0100
Message-ID: <55ef1f45-31a7-4584-1083-aef7bd68634a@kaod.org>
References: <20171215062443.23059-1-joel@jms.id.au>
 <20171215062443.23059-12-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20171215062443.23059-12-joel@jms.id.au>
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

T24gMTIvMTUvMjAxNyAwNzoyNCBBTSwgSm9lbCBTdGFubGV5IHdyb3RlOgo+IFdlIGRvbid0IHJl
cXVpcmUgaXQgZm9yIGFueSBvZiB0aGUgQVNQRUVEIHN5c3RlbXMuCgpSZXZpZXdlZC1ieTogQ8Op
ZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4KCgo+IAo+IFNpZ25lZC1vZmYtYnk6IEpvZWwg
U3RhbmxleSA8am9lbEBqbXMuaWQuYXU+Cj4gLS0tCj4gIGFyY2gvYXJtL2Jvb3QvZHRzL2FzcGVl
ZC1nNC5kdHNpIHwgMSAtCj4gIGFyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1nNS5kdHNpIHwgMSAt
Cj4gIDIgZmlsZXMgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJj
aC9hcm0vYm9vdC9kdHMvYXNwZWVkLWc0LmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQt
ZzQuZHRzaQo+IGluZGV4IGIzNTgwZjM3ZjUwNy4uMmQ3YWM1NzdkNmI1IDEwMDY0NAo+IC0tLSBh
L2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1nNC5kdHNpCj4gKysrIGIvYXJjaC9hcm0vYm9vdC9k
dHMvYXNwZWVkLWc0LmR0c2kKPiBAQCAtMSw1ICsxLDQgQEAKPiAgLy8gU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IEdQTC0yLjAKPiAtI2luY2x1ZGUgInNrZWxldG9uLmR0c2kiCj4gICNpbmNsdWRl
IDxkdC1iaW5kaW5ncy9jbG9jay9hc3BlZWQtY2xvY2suaD4KPiAgI2luY2x1ZGUgPGR0LWJpbmRp
bmdzL2dwaW8vYXNwZWVkLWdwaW8uaD4KPiAgCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3Qv
ZHRzL2FzcGVlZC1nNS5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWc1LmR0c2kKPiBp
bmRleCA1MDc2NmYwNjI5ZjguLjAzMGE3NjA2OTZmZCAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybS9i
b290L2R0cy9hc3BlZWQtZzUuZHRzaQo+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1n
NS5kdHNpCj4gQEAgLTEsNSArMSw0IEBACj4gIC8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBH
UEwtMi4wCj4gLSNpbmNsdWRlICJza2VsZXRvbi5kdHNpIgo+ICAjaW5jbHVkZSA8ZHQtYmluZGlu
Z3MvY2xvY2svYXNwZWVkLWNsb2NrLmg+Cj4gICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9ncGlvL2Fz
cGVlZC1ncGlvLmg+Cj4gIAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJu
ZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
