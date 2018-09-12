From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH v2 6/8] drm/imx: support handling bridge timings bus flags
Date: Wed, 12 Sep 2018 11:32:20 -0700
Message-ID: <20180912183222.25414-7-stefan@agner.ch>
References: <20180912183222.25414-1-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180912183222.25414-1-stefan@agner.ch>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: linus.walleij@linaro.org, Laurent.pinchart@ideasonboard.com, airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, p.zabel@pengutronix.de
Cc: devicetree@vger.kernel.org, max.krummenacher@toradex.com, marcel.ziswiler@toradex.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-imx@nxp.com, kernel@pengutronix.de, fabio.estevam@nxp.com, sean@poorly.run, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

QSBicmlkZ2UgbWlnaHQgcmVxdWlyZSBzcGVjaWZpYyBzZXR0aW5ncyBmb3IgdGhlIHBpeGVsIGRh
dGEgb24KdGhlIGJ1cy4gQ29weSB0aGUgYnVzIGZsYWdzIGZyb20gdGhlIGJyaWRnZSB0aW1pbmdz
IGlmIGEgYnJpZGdlCmlzIGluIHVzZS4KClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBBZ25lciA8c3Rl
ZmFuQGFnbmVyLmNoPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pbXgvcGFyYWxsZWwtZGlzcGxheS5j
IHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vaW14L3BhcmFsbGVsLWRpc3BsYXkuYyBiL2RyaXZlcnMvZ3B1L2RybS9p
bXgvcGFyYWxsZWwtZGlzcGxheS5jCmluZGV4IGFlZmQwNGUxOGY5My4uNzc5OGEwNjIxZGY3IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaW14L3BhcmFsbGVsLWRpc3BsYXkuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vaW14L3BhcmFsbGVsLWRpc3BsYXkuYwpAQCAtMjM5LDYgKzIzOSw5IEBA
IHN0YXRpYyBpbnQgaW14X3BkX2JpbmQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNl
ICptYXN0ZXIsIHZvaWQgKmRhdGEpCiAJaWYgKHJldCAmJiByZXQgIT0gLUVOT0RFVikKIAkJcmV0
dXJuIHJldDsKIAorCWlmIChpbXhwZC0+YnJpZGdlICYmIGlteHBkLT5icmlkZ2UtPnRpbWluZ3Mp
CisJCWlteHBkLT5idXNfZmxhZ3MgPSBpbXhwZC0+YnJpZGdlLT50aW1pbmdzLT5pbnB1dF9idXNf
ZmxhZ3M7CisKIAlpbXhwZC0+ZGV2ID0gZGV2OwogCiAJcmV0ID0gaW14X3BkX3JlZ2lzdGVyKGRy
bSwgaW14cGQpOwotLSAKMi4xOC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
