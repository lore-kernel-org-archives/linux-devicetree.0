From: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 08/15] arm64: dts: rockchip: default values for core clocks on
 rk3368
Date: Mon, 17 Dec 2018 13:36:43 +0100
Message-ID: <20181217123650.6773-9-heiko@sntech.de>
References: <20181217123650.6773-1-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20181217123650.6773-1-heiko@sntech.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: linux-rockchip@lists.infradead.org, hjc@rock-chips.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

QWRkIGJldHRlciBkZWZhdWx0IHZhbHVlcyBmb3IgUExMcyBhbmQgY29yZSBjbG9ja3Mgb24gcmsz
MzY4LgpUaGlzIGluY2x1ZGVzIGFsbCBwbGxzIGFzIHdlbGwgYXMgY29yZSBhY2xrLGhjbGsgYW5k
IHBjbGsgaW4KYm90aCB0aGUgY3B1IGFzIHdlbGwgYXMgcGVyaXBoZXJhbCBkb21haW4uCgpTaWdu
ZWQtb2ZmLWJ5OiBIZWlrbyBTdHVlYm5lciA8aGVpa29Ac250ZWNoLmRlPgotLS0KIGFyY2gvYXJt
NjQvYm9vdC9kdHMvcm9ja2NoaXAvcmszMzY4LmR0c2kgfCAxMCArKysrKysrKysrCiAxIGZpbGUg
Y2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9k
dHMvcm9ja2NoaXAvcmszMzY4LmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JvY2tjaGlwL3Jr
MzM2OC5kdHNpCmluZGV4IDcwMTRkMTBiOTU0Yy4uM2VmMWMyN2NiN2QzIDEwMDY0NAotLS0gYS9h
cmNoL2FybTY0L2Jvb3QvZHRzL3JvY2tjaGlwL3JrMzM2OC5kdHNpCisrKyBiL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvcm9ja2NoaXAvcmszMzY4LmR0c2kKQEAgLTY1MCw2ICs2NTAsMTYgQEAKIAkJcm9j
a2NoaXAsZ3JmID0gPCZncmY+OwogCQkjY2xvY2stY2VsbHMgPSA8MT47CiAJCSNyZXNldC1jZWxs
cyA9IDwxPjsKKwkJYXNzaWduZWQtY2xvY2tzID0gPCZjcnUgUExMX0dQTEw+LCA8JmNydSBQTExf
Q1BMTD4sCisJCQkJICA8JmNydSBQTExfTlBMTD4sIDwmY3J1IEFDTEtfQlVTPiwKKwkJCQkgIDwm
Y3J1IEhDTEtfQlVTPiwgPCZjcnUgUENMS19CVVM+LAorCQkJCSAgPCZjcnUgQUNMS19QRVJJPiwg
PCZjcnUgSENMS19QRVJJPiwKKwkJCQkgIDwmY3J1IFBDTEtfUEVSST47CisJCWFzc2lnbmVkLWNs
b2NrLXJhdGVzID0gPDU5NDAwMDAwMD4sIDw0MDAwMDAwMDA+LAorCQkJCSAgICAgICA8NTAwMDAw
MDAwPiwgPDMwMDAwMDAwMD4sCisJCQkJICAgICAgIDwxNTAwMDAwMDA+LCA8NzUwMDAwMDA+LAor
CQkJCSAgICAgICA8MzAwMDAwMDAwPiwgPDE1MDAwMDAwMD4sCisJCQkJICAgICAgIDw3NTAwMDAw
MD47CiAJfTsKIAogCWdyZjogc3lzY29uQGZmNzcwMDAwIHsKLS0gCjIuMTkuMgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
