From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v6 3/5] drm: bridge: add support for TI ths8135
Date: Mon, 12 Dec 2016 14:05:40 +0100
Message-ID: <1481547942-24775-4-git-send-email-bgolaszewski@baylibre.com>
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

VEhTODEzNSBpcyBhIGNvbmZpZ3VyYWJsZSB2aWRlbyBEQUMsIGJ1dCBubyBjb25maWd1cmF0aW9u
IGlzIGFjdHVhbGx5Cm5lY2Vzc2FyeSB0byBtYWtlIGl0IHdvcmsuCgpGb3Igbm93IHVzZSB0aGUg
ZHVtYi12Z2EtZGFjIGRyaXZlciB0byBzdXBwb3J0IGl0LgoKU2lnbmVkLW9mZi1ieTogQmFydG9z
eiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KUmV2aWV3ZWQtYnk6IExh
dXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL2R1bWItdmdhLWRhYy5jIHwgMSArCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2R1
bWItdmdhLWRhYy5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9kdW1iLXZnYS1kYWMuYwppbmRl
eCBhZmVjMjMyLi40OThmYTc1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2R1
bWItdmdhLWRhYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvZHVtYi12Z2EtZGFjLmMK
QEAgLTIwNCw2ICsyMDQsNyBAQCBzdGF0aWMgaW50IGR1bWJfdmdhX3JlbW92ZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQogCiBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBk
dW1iX3ZnYV9tYXRjaFtdID0gewogCXsgLmNvbXBhdGlibGUgPSAiZHVtYi12Z2EtZGFjIiB9LAor
CXsgLmNvbXBhdGlibGUgPSAidGksdGhzODEzNSIgfSwKIAl7fSwKIH07CiBNT0RVTEVfREVWSUNF
X1RBQkxFKG9mLCBkdW1iX3ZnYV9tYXRjaCk7Ci0tIAoyLjkuMwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
