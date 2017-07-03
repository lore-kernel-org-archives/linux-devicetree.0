From: Philippe CORNU <philippe.cornu@st.com>
Subject: [PATCH v5 1/7] drm/stm: ltdc: Fix leak of px clk enable in some error
 paths
Date: Mon, 3 Jul 2017 10:41:21 +0200
Message-ID: <1499071287-10414-2-git-send-email-philippe.cornu@st.com>
References: <1499071287-10414-1-git-send-email-philippe.cornu@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1499071287-10414-1-git-send-email-philippe.cornu@st.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Alexandre Torgue <alexandre.torgue@st.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Russell King <linux@armlinux.org.uk>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Yannick Fertre <yannick.fertre@st.com>, Neil Armstrong <narmstrong@baylibre.com>, Archit Taneja <architt@codeaurora.org>, Eric Anholt <eric@anholt.net>, Chris Zhong <zyw@rock-chips.com>, Andrzej Hajda <a.hajda@samsung.com>, Xinliang Liu <xinliang.liu@linaro.org>, zourongrong@gmail.com, Xinwei Kong <kong.kongxinwei@hisilicon.com>, Chen Feng <puck.chen@hisilicon.com>, Mark Yao <mark.yao@rock-chips.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Philippe Cornu <philippe.cornu@st.com>, Fabien Dessenne <fabien.dessenne@st.com>, dri-devel@lists.freedesktop.org, Mickael Reulier <mickael.reulier@st.com>, Vincent Abriou <vincent.abriou@st.com>, Gabriel Fernandez <gabriel.fernandez@st.com>, Ludovic Barre <ludovic.barre@st.com>
List-Id: devicetree@vger.kernel.org

VGhlIHBpeGVsIGNsb2NrIGdldHMgZW5hYmxlZCBlYXJseSBkdXJpbmcgaW5pdCwgc2luY2UgaXQn
cyByZXF1aXJlZAppbiBvcmRlciB0byByZWFkIHJlZ2lzdGVycy4gVGhpcyBwaXhlbCBjbG9jayBt
dXN0IGJlIGRpc2FibGVkIGlmCmVycm9ycyBkdXJpbmcgdGhpcyBpbml0IHBoYXNlLgoKU2lnbmVk
LW9mZi1ieTogRXJpYyBBbmhvbHQgPGVyaWNAYW5ob2x0Lm5ldD4KQWNrZWQtYnk6IFBoaWxpcHBl
IENvcm51IDxwaGlsaXBwZS5jb3JudUBzdC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3N0bS9s
dGRjLmMgfCAxMCArKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jIGIv
ZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMKaW5kZXggNTMzMTc2MC4uN2Y2NGQ1YSAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3N0
bS9sdGRjLmMKQEAgLTEwNDUsMTMgKzEwNDUsMTUgQEAgaW50IGx0ZGNfbG9hZChzdHJ1Y3QgZHJt
X2RldmljZSAqZGRldikKIAogCWlmIChvZl9hZGRyZXNzX3RvX3Jlc291cmNlKG5wLCAwLCAmcmVz
KSkgewogCQlEUk1fRVJST1IoIlVuYWJsZSB0byBnZXQgcmVzb3VyY2VcbiIpOwotCQlyZXR1cm4g
LUVOT0RFVjsKKwkJcmV0ID0gLUVOT0RFVjsKKwkJZ290byBlcnI7CiAJfQogCiAJbGRldi0+cmVn
cyA9IGRldm1faW9yZW1hcF9yZXNvdXJjZShkZXYsICZyZXMpOwogCWlmIChJU19FUlIobGRldi0+
cmVncykpIHsKIAkJRFJNX0VSUk9SKCJVbmFibGUgdG8gZ2V0IGx0ZGMgcmVnaXN0ZXJzXG4iKTsK
LQkJcmV0dXJuIFBUUl9FUlIobGRldi0+cmVncyk7CisJCXJldCA9IFBUUl9FUlIobGRldi0+cmVn
cyk7CisJCWdvdG8gZXJyOwogCX0KIAogCWZvciAoaSA9IDA7IGkgPCBNQVhfSVJROyBpKyspIHsK
QEAgLTEwNjQsNyArMTA2Niw3IEBAIGludCBsdGRjX2xvYWQoc3RydWN0IGRybV9kZXZpY2UgKmRk
ZXYpCiAJCQkJCQlkZXZfbmFtZShkZXYpLCBkZGV2KTsKIAkJaWYgKHJldCkgewogCQkJRFJNX0VS
Uk9SKCJGYWlsZWQgdG8gcmVnaXN0ZXIgTFREQyBpbnRlcnJ1cHRcbiIpOwotCQkJcmV0dXJuIHJl
dDsKKwkJCWdvdG8gZXJyOwogCQl9CiAJfQogCkBAIC0xMDc5LDcgKzEwODEsNyBAQCBpbnQgbHRk
Y19sb2FkKHN0cnVjdCBkcm1fZGV2aWNlICpkZGV2KQogCWlmIChyZXQpIHsKIAkJRFJNX0VSUk9S
KCJoYXJkd2FyZSBpZGVudGlmaWVyICgweCUwOHgpIG5vdCBzdXBwb3J0ZWQhXG4iLAogCQkJICBs
ZGV2LT5jYXBzLmh3X3ZlcnNpb24pOwotCQlyZXR1cm4gcmV0OworCQlnb3RvIGVycjsKIAl9CiAK
IAlEUk1fSU5GTygibHRkYyBodyB2ZXJzaW9uIDB4JTA4eCAtIHJlYWR5XG4iLCBsZGV2LT5jYXBz
Lmh3X3ZlcnNpb24pOwotLSAKMS45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
