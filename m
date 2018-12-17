From: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 10/15] arm64: dts: rockchip: add dw-hdmi controller on rk3368
Date: Mon, 17 Dec 2018 13:36:45 +0100
Message-ID: <20181217123650.6773-11-heiko@sntech.de>
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

QWRkIHRoZSBjb3JlIG5vZGUgZm9yIHRoZSBkdy1oZG1pIGNvbnRyb2xsZXIgZm91bmQgb24gcmsz
MzY4IHNvY3MuCgpTaWduZWQtb2ZmLWJ5OiBIZWlrbyBTdHVlYm5lciA8aGVpa29Ac250ZWNoLmRl
PgotLS0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvcm9ja2NoaXAvcmszMzY4LmR0c2kgfCAxNCArKysr
KysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JvY2tjaGlwL3JrMzM2OC5kdHNpIGIvYXJjaC9hcm02NC9i
b290L2R0cy9yb2NrY2hpcC9yazMzNjguZHRzaQppbmRleCBlNzljNTk4NWY2MGEuLjRkZGYzODBh
MmMyZCAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9yb2NrY2hpcC9yazMzNjguZHRz
aQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JvY2tjaGlwL3JrMzM2OC5kdHNpCkBAIC04Njgs
NiArODY4LDIwIEBACiAJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CiAJfTsKIAorCWhkbWk6IGhkbWlA
ZmY5ODAwMDAgeworCQljb21wYXRpYmxlID0gInJvY2tjaGlwLHJrMzM2OC1kdy1oZG1pIjsKKwkJ
cmVnID0gPDB4MCAweGZmOTgwMDAwIDB4MCAweDIwMDAwPjsKKwkJcmVnLWlvLXdpZHRoID0gPDQ+
OworCQlyb2NrY2hpcCxncmYgPSA8JmdyZj47CisJCWludGVycnVwdHMgPSA8R0lDX1NQSSAxMDMg
SVJRX1RZUEVfTEVWRUxfSElHSD47CisJCWNsb2NrcyA9IDwmY3J1IFBDTEtfSERNSV9DVFJMPiwK
KwkJCSA8JmNydSBTQ0xLX0hETUlfSERDUD4sCisJCQkgPCZjcnUgU0NMS19IRE1JX0NFQz47CisJ
CWNsb2NrLW5hbWVzID0gImlhaGIiLCAiaXNmciIsICJjZWMiOworCQlwb3dlci1kb21haW5zID0g
PCZwb3dlciBSSzMzNjhfUERfVklPPjsKKwkJc3RhdHVzID0gImRpc2FibGVkIjsKKwl9OworCiAJ
aGV2Y19tbXU6IGlvbW11QGZmOWEwNDQwIHsKIAkJY29tcGF0aWJsZSA9ICJyb2NrY2hpcCxpb21t
dSI7CiAJCXJlZyA9IDwweDAgMHhmZjlhMDQ0MCAweDAgMHg0MD4sCi0tIAoyLjE5LjIKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
