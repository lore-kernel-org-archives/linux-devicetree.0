From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH v4 6/7] clk: sunxi-ng: sun5i: Export the MBUS clock
Date: Thu, 14 Mar 2019 21:26:05 +0100
Message-ID: <c89226fd5d6af6efb25385fc4c930e55628b83d8.1552595146.git-series.maxime.ripard@bootlin.com>
References: <cover.221220f2f28e14ef07cce84e753ac662085d84ff.1552595146.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <cover.221220f2f28e14ef07cce84e753ac662085d84ff.1552595146.git-series.maxime.ripard@bootlin.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@bootlin.com>
Cc: devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org, Georgi Djakov <georgi.djakov@linaro.org>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Yong Deng <yong.deng@magewell.com>, Robin Murphy <robin.murphy@arm.com>, Dave Martin <dave.martin@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

VGhlIE1CVVMgY2xvY2sgaXMgdXNlZCBieSB0aGUgTUJVUyBjb250cm9sbGVyLCBzbyBsZXQncyBl
eHBvcnQgaXQgc28gdGhhdAp3ZSBjYW4gdXNlIGl0IGluIG91ciBEVCBub2RlLgoKUmV2aWV3ZWQt
Ynk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+ClNpZ25lZC1vZmYtYnk6IE1heGltZSBS
aXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+Ci0tLQogZHJpdmVycy9jbGsvc3VueGkt
bmcvY2N1LXN1bjVpLmggICAgICB8IDQgLS0tLQogaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9z
dW41aS1jY3UuaCB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDUgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvc3VueGktbmcvY2N1LXN1bjVpLmgg
Yi9kcml2ZXJzL2Nsay9zdW54aS1uZy9jY3Utc3VuNWkuaAppbmRleCA5M2EyNzVmYmQ5YTkuLmI2
NmFiZDRmZDBiZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9jbGsvc3VueGktbmcvY2N1LXN1bjVpLmgK
KysrIGIvZHJpdmVycy9jbGsvc3VueGktbmcvY2N1LXN1bjVpLmgKQEAgLTYwLDEwICs2MCw2IEBA
CiAKIC8qIFRoZSByZXN0IG9mIHRoZSBtb2R1bGUgY2xvY2tzIGFyZSBleHBvcnRlZCAqLwogCi0j
ZGVmaW5lIENMS19NQlVTCQk5OQotCi0vKiBBbmQgZmluYWxseSB0aGUgSUVQIGNsb2NrICovCi0K
ICNkZWZpbmUgQ0xLX05VTUJFUgkJKENMS19JRVAgKyAxKQogCiAjZW5kaWYgLyogX0NDVV9TVU41
SV9IXyAqLwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9zdW41aS1jY3Uu
aCBiL2luY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svc3VuNWktY2N1LmgKaW5kZXggODFmMzRkNDc3
YWViLi4yZTZiOWRkY2MyNGUgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2sv
c3VuNWktY2N1LmgKKysrIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9zdW41aS1jY3UuaApA
QCAtMTAwLDcgKzEwMCw3IEBACiAjZGVmaW5lIENMS19BVlMJCQk5NgogI2RlZmluZSBDTEtfSERN
SQkJOTcKICNkZWZpbmUgQ0xLX0dQVQkJCTk4Ci0KKyNkZWZpbmUgQ0xLX01CVVMJCTk5CiAjZGVm
aW5lIENMS19JRVAJCQkxMDAKIAogI2VuZGlmIC8qIF9EVF9CSU5ESU5HU19DTEtfU1VONUlfSF8g
Ki8KLS0gCmdpdC1zZXJpZXMgMC45LjEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
