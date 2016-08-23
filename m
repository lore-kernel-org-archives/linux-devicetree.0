From: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [PATCH 2/2] ARM: dts: sun8i: Add extra UART pinmux settings for
 A23/33
Date: Tue, 23 Aug 2016 21:51:05 +0800
Message-ID: <69271471960265@web26h.yandex.ru>
References: <20160823055826.20591-1-icenowy@aosc.xyz>
 <20160823055826.20591-2-icenowy@aosc.xyz> <20160823114251.GL2598@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160823114251.GL2598@lukather>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Russell King <linux@armlinux.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

CgoyMy4wOC4yMDE2LCAxOTo0MiwgIk1heGltZSBSaXBhcmQiIDxtYXhpbWUucmlwYXJkQGZyZWUt
ZWxlY3Ryb25zLmNvbT46Cj4gSGksCj4KPiBPbiBUdWUsIEF1ZyAyMywgMjAxNiBhdCAwMTo1ODoy
NlBNICswODAwLCBJY2Vub3d5IFpoZW5nIHdyb3RlOgo+PiDCoEEyMy8zMyBoYXZlIDQgVUFSVCBj
b250cm9sbGVycyBvdXRzaWRlIFBSQ00uIEhvd2V2ZXIsIHRoZSBkZXZpY2V0cmVlIHVzZWQKPj4g
wqB0byBtZW50aW9uZWQgb25seSBVQVJUMCdzIHBpbm11eCBzZXR0aW5ncy4gU29tZSBleHRyYSBV
QVJUIGNvbnRyb2xsZXJzIGhhdmUKPj4gwqBSVFMvQ1RTLCBhbmQgaXMgc3VpdGFibGUgZm9yIHVz
aW5nIGFzIGJsdWV0b290aCBVQVJUIGNvbnRyb2xsZXIuCj4+Cj4+IMKgQWRkIHRoZSBwaW5tdXgg
c2V0dGluZ3MgZm9yIHRoZSBVQVJUIGNvbnRyb2xsZXIsIHRvIG1ha2UgdXNlIG9mIHRoZQo+PiDC
oGJsdWV0b290aCBmdW5jdGlvbiBvZiBzb21lIHRhYmxldHMuCj4+Cj4+IMKgU2lnbmVkLW9mZi1i
eTogSWNlbm93eSBaaGVuZyA8aWNlbm93eUBhb3NjLnh5ej4KPgo+IE91ciBwb2xpY3kgaXMgdGhh
dCB3ZSBhdm9pZCBhZGRpbmcgdW51c2VkIHBpbmN0cmwgbm9kZXMgdG8gbm90IGNyaXBwbGUKPiB0
aGUgRFQgZm9yIG5vIHBhcnRpY3VsYXIgcmVhc29uLgo+Cj4gU28gcGxlYXNlIGFkZCBvbmx5IHRo
ZSBub2RlcyB5b3UnbGwgbmVlZCBpbiB5b3VyIHRhYmxldC4KClRoZW4uLi4gaWYgd2hhdCBJIG5l
ZWRzIGlzIHRoZSBQRyBncm91cCBvZiB1YXJ0MSwgc2hvdWxkIEkgbmFtZSBpdCBhcwp1YXJ0MV9w
aW5zX2Egb3IgdWFydDFfcGluc19iPwoKPgo+IFRoYW5rcyEKPiBNYXhpbWUKPgo+IC0tCj4gTWF4
aW1lIFJpcGFyZCwgRnJlZSBFbGVjdHJvbnMKPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVu
Z2luZWVyaW5nCj4gaHR0cDovL2ZyZWUtZWxlY3Ryb25zLmNvbQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxp
c3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
