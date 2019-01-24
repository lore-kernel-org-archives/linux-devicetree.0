From: Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v6 11/22] clk: sunxi-ng: a64: Add minimum rate for PLL_MIPI
Date: Fri, 25 Jan 2019 01:28:49 +0530
Message-ID: <20190124195900.22620-12-jagan@amarulasolutions.com>
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

TWluaW11bSBQTEwgdXNlZCBmb3IgTUlQSSBpcyA1MDBNSHosIGFzIHBlciBtYW51YWwsIGJ1dAps
b3dlcmluZyB0aGUgbWluIHJhdGUgYnkgMzAwTUh6IGNhbiByZXN1bHQgcHJvcGVyIHdvcmtpbmcK
bmttcyBkaXZpZGVyIHdpdGggdGhlIGhlbHAgb2YgZGVzaXJlZCBkY2xvY2sgcmF0ZSBmcm9tCnBh
bmVsIGRyaXZlci4KClNpZ25lZC1vZmYtYnk6IEphZ2FuIFRla2kgPGphZ2FuQGFtYXJ1bGFzb2x1
dGlvbnMuY29tPgpBY2tlZC1ieTogU3RlcGhlbiBCb3lkIDxzYm95ZEBrZXJuZWwub3JnPgotLS0K
IGRyaXZlcnMvY2xrL3N1bnhpLW5nL2NjdS1zdW41MGktYTY0LmMgfCAxICsKIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL3N1bnhpLW5nL2Nj
dS1zdW41MGktYTY0LmMgYi9kcml2ZXJzL2Nsay9zdW54aS1uZy9jY3Utc3VuNTBpLWE2NC5jCmlu
ZGV4IDkzMjgzNmQyNmUyYi4uMjk2ZDQ4OWFhZDZlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2Nsay9z
dW54aS1uZy9jY3Utc3VuNTBpLWE2NC5jCisrKyBiL2RyaXZlcnMvY2xrL3N1bnhpLW5nL2NjdS1z
dW41MGktYTY0LmMKQEAgLTE4Myw2ICsxODMsNyBAQCBzdGF0aWMgc3RydWN0IGNjdV9ua20gcGxs
X21pcGlfY2xrID0gewogCS5uCQk9IF9TVU5YSV9DQ1VfTVVMVCg4LCA0KSwKIAkuawkJPSBfU1VO
WElfQ0NVX01VTFRfTUlOKDQsIDIsIDIpLAogCS5tCQk9IF9TVU5YSV9DQ1VfRElWKDAsIDQpLAor
CS5taW5fcmF0ZQk9IDMwMDAwMDAwMCwKIAkuY29tbW9uCQk9IHsKIAkJLnJlZwkJPSAweDA0MCwK
IAkJLmh3LmluaXQJPSBDTEtfSFdfSU5JVCgicGxsLW1pcGkiLCAicGxsLXZpZGVvMCIsCi0tIAoy
LjE4LjAuMzIxLmdmZmM2ZmEwZTMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
