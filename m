From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH v4 14/15] ARM: dts: sun8i: a711: Reinstate the PMIC compatible
Date: Thu,  7 Dec 2017 16:58:59 +0100
Message-ID: <80711a93a5e49166a26ade747687d8ba4ef7a6f3.1512662253.git-series.maxime.ripard@free-electrons.com>
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

V2hlbiB3ZSBhZGRlZCB0aGUgcmVndWxhdG9yIHN1cHBvcnQgaW4gY29tbWl0IDkwYzVkN2NkYWU2
NCAoIkFSTTogZHRzOgpzdW44aTogYTcxMTogQWRkIHJlZ3VsYXRvciBzdXBwb3J0IiksIHdlIGFs
c28gZHJvcHBlZCB0aGUgUE1JQydzCmNvbXBhdGlibGUuIFNpbmNlIGl0J3Mgbm90IGluIHRoZSBQ
TUlDIERUU0ksIHVubGlrZSBtb3N0IG90aGVyIFBNSUMKRFRTSSwgaXQgb2J2aW91c2x5IHdhc24n
dCBwcm9iaW5nIGFueW1vcmUuCgpSZS1hZGQgaXQgc28gdGhhdCBldmVyeXRoaW5nIHdvcmtzIGFn
YWluLgoKRml4ZXM6IDkwYzVkN2NkYWU2NCAoIkFSTTogZHRzOiBzdW44aTogYTcxMTogQWRkIHJl
Z3VsYXRvciBzdXBwb3J0IikKUmV2aWV3ZWQtYnk6IENoZW4tWXUgVHNhaSA8d2Vuc0Bjc2llLm9y
Zz4KU2lnbmVkLW9mZi1ieTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBmcmVlLWVsZWN0
cm9ucy5jb20+Ci0tLQogYXJjaC9hcm0vYm9vdC9kdHMvc3VuOGktYTgzdC10YnMtYTcxMS5kdHMg
fCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2FyY2gv
YXJtL2Jvb3QvZHRzL3N1bjhpLWE4M3QtdGJzLWE3MTEuZHRzIGIvYXJjaC9hcm0vYm9vdC9kdHMv
c3VuOGktYTgzdC10YnMtYTcxMS5kdHMKaW5kZXggOTg3MTU1Mzg5MzJmLi5hMDIxZWU2ZGEzOTYg
MTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N1bjhpLWE4M3QtdGJzLWE3MTEuZHRzCisr
KyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N1bjhpLWE4M3QtdGJzLWE3MTEuZHRzCkBAIC0xNDYsNiAr
MTQ2LDcgQEAKIAlzdGF0dXMgPSAib2theSI7CiAKIAlheHA4MXg6IHBtaWNAM2EzIHsKKwkJY29t
cGF0aWJsZSA9ICJ4LXBvd2VycyxheHA4MTMiOwogCQlyZWcgPSA8MHgzYTM+OwogCQlpbnRlcnJ1
cHQtcGFyZW50ID0gPCZyX2ludGM+OwogCQlpbnRlcnJ1cHRzID0gPDAgSVJRX1RZUEVfTEVWRUxf
TE9XPjsKLS0gCmdpdC1zZXJpZXMgMC45LjEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
