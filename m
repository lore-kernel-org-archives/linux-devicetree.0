From: Liu Ying <Ying.Liu@freescale.com>
Subject: [PATCH RFC v3 10/18] drm/dsi: Add a helper to get bits per pixel of
 MIPI DSI pixel format
Date: Tue, 23 Dec 2014 11:46:31 +0800
Message-ID: <1419306399-9387-11-git-send-email-Ying.Liu@freescale.com>
References: <1419306399-9387-1-git-send-email-Ying.Liu@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1419306399-9387-1-git-send-email-Ying.Liu@freescale.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, linux@arm.linux.org.uk, kernel@pengutronix.de, linux-kernel@vger.kernel.org, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, andyshrk@gmail.com
List-Id: devicetree@vger.kernel.org

U2lnbmVkLW9mZi1ieTogTGl1IFlpbmcgPFlpbmcuTGl1QGZyZWVzY2FsZS5jb20+Ci0tLQp2Mi0+
djM6CiAqIE5vbmUuCgp2MS0+djI6CiAqIFRoaWVycnkgUmVkaW5nIHN1Z2dlc3RlZCB0aGF0IHRo
ZSBtaXBpX2RzaV9waXhlbF9mb3JtYXRfdG9fYnBwKCkgZnVuY3Rpb24KICAgY291bGQgYmUgcGxh
Y2VkIGF0IHRoZSBjb21tb24gRFJNIE1JUEkgRFNJIGRyaXZlci4KICAgVGhpcyBwYXRjaCBpcyBu
ZXdseSBhZGRlZC4KCiBpbmNsdWRlL2RybS9kcm1fbWlwaV9kc2kuaCB8IDE0ICsrKysrKysrKysr
KysrCiAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2luY2x1
ZGUvZHJtL2RybV9taXBpX2RzaS5oIGIvaW5jbHVkZS9kcm0vZHJtX21pcGlfZHNpLmgKaW5kZXgg
ZjFkOGQwZC4uMGY1MjEwYyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX21pcGlfZHNpLmgK
KysrIGIvaW5jbHVkZS9kcm0vZHJtX21pcGlfZHNpLmgKQEAgLTE2Myw2ICsxNjMsMjAgQEAgc3Rh
dGljIGlubGluZSBzdHJ1Y3QgbWlwaV9kc2lfZGV2aWNlICp0b19taXBpX2RzaV9kZXZpY2Uoc3Ry
dWN0IGRldmljZSAqZGV2KQogCXJldHVybiBjb250YWluZXJfb2YoZGV2LCBzdHJ1Y3QgbWlwaV9k
c2lfZGV2aWNlLCBkZXYpOwogfQogCitzdGF0aWMgaW5saW5lIGludCBtaXBpX2RzaV9waXhlbF9m
b3JtYXRfdG9fYnBwKGVudW0gbWlwaV9kc2lfcGl4ZWxfZm9ybWF0IGZvcm1hdCkKK3sKKwlzd2l0
Y2ggKGZvcm1hdCkgeworCWNhc2UgTUlQSV9EU0lfRk1UX1JHQjg4ODoKKwljYXNlIE1JUElfRFNJ
X0ZNVF9SR0I2NjY6CisJCXJldHVybiAyNDsKKwljYXNlIE1JUElfRFNJX0ZNVF9SR0I2NjZfUEFD
S0VEOgorCQlyZXR1cm4gMTg7CisJY2FzZSBNSVBJX0RTSV9GTVRfUkdCNTY1OgorCQlyZXR1cm4g
MTY7CisJfQorCXJldHVybiAtRUlOVkFMOworfQorCiBzdHJ1Y3QgbWlwaV9kc2lfZGV2aWNlICpv
Zl9maW5kX21pcGlfZHNpX2RldmljZV9ieV9ub2RlKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnApOwog
aW50IG1pcGlfZHNpX2F0dGFjaChzdHJ1Y3QgbWlwaV9kc2lfZGV2aWNlICpkc2kpOwogaW50IG1p
cGlfZHNpX2RldGFjaChzdHJ1Y3QgbWlwaV9kc2lfZGV2aWNlICpkc2kpOwotLSAKMi4xLjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
