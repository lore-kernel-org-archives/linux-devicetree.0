From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2 1/2] dts: arm64: imx8mq: Enable gpu passive throttling
Date: Sun, 6 Oct 2019 16:06:43 +0800
Message-ID: <20191006080641.GX7150@dragon>
References: <cover.1568255903.git.agx@sigxcpu.org>
 <0ab2ee7de9c2e24f6de860ffcbcdfc25b72c2c61.1568255903.git.agx@sigxcpu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <0ab2ee7de9c2e24f6de860ffcbcdfc25b72c2c61.1568255903.git.agx@sigxcpu.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, Anson Huang <Anson.Huang@nxp.com>, Carlo Caione <ccaione@baylibre.com>, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, "Angus Ainslie (Purism)" <angus@akkea.ca>, etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Abel Vesa <abel.vesa@nxp.com>, Andrey Smirnov <andrew.smirnov@gmail.com>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Russell King <linux+etnaviv@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

T24gV2VkLCBTZXAgMTEsIDIwMTkgYXQgMDc6NDA6MzVQTSAtMDcwMCwgR3VpZG8gR8O8bnRoZXIg
d3JvdGU6Cj4gVGVtcGVyYXR1cmUgYW5kIGh5c3RlcmVzaXMgd2VyZSBwaWNrZWQgYWZ0ZXIgdGhl
IENQVS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBHdWlkbyBHw7xudGhlciA8YWd4QHNpZ3hjcHUub3Jn
PgoKVGhlIHBhdGNoIHByZWZpeCBzaG91bGQgYmUgJ2FybTY0OiBkdHM6IC4uLicKCkkgZml4ZWQg
aXQgdXAgYW5kIGFwcGxpZWQgdGhlIHBhdGNoLgoKU2hhd24KCj4gLS0tCj4gIGFyY2gvYXJtNjQv
Ym9vdC9kdHMvZnJlZXNjYWxlL2lteDhtcS5kdHNpIHwgMTUgKysrKysrKysrKysrKysrCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJt
NjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtcS5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9m
cmVlc2NhbGUvaW14OG1xLmR0c2kKPiBpbmRleCA0ZmRkNjBmMmM1MWUuLjUwMjNhMGU1MDY4ZCAx
MDA2NDQKPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4bXEuZHRzaQo+
ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtcS5kdHNpCj4gQEAgLTIz
NSwxMiArMjM1LDI2IEBACj4gIAkJCXRoZXJtYWwtc2Vuc29ycyA9IDwmdG11IDE+Owo+ICAKPiAg
CQkJdHJpcHMgewo+ICsJCQkJZ3B1X2FsZXJ0OiBncHUtYWxlcnQgewo+ICsJCQkJCXRlbXBlcmF0
dXJlID0gPDgwMDAwPjsKPiArCQkJCQloeXN0ZXJlc2lzID0gPDIwMDA+Owo+ICsJCQkJCXR5cGUg
PSAicGFzc2l2ZSI7Cj4gKwkJCQl9Owo+ICsKPiAgCQkJCWdwdS1jcml0IHsKPiAgCQkJCQl0ZW1w
ZXJhdHVyZSA9IDw5MDAwMD47Cj4gIAkJCQkJaHlzdGVyZXNpcyA9IDwyMDAwPjsKPiAgCQkJCQl0
eXBlID0gImNyaXRpY2FsIjsKPiAgCQkJCX07Cj4gIAkJCX07Cj4gKwo+ICsJCQljb29saW5nLW1h
cHMgewo+ICsJCQkJbWFwMCB7Cj4gKwkJCQkJdHJpcCA9IDwmZ3B1X2FsZXJ0PjsKPiArCQkJCQlj
b29saW5nLWRldmljZSA9Cj4gKwkJCQkJCTwmZ3B1IFRIRVJNQUxfTk9fTElNSVQgVEhFUk1BTF9O
T19MSU1JVD47Cj4gKwkJCQl9Owo+ICsJCQl9Owo+ICAJCX07Cj4gIAo+ICAJCXZwdS10aGVybWFs
IHsKPiBAQCAtOTEyLDYgKzkyNiw3IEBACj4gIAkJCSAgICAgICAgIDwmY2xrIElNWDhNUV9DTEtf
R1BVX0FYST4sCj4gIAkJCSAgICAgICAgIDwmY2xrIElNWDhNUV9DTEtfR1BVX0FIQj47Cj4gIAkJ
CWNsb2NrLW5hbWVzID0gImNvcmUiLCAic2hhZGVyIiwgImJ1cyIsICJyZWciOwo+ICsJCQkjY29v
bGluZy1jZWxscyA9IDwyPjsKPiAgCQkJYXNzaWduZWQtY2xvY2tzID0gPCZjbGsgSU1YOE1RX0NM
S19HUFVfQ09SRV9TUkM+LAo+ICAJCQkgICAgICAgICAgICAgICAgICA8JmNsayBJTVg4TVFfQ0xL
X0dQVV9TSEFERVJfU1JDPiwKPiAgCQkJICAgICAgICAgICAgICAgICAgPCZjbGsgSU1YOE1RX0NM
S19HUFVfQVhJPiwKPiAtLSAKPiAyLjIzLjAucmMxCj4gCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
