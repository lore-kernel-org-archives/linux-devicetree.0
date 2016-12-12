From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v6 5/5] ARM: dts: da850: specify the maximum pixel clock rate
 for tilcdc
Date: Mon, 12 Dec 2016 14:05:42 +0100
Message-ID: <1481547942-24775-6-git-send-email-bgolaszewski@baylibre.com>
References: <1481547942-24775-1-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1481547942-24775-1-git-send-email-bgolaszewski@baylibre.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jyri Sarha <jsarha@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, David Airlie <airlied@linux.ie>, Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Russell King <linux@armlinux.org.uk>
Cc: linux-devicetree <devicetree@vger.kernel.org>, linux-drm <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, arm-soc <linux-arm-kernel@lists.infradead.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

QXQgbWF4aW11bSBDUFUgZnJlcXVlbmN5IG9mIDMwMCBNSHogdGhlIG1heGltdW0gcGl4ZWwgY2xv
Y2sgZnJlcXVlbmN5CmlzIDM3LjUgTUh6WzFdLiBXZSBtdXN0IGZpbHRlciBvdXQgYW55IG1vZGUg
Zm9yIHdoaWNoIHRoZSBjYWxjdWxhdGVkCnBpeGVsIGNsb2NrIHJhdGUgd291bGQgZXhjZWVkIHRo
aXMgdmFsdWUuCgpTcGVjaWZ5IHRoZSBtYXgtcGl4ZWxjbG9jayBwcm9wZXJ0eSBmb3IgdGhlIGRp
c3BsYXkgbm9kZSBmb3IKZGE4NTAtbGNkay4KClsxXSBodHRwOi8vcHJvY2Vzc29ycy53aWtpLnRp
LmNvbS9pbmRleC5waHAvT01BUC1MMXgvQzY3NHgvQU0xeF9MQ0RfQ29udHJvbGxlcl8oTENEQylf
VGhyb3VnaHB1dF9hbmRfT3B0aW1pemF0aW9uX1RlY2huaXF1ZXMKClNpZ25lZC1vZmYtYnk6IEJh
cnRvc3ogR29sYXN6ZXdza2kgPGJnb2xhc3pld3NraUBiYXlsaWJyZS5jb20+Ci0tLQogYXJjaC9h
cm0vYm9vdC9kdHMvZGE4NTAuZHRzaSB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvZGE4NTAuZHRzaSBiL2FyY2gvYXJt
L2Jvb3QvZHRzL2RhODUwLmR0c2kKaW5kZXggM2Y1MWU1OS4uYmE1YmY4MCAxMDA2NDQKLS0tIGEv
YXJjaC9hcm0vYm9vdC9kdHMvZGE4NTAuZHRzaQorKysgYi9hcmNoL2FybS9ib290L2R0cy9kYTg1
MC5kdHNpCkBAIC00NTIsNiArNDUyLDcgQEAKIAkJCWNvbXBhdGlibGUgPSAidGksZGE4NTAtdGls
Y2RjIjsKIAkJCXJlZyA9IDwweDIxMzAwMCAweDEwMDA+OwogCQkJaW50ZXJydXB0cyA9IDw1Mj47
CisJCQltYXgtcGl4ZWxjbG9jayA9IDwzNzUwMD47CiAJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwog
CQl9OwogCX07Ci0tIAoyLjkuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
