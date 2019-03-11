From: Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v8 11/15] drm/sun4i: sun6i_mipi_dsi: Add Allwinner A64 MIPI
 DSI support
Date: Mon, 11 Mar 2019 19:06:33 +0530
Message-ID: <20190311133637.18334-12-jagan@amarulasolutions.com>
References: <20190311133637.18334-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190311133637.18334-1-jagan@amarulasolutions.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com, Jagan Teki <jagan@amarulasolutions.com>, Michael Trimarchi <michael@amarulasolutions.com>, linux-amarula@amarulasolutions.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

VGhlIE1JUEkgRFNJIGNvbnRyb2xsZXIgaW4gQWxsd2lubmVyIEE2NCBpcyBzaW1pbGFyIHRvIEEz
My4KCkJ1dCB1bmxpa2UgQTMzLCBBNjQgZG9lc24ndCBoYXZlIERTSV9TQ0xLIGdhdGluZyBzbyBh
ZGQgY29tcGF0aWJsZQpmb3IgQWxsd2lubmVyIEE2NCB3aXRoIHVuaW5pdGlhbGl6ZWQgaGFzX21v
ZF9jbGsgZHJpdmVyLgoKU2lnbmVkLW9mZi1ieTogSmFnYW4gVGVraSA8amFnYW5AYW1hcnVsYXNv
bHV0aW9ucy5jb20+ClRlc3RlZC1ieTogTWVybGlqbiBXYWplciA8bWVybGlqbkB3aXp6dXAub3Jn
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW42aV9taXBpX2RzaS5jIHwgNyArKysrKysr
CiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3N1bjRpL3N1bjZpX21pcGlfZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3Vu
NmlfbWlwaV9kc2kuYwppbmRleCAyYTYzZTk2YWFmZjkuLjA5NjBiOTZiNjJjYyAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjZpX21pcGlfZHNpLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL3N1bjRpL3N1bjZpX21pcGlfZHNpLmMKQEAgLTEyNzYsMTEgKzEyNzYsMTggQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBzdW42aV9kc2lfdmFyaWFudCBzdW42aV9hMzFfbWlwaV9kc2kgPSB7
CiAJLmhhc19tb2RfY2xrID0gdHJ1ZSwKIH07CiAKK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgc3VuNmlf
ZHNpX3ZhcmlhbnQgc3VuNTBpX2E2NF9taXBpX2RzaSA9IHsKK307CisKIHN0YXRpYyBjb25zdCBz
dHJ1Y3Qgb2ZfZGV2aWNlX2lkIHN1bjZpX2RzaV9vZl90YWJsZVtdID0gewogCXsKIAkJLmNvbXBh
dGlibGUgPSAiYWxsd2lubmVyLHN1bjZpLWEzMS1taXBpLWRzaSIsCiAJCS5kYXRhID0gJnN1bjZp
X2EzMV9taXBpX2RzaSwKIAl9LAorCXsKKwkJLmNvbXBhdGlibGUgPSAiYWxsd2lubmVyLHN1bjUw
aS1hNjQtbWlwaS1kc2kiLAorCQkuZGF0YSA9ICZzdW41MGlfYTY0X21pcGlfZHNpLAorCX0sCiAJ
eyAvKiBzZW50aW5lbCAqLyB9CiB9OwogTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgc3VuNmlfZHNp
X29mX3RhYmxlKTsKLS0gCjIuMTguMC4zMjEuZ2ZmYzZmYTBlMwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
