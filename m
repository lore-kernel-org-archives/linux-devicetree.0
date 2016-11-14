From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 0/2] ARM: da850: enable the MSTPRI and DDR2/mDDR drivers
Date: Mon, 14 Nov 2016 18:32:02 +0100
Message-ID: <1479144724-14231-1-git-send-email-bgolaszewski@baylibre.com>
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

VGhpcyBpcyBhIGZvbGxvdy11cCBmb3IgbXkgcHJldmlvdXMgc2VyaWVzOgoKICBBUk06IGRhODUw
OiBuZXcgZHJpdmVycyBmb3IgYmV0dGVyIExDREMgc3VwcG9ydAoKZnJvbSB3aGljaCB0aGUgbmV3
IGRyaXZlcnMgd2VyZSBtZXJnZWQsIHdoaWxlIHRoZSBwYXRjaCBhZGRpbmcgdGhlCnBhbmVsIG5v
ZGUgd2FzIG5hY2tlZCBhbmQgaGFzIGJlZW4gZHJvcHBlZC4KClRoZSBmaXJzdCBwYXRjaCBpbiB0
aGlzIHNlcmllcyBlbmFibGVzIHRoZSBuZXcgZHJpdmVycyBpbiBkYTg1MC5kdHNpLgpJdCBoYXMg
YmVlbiBjaGFuZ2VkIHNpbmNlIHRoZSBsYXN0IGl0ZXJhdGlvbiB0byBub3QgZGlzYWJsZSB0aGUg
YWRkZWQKbm9kZXMuIEFsc286IHRoZSBwYXRjaCBlbmFibGluZyB0aGUgbm9kZXMgaW4gZGE4NTAt
bGNkay5kdHMgaGFzIGJlZW4KZHJvcHBlZCB0b28uCgpUaGUgc2Vjb25kIHBhdGNoIHVwZGF0ZXMg
dGhlIGRhdmluY2kgZGVmY29uZmlnLgoKQmFydG9zeiBHb2xhc3pld3NraSAoMik6CiAgQVJNOiBk
dHM6IGRhODUwOiBhZGQgdGhlIG1zdHByaSBhbmQgZGRyY3RsIG5vZGVzCiAgQVJNOiBkYXZpbmNp
X2FsbF9kZWZjb25maWc6IGVuYWJsZSB0aGUgbXN0cHJpIGFuZCBkZHJjdGwgZHJpdmVycwoKIGFy
Y2gvYXJtL2Jvb3QvZHRzL2RhODUwLmR0c2kgICAgICAgICAgIHwgOSArKysrKysrKysKIGFyY2gv
YXJtL2NvbmZpZ3MvZGF2aW5jaV9hbGxfZGVmY29uZmlnIHwgMiArKwogMiBmaWxlcyBjaGFuZ2Vk
LCAxMSBpbnNlcnRpb25zKCspCgotLSAKMi45LjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
