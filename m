From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH] ARM: dts: da850: specify max width for display node
Date: Tue, 22 Nov 2016 10:42:55 +0100
Message-ID: <1479807775-28283-1-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
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

SXQgaGFzIGJlZW4gZGV0ZXJtaW5lZCB0aGF0IHRoZSBoaWdoZXN0IHJlc29sdXRpb24gc3VwcG9y
dGVkIGNvcnJlY3RseQpieSBMQ0RDIHJldjEgaXMgODAweDYwMCBvbiBkYTg1MCBkdWUgdG8gbWVt
b3J5IGJhbmR3aWR0aCBjb25zdHJhaW50cy4KClNldCB0aGUgbWF4X3dpZHRoIHByb3BlcnR5IGlu
IGRhODUwLmR0c2kgdG8gODAwLgoKU2lnbmVkLW9mZi1ieTogQmFydG9zeiBHb2xhc3pld3NraSA8
YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KLS0tCiBhcmNoL2FybS9ib290L2R0cy9kYTg1MC5k
dHNpIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9h
cmNoL2FybS9ib290L2R0cy9kYTg1MC5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvZGE4NTAuZHRz
aQppbmRleCAzNjA2NmZhLi4wODc2MjM4IDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9k
YTg1MC5kdHNpCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2RhODUwLmR0c2kKQEAgLTQ0MSw2ICs0
NDEsNyBAQAogCQkJY29tcGF0aWJsZSA9ICJ0aSxkYTg1MC10aWxjZGMiOwogCQkJcmVnID0gPDB4
MjEzMDAwIDB4MTAwMD47CiAJCQlpbnRlcnJ1cHRzID0gPDUyPjsKKwkJCW1heC13aWR0aCA9IDw4
MDA+OwogCQkJc3RhdHVzID0gImRpc2FibGVkIjsKIAkJfTsKIAl9OwotLSAKMi45LjMKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
