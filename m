From: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [PATCH v2 1/2] dt: bindings: add binding for Allwinner A64 R_PIO
 pinctrl
Date: Tue, 16 Aug 2016 18:56:47 +0800
Message-ID: <1672001471345007@web4j.yandex.ru>
References: <20160816050709.7412-1-icenowy@aosc.xyz>
 <CAGb2v65ca+HFq9Mr21E7QSN845O2H7BYKg5uAmRhECJe5dK6ag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAGb2v65ca+HFq9Mr21E7QSN845O2H7BYKg5uAmRhECJe5dK6ag@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Vishnu Patekar <vishnupatekar0510@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Andre Przywara <andre.przywara@arm.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Rob Herring <robh+dt@kernel.org>, Jens Kuske <jenskuske@gmail.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Krzysztof Adamski <k@japko.eu>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

CgoxNi4wOC4yMDE2LCAxNzoxNCwgIkNoZW4tWXUgVHNhaSIgPHdlbnNAY3NpZS5vcmc+Ogo+IE9u
IFR1ZSwgQXVnIDE2LCAyMDE2IGF0IDE6MDcgUE0sIEljZW5vd3kgWmhlbmcgPGljZW5vd3lAYW9z
Yy54eXo+IHdyb3RlOgo+PiDCoFNpZ25lZC1vZmYtYnk6IEljZW5vd3kgWmhlbmcgPGljZW5vd3lA
YW9zYy54eXo+Cj4KPiBDb21taXQgbWVzc2FnZSBwbGVhc2UuIDopCkknbSB0b28gc2lsbHkgdG8g
ZGVjaWRlIHdoYXQgc2hvdWxkIGJlIHdyaXR0ZW4gaGVyZS4uLgo+Cj4gU29tZXRoaW5nIHNpbWls
YXIgdG8gdGhlIG9uZSBpbiB0aGUgcGluY3RybCBkcml2ZXIgcGF0Y2ggd291bGQgZG8uCj4KPiBD
aGVuWXUKPgo+PiDCoC0tLQo+PiDCoMKgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3BpbmN0cmwvYWxsd2lubmVyLHN1bnhpLXBpbmN0cmwudHh0IHwgMSArCj4+IMKgwqAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPj4KPj4gwqBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvYWxsd2lubmVyLHN1bnhpLXBpbmN0cmwudHh0
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvYWxsd2lubmVyLHN1
bnhpLXBpbmN0cmwudHh0Cj4+IMKgaW5kZXggNjk2MTcyMi4uZWU3M2Y5ZiAxMDA2NDQKPj4gwqAt
LS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9hbGx3aW5uZXIs
c3VueGktcGluY3RybC50eHQKPj4gwqArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcGluY3RybC9hbGx3aW5uZXIsc3VueGktcGluY3RybC50eHQKPj4gwqBAQCAtMjMsNiAr
MjMsNyBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+PiDCoMKgwqDCoCJhbGx3aW5uZXIsc3VuOGkt
aDMtcGluY3RybCIKPj4gwqDCoMKgwqAiYWxsd2lubmVyLHN1bjhpLWgzLXItcGluY3RybCIKPj4g
wqDCoMKgwqAiYWxsd2lubmVyLHN1bjUwaS1hNjQtcGluY3RybCIKPj4gwqArICJhbGx3aW5uZXIs
c3VuNTBpLWE2NC1yLXBpbmN0cmwiCj4+Cj4+IMKgwqAtIHJlZzogU2hvdWxkIGNvbnRhaW4gdGhl
IHJlZ2lzdGVyIHBoeXNpY2FsIGFkZHJlc3MgYW5kIGxlbmd0aCBmb3IgdGhlCj4+IMKgwqDCoMKg
cGluIGNvbnRyb2xsZXIuCj4+IMKgLS0KPj4gwqAyLjkuMgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QK
bGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
