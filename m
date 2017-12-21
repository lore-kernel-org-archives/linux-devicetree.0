From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH v5 10/12] ARM: dts: sun8i: a83t: Enable the PWM
Date: Thu, 21 Dec 2017 12:02:36 +0100
Message-ID: <0660061a425cbe3ea6426f5271457d6dde9313f1.1513854122.git-series.maxime.ripard@free-electrons.com>
References: <cover.e5a47cc96ec5274dd932daa2bde47df073087da9.1513854122.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <cover.e5a47cc96ec5274dd932daa2bde47df073087da9.1513854122.git-series.maxime.ripard@free-electrons.com>
In-Reply-To: <cover.e5a47cc96ec5274dd932daa2bde47df073087da9.1513854122.git-series.maxime.ripard@free-electrons.com>
References: <cover.e5a47cc96ec5274dd932daa2bde47df073087da9.1513854122.git-series.maxime.ripard@free-electrons.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, jernej.skrabec@siol.net, plaes@plaes.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, thierry.reding@gmail.com, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-arm-kernel@lists.infradead.org, icenowy@aosc.io
List-Id: devicetree@vger.kernel.org

VGhlIEE4M1QgaGFzIHRoZSBzYW1lIFBXTSBibG9jayB0aGFuIHRoZSBIMy4gQWRkIGl0IHRvIG91
ciBEVC4KClJldmlld2VkLWJ5OiBDaGVuLVl1IFRzYWkgPHdlbnNAY3NpZS5vcmc+ClNpZ25lZC1v
ZmYtYnk6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAZnJlZS1lbGVjdHJvbnMuY29tPgot
LS0KIGFyY2gvYXJtL2Jvb3QvZHRzL3N1bjhpLWE4M3QuZHRzaSB8IDE0ICsrKysrKysrKysrKysr
CiAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJt
L2Jvb3QvZHRzL3N1bjhpLWE4M3QuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N1bjhpLWE4M3Qu
ZHRzaQppbmRleCBlNGRiMzhjNzE3ZDkuLmFlMzRkMjJkNmQ0NyAxMDA2NDQKLS0tIGEvYXJjaC9h
cm0vYm9vdC9kdHMvc3VuOGktYTgzdC5kdHNpCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N1bjhp
LWE4M3QuZHRzaQpAQCAtNDQwLDYgKzQ0MCwxMSBAQAogCQkJCWJpYXMtcHVsbC11cDsKIAkJCX07
CiAKKwkJCXB3bV9waW46IHB3bS1waW4geworCQkJCXBpbnMgPSAiUEQyOCI7CisJCQkJZnVuY3Rp
b24gPSAicHdtIjsKKwkJCX07CisKIAkJCXNwZGlmX3R4X3Bpbjogc3BkaWYtdHgtcGluIHsKIAkJ
CQlwaW5zID0gIlBFMTgiOwogCQkJCWZ1bmN0aW9uID0gInNwZGlmIjsKQEAgLTQ5Nyw2ICs1MDIs
MTUgQEAKIAkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CiAJCX07CiAKKwkJcHdtOiBwd21AMWMyMTQw
MCB7CisJCQljb21wYXRpYmxlID0gImFsbHdpbm5lcixzdW44aS1hODN0LXB3bSIsCisJCQkJICAg
ICAiYWxsd2lubmVyLHN1bjhpLWgzLXB3bSI7CisJCQlyZWcgPSA8MHgwMWMyMTQwMCAweDQwMD47
CisJCQljbG9ja3MgPSA8Jm9zYzI0TT47CisJCQkjcHdtLWNlbGxzID0gPDM+OworCQkJc3RhdHVz
ID0gImRpc2FibGVkIjsKKwkJfTsKKwogCQl1YXJ0MDogc2VyaWFsQDFjMjgwMDAgewogCQkJY29t
cGF0aWJsZSA9ICJzbnBzLGR3LWFwYi11YXJ0IjsKIAkJCXJlZyA9IDwweDAxYzI4MDAwIDB4NDAw
PjsKLS0gCmdpdC1zZXJpZXMgMC45LjEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
