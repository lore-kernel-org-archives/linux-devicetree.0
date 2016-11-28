From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 2/2] ARM: dts: da850-lcdk: specify the maximum pixel clock
 rate for tilcdc
Date: Mon, 28 Nov 2016 13:15:28 +0100
Message-ID: <1480335328-4010-3-git-send-email-bgolaszewski@baylibre.com>
References: <1480335328-4010-1-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1480335328-4010-1-git-send-email-bgolaszewski@baylibre.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Russell King <linux@armlinux.org.uk>
Cc: linux-devicetree <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, linux-drm <dri-devel@lists.freedesktop.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>, arm-soc <linux-arm-kernel@lists.infradead.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

RHVlIHRvIG1lbW9yeSB0aHJvdWdocHV0IGNvbnN0cmFpbnRzIGFueSBkaXNwbGF5IG1vZGUgZm9y
IHdoaWNoIHRoZQpwaXhlbCBjbG9jayByYXRlIGV4Y2VlZHMgdGhlIHJlY29tbWVuZGVkIHZhbHVl
IG9mIDM3NTAwIEtIeiBtdXN0IGJlCmZpbHRlcmVkIG91dC4KClNwZWNpZnkgdGhlIG1heC1waXhl
bGNsb2NrIHByb3BlcnR5IGZvciB0aGUgZGlzcGxheSBub2RlIGZvcgpkYTg1MC1sY2RrLgoKU2ln
bmVkLW9mZi1ieTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNv
bT4KLS0tCiBhcmNoL2FybS9ib290L2R0cy9kYTg1MC1sY2RrLmR0cyB8IDEgKwogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvZGE4
NTAtbGNkay5kdHMgYi9hcmNoL2FybS9ib290L2R0cy9kYTg1MC1sY2RrLmR0cwppbmRleCBkODY0
ZjExLi4xMjgzMjYzIDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9kYTg1MC1sY2RrLmR0
cworKysgYi9hcmNoL2FybS9ib290L2R0cy9kYTg1MC1sY2RrLmR0cwpAQCAtMjg1LDYgKzI4NSw3
IEBACiAKICZkaXNwbGF5IHsKIAlzdGF0dXMgPSAib2theSI7CisJbWF4LXBpeGVsY2xvY2sgPSA8
Mzc1MDA+OwogfTsKIAogJmRpc3BsYXlfb3V0IHsKLS0gCjIuOS4zCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
