From: Philippe CORNU <philippe.cornu@st.com>
Subject: [PATCH v5 3/7] dt-bindings: display: Add Synopsys DW MIPI DSI host
 controller
Date: Mon, 3 Jul 2017 10:41:23 +0200
Message-ID: <1499071287-10414-4-git-send-email-philippe.cornu@st.com>
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

VGhpcyBwYXRjaCBhZGRzIGRvY3VtZW50YXRpb24gb2YgZGV2aWNlIHRyZWUgYmluZGluZ3MgZm9y
IHRoZQpTeW5vcHN5cyBEZXNpZ25XYXJlIE1JUEkgRFNJIGhvc3QgY29udHJvbGxlci4KClNpZ25l
ZC1vZmYtYnk6IFBoaWxpcHBlIENPUk5VIDxwaGlsaXBwZS5jb3JudUBzdC5jb20+Ci0tLQogLi4u
L2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2R3X21pcGlfZHNpLnR4dCAgICAgICAgfCAzMiArKysr
KysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKQogY3Jl
YXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L2JyaWRnZS9kd19taXBpX2RzaS50eHQKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvZHdfbWlwaV9kc2kudHh0IGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2R3X21pcGlfZHNpLnR4dApu
ZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwLi5iMTNhZGYzCi0tLSAvZGV2L251bGwK
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2R3
X21pcGlfZHNpLnR4dApAQCAtMCwwICsxLDMyIEBACitTeW5vcHN5cyBEZXNpZ25XYXJlIE1JUEkg
RFNJIGhvc3QgY29udHJvbGxlcgorPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT0KKworVGhpcyBkb2N1bWVudCBkZWZpbmVzIGRldmljZSB0cmVlIHByb3BlcnRpZXMg
Zm9yIHRoZSBTeW5vcHN5cyBEZXNpZ25XYXJlIE1JUEkKK0RTSSBob3N0IGNvbnRyb2xsZXIuIEl0
IGRvZXNuJ3QgY29uc3RpdHVlIGEgZGV2aWNlIHRyZWUgYmluZGluZyBzcGVjaWZpY2F0aW9uCiti
eSBpdHNlbGYgYnV0IGlzIG1lYW50IHRvIGJlIHJlZmVyZW5jZWQgYnkgcGxhdGZvcm0tc3BlY2lm
aWMgZGV2aWNlIHRyZWUKK2JpbmRpbmdzLgorCitXaGVuIHJlZmVyZW5jZWQgZnJvbSBwbGF0Zm9y
bSBkZXZpY2UgdHJlZSBiaW5kaW5ncyB0aGUgcHJvcGVydGllcyBkZWZpbmVkIGluCit0aGlzIGRv
Y3VtZW50IGFyZSBkZWZpbmVkIGFzIGZvbGxvd3MuIFRoZSBwbGF0Zm9ybSBkZXZpY2UgdHJlZSBi
aW5kaW5ncyBhcmUKK3Jlc3BvbnNpYmxlIGZvciBkZWZpbmluZyB3aGV0aGVyIGVhY2ggb3B0aW9u
YWwgcHJvcGVydHkgaXMgdXNlZCBvciBub3QuCisKKy0gcmVnOiBNZW1vcnkgbWFwcGVkIGJhc2Ug
YWRkcmVzcyBhbmQgbGVuZ3RoIG9mIHRoZSBEZXNpZ25XYXJlIE1JUEkgRFNJCisgIGhvc3QgY29u
dHJvbGxlciByZWdpc3RlcnMuIChtYW5kYXRvcnkpCisKKy0gY2xvY2tzOiBSZWZlcmVuY2VzIHRv
IGFsbCB0aGUgY2xvY2tzIHNwZWNpZmllZCBpbiB0aGUgY2xvY2stbmFtZXMgcHJvcGVydHkKKyAg
YXMgc3BlY2lmaWVkIGluIFsxXS4gKG1hbmRhdG9yeSkKKworLSBjbG9jay1uYW1lczoKKyAgLSAi
cGNsayIgaXMgdGhlIHBlcmlwaGVyYWwgY2xvY2sgZm9yIGVpdGhlciBBSEIgYW5kIEFQQi4gKG1h
bmRhdG9yeSkKKyAgLSAicHhfY2xrIiBpcyB0aGUgcGl4ZWwgY2xvY2sgZm9yIHRoZSBEUEkvUkdC
IGlucHV0LiAob3B0aW9uYWwpCisKKy0gcmVzZXRzOiBSZWZlcmVuY2VzIHRvIGFsbCB0aGUgcmVz
ZXRzIHNwZWNpZmllZCBpbiB0aGUgcmVzZXQtbmFtZXMgcHJvcGVydHkKKyAgYXMgc3BlY2lmaWVk
IGluIFsyXS4gKG9wdGlvbmFsKQorCistIHJlc2V0LW5hbWVzOiBzdHJpbmcgcmVzZXQgbmFtZSwg
bXVzdCBiZSAiYXBiIiBpZiB1c2VkLiAob3B0aW9uYWwpCisKKy0gcGFuZWwgb3IgYnJpZGdlIG5v
ZGU6IHNlZSBbM10uIChtYW5kYXRvcnkpCisKK1sxXSBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvY2xvY2svY2xvY2stYmluZGluZ3MudHh0CitbMl0gRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3Jlc2V0L3Jlc2V0LnR4dAorWzNdIERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L21pcGktZHNpLWJ1cy50eHQKLS0gCjEuOS4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
