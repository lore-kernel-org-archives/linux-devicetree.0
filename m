From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v4 0/2] da8xx: fix section mismatch in new drivers
Date: Wed, 23 Nov 2016 14:39:58 +0100
Message-ID: <1479908400-10136-1-git-send-email-bgolaszewski@baylibre.com>
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
Cc: linux-devicetree <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, linux-drm <dri-devel@lists.freedesktop.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>, Sudeep Holla <sudeep.holla@arm.com>, Robin Murphy <robin.murphy@arm.com>, arm-soc <linux-arm-kernel@lists.infradead.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

U2VraGFyIG5vdGljZWQgdGhlcmUncyBhIHNlY3Rpb24gbWlzbWF0Y2ggaW4gdGhlIGRhOHh4LW1z
dHByaSBhbmQKZGE4eHgtZGRyY3RsIGRyaXZlcnMuIFRoaXMgaXMgY2F1c2VkIGJ5IGNhbGxpbmcK
b2ZfZmxhdF9kdF9nZXRfbWFjaGluZV9uYW1lKCkgd2hpY2ggaGFzIGFuIF9faW5pdCBhbm5vdGF0
aW9uLgoKVGhpcyBzZXJpZXMgbWFrZXMgdGhlIGRyaXZlcnMgZHJvcCB0aGUgY2FsbCBhbmQgbm90
IHByaW50IHRoZQptYWNoaW5lIG5hbWUgaW4gdGhlIGVycm9yIG1lc3NhZ2UuCgp2MSAtPiB2MjoK
LSBkcm9wIHBhdGNoIFsxLzNdIGZyb20gdjEKLSBpbnRyb2R1Y2UgaW50ZXJuYWwgcm91dGluZXMg
aW4gdGhlIGRyaXZlcnMgaW5zdGVhZCBvZiBhIGdlbmVyYWwKICBmdW5jdGlvbiBpbiBvZi9iYXNl
LmMKCnYyIC0+IHYzOgotIHVzZSBvZl9wcm9wZXJ0eV9yZWFkX3N0cmluZ19pbmRleCgpIGluc3Rl
YWQgb2YKICBvZl9wcm9wZXJ0eV9yZWFkX3N0cmluZygpIHRvIGdldCB0aGUgZmlyc3QgY29tcGF0
aWJsZSBlbnRyeQotIHMvcHJpb3RpdGllcy9wcmlvcml0aWVzCgp2MyAtPiB2NDoKLSBkcm9wIHRo
ZSBjb21wYXRpYmxlIHN0cmluZyBwcmludGluZyBhbHRvZ2V0aGVyIGFzIHRoZSBuZXcgZnVuY3Rp
b24KICBpcyBub3Qgc2FmZQotIG1lcmdlIHRoZSB0eXBvIGZpeCBpbnRvIHBhdGNoIFsxLzJdCgpC
YXJ0b3N6IEdvbGFzemV3c2tpICgyKToKICBidXM6IGRhOHh4LW1zdHByaTogZHJvcCB0aGUgY2Fs
bCB0byBvZl9mbGF0X2R0X2dldF9tYWNoaW5lX25hbWUoKQogIG1lbW9yeTogZGE4eHgtZGRyY3Rs
OiBkcm9wIHRoZSBjYWxsIHRvIG9mX2ZsYXRfZHRfZ2V0X21hY2hpbmVfbmFtZSgpCgogZHJpdmVy
cy9idXMvZGE4eHgtbXN0cHJpLmMgICAgfCA0ICstLS0KIGRyaXZlcnMvbWVtb3J5L2RhOHh4LWRk
cmN0bC5jIHwgNCArLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNiBkZWxl
dGlvbnMoLSkKCi0tIAoyLjkuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
