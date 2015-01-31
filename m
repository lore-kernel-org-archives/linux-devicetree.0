From: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 08/11] drm/rockchip: enable rgb ouput of vops for vga and tv
 connectors
Date: Sat, 31 Jan 2015 17:33:01 +0100
Message-ID: <1422721984-27782-9-git-send-email-heiko@sntech.de>
References: <1422721984-27782-1-git-send-email-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1422721984-27782-1-git-send-email-heiko@sntech.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: airlied@linux.ie, mark.yao@rock-chips.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, galak@codeaurora.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

VGhlIHNvY3MgaXRzZWxmIGRvIG5vdCBjb250YWluIGVuY29kZXJzIGZvciBlaXRoZXIgdmdhIG9y
IHR2IG91dHB1dC4KVGhlcmVmb3JlIHRoZXNlIHdpbGwgYmUgcmVhbGl6ZWQgYnkgZXh0ZXJuYWwg
Y29tcG9uZW50cyBhbmQgdGh1cyB1c2UgdGhlCnJnYiBvdXRwdXQuCgpTaWduZWQtb2ZmLWJ5OiBI
ZWlrbyBTdHVlYm5lciA8aGVpa29Ac250ZWNoLmRlPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yb2Nr
Y2hpcC9yb2NrY2hpcF9kcm1fdm9wLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2Ry
bV92b3AuYyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wLmMKaW5k
ZXggYzAzODdmNy4uYjc0NDg4OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlw
L3JvY2tjaGlwX2RybV92b3AuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2No
aXBfZHJtX3ZvcC5jCkBAIC04NjMsNiArODYzLDggQEAgc3RhdGljIGludCB2b3BfY3J0Y19tb2Rl
X3NldChzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCiAKIAlzd2l0Y2ggKHZvcC0+Y29ubmVjdG9yX3R5
cGUpIHsKIAljYXNlIERSTV9NT0RFX0NPTk5FQ1RPUl9MVkRTOgorCWNhc2UgRFJNX01PREVfQ09O
TkVDVE9SX1ZHQToKKwljYXNlIERSTV9NT0RFX0NPTk5FQ1RPUl9UVjoKIAkJVk9QX0NUUkxfU0VU
KHZvcCwgcmdiX2VuLCAxKTsKIAkJYnJlYWs7CiAJY2FzZSBEUk1fTU9ERV9DT05ORUNUT1JfZURQ
OgotLSAKMi4xLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
