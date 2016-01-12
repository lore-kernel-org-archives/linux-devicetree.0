From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCH 07/14] ARM: dts: imx6ul: add pwm[1-4] nodes
Date: Tue, 12 Jan 2016 18:21:24 +0100
Message-ID: <1452619291-13625-8-git-send-email-LW@KARO-electronics.de>
References: <1452619291-13625-1-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-2-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-3-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-4-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-5-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-6-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-7-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1452619291-13625-7-git-send-email-LW@KARO-electronics.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
List-Id: devicetree@vger.kernel.org

U2lnbmVkLW9mZi1ieTogTG90aGFyIFdhw59tYW5uIDxMV0BLQVJPLWVsZWN0cm9uaWNzLmRlPgot
LS0KIGFyY2gvYXJtL2Jvb3QvZHRzL2lteDZ1bC5kdHNpIHwgNDQgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDQ0IGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9pbXg2dWwuZHRzaSBiL2FyY2gvYXJt
L2Jvb3QvZHRzL2lteDZ1bC5kdHNpCmluZGV4IDg2Mzc3N2UuLjQwZWE1ZjAgMTAwNjQ0Ci0tLSBh
L2FyY2gvYXJtL2Jvb3QvZHRzL2lteDZ1bC5kdHNpCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2lt
eDZ1bC5kdHNpCkBAIC0yNDgsNiArMjQ4LDUwIEBACiAJCQkJc3RhdHVzID0gImRpc2FibGVkIjsK
IAkJCX07CiAKKwkJCXB3bTE6IHB3bUAwMjA4MDAwMCB7CisJCQkJY29tcGF0aWJsZSA9ICJmc2ws
aW14NnVsLXB3bSIsICJmc2wsaW14MjctcHdtIjsKKwkJCQlyZWcgPSA8MHgwMjA4MDAwMCAweDQw
MDA+OworCQkJCWludGVycnVwdHMgPSA8R0lDX1NQSSAxMTUgSVJRX1RZUEVfTEVWRUxfSElHSD47
CisJCQkJY2xvY2tzID0gPCZjbGtzIElNWDZVTF9DTEtfUFdNMT4sCisJCQkJCSA8JmNsa3MgSU1Y
NlVMX0NMS19QV00xPjsKKwkJCQljbG9jay1uYW1lcyA9ICJpcGciLCAicGVyIjsKKwkJCQkjcHdt
LWNlbGxzID0gPDI+OworCQkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CisJCQl9OworCisJCQlwd20y
OiBwd21AMDIwODQwMDAgeworCQkJCWNvbXBhdGlibGUgPSAiZnNsLGlteDZ1bC1wd20iLCAiZnNs
LGlteDI3LXB3bSI7CisJCQkJcmVnID0gPDB4MDIwODQwMDAgMHg0MDAwPjsKKwkJCQlpbnRlcnJ1
cHRzID0gPEdJQ19TUEkgMTE2IElSUV9UWVBFX0xFVkVMX0hJR0g+OworCQkJCWNsb2NrcyA9IDwm
Y2xrcyBJTVg2VUxfQ0xLX1BXTTI+LAorCQkJCQkgPCZjbGtzIElNWDZVTF9DTEtfUFdNMj47CisJ
CQkJY2xvY2stbmFtZXMgPSAiaXBnIiwgInBlciI7CisJCQkJI3B3bS1jZWxscyA9IDwyPjsKKwkJ
CQlzdGF0dXMgPSAiZGlzYWJsZWQiOworCQkJfTsKKworCQkJcHdtMzogcHdtQDAyMDg4MDAwIHsK
KwkJCQljb21wYXRpYmxlID0gImZzbCxpbXg2dWwtcHdtIiwgImZzbCxpbXgyNy1wd20iOworCQkJ
CXJlZyA9IDwweDAyMDg4MDAwIDB4NDAwMD47CisJCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDEx
NyBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKKwkJCQljbG9ja3MgPSA8JmNsa3MgSU1YNlVMX0NMS19Q
V00zPiwKKwkJCQkJIDwmY2xrcyBJTVg2VUxfQ0xLX1BXTTM+OworCQkJCWNsb2NrLW5hbWVzID0g
ImlwZyIsICJwZXIiOworCQkJCSNwd20tY2VsbHMgPSA8Mj47CisJCQkJc3RhdHVzID0gImRpc2Fi
bGVkIjsKKwkJCX07CisKKwkJCXB3bTQ6IHB3bUAwMjA4YzAwMCB7CisJCQkJY29tcGF0aWJsZSA9
ICJmc2wsaW14NnVsLXB3bSIsICJmc2wsaW14MjctcHdtIjsKKwkJCQlyZWcgPSA8MHgwMjA4YzAw
MCAweDQwMDA+OworCQkJCWludGVycnVwdHMgPSA8R0lDX1NQSSAxMTggSVJRX1RZUEVfTEVWRUxf
SElHSD47CisJCQkJY2xvY2tzID0gPCZjbGtzIElNWDZVTF9DTEtfUFdNND4sCisJCQkJCSA8JmNs
a3MgSU1YNlVMX0NMS19QV000PjsKKwkJCQljbG9jay1uYW1lcyA9ICJpcGciLCAicGVyIjsKKwkJ
CQkjcHdtLWNlbGxzID0gPDI+OworCQkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CisJCQl9OworCiAJ
CQlncHQxOiBncHRAMDIwOTgwMDAgewogCQkJCWNvbXBhdGlibGUgPSAiZnNsLGlteDZ1bC1ncHQi
LCAiZnNsLGlteDZzeC1ncHQiOwogCQkJCXJlZyA9IDwweDAyMDk4MDAwIDB4NDAwMD47Ci0tIAoy
LjEuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFybS1rZXJuZWwK
