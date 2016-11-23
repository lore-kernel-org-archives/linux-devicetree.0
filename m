From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 3/3] bus: da8xx-mstpri: fix a typo
Date: Wed, 23 Nov 2016 12:06:27 +0100
Message-ID: <1479899187-10199-4-git-send-email-bgolaszewski@baylibre.com>
References: <1479899187-10199-1-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1479899187-10199-1-git-send-email-bgolaszewski@baylibre.com>
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
Cc: linux-devicetree <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, linux-drm <dri-devel@lists.freedesktop.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>, Sudeep Holla <sudeep.holla@arm.com>, Robin Murphy <robin.murphy@arm.com>, arm-soc <linux-arm-kernel@lists.infradead.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

U2hvdWxkIGhhdmUgYmVlbiBwcmlvcml0aWVzLgoKU2lnbmVkLW9mZi1ieTogQmFydG9zeiBHb2xh
c3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KLS0tCiBkcml2ZXJzL2J1cy9kYTh4
eC1tc3RwcmkuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvYnVzL2RhOHh4LW1zdHByaS5jIGIvZHJpdmVy
cy9idXMvZGE4eHgtbXN0cHJpLmMKaW5kZXggMDY0ZWViOS4uYjE3YmE5NyAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9idXMvZGE4eHgtbXN0cHJpLmMKKysrIGIvZHJpdmVycy9idXMvZGE4eHgtbXN0cHJp
LmMKQEAgLTI0NSw3ICsyNDUsNyBAQCBzdGF0aWMgaW50IGRhOHh4X21zdHByaV9wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCiAJcHJpb19saXN0ID0gZGE4eHhfbXN0cHJpX2dl
dF9ib2FyZF9wcmlvKCk7CiAJaWYgKCFwcmlvX2xpc3QpIHsKLQkJZGV2X2VycihkZXYsICJubyBt
YXN0ZXIgcHJpb3RpdGllcyBkZWZpbmVkIGZvciBib2FyZCAnJXMnXG4iLAorCQlkZXZfZXJyKGRl
diwgIm5vIG1hc3RlciBwcmlvcml0aWVzIGRlZmluZWQgZm9yIGJvYXJkICclcydcbiIsCiAJCQlk
YTh4eF9tc3RwcmlfbWFjaGluZV9nZXRfY29tcGF0aWJsZSgpKTsKIAkJcmV0dXJuIC1FSU5WQUw7
CiAJfQotLSAKMi45LjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
