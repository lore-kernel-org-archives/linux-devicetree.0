From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH v4 12/15] ARM: dts: sun8i: a83t: Add LVDS pins group
Date: Thu,  7 Dec 2017 16:58:57 +0100
Message-ID: <1621056ff45c1305dd3baabe680866517874a4d9.1512662253.git-series.maxime.ripard@free-electrons.com>
References: <cover.e46a07c0e181d735c807dc94fe0ce0ea013788be.1512662253.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <cover.e46a07c0e181d735c807dc94fe0ce0ea013788be.1512662253.git-series.maxime.ripard@free-electrons.com>
In-Reply-To: <cover.e46a07c0e181d735c807dc94fe0ce0ea013788be.1512662253.git-series.maxime.ripard@free-electrons.com>
References: <cover.e46a07c0e181d735c807dc94fe0ce0ea013788be.1512662253.git-series.maxime.ripard@free-electrons.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, jernej.skrabec@siol.net, plaes@plaes.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, thierry.reding@gmail.com, linux-arm-kernel@lists.infradead.org, icenowy@aosc.io
List-Id: devicetree@vger.kernel.org

VGhlIEE4M1QgaGFzIGFuIExWRFMgYnVzIHRoYXQgY2FuIGJlIGNvbm5lY3RlZCB0byBhIHBhbmVs
IG9yIGEgYnJpZGdlLiBBZGQKdGhlIHBpbmN0cmwgZ3JvdXAgZm9yIGl0LgoKUmV2aWV3ZWQtYnk6
IENoZW4tWXUgVHNhaSA8d2Vuc0Bjc2llLm9yZz4KU2lnbmVkLW9mZi1ieTogTWF4aW1lIFJpcGFy
ZCA8bWF4aW1lLnJpcGFyZEBmcmVlLWVsZWN0cm9ucy5jb20+Ci0tLQogYXJjaC9hcm0vYm9vdC9k
dHMvc3VuOGktYTgzdC5kdHNpIHwgNiArKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdW44aS1hODN0LmR0c2kgYi9h
cmNoL2FybS9ib290L2R0cy9zdW44aS1hODN0LmR0c2kKaW5kZXggN2E0OWI5ZjA4NWViLi5lMjAw
ZGY1YTkwNTggMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N1bjhpLWE4M3QuZHRzaQor
KysgYi9hcmNoL2FybS9ib290L2R0cy9zdW44aS1hODN0LmR0c2kKQEAgLTQxNSw2ICs0MTUsMTIg
QEAKIAkJCSNpbnRlcnJ1cHQtY2VsbHMgPSA8Mz47CiAJCQkjZ3Bpby1jZWxscyA9IDwzPjsKIAor
CQkJbGNkX2x2ZHNfcGluczogbGNkLWx2ZHMtcGlucyB7CisJCQkJcGlucyA9ICJQRDE4IiwgIlBE
MTkiLCAiUEQyMCIsICJQRDIxIiwgIlBEMjIiLAorCQkJCSAgICAgICAiUEQyMyIsICJQRDI0Iiwg
IlBEMjUiLCAiUEQyNiIsICJQRDI3IjsKKwkJCQlmdW5jdGlvbiA9ICJsdmRzMCI7CisJCQl9Owor
CiAJCQltbWMwX3BpbnM6IG1tYzAtcGlucyB7CiAJCQkJcGlucyA9ICJQRjAiLCAiUEYxIiwgIlBG
MiIsCiAJCQkJICAgICAgICJQRjMiLCAiUEY0IiwgIlBGNSI7Ci0tIApnaXQtc2VyaWVzIDAuOS4x
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
