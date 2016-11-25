From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 2/3] ARM: dts: da850: specify the maximum bandwidth for tilcdc
Date: Fri, 25 Nov 2016 17:03:14 +0100
Message-ID: <1480089795-29811-3-git-send-email-bgolaszewski@baylibre.com>
References: <1480089795-29811-1-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1480089795-29811-1-git-send-email-bgolaszewski@baylibre.com>
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

SXQgaGFzIGJlZW4gZGV0ZXJtaW5lZCB0aGF0IHRoZSBtYXhpbXVtIHJlc29sdXRpb24gc3VwcG9y
dGVkIGNvcnJlY3RseQpieSB0aWxjZGMgcmV2MSBvbiBkYTg1MCBTb0NzIGlzIDgwMHg2MDBANjAu
IER1ZSB0byBtZW1vcnkgdGhyb3VnaHB1dApjb25zdHJhaW50cyB3ZSBtdXN0IGZpbHRlciBvdXQg
aGlnaGVyIG1vZGVzLgoKU3BlY2lmeSB0aGUgbWF4LWJhbmR3aWR0aCBwcm9wZXJ0eSBmb3IgdGhl
IGRpc3BsYXkgbm9kZSBmb3IKZGE4NTAtYmFzZWQgYm9hcmRzLgoKU2lnbmVkLW9mZi1ieTogQmFy
dG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KLS0tCiBhcmNoL2Fy
bS9ib290L2R0cy9kYTg1MC5kdHNpIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KykKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9kYTg1MC5kdHNpIGIvYXJjaC9hcm0v
Ym9vdC9kdHMvZGE4NTAuZHRzaQppbmRleCA4ZTMwZDliLi45YjdjNDQ0IDEwMDY0NAotLS0gYS9h
cmNoL2FybS9ib290L2R0cy9kYTg1MC5kdHNpCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2RhODUw
LmR0c2kKQEAgLTQ1Miw2ICs0NTIsNyBAQAogCQkJY29tcGF0aWJsZSA9ICJ0aSxkYTg1MC10aWxj
ZGMiOwogCQkJcmVnID0gPDB4MjEzMDAwIDB4MTAwMD47CiAJCQlpbnRlcnJ1cHRzID0gPDUyPjsK
KwkJCW1heC1iYW5kd2lkdGggPSA8Mjg4MDAwMDA+OwogCQkJc3RhdHVzID0gImRpc2FibGVkIjsK
IAogCQkJcG9ydHMgewotLSAKMi45LjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
