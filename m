From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v2 6/8] drm/imx: support handling bridge timings bus flags
Date: Thu, 13 Sep 2018 10:38:50 +0200
Message-ID: <1536827930.3452.4.camel@pengutronix.de>
References: <20180912183222.25414-1-stefan@agner.ch>
 <20180912183222.25414-7-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180912183222.25414-7-stefan@agner.ch>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Stefan Agner <stefan@agner.ch>, linus.walleij@linaro.org, Laurent.pinchart@ideasonboard.com, airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de
Cc: devicetree@vger.kernel.org, max.krummenacher@toradex.com, marcel.ziswiler@toradex.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-imx@nxp.com, kernel@pengutronix.de, fabio.estevam@nxp.com, sean@poorly.run, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

T24gV2VkLCAyMDE4LTA5LTEyIGF0IDExOjMyIC0wNzAwLCBTdGVmYW4gQWduZXIgd3JvdGU6Cj4g
QSBicmlkZ2UgbWlnaHQgcmVxdWlyZSBzcGVjaWZpYyBzZXR0aW5ncyBmb3IgdGhlIHBpeGVsIGRh
dGEgb24KPiB0aGUgYnVzLgoKT24gd2hpY2ggYnVzPyBUaGUgYnJpZGdlIGhhcyBpbnB1dCBhbmQg
b3V0cHV0LgoKPiBDb3B5IHRoZSBidXMgZmxhZ3MgZnJvbSB0aGUgYnJpZGdlIHRpbWluZ3MgaWYg
YSBicmlkZ2UKPiBpcyBpbiB1c2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogU3RlZmFuIEFnbmVyIDxz
dGVmYW5AYWduZXIuY2g+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9pbXgvcGFyYWxsZWwtZGlz
cGxheS5jIHwgMyArKysKPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaW14L3BhcmFsbGVsLWRpc3BsYXkuYyBiL2RyaXZl
cnMvZ3B1L2RybS9pbXgvcGFyYWxsZWwtZGlzcGxheS5jCj4gaW5kZXggYWVmZDA0ZTE4ZjkzLi43
Nzk4YTA2MjFkZjcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2lteC9wYXJhbGxlbC1k
aXNwbGF5LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaW14L3BhcmFsbGVsLWRpc3BsYXkuYwo+
IEBAIC0yMzksNiArMjM5LDkgQEAgc3RhdGljIGludCBpbXhfcGRfYmluZChzdHJ1Y3QgZGV2aWNl
ICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3Rlciwgdm9pZCAqZGF0YSkKPiAgCWlmIChyZXQgJiYg
cmV0ICE9IC1FTk9ERVYpCj4gIAkJcmV0dXJuIHJldDsKPiAgCj4gKwlpZiAoaW14cGQtPmJyaWRn
ZSAmJiBpbXhwZC0+YnJpZGdlLT50aW1pbmdzKQo+ICsJCWlteHBkLT5idXNfZmxhZ3MgPSBpbXhw
ZC0+YnJpZGdlLT50aW1pbmdzLT5pbnB1dF9idXNfZmxhZ3M7CgpPaCwgb2suIEknZCBhbHNvIHNw
ZWNpZnkgaW5wdXQgYnVzIGluIHRoZSBjb21taXQgbWVzc2FnZS4KCj4gKwo+ICAJaW14cGQtPmRl
diA9IGRldjsKPiAgCj4gIAlyZXQgPSBpbXhfcGRfcmVnaXN0ZXIoZHJtLCBpbXhwZCk7CgpyZWdh
cmRzClBoaWxpcHAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
