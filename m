From: Liu Ying <Ying.Liu@freescale.com>
Subject: [PATCH RFC v4 10/21] drm/dsi: Add a helper to get bits per pixel of
 MIPI DSI pixel format
Date: Tue, 23 Dec 2014 18:02:08 +0800
Message-ID: <1419328939-22758-11-git-send-email-Ying.Liu@freescale.com>
References: <1419328939-22758-1-git-send-email-Ying.Liu@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1419328939-22758-1-git-send-email-Ying.Liu@freescale.com>
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
Cc: stefan.wahren@i2se.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, kernel@pengutronix.de, linux-kernel@vger.kernel.org, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, andyshrk@gmail.com
List-Id: devicetree@vger.kernel.org

U2lnbmVkLW9mZi1ieTogTGl1IFlpbmcgPFlpbmcuTGl1QGZyZWVzY2FsZS5jb20+Ci0tLQp2My0+
djQ6CiAqIE5vbmUuCgp2Mi0+djM6CiAqIE5vbmUuCgp2MS0+djI6CiAqIFRoaWVycnkgUmVkaW5n
IHN1Z2dlc3RlZCB0aGF0IHRoZSBtaXBpX2RzaV9waXhlbF9mb3JtYXRfdG9fYnBwKCkgZnVuY3Rp
b24KICAgY291bGQgYmUgcGxhY2VkIGF0IHRoZSBjb21tb24gRFJNIE1JUEkgRFNJIGRyaXZlci4K
ICAgVGhpcyBwYXRjaCBpcyBuZXdseSBhZGRlZC4KCiBpbmNsdWRlL2RybS9kcm1fbWlwaV9kc2ku
aCB8IDE0ICsrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9taXBpX2RzaS5oIGIvaW5jbHVkZS9kcm0vZHJt
X21pcGlfZHNpLmgKaW5kZXggZjFkOGQwZC4uMGY1MjEwYyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9k
cm0vZHJtX21pcGlfZHNpLmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX21pcGlfZHNpLmgKQEAgLTE2
Myw2ICsxNjMsMjAgQEAgc3RhdGljIGlubGluZSBzdHJ1Y3QgbWlwaV9kc2lfZGV2aWNlICp0b19t
aXBpX2RzaV9kZXZpY2Uoc3RydWN0IGRldmljZSAqZGV2KQogCXJldHVybiBjb250YWluZXJfb2Yo
ZGV2LCBzdHJ1Y3QgbWlwaV9kc2lfZGV2aWNlLCBkZXYpOwogfQogCitzdGF0aWMgaW5saW5lIGlu
dCBtaXBpX2RzaV9waXhlbF9mb3JtYXRfdG9fYnBwKGVudW0gbWlwaV9kc2lfcGl4ZWxfZm9ybWF0
IGZvcm1hdCkKK3sKKwlzd2l0Y2ggKGZvcm1hdCkgeworCWNhc2UgTUlQSV9EU0lfRk1UX1JHQjg4
ODoKKwljYXNlIE1JUElfRFNJX0ZNVF9SR0I2NjY6CisJCXJldHVybiAyNDsKKwljYXNlIE1JUElf
RFNJX0ZNVF9SR0I2NjZfUEFDS0VEOgorCQlyZXR1cm4gMTg7CisJY2FzZSBNSVBJX0RTSV9GTVRf
UkdCNTY1OgorCQlyZXR1cm4gMTY7CisJfQorCXJldHVybiAtRUlOVkFMOworfQorCiBzdHJ1Y3Qg
bWlwaV9kc2lfZGV2aWNlICpvZl9maW5kX21pcGlfZHNpX2RldmljZV9ieV9ub2RlKHN0cnVjdCBk
ZXZpY2Vfbm9kZSAqbnApOwogaW50IG1pcGlfZHNpX2F0dGFjaChzdHJ1Y3QgbWlwaV9kc2lfZGV2
aWNlICpkc2kpOwogaW50IG1pcGlfZHNpX2RldGFjaChzdHJ1Y3QgbWlwaV9kc2lfZGV2aWNlICpk
c2kpOwotLSAKMi4xLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
