From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCHv2 07/16] ARM: dts: imx6ul: add pwm[1-4] nodes
Date: Wed, 20 Jan 2016 11:09:00 +0100
Message-ID: <1453284549-16363-8-git-send-email-LW@KARO-electronics.de>
References: <1452619291-13625-1-git-send-email-LW@KARO-electronics.de>
 <1453284549-16363-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1453284549-16363-1-git-send-email-LW@KARO-electronics.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Anson Huang <b20788@freescale.com>, Bai Ping <b51503@freescale.com>, Frank Li <Frank.Li@freescale.com>, Fugang Duan <B38611@freescale.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

QWRkIGRldmljZSBub2RlcyBmb3IgdGhlIFBXTSB1aW5pdHMgMS4uNCB3aGljaCB3ZXJlIG1pc3Np
bmcgaW4gdGhlCm9yaWdpbmFsIGNvbW1pdCBmb3IgaS5NWDZVTCBzdXBwb3J0LgoKU2lnbmVkLW9m
Zi1ieTogTG90aGFyIFdhw59tYW5uIDxMV0BLQVJPLWVsZWN0cm9uaWNzLmRlPgotLS0KIGFyY2gv
YXJtL2Jvb3QvZHRzL2lteDZ1bC5kdHNpIHwgNDQgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDQ0IGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9pbXg2dWwuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRz
L2lteDZ1bC5kdHNpCmluZGV4IDg2Mzc3N2UuLjQwZWE1ZjAgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJt
L2Jvb3QvZHRzL2lteDZ1bC5kdHNpCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDZ1bC5kdHNp
CkBAIC0yNDgsNiArMjQ4LDUwIEBACiAJCQkJc3RhdHVzID0gImRpc2FibGVkIjsKIAkJCX07CiAK
KwkJCXB3bTE6IHB3bUAwMjA4MDAwMCB7CisJCQkJY29tcGF0aWJsZSA9ICJmc2wsaW14NnVsLXB3
bSIsICJmc2wsaW14MjctcHdtIjsKKwkJCQlyZWcgPSA8MHgwMjA4MDAwMCAweDQwMDA+OworCQkJ
CWludGVycnVwdHMgPSA8R0lDX1NQSSAxMTUgSVJRX1RZUEVfTEVWRUxfSElHSD47CisJCQkJY2xv
Y2tzID0gPCZjbGtzIElNWDZVTF9DTEtfUFdNMT4sCisJCQkJCSA8JmNsa3MgSU1YNlVMX0NMS19Q
V00xPjsKKwkJCQljbG9jay1uYW1lcyA9ICJpcGciLCAicGVyIjsKKwkJCQkjcHdtLWNlbGxzID0g
PDI+OworCQkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CisJCQl9OworCisJCQlwd20yOiBwd21AMDIw
ODQwMDAgeworCQkJCWNvbXBhdGlibGUgPSAiZnNsLGlteDZ1bC1wd20iLCAiZnNsLGlteDI3LXB3
bSI7CisJCQkJcmVnID0gPDB4MDIwODQwMDAgMHg0MDAwPjsKKwkJCQlpbnRlcnJ1cHRzID0gPEdJ
Q19TUEkgMTE2IElSUV9UWVBFX0xFVkVMX0hJR0g+OworCQkJCWNsb2NrcyA9IDwmY2xrcyBJTVg2
VUxfQ0xLX1BXTTI+LAorCQkJCQkgPCZjbGtzIElNWDZVTF9DTEtfUFdNMj47CisJCQkJY2xvY2st
bmFtZXMgPSAiaXBnIiwgInBlciI7CisJCQkJI3B3bS1jZWxscyA9IDwyPjsKKwkJCQlzdGF0dXMg
PSAiZGlzYWJsZWQiOworCQkJfTsKKworCQkJcHdtMzogcHdtQDAyMDg4MDAwIHsKKwkJCQljb21w
YXRpYmxlID0gImZzbCxpbXg2dWwtcHdtIiwgImZzbCxpbXgyNy1wd20iOworCQkJCXJlZyA9IDww
eDAyMDg4MDAwIDB4NDAwMD47CisJCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDExNyBJUlFfVFlQ
RV9MRVZFTF9ISUdIPjsKKwkJCQljbG9ja3MgPSA8JmNsa3MgSU1YNlVMX0NMS19QV00zPiwKKwkJ
CQkJIDwmY2xrcyBJTVg2VUxfQ0xLX1BXTTM+OworCQkJCWNsb2NrLW5hbWVzID0gImlwZyIsICJw
ZXIiOworCQkJCSNwd20tY2VsbHMgPSA8Mj47CisJCQkJc3RhdHVzID0gImRpc2FibGVkIjsKKwkJ
CX07CisKKwkJCXB3bTQ6IHB3bUAwMjA4YzAwMCB7CisJCQkJY29tcGF0aWJsZSA9ICJmc2wsaW14
NnVsLXB3bSIsICJmc2wsaW14MjctcHdtIjsKKwkJCQlyZWcgPSA8MHgwMjA4YzAwMCAweDQwMDA+
OworCQkJCWludGVycnVwdHMgPSA8R0lDX1NQSSAxMTggSVJRX1RZUEVfTEVWRUxfSElHSD47CisJ
CQkJY2xvY2tzID0gPCZjbGtzIElNWDZVTF9DTEtfUFdNND4sCisJCQkJCSA8JmNsa3MgSU1YNlVM
X0NMS19QV000PjsKKwkJCQljbG9jay1uYW1lcyA9ICJpcGciLCAicGVyIjsKKwkJCQkjcHdtLWNl
bGxzID0gPDI+OworCQkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CisJCQl9OworCiAJCQlncHQxOiBn
cHRAMDIwOTgwMDAgewogCQkJCWNvbXBhdGlibGUgPSAiZnNsLGlteDZ1bC1ncHQiLCAiZnNsLGlt
eDZzeC1ncHQiOwogCQkJCXJlZyA9IDwweDAyMDk4MDAwIDB4NDAwMD47Ci0tIAoyLjEuNAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1r
ZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJu
ZWwK
