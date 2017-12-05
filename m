From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH v3 13/15] ARM: dts: sun8i: a83t: Add the PWM pin group
Date: Tue,  5 Dec 2017 16:10:25 +0100
Message-ID: <9d640f746ff4dbc968cdd46438874685f58dc2ba.1512486553.git-series.maxime.ripard@free-electrons.com>
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

VGhlIEE4M1QgaGFzIGEgUFdNIHRoYXQgY2FuIGJlIG91dHB1dCBmcm9tIHRoZSBTb0MuIExldCdz
IGFkZCBhIHBpbmN0cmwKZ3JvdXAgZm9yIGl0LgoKUmV2aWV3ZWQtYnk6IENoZW4tWXUgVHNhaSA8
d2Vuc0Bjc2llLm9yZz4KU2lnbmVkLW9mZi1ieTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFy
ZEBmcmVlLWVsZWN0cm9ucy5jb20+Ci0tLQogYXJjaC9hcm0vYm9vdC9kdHMvc3VuOGktYTgzdC5k
dHNpIHwgNSArKysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N1bjhpLWE4M3QuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRz
L3N1bjhpLWE4M3QuZHRzaQppbmRleCBlMjAwZGY1YTkwNTguLmEzNzUxN2Q0NDcyYSAxMDA2NDQK
LS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvc3VuOGktYTgzdC5kdHNpCisrKyBiL2FyY2gvYXJtL2Jv
b3QvZHRzL3N1bjhpLWE4M3QuZHRzaQpAQCAtNDQ2LDYgKzQ0NiwxMSBAQAogCQkJCWJpYXMtcHVs
bC11cDsKIAkJCX07CiAKKwkJCXB3bV9waW46IHB3bS1waW4geworCQkJCXBpbnMgPSAiUEQyOCI7
CisJCQkJZnVuY3Rpb24gPSAicHdtIjsKKwkJCX07CisKIAkJCXNwZGlmX3R4X3Bpbjogc3BkaWYt
dHgtcGluIHsKIAkJCQlwaW5zID0gIlBFMTgiOwogCQkJCWZ1bmN0aW9uID0gInNwZGlmIjsKLS0g
CmdpdC1zZXJpZXMgMC45LjEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
