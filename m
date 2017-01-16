From: Chris Zhong <zyw@rock-chips.com>
Subject: [PATCH v2 06/11] drm/rockchip/dsi: return probe defer if attach panel
 failed
Date: Mon, 16 Jan 2017 18:08:26 +0800
Message-ID: <1484561311-494-7-git-send-email-zyw@rock-chips.com>
References: <1484561311-494-1-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1484561311-494-1-git-send-email-zyw@rock-chips.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dianders@chromium.org, tfiga@chromium.org, heiko@sntech.de, yzq@rock-chips.com, mark.rutland@arm.com, devicetree@vger.kernel.org, robh+dt@kernel.org, galak@codeaurora.org, pawel.moll@arm.com, seanpaul@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, Chris Zhong <zyw@rock-chips.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

RnJvbTogTWFyayBZYW8gPG1hcmsueWFvQHJvY2stY2hpcHMuY29tPgoKUmV0dXJuIC1FSU5WQUwg
d291bGQgY2F1c2UgbWlwaSBkc2kgYmFkIGJlaGF2aW9yLCBwcm9iZSBkZWZlcgp0byBlbnN1cmUg
bWlwaSBmaW5kIHRoZSBjb3JyZWN0IG1vZGUsCgpTaWduZWQtb2ZmLWJ5OiBNYXJrIFlhbyA8bWFy
ay55YW9Acm9jay1jaGlwcy5jb20+ClNpZ25lZC1vZmYtYnk6IENocmlzIFpob25nIDx6eXdAcm9j
ay1jaGlwcy5jb20+Ci0tLQoKIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9kdy1taXBpLWRzaS5j
IHwgMTMgKysrKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvZHctbWlw
aS1kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9kdy1taXBpLWRzaS5jCmluZGV4IGQy
YTNlZmIuLjVlM2YwMzEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9kdy1t
aXBpLWRzaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9kdy1taXBpLWRzaS5jCkBA
IC01NDksMTAgKzU0OSwxNCBAQCBzdGF0aWMgaW50IGR3X21pcGlfZHNpX2hvc3RfYXR0YWNoKHN0
cnVjdCBtaXBpX2RzaV9ob3N0ICpob3N0LAogCWRzaS0+Y2hhbm5lbCA9IGRldmljZS0+Y2hhbm5l
bDsKIAlkc2ktPmZvcm1hdCA9IGRldmljZS0+Zm9ybWF0OwogCWRzaS0+cGFuZWwgPSBvZl9kcm1f
ZmluZF9wYW5lbChkZXZpY2UtPmRldi5vZl9ub2RlKTsKLQlpZiAoZHNpLT5wYW5lbCkKLQkJcmV0
dXJuIGRybV9wYW5lbF9hdHRhY2goZHNpLT5wYW5lbCwgJmRzaS0+Y29ubmVjdG9yKTsKKwlpZiAo
IWRzaS0+cGFuZWwpIHsKKwkJRFJNX0VSUk9SKCJmYWlsZWQgdG8gZmluZCBwYW5lbFxuIik7CisJ
CXJldHVybiAtRVBST0JFX0RFRkVSOworCX0KIAotCXJldHVybiAtRUlOVkFMOworCWRybV9wYW5l
bF9hdHRhY2goZHNpLT5wYW5lbCwgJmRzaS0+Y29ubmVjdG9yKTsKKworCXJldHVybiAwOwogfQog
CiBzdGF0aWMgaW50IGR3X21pcGlfZHNpX2hvc3RfZGV0YWNoKHN0cnVjdCBtaXBpX2RzaV9ob3N0
ICpob3N0LApAQCAtNTYwLDcgKzU2NCw4IEBAIHN0YXRpYyBpbnQgZHdfbWlwaV9kc2lfaG9zdF9k
ZXRhY2goc3RydWN0IG1pcGlfZHNpX2hvc3QgKmhvc3QsCiB7CiAJc3RydWN0IGR3X21pcGlfZHNp
ICpkc2kgPSBob3N0X3RvX2RzaShob3N0KTsKIAotCWRybV9wYW5lbF9kZXRhY2goZHNpLT5wYW5l
bCk7CisJaWYgKGRzaS0+cGFuZWwpCisJCWRybV9wYW5lbF9kZXRhY2goZHNpLT5wYW5lbCk7CiAK
IAlyZXR1cm4gMDsKIH0KLS0gCjIuNi4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
