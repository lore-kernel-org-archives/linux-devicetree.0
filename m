From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [RFC] da850: DDR2/mDDR memory controller driver
Date: Mon, 24 Oct 2016 18:46:35 +0200
Message-ID: <1477327596-16060-1-git-send-email-bgolaszewski@baylibre.com>
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

VGhpcyBpcyBhIGZvbGxvdy11cCBmb3IgdGhlIHNlcmllc1sxXSBhZGRpbmcgbmV3IGJ1cyBhbmQg
bWVtb3J5IGRyaXZlcnMKdG8gYmV0dGVyIHN1cHBvcnQgdGhlIFRJIExDRCBjb250cm9sbGVyIG9u
IHRoZSBkYTg1MC1sY2RrIGJvYXJkLgoKVGhlIGdlbmVyYWwgY29uc2Vuc3VzIG9mIHRoZSBkaXNj
dXNzaW9uIHRoYXQgZm9sbG93ZWQgd2FzIHRoYXQgRFQgaXMKbm90IHRoZSByaWdodCB0b29sIGZv
ciB0aGlzIGtpbmQgb2YgU29DIHBlcmZvcm1hbmNlIHR3ZWFrcy4KCkluIG9yZGVyIHRvIGF2b2lk
IGNvbW1pdHRpbmcgdG8gc3RhYmxlIERUIGJpbmRpbmdzLCB3ZSBvbmx5IGludHJvZHVjZQp0d28g
Y29tbW9uIHByb3BlcnRpZXMgKGNvbXBhdGlibGUgYW5kIHJlZykgd2hpbGUgdGhlIGNvbmZpZ3Vy
YXRpb24KcmVnaXN0ZXIgdmFsdWVzIGFyZSBoYXJkLWNvZGVkIGZvciBlYWNoIGJvYXJkIChjdXJy
ZW50bHkgb25seSBsY2RrKS4KCkknbSBzZW5kaW5nIGEgc2luZ2xlIHBhdGNoIHRoaXMgdGltZSBh
cyBSRkMgdG8gZ2V0IHNvbWUgcmV2aWV3cyBhbmQKc2VlIGl0IHRoZSBhcHByb2FjaCBpcyB2aWV3
ZWQgYXMgY29ycmVjdC4KClsxXSBodHRwczovL2xrbWwub3JnL2xrbWwvMjAxNi8xMC8xNy82MTMK
CkJhcnRvc3ogR29sYXN6ZXdza2kgKDEpOgogIEFSTTogbWVtb3J5OiBkYTh4eC1kZHJjdGw6IG5l
dyBkcml2ZXIKCiAuLi4vbWVtb3J5LWNvbnRyb2xsZXJzL3RpLWRhOHh4LWRkcmN0bC50eHQgICAg
ICAgICB8ICAyMCArKysKIGRyaXZlcnMvbWVtb3J5L0tjb25maWcgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgICA4ICsKIGRyaXZlcnMvbWVtb3J5L01ha2VmaWxlICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgICAxICsKIGRyaXZlcnMvbWVtb3J5L2RhOHh4LWRkcmN0bC5jICAgICAg
ICAgICAgICAgICAgICAgIHwgMTg3ICsrKysrKysrKysrKysrKysrKysrKwogNCBmaWxlcyBjaGFu
Z2VkLCAyMTYgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvdGktZGE4eHgtZGRyY3RsLnR4
dAogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWVtb3J5L2RhOHh4LWRkcmN0bC5jCgotLSAK
Mi45LjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
