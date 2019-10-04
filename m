From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 11/16] dt-bindings: mtd: aspeed-smc: Add new comptatible for
 AST2600
Date: Fri,  4 Oct 2019 13:59:14 +0200
Message-ID: <20191004115919.20788-12-clg@kaod.org>
References: <20191004115919.20788-1-clg@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191004115919.20788-1-clg@kaod.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-mtd@lists.infradead.org, Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>, Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>, Joel Stanley <joel@jms.id.au>, Miquel Raynal <miquel.raynal@bootlin.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
List-Id: devicetree@vger.kernel.org

VGhlIFNNQyBjb250cm9sbGVycyBvbiB0aGUgQVNUMjYwMCBTb0MgYXJlIHZlcnkgc2ltaWxhciB0
byB0aGUgdGhlCkFTVDI1MDAuIFRoZSBTb0MgaGFzIG9uZSBGaXJtd2FyZSBNZW1vcnkgQ29udHJv
bGxlciBhbmQgdHdvIFNQSSBmbGFzaAptZW1vcnkgY29udHJvbGxlcnMuCgpDYzogUm9iIEhlcnJp
bmcgPHJvYmhAa2VybmVsLm9yZz4KQ2M6IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnClNpZ25l
ZC1vZmYtYnk6IEPDqWRyaWMgTGUgR29hdGVyIDxjbGdAa2FvZC5vcmc+Ci0tLQogRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9hc3BlZWQtc21jLnR4dCB8IDIgKysKIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbXRkL2FzcGVlZC1zbWMudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL210ZC9hc3BlZWQtc21jLnR4dAppbmRleCA0OWY2NTI4ZWY1NDcuLmMy
MzczZDljZmQ5MCAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L210ZC9hc3BlZWQtc21jLnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbXRkL2FzcGVlZC1zbWMudHh0CkBAIC0xNCw2ICsxNCw4IEBAIFJlcXVpcmVkIHByb3BlcnRp
ZXM6CiAJImFzcGVlZCxhc3QyNDAwLXNwaSIgZm9yIHRoZSBBU1QyNDAwIFNQSSBGbGFzaCBtZW1v
cnkgQ29udHJvbGxlcgogCSJhc3BlZWQsYXN0MjUwMC1mbWMiIGZvciB0aGUgQVNUMjUwMCBGaXJt
d2FyZSBNZW1vcnkgQ29udHJvbGxlcgogCSJhc3BlZWQsYXN0MjUwMC1zcGkiIGZvciB0aGUgQVNU
MjUwMCBTUEkgZmxhc2ggbWVtb3J5IGNvbnRyb2xsZXJzCisJImFzcGVlZCxhc3QyNjAwLWZtYyIg
Zm9yIHRoZSBBU1QyNjAwIEZpcm13YXJlIE1lbW9yeSBDb250cm9sbGVyCisJImFzcGVlZCxhc3Qy
NjAwLXNwaSIgZm9yIHRoZSBBU1QyNjAwIFNQSSBmbGFzaCBtZW1vcnkgY29udHJvbGxlcnMKIAog
ICAtIHJlZyA6IHRoZSBmaXJzdCBjb250YWlucyB0aGUgY29udHJvbCByZWdpc3RlciBsb2NhdGlv
biBhbmQgbGVuZ3RoLAogICAgICAgICAgIHRoZSBzZWNvbmQgY29udGFpbnMgdGhlIG1lbW9yeSB3
aW5kb3cgbWFwcGluZyBhZGRyZXNzIGFuZCBsZW5ndGgKLS0gCjIuMjEuMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFp
bGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
