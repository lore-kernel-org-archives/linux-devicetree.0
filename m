From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH v3 11/15] ARM: dts: sun8i: a83t: Enable the PWM
Date: Tue,  5 Dec 2017 16:10:23 +0100
Message-ID: <016ca4fc16ab5c7c03cc79aaccae946b14b02194.1512486553.git-series.maxime.ripard@free-electrons.com>
References: <cover.825a49a4c1c565a548f3de0375e7537e7e8fd3a4.1512486553.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <cover.825a49a4c1c565a548f3de0375e7537e7e8fd3a4.1512486553.git-series.maxime.ripard@free-electrons.com>
In-Reply-To: <cover.825a49a4c1c565a548f3de0375e7537e7e8fd3a4.1512486553.git-series.maxime.ripard@free-electrons.com>
References: <cover.825a49a4c1c565a548f3de0375e7537e7e8fd3a4.1512486553.git-series.maxime.ripard@free-electrons.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, jernej.skrabec@siol.net, plaes@plaes.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, icenowy@aosc.io
List-Id: devicetree@vger.kernel.org

VGhlIEE4M1QgaGFzIHRoZSBzYW1lIFBXTSBibG9jayB0aGFuIHRoZSBIMy4gQWRkIGl0IHRvIG91
ciBEVC4KClJldmlld2VkLWJ5OiBDaGVuLVl1IFRzYWkgPHdlbnNAY3NpZS5vcmc+ClNpZ25lZC1v
ZmYtYnk6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAZnJlZS1lbGVjdHJvbnMuY29tPgot
LS0KIGFyY2gvYXJtL2Jvb3QvZHRzL3N1bjhpLWE4M3QuZHRzaSB8ICA5ICsrKysrKysrKwogMSBm
aWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3Qv
ZHRzL3N1bjhpLWE4M3QuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N1bjhpLWE4M3QuZHRzaQpp
bmRleCBlNGRiMzhjNzE3ZDkuLjdhNDliOWYwODVlYiAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9v
dC9kdHMvc3VuOGktYTgzdC5kdHNpCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N1bjhpLWE4M3Qu
ZHRzaQpAQCAtNDk3LDYgKzQ5NywxNSBAQAogCQkJc3RhdHVzID0gImRpc2FibGVkIjsKIAkJfTsK
IAorCQlwd206IHB3bUAxYzIxNDAwIHsKKwkJCWNvbXBhdGlibGUgPSAiYWxsd2lubmVyLHN1bjhp
LWE4M3QtcHdtIiwKKwkJCQkgICAgICJhbGx3aW5uZXIsc3VuOGktaDMtcHdtIjsKKwkJCXJlZyA9
IDwweDAxYzIxNDAwIDB4NDAwPjsKKwkJCWNsb2NrcyA9IDwmb3NjMjRNPjsKKwkJCSNwd20tY2Vs
bHMgPSA8Mz47CisJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOworCQl9OworCiAJCXVhcnQwOiBzZXJp
YWxAMWMyODAwMCB7CiAJCQljb21wYXRpYmxlID0gInNucHMsZHctYXBiLXVhcnQiOwogCQkJcmVn
ID0gPDB4MDFjMjgwMDAgMHg0MDA+OwotLSAKZ2l0LXNlcmllcyAwLjkuMQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
