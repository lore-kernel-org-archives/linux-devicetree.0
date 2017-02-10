From: Yannick Fertre <yannick.fertre@st.com>
Subject: [PATCH v2 3/9] drm/st: Add STM32 LTDC driver
Date: Fri, 10 Feb 2017 15:54:43 +0100
Message-ID: <1486738489-22154-4-git-send-email-yannick.fertre@st.com>
References: <1486738489-22154-1-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1486738489-22154-1-git-send-email-yannick.fertre@st.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Alexandre TORGUE <alexandre.torgue@st.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Russell King <linux@armlinux.org.uk>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Benjamin Gaignard <benjamin.gaignard@st.com>
Cc: devicetree@vger.kernel.org, kernel@stlinux.com, Philippe Cornu <philippe.cornu@st.com>, Fabien Dessenne <fabien.dessenne@st.com>, dri-devel@lists.freedesktop.org, Mickael Reulier <mickael.reulier@st.com>, Vincent Abriou <vincent.abriou@st.com>, Gabriel FERNANDEZ <gabriel.fernandez@st.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

VGhpcyBwYXRjaCBhZGRzIHN1cHBvcnQgZm9yIHRoZSBTVE0zMiBMQ0QtVEZUIGRpc3BsYXkgY29u
dHJvbGxlci4KClNpZ25lZC1vZmYtYnk6IFlhbm5pY2sgRmVydHJlIDx5YW5uaWNrLmZlcnRyZUBz
dC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMgfCA0ICsrLS0KIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3N0bS9sdGRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYwppbmRl
eCAwYTM5M2UyLi4xNDg2MDdkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYwpAQCAtMTI0Niw3ICsxMjQ2LDcgQEAg
aW50IGx0ZGNfbG9hZChzdHJ1Y3QgZHJtX2RldmljZSAqZGRldikKIAogCW11dGV4X2luaXQoJmx0
ZGMtPmVycl9sb2NrKTsKIAotCWx0ZGMtPnBpeGVsX2NsayA9IGRldm1fY2xrX2dldChkZXYsICJj
bGstbGNkIik7CisJbHRkYy0+cGl4ZWxfY2xrID0gZGV2bV9jbGtfZ2V0KGRldiwgImxjZCIpOwog
CWlmIChJU19FUlIobHRkYy0+cGl4ZWxfY2xrKSkgewogCQlEUk1fRVJST1IoIlVuYWJsZSB0byBn
ZXQgbGNkIGNsb2NrXG4iKTsKIAkJcmV0dXJuIC1FTk9ERVY7CkBAIC0xMjYzLDcgKzEyNjMsNyBA
QCBpbnQgbHRkY19sb2FkKHN0cnVjdCBkcm1fZGV2aWNlICpkZGV2KQogCQlyZXR1cm4gUFRSX0VS
UihyZWdzKTsKIAl9CiAKLQlsdGRjLT5tYXAgPSBkZXZtX3JlZ21hcF9pbml0X21taW9fY2xrKGRl
diwgImNsay1sY2QiLCByZWdzLAorCWx0ZGMtPm1hcCA9IGRldm1fcmVnbWFwX2luaXRfbW1pb19j
bGsoZGV2LCAibGNkIiwgcmVncywKIAkJCQkJICAgICAgJmx0ZGNfcmVnbWFwX2NvbmZpZyk7CiAJ
aWYgKElTX0VSUihsdGRjLT5tYXApKSB7CiAJCWRldl9lcnIoZGV2LCAiQ291bGRuJ3QgY3JlYXRl
IGx0ZGMgcmVnaXN0ZXIgbWFwcGluZ1xuIik7Ci0tIAoxLjkuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
