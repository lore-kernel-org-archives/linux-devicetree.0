From: Lucas Stach <l.stach@pengutronix.de>
Subject: [PATCH v2 7/9] gpu: ipu-v3: only set non-zero AXI ID for IC when PRG
 is absent
Date: Wed,  8 Mar 2017 12:13:19 +0100
Message-ID: <20170308111321.3035-7-l.stach@pengutronix.de>
References: <20170308111321.3035-1-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170308111321.3035-1-l.stach@pengutronix.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, kernel@pengutronix.de, dri-devel@lists.freedesktop.org, patchwork-lst@pengutronix.de
List-Id: devicetree@vger.kernel.org

VXNpbmcgbm9uLXplcm8gQVhJIElEcyBmb3IgYW55dGhpbmcgb3RoZXIgdGhhbiB0aGUgZGlzcGxh
eSBjaGFubmVscwpjb2xsaWRlcyB3aXRoIHRoZSBQUkcgQVhJIHNub29waW5nLCBzbyBvbmx5IGRv
IHRoaXMgaWYgdGhlcmUgaXMgbm8KUFJHIHByZXNlbnQuCgpTaWduZWQtb2ZmLWJ5OiBMdWNhcyBT
dGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT4KLS0tCiBkcml2ZXJzL2dwdS9pcHUtdjMvaXB1
LWltYWdlLWNvbnZlcnQuYyB8IDcgKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2lwdS12My9pcHUt
aW1hZ2UtY29udmVydC5jIGIvZHJpdmVycy9ncHUvaXB1LXYzL2lwdS1pbWFnZS1jb252ZXJ0LmMK
aW5kZXggODA1YjZmYTdiNWY0Li41MjRhNzE3YWIyOGUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2lwdS12My9pcHUtaW1hZ2UtY29udmVydC5jCisrKyBiL2RyaXZlcnMvZ3B1L2lwdS12My9pcHUt
aW1hZ2UtY29udmVydC5jCkBAIC02NzEsNyArNjcxLDEyIEBAIHN0YXRpYyB2b2lkIGluaXRfaWRt
YWNfY2hhbm5lbChzdHJ1Y3QgaXB1X2ltYWdlX2NvbnZlcnRfY3R4ICpjdHgsCiAJaXB1X2ljX3Rh
c2tfaWRtYV9pbml0KGNoYW4tPmljLCBjaGFubmVsLCB3aWR0aCwgaGVpZ2h0LAogCQkJICAgICAg
YnVyc3Rfc2l6ZSwgcm90X21vZGUpOwogCi0JaXB1X2NwbWVtX3NldF9heGlfaWQoY2hhbm5lbCwg
MSk7CisJLyoKKwkgKiBTZXR0aW5nIGEgbm9uLXplcm8gQVhJIElEIGNvbGxpZGVzIHdpdGggdGhl
IFBSRyBBWEkgc25vb3BpbmcsIHNvCisJICogb25seSBkbyB0aGlzIHdoZW4gdGhlcmUgaXMgbm8g
UFJHIHByZXNlbnQuCisJICovCisJaWYgKCFjaGFubmVsLT5pcHUtPnByZ19wcml2KQorCQlpcHVf
Y3BtZW1fc2V0X2F4aV9pZChjaGFubmVsLCAxKTsKIAogCWlwdV9pZG1hY19zZXRfZG91YmxlX2J1
ZmZlcihjaGFubmVsLCBjdHgtPmRvdWJsZV9idWZmZXJpbmcpOwogfQotLSAKMi4xMS4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
