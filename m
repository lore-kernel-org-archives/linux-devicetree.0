From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH 4/6] drm/imx: support handling bridge timings bus flags
Date: Tue,  4 Sep 2018 22:21:11 -0700
Message-ID: <20180905052113.21262-4-stefan@agner.ch>
References: <20180905052113.21262-1-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180905052113.21262-1-stefan@agner.ch>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: linus.walleij@linaro.org, airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, p.zabel@pengutronix.de
Cc: devicetree@vger.kernel.org, max.krummenacher@toradex.com, marcel.ziswiler@toradex.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-imx@nxp.com, kernel@pengutronix.de, fabio.estevam@nxp.com, sean@poorly.run, linux-arm-kernel@lists.infradead.org, Laurent.pinchart@ideasonboard.com
List-Id: devicetree@vger.kernel.org

QSBicmlkZ2UgbWlnaHQgcmVxdWlyZSBzcGVjaWZpYyBzZXR0aW5ncyBmb3IgdGhlIHBpeGVsIGRh
dGEgb24KdGhlIGJ1cy4gQ29weSB0aGUgYnVzIGZsYWdzIGZyb20gdGhlIGJyaWRnZSB0aW1pbmdz
IGlmIGEgYnJpZGdlCmlzIGluIHVzZS4KClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBBZ25lciA8c3Rl
ZmFuQGFnbmVyLmNoPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pbXgvcGFyYWxsZWwtZGlzcGxheS5j
IHwgNyArKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2lteC9wYXJhbGxlbC1kaXNwbGF5LmMgYi9kcml2ZXJzL2dwdS9k
cm0vaW14L3BhcmFsbGVsLWRpc3BsYXkuYwppbmRleCBhZWZkMDRlMThmOTMuLmVlNTg0MGNkYjlh
YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2lteC9wYXJhbGxlbC1kaXNwbGF5LmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2lteC9wYXJhbGxlbC1kaXNwbGF5LmMKQEAgLTIzOSw2ICsyMzks
MTMgQEAgc3RhdGljIGludCBpbXhfcGRfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBk
ZXZpY2UgKm1hc3Rlciwgdm9pZCAqZGF0YSkKIAlpZiAocmV0ICYmIHJldCAhPSAtRU5PREVWKQog
CQlyZXR1cm4gcmV0OwogCisJaWYgKGlteHBkLT5icmlkZ2UpIHsKKwkJY29uc3Qgc3RydWN0IGRy
bV9icmlkZ2VfdGltaW5ncyAqYnRpbWluZ3MgPSBpbXhwZC0+YnJpZGdlLT50aW1pbmdzOworCisJ
CWlmIChidGltaW5ncykKKwkJCWlteHBkLT5idXNfZmxhZ3MgPSBidGltaW5ncy0+YnVzX2ZsYWdz
OworCX0KKwogCWlteHBkLT5kZXYgPSBkZXY7CiAKIAlyZXQgPSBpbXhfcGRfcmVnaXN0ZXIoZHJt
LCBpbXhwZCk7Ci0tIAoyLjE4LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
