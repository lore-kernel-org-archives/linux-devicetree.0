From: Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v6 10/22] clk: sunxi-ng: Add check for minimal rate to NKM PLLs
Date: Fri, 25 Jan 2019 01:28:48 +0530
Message-ID: <20190124195900.22620-11-jagan@amarulasolutions.com>
References: <20190124195900.22620-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190124195900.22620-1-jagan@amarulasolutions.com>
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

U29tZSBOS00gUExMcyBkb2Vzbid0IHdvcmsgd2VsbCB3aGVuIHRoZWlyIG91dHB1dCBjbG9jayBy
YXRlIGlzIHNldCBiZWxvdwpjZXJ0YWluIHJhdGUuCgpTbywgYWRkIHN1cHBvcnQgZm9yIG1pbmlt
YWwgcmF0ZSBmb3IgcmVsZXZhbnQgUExMcy4KClNpZ25lZC1vZmYtYnk6IEphZ2FuIFRla2kgPGph
Z2FuQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgpBY2tlZC1ieTogU3RlcGhlbiBCb3lkIDxzYm95ZEBr
ZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvY2xrL3N1bnhpLW5nL2NjdV9ua20uYyB8IDUgKysrKysK
IGRyaXZlcnMvY2xrL3N1bnhpLW5nL2NjdV9ua20uaCB8IDEgKwogMiBmaWxlcyBjaGFuZ2VkLCA2
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9zdW54aS1uZy9jY3Vfbmtt
LmMgYi9kcml2ZXJzL2Nsay9zdW54aS1uZy9jY3VfbmttLmMKaW5kZXggODQxODQwZTM1ZTYxLi4w
OTZmZjRmNDgzOWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvY2xrL3N1bnhpLW5nL2NjdV9ua20uYwor
KysgYi9kcml2ZXJzL2Nsay9zdW54aS1uZy9jY3VfbmttLmMKQEAgLTEyNSw2ICsxMjUsMTEgQEAg
c3RhdGljIHVuc2lnbmVkIGxvbmcgY2N1X25rbV9yb3VuZF9yYXRlKHN0cnVjdCBjY3VfbXV4X2lu
dGVybmFsICptdXgsCiAJaWYgKG5rbS0+Y29tbW9uLmZlYXR1cmVzICYgQ0NVX0ZFQVRVUkVfRklY
RURfUE9TVERJVikKIAkJcmF0ZSAqPSBua20tPmZpeGVkX3Bvc3RfZGl2OwogCisJaWYgKHJhdGUg
PCBua20tPm1pbl9yYXRlKSB7CisJCXJhdGUgPSBua20tPm1pbl9yYXRlOworCQlyZXR1cm4gcmF0
ZTsKKwl9CisKIAljY3VfbmttX2ZpbmRfYmVzdCgqcGFyZW50X3JhdGUsIHJhdGUsICZfbmttKTsK
IAogCXJhdGUgPSAqcGFyZW50X3JhdGUgKiBfbmttLm4gKiBfbmttLmsgLyBfbmttLm07CmRpZmYg
LS1naXQgYS9kcml2ZXJzL2Nsay9zdW54aS1uZy9jY3VfbmttLmggYi9kcml2ZXJzL2Nsay9zdW54
aS1uZy9jY3VfbmttLmgKaW5kZXggY2M2ZWZiNzBhMTAyLi5mZjViZDAwZjQyOWYgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvY2xrL3N1bnhpLW5nL2NjdV9ua20uaAorKysgYi9kcml2ZXJzL2Nsay9zdW54
aS1uZy9jY3VfbmttLmgKQEAgLTM1LDYgKzM1LDcgQEAgc3RydWN0IGNjdV9ua20gewogCXN0cnVj
dCBjY3VfbXV4X2ludGVybmFsCW11eDsKIAogCXVuc2lnbmVkIGludAkJZml4ZWRfcG9zdF9kaXY7
CisJdW5zaWduZWQgaW50CQltaW5fcmF0ZTsKIAogCXN0cnVjdCBjY3VfY29tbW9uCWNvbW1vbjsK
IH07Ci0tIAoyLjE4LjAuMzIxLmdmZmM2ZmEwZTMKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
