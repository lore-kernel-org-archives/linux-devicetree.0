From: Liu Ying <Ying.Liu@freescale.com>
Subject: [PATCH RFC v5 10/21] drm/dsi: Add a helper to get bits per pixel of
 MIPI DSI pixel format
Date: Wed, 24 Dec 2014 16:39:32 +0800
Message-ID: <1419410383-6359-11-git-send-email-Ying.Liu@freescale.com>
References: <1419410383-6359-1-git-send-email-Ying.Liu@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1419410383-6359-1-git-send-email-Ying.Liu@freescale.com>
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
Cc: stefan.wahren@i2se.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, kernel@pengutronix.de, linux-kernel@vger.kernel.org, a.hajda@samsung.com, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, andyshrk@gmail.com
List-Id: devicetree@vger.kernel.org

U2lnbmVkLW9mZi1ieTogTGl1IFlpbmcgPFlpbmcuTGl1QGZyZWVzY2FsZS5jb20+Ci0tLQp2NC0+
djU6CiAqIE5vbmUuCgp2My0+djQ6CiAqIE5vbmUuCgp2Mi0+djM6CiAqIE5vbmUuCgp2MS0+djI6
CiAqIFRoaWVycnkgUmVkaW5nIHN1Z2dlc3RlZCB0aGF0IHRoZSBtaXBpX2RzaV9waXhlbF9mb3Jt
YXRfdG9fYnBwKCkgZnVuY3Rpb24KICAgY291bGQgYmUgcGxhY2VkIGF0IHRoZSBjb21tb24gRFJN
IE1JUEkgRFNJIGRyaXZlci4KICAgVGhpcyBwYXRjaCBpcyBuZXdseSBhZGRlZC4KCiBpbmNsdWRl
L2RybS9kcm1fbWlwaV9kc2kuaCB8IDE0ICsrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwg
MTQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9taXBpX2RzaS5o
IGIvaW5jbHVkZS9kcm0vZHJtX21pcGlfZHNpLmgKaW5kZXggZjFkOGQwZC4uMGY1MjEwYyAxMDA2
NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX21pcGlfZHNpLmgKKysrIGIvaW5jbHVkZS9kcm0vZHJt
X21pcGlfZHNpLmgKQEAgLTE2Myw2ICsxNjMsMjAgQEAgc3RhdGljIGlubGluZSBzdHJ1Y3QgbWlw
aV9kc2lfZGV2aWNlICp0b19taXBpX2RzaV9kZXZpY2Uoc3RydWN0IGRldmljZSAqZGV2KQogCXJl
dHVybiBjb250YWluZXJfb2YoZGV2LCBzdHJ1Y3QgbWlwaV9kc2lfZGV2aWNlLCBkZXYpOwogfQog
CitzdGF0aWMgaW5saW5lIGludCBtaXBpX2RzaV9waXhlbF9mb3JtYXRfdG9fYnBwKGVudW0gbWlw
aV9kc2lfcGl4ZWxfZm9ybWF0IGZvcm1hdCkKK3sKKwlzd2l0Y2ggKGZvcm1hdCkgeworCWNhc2Ug
TUlQSV9EU0lfRk1UX1JHQjg4ODoKKwljYXNlIE1JUElfRFNJX0ZNVF9SR0I2NjY6CisJCXJldHVy
biAyNDsKKwljYXNlIE1JUElfRFNJX0ZNVF9SR0I2NjZfUEFDS0VEOgorCQlyZXR1cm4gMTg7CisJ
Y2FzZSBNSVBJX0RTSV9GTVRfUkdCNTY1OgorCQlyZXR1cm4gMTY7CisJfQorCXJldHVybiAtRUlO
VkFMOworfQorCiBzdHJ1Y3QgbWlwaV9kc2lfZGV2aWNlICpvZl9maW5kX21pcGlfZHNpX2Rldmlj
ZV9ieV9ub2RlKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnApOwogaW50IG1pcGlfZHNpX2F0dGFjaChz
dHJ1Y3QgbWlwaV9kc2lfZGV2aWNlICpkc2kpOwogaW50IG1pcGlfZHNpX2RldGFjaChzdHJ1Y3Qg
bWlwaV9kc2lfZGV2aWNlICpkc2kpOwotLSAKMi4xLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
