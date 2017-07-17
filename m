From: Philippe CORNU <philippe.cornu@st.com>
Subject: [PATCH v6 3/7] dt-bindings: display: Add Synopsys DW MIPI DSI host
 controller
Date: Mon, 17 Jul 2017 09:40:19 +0200
Message-ID: <1500277223-29553-4-git-send-email-philippe.cornu@st.com>
References: <1500277223-29553-1-git-send-email-philippe.cornu@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1500277223-29553-1-git-send-email-philippe.cornu@st.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Alexandre Torgue <alexandre.torgue@st.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Russell King <linux@armlinux.org.uk>, Mark
 Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Yannick Fertre <yannick.fertre@st.com>, Neil Armstrong <narmstrong@baylibre.com>, Archit Taneja <architt@codeaurora.org>, Eric
 Anholt <eric@anholt.net>, Chris Zhong <zyw@rock-chips.com>, Andrzej Hajda <a.hajda@samsung.com>, Xinliang Liu <xinliang.liu@linaro.org>, zourongrong@gmail.com, Xinwei Kong <kong.kongxinwei@hisilicon.com>, Chen
 Feng <puck.chen@hisilicon.com>, Mark Yao <mark.yao@rock-chips.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Philippe Cornu <philippe.cornu@st.com>, Fabien Dessenne <fabien.dessenne@st.com>, dri-devel@lists.freedesktop.org, Mickael Reulier <mickael.reulier@st.com>, Vincent Abriou <vincent.abriou@st.com>, Gabriel Fernandez <gabriel.fernandez@st.com>, Ludovic Barre <ludovic.barre@st.com>
List-Id: devicetree@vger.kernel.org

VGhpcyBwYXRjaCBhZGRzIGRvY3VtZW50YXRpb24gb2YgZGV2aWNlIHRyZWUgYmluZGluZ3MgZm9y
IHRoZQpTeW5vcHN5cyBEZXNpZ25XYXJlIE1JUEkgRFNJIGhvc3QgY29udHJvbGxlci4KClNpZ25l
ZC1vZmYtYnk6IFBoaWxpcHBlIENPUk5VIDxwaGlsaXBwZS5jb3JudUBzdC5jb20+CkFja2VkLWJ5
OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgotLS0KIC4uLi9iaW5kaW5ncy9kaXNwbGF5
L2JyaWRnZS9kd19taXBpX2RzaS50eHQgICAgICAgIHwgMzIgKysrKysrKysrKysrKysrKysrKysr
KwogMSBmaWxlIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvZHdfbWlwaV9k
c2kudHh0CgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvYnJpZGdlL2R3X21pcGlfZHNpLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9kd19taXBpX2RzaS50eHQKbmV3IGZpbGUgbW9kZSAxMDA2
NDQKaW5kZXggMDAwMDAwMC4uYjEzYWRmMwotLS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9kd19taXBpX2RzaS50eHQKQEAg
LTAsMCArMSwzMiBAQAorU3lub3BzeXMgRGVzaWduV2FyZSBNSVBJIERTSSBob3N0IGNvbnRyb2xs
ZXIKKz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CisKK1RoaXMg
ZG9jdW1lbnQgZGVmaW5lcyBkZXZpY2UgdHJlZSBwcm9wZXJ0aWVzIGZvciB0aGUgU3lub3BzeXMg
RGVzaWduV2FyZSBNSVBJCitEU0kgaG9zdCBjb250cm9sbGVyLiBJdCBkb2Vzbid0IGNvbnN0aXR1
ZSBhIGRldmljZSB0cmVlIGJpbmRpbmcgc3BlY2lmaWNhdGlvbgorYnkgaXRzZWxmIGJ1dCBpcyBt
ZWFudCB0byBiZSByZWZlcmVuY2VkIGJ5IHBsYXRmb3JtLXNwZWNpZmljIGRldmljZSB0cmVlCiti
aW5kaW5ncy4KKworV2hlbiByZWZlcmVuY2VkIGZyb20gcGxhdGZvcm0gZGV2aWNlIHRyZWUgYmlu
ZGluZ3MgdGhlIHByb3BlcnRpZXMgZGVmaW5lZCBpbgordGhpcyBkb2N1bWVudCBhcmUgZGVmaW5l
ZCBhcyBmb2xsb3dzLiBUaGUgcGxhdGZvcm0gZGV2aWNlIHRyZWUgYmluZGluZ3MgYXJlCityZXNw
b25zaWJsZSBmb3IgZGVmaW5pbmcgd2hldGhlciBlYWNoIG9wdGlvbmFsIHByb3BlcnR5IGlzIHVz
ZWQgb3Igbm90LgorCistIHJlZzogTWVtb3J5IG1hcHBlZCBiYXNlIGFkZHJlc3MgYW5kIGxlbmd0
aCBvZiB0aGUgRGVzaWduV2FyZSBNSVBJIERTSQorICBob3N0IGNvbnRyb2xsZXIgcmVnaXN0ZXJz
LiAobWFuZGF0b3J5KQorCistIGNsb2NrczogUmVmZXJlbmNlcyB0byBhbGwgdGhlIGNsb2NrcyBz
cGVjaWZpZWQgaW4gdGhlIGNsb2NrLW5hbWVzIHByb3BlcnR5CisgIGFzIHNwZWNpZmllZCBpbiBb
MV0uIChtYW5kYXRvcnkpCisKKy0gY2xvY2stbmFtZXM6CisgIC0gInBjbGsiIGlzIHRoZSBwZXJp
cGhlcmFsIGNsb2NrIGZvciBlaXRoZXIgQUhCIGFuZCBBUEIuIChtYW5kYXRvcnkpCisgIC0gInB4
X2NsayIgaXMgdGhlIHBpeGVsIGNsb2NrIGZvciB0aGUgRFBJL1JHQiBpbnB1dC4gKG9wdGlvbmFs
KQorCistIHJlc2V0czogUmVmZXJlbmNlcyB0byBhbGwgdGhlIHJlc2V0cyBzcGVjaWZpZWQgaW4g
dGhlIHJlc2V0LW5hbWVzIHByb3BlcnR5CisgIGFzIHNwZWNpZmllZCBpbiBbMl0uIChvcHRpb25h
bCkKKworLSByZXNldC1uYW1lczogc3RyaW5nIHJlc2V0IG5hbWUsIG11c3QgYmUgImFwYiIgaWYg
dXNlZC4gKG9wdGlvbmFsKQorCistIHBhbmVsIG9yIGJyaWRnZSBub2RlOiBzZWUgWzNdLiAobWFu
ZGF0b3J5KQorCitbMV0gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL2Ns
b2NrLWJpbmRpbmdzLnR4dAorWzJdIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9y
ZXNldC9yZXNldC50eHQKK1szXSBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9taXBpLWRzaS1idXMudHh0Ci0tIAoxLjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
