From: Philippe CORNU <philippe.cornu@st.com>
Subject: [PATCH v5 5/7] dt-bindings: display: stm32: remove
 st-display-subsystem parent node requirement
Date: Mon, 3 Jul 2017 10:41:25 +0200
Message-ID: <1499071287-10414-6-git-send-email-philippe.cornu@st.com>
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

VGhlcmUgaXMgbm8gbmVlZCBhbnltb3JlIHRvIGhhdmUgYSAic3QtZGlzcGxheS1zdWJzeXN0ZW0i
IHBhcmVudCBub2RlCmluIHRoZSBkZXZpY2UgdHJlZSBmb3IgdGhlIGx0ZGMuCgpTaWduZWQtb2Zm
LWJ5OiBQaGlsaXBwZSBDT1JOVSA8cGhpbGlwcGUuY29ybnVAc3QuY29tPgpBY2tlZC1ieTogUm9i
IEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KLS0tCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9zdCxzdG0zMi1sdGRjLnR4dCB8IDEgLQogMSBmaWxlIGNoYW5nZWQs
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9zdCxzdG0zMi1sdGRjLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L3N0LHN0bTMyLWx0ZGMudHh0CmluZGV4IDhlMTQ3NjkuLjkwYTg0
NTkgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L3N0LHN0bTMyLWx0ZGMudHh0CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L3N0LHN0bTMyLWx0ZGMudHh0CkBAIC0xLDcgKzEsNiBAQAogKiBTVE1pY3JvZWxl
Y3Ryb25pY3MgU1RNMzIgbGNkLXRmdCBkaXNwbGF5IGNvbnRyb2xsZXIKIAogLSBsdGRjOiBsY2Qt
dGZ0IGRpc3BsYXkgY29udHJvbGxlciBob3N0Ci0gIG11c3QgYmUgYSBzdWItbm9kZSBvZiBzdC1k
aXNwbGF5LXN1YnN5c3RlbQogICBSZXF1aXJlZCBwcm9wZXJ0aWVzOgogICAtIGNvbXBhdGlibGU6
ICJzdCxzdG0zMi1sdGRjIgogICAtIHJlZzogUGh5c2ljYWwgYmFzZSBhZGRyZXNzIG9mIHRoZSBJ
UCByZWdpc3RlcnMgYW5kIGxlbmd0aCBvZiBtZW1vcnkgbWFwcGVkIHJlZ2lvbi4KLS0gCjEuOS4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
