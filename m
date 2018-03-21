From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Subject: [PATCH 4/7] ARM: dts: sun7i: Add pinmux settings for LCD0 RGB888
 output.
Date: Wed, 21 Mar 2018 21:03:10 +0100
Message-ID: <1521662593-25468-4-git-send-email-giulio.benetti@micronovasrl.com>
References: <1521662593-25468-1-git-send-email-giulio.benetti@micronovasrl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1521662593-25468-1-git-send-email-giulio.benetti@micronovasrl.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Giulio Benetti <giulio.benetti@micronovasrl.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

VGhlIEEyMCBzdXBwb3J0cyBSR0I4ODggd2l0aCBIL1Ygc3luYyBmcm9tIExDRDAuIEFkZCBhIHBp
bm11eCBzZXR0aW5nCmZvciB0aGUgbmVlZGVkIHBpbnMuCgpTaWduZWQtb2ZmLWJ5OiBHaXVsaW8g
QmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAbWljcm9ub3Zhc3JsLmNvbT4KLS0tCiBhcmNoL2FybS9i
b290L2R0cy9zdW43aS1hMjAuZHRzaSB8IDggKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA4IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdW43aS1hMjAuZHRz
aSBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N1bjdpLWEyMC5kdHNpCmluZGV4IGVmYjU2MDcuLmJmZTY3
MjggMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N1bjdpLWEyMC5kdHNpCisrKyBiL2Fy
Y2gvYXJtL2Jvb3QvZHRzL3N1bjdpLWEyMC5kdHNpCkBAIC05MjIsNiArOTIyLDE0IEBACiAJCQkJ
cGlucyA9ICJQSTIwIiwgIlBJMjEiOwogCQkJCWZ1bmN0aW9uID0gInVhcnQ3IjsKIAkJCX07CisK
KwkJCWxjZDBfcmdiODg4X3BpbnM6IGxjZDAtcmdiODg4LXBpbnMgeworCQkJCXBpbnMgPSAiUEQw
IiwgIlBEMSIsICJQRDIiLCAiUEQzIiwgIlBENCIsICJQRDUiLCAiUEQ2IiwgIlBENyIsCisJCQkJ
ICAgICAgICJQRDgiLCAiUEQ5IiwgIlBEMTAiLCAiUEQxMSIsICJQRDEyIiwgIlBEMTMiLCAiUEQx
NCIsICJQRDE1IiwKKwkJCQkgICAgICAgIlBEMTYiLCAiUEQxNyIsICJQRDE4IiwgIlBEMTkiLCAi
UEQyMCIsICJQRDIxIiwgIlBEMjIiLCAiUEQyMyIsCisJCQkJICAgICAgICJQRDI0IiwgIlBEMjUi
LCAiUEQyNiIsICJQRDI3IjsKKwkJCQlmdW5jdGlvbiA9ICJsY2QwIjsKKwkJCX07CiAJCX07CiAK
IAkJdGltZXJAMWMyMGMwMCB7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
