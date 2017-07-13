From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH 14/18] dt-bindings: panel: Add Huarui LHR050H41 panel
 documentation
Date: Thu, 13 Jul 2017 16:13:09 +0200
Message-ID: <5c1df0e5171fd2fb0e4536e88363eeb8c8382b80.1499955058.git-series.maxime.ripard@free-electrons.com>
References: <cover.a5e7407c191c66e264164d017f64582039c56acb.1499955058.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <cover.a5e7407c191c66e264164d017f64582039c56acb.1499955058.git-series.maxime.ripard@free-electrons.com>
In-Reply-To: <cover.a5e7407c191c66e264164d017f64582039c56acb.1499955058.git-series.maxime.ripard@free-electrons.com>
References: <cover.a5e7407c191c66e264164d017f64582039c56acb.1499955058.git-series.maxime.ripard@free-electrons.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Boris Brezillon <boris.brezillon@free-electrons.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel.vetter@intel.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

VGhlIExIUjA1MEg0MSBpcyBhIDEyODB4NzAwIDQtbGFuZXMgRFNJIHBhbmVsLgoKU2lnbmVkLW9m
Zi1ieTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBmcmVlLWVsZWN0cm9ucy5jb20+Ci0t
LQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvaHVhcnVp
LGxocjA1MGg0MS50eHQgfCAxOSArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwg
MTkgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2h1YXJ1aSxsaHIwNTBoNDEudHh0CgpkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvaHVh
cnVpLGxocjA1MGg0MS50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9wYW5lbC9odWFydWksbGhyMDUwaDQxLnR4dApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRl
eCAwMDAwMDAwMDAwMDAuLmIyNTRkYjRkMjljNQotLS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2h1YXJ1aSxsaHIwNTBoNDEu
dHh0CkBAIC0wLDAgKzEsMTkgQEAKK0h1YXJ1aSBMSFIwNTBINDEgTUlQSS1EU0kgcGFuZWwKKwor
UmVxdWlyZWQgcHJvcGVydGllczoKKyAgLSBjb21wYXRpYmxlOiAiaHVhcnVpLGxocjA1MGg0MSIK
KyAgLSByZWc6IERTSSB2aXJ0dWFsIGNoYW5uZWwgdXNlZCBieSB0aGF0IHNjcmVlbgorICAtIHBv
d2VyLWdwaW9zOiBhIEdQSU8gcGhhbmRsZSBmb3IgdGhlIHBvd2VyIHBpbgorICAtIHJlc2V0LWdw
aW9zOiBhIEdQSU8gcGhhbmRsZSBmb3IgdGhlIHJlc2V0IHBpbgorCitPcHRpb25hbCBwcm9wZXJ0
aWVzOgorICAtIGJhY2tsaWdodDogcGhhbmRsZSB0byB0aGUgYmFja2xpZ2h0IHVzZWQKKworRXhh
bXBsZToKK3BhbmVsQDAgeworCWNvbXBhdGlibGUgPSAiaHVhcnVpLGxocjA1MGg0MSI7CisJcmVn
ID0gPDA+OworCXBvd2VyLWdwaW9zID0gPCZwaW8gMSA3IEdQSU9fQUNUSVZFX0hJR0g+OyAvKiBQ
QjA3ICovCisJcmVzZXQtZ3Bpb3MgPSA8JnJfcGlvIDAgNSBHUElPX0FDVElWRV9MT1c+OyAvKiBQ
TDA1ICovCisJYmFja2xpZ2h0ID0gPCZwd21fYmw+OworfTsKLS0gCmdpdC1zZXJpZXMgMC45LjEK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
