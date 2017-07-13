From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH 05/18] drm/sun4i: tcon: remove unused function
Date: Thu, 13 Jul 2017 16:13:00 +0200
Message-ID: <7d8e9b8d77c9bef3258e97a06aab42314355acf4.1499955058.git-series.maxime.ripard@free-electrons.com>
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

RXZlbiB0aG91Z2ggdGhhdCBmdW5jdGlvbiBpcyBkZWZpbmVkIGluIHRoZSBUQ09OIGhlYWRlciwg
aXQncyBub3QgZGVmaW5lZApub3IgdXNlZCBhbnl3aGVyZS4gUmVtb3ZlIHRoZSBwcm90b3R5cGUu
CgpTaWduZWQtb2ZmLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGZyZWUtZWxlY3Ry
b25zLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfdGNvbi5oIHwgMiAtLQog
MSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3N1bjRpL3N1bjRpX3Rjb24uaCBiL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV90Y29u
LmgKaW5kZXggZTNjNTBlY2RjZDA0Li41NTJjODhlYzE2YmUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9zdW40aS9zdW40aV90Y29uLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1
bjRpX3Rjb24uaApAQCAtMTk0LDggKzE5NCw2IEBAIHZvaWQgc3VuNGlfdGNvbl9jaGFubmVsX2Vu
YWJsZShzdHJ1Y3Qgc3VuNGlfdGNvbiAqdGNvbiwgaW50IGNoYW5uZWwpOwogdm9pZCBzdW40aV90
Y29uX2VuYWJsZV92Ymxhbmsoc3RydWN0IHN1bjRpX3Rjb24gKnRjb24sIGJvb2wgZW5hYmxlKTsK
IAogLyogTW9kZSBSZWxhdGVkIENvbnRyb2xzICovCi12b2lkIHN1bjRpX3Rjb25fc3dpdGNoX2lu
dGVybGFjZShzdHJ1Y3Qgc3VuNGlfdGNvbiAqdGNvbiwKLQkJCQkgYm9vbCBlbmFibGUpOwogdm9p
ZCBzdW40aV90Y29uX3NldF9tdXgoc3RydWN0IHN1bjRpX3Rjb24gKnRjb24sIGludCBjaGFubmVs
LAogCQkJc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyKTsKIHZvaWQgc3VuNGlfdGNvbjBfbW9k
ZV9zZXQoc3RydWN0IHN1bjRpX3Rjb24gKnRjb24sCi0tIApnaXQtc2VyaWVzIDAuOS4xCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
