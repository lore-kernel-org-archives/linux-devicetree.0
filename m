From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH] ARM: davinci_all_defconfig: enable dumb vga-dac drm bridge
Date: Fri, 25 Nov 2016 10:13:02 +0100
Message-ID: <1480065182-7095-1-git-send-email-bgolaszewski@baylibre.com>
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

VGhpcyBlbmFibGVzIHRoZSBkdW1iLXZnYS1kYWMgZHJpdmVyIGJ5IGRlZmF1bHQgZm9yIGRhdmlu
Y2kgYm9hcmRzLgoKVGhlIGRyaXZlciBpcyBuZWVkZWQgZm9yIHRpbGNkYyBzdXBwb3J0IG9uIGRh
ODUwLWxjZGsgYm9hcmQuCgpTaWduZWQtb2ZmLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29s
YXN6ZXdza2lAYmF5bGlicmUuY29tPgotLS0KIGFyY2gvYXJtL2NvbmZpZ3MvZGF2aW5jaV9hbGxf
ZGVmY29uZmlnIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL2FyY2gvYXJtL2NvbmZpZ3MvZGF2aW5jaV9hbGxfZGVmY29uZmlnIGIvYXJjaC9hcm0v
Y29uZmlncy9kYXZpbmNpX2FsbF9kZWZjb25maWcKaW5kZXggYjVlOTc4Zi4uYWIxYmYxOCAxMDA2
NDQKLS0tIGEvYXJjaC9hcm0vY29uZmlncy9kYXZpbmNpX2FsbF9kZWZjb25maWcKKysrIGIvYXJj
aC9hcm0vY29uZmlncy9kYXZpbmNpX2FsbF9kZWZjb25maWcKQEAgLTEyNyw2ICsxMjcsOCBAQCBD
T05GSUdfUkVHVUxBVE9SX0ZJWEVEX1ZPTFRBR0U9eQogQ09ORklHX1JFR1VMQVRPUl9UUFM2NTA3
WD15CiBDT05GSUdfRFJNPW0KIENPTkZJR19EUk1fVElMQ0RDPW0KK0NPTkZJR19EUk1fQlJJREdF
PXkKK0NPTkZJR19EUk1fRFVNQl9WR0FfREFDPW0KIENPTkZJR19GQj15CiBDT05GSUdfRklSTVdB
UkVfRURJRD15CiBDT05GSUdfRkJfREE4WFg9eQotLSAKMi45LjMKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
