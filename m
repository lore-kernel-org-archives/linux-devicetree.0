From: Robert Chiras <robert.chiras@nxp.com>
Subject: [PATCH v2 02/15] drm/mxsfb: Read bus flags from bridge if present
Date: Wed, 14 Aug 2019 13:48:38 +0300
Message-ID: <1565779731-1300-3-git-send-email-robert.chiras@nxp.com>
References: <1565779731-1300-1-git-send-email-robert.chiras@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1565779731-1300-1-git-send-email-robert.chiras@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>, Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

RnJvbTogR3VpZG8gR8O8bnRoZXIgPGFneEBzaWd4Y3B1Lm9yZz4KClRoZSBicmlkZ2UgbWlnaHQg
aGF2ZSBzcGVjaWFsIHJlcXVpcm1lbnRlcyBvbiB0aGUgaW5wdXQgYnVzLiBUaGlzCmlzIGUuZy4g
dXNlZCBieSB0aGUgaW14LW53bCBicmlkZ2UuCgpTaWduZWQtb2ZmLWJ5OiBHdWlkbyBHw7xudGhl
ciA8YWd4QHNpZ3hjcHUub3JnPgpSZXZpZXdlZC1ieTogU3RlZmFuIEFnbmVyIDxzdGVmYW5AYWdu
ZXIuY2g+Ci0tLQogZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2ZiX2NydGMuYyB8IDUgKysrKy0K
IDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfY3J0Yy5jIGIvZHJpdmVycy9ncHUvZHJt
L214c2ZiL214c2ZiX2NydGMuYwppbmRleCBkZTA5YjkzLi5iNjlhY2U4IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfY3J0Yy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9t
eHNmYi9teHNmYl9jcnRjLmMKQEAgLTIwOSw3ICsyMDksNyBAQCBzdGF0aWMgdm9pZCBteHNmYl9j
cnRjX21vZGVfc2V0X25vZmIoc3RydWN0IG14c2ZiX2RybV9wcml2YXRlICpteHNmYikKIHsKIAlz
dHJ1Y3QgZHJtX2RldmljZSAqZHJtID0gbXhzZmItPnBpcGUuY3J0Yy5kZXY7CiAJc3RydWN0IGRy
bV9kaXNwbGF5X21vZGUgKm0gPSAmbXhzZmItPnBpcGUuY3J0Yy5zdGF0ZS0+YWRqdXN0ZWRfbW9k
ZTsKLQljb25zdCB1MzIgYnVzX2ZsYWdzID0gbXhzZmItPmNvbm5lY3Rvci0+ZGlzcGxheV9pbmZv
LmJ1c19mbGFnczsKKwl1MzIgYnVzX2ZsYWdzID0gbXhzZmItPmNvbm5lY3Rvci0+ZGlzcGxheV9p
bmZvLmJ1c19mbGFnczsKIAl1MzIgdmRjdHJsMCwgdnN5bmNfcHVsc2VfbGVuLCBoc3luY19wdWxz
ZV9sZW47CiAJaW50IGVycjsKIApAQCAtMjMzLDYgKzIzMyw5IEBAIHN0YXRpYyB2b2lkIG14c2Zi
X2NydGNfbW9kZV9zZXRfbm9mYihzdHJ1Y3QgbXhzZmJfZHJtX3ByaXZhdGUgKm14c2ZiKQogCiAJ
Y2xrX3NldF9yYXRlKG14c2ZiLT5jbGssIG0tPmNydGNfY2xvY2sgKiAxMDAwKTsKIAorCWlmICht
eHNmYi0+YnJpZGdlICYmIG14c2ZiLT5icmlkZ2UtPnRpbWluZ3MpCisJCWJ1c19mbGFncyA9IG14
c2ZiLT5icmlkZ2UtPnRpbWluZ3MtPmlucHV0X2J1c19mbGFnczsKKwogCURSTV9ERVZfREVCVUdf
RFJJVkVSKGRybS0+ZGV2LCAiUGl4ZWwgY2xvY2s6ICVka0h6IChhY3R1YWw6ICVka0h6KVxuIiwK
IAkJCSAgICAgbS0+Y3J0Y19jbG9jaywKIAkJCSAgICAgKGludCkoY2xrX2dldF9yYXRlKG14c2Zi
LT5jbGspIC8gMTAwMCkpOwotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1h
cm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
