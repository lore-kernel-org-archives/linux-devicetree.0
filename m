From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCH 05/14] ARM: dts: imx6ul: specify proper clocks for the PWM
 nodes
Date: Tue, 12 Jan 2016 18:21:22 +0100
Message-ID: <1452619291-13625-6-git-send-email-LW@KARO-electronics.de>
References: <1452619291-13625-1-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-2-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-3-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-4-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-5-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1452619291-13625-5-git-send-email-LW@KARO-electronics.de>
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
LS0KIGFyY2gvYXJtL2Jvb3QvZHRzL2lteDZ1bC5kdHNpIHwgMTYgKysrKysrKystLS0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9hcmNoL2FybS9ib290L2R0cy9pbXg2dWwuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL2lt
eDZ1bC5kdHNpCmluZGV4IGU2ZTNlNTQuLjNhYmEwYmIgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jv
b3QvZHRzL2lteDZ1bC5kdHNpCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDZ1bC5kdHNpCkBA
IC01MDgsOCArNTA4LDggQEAKIAkJCQljb21wYXRpYmxlID0gImZzbCxpbXg2dWwtcHdtIiwgImZz
bCxpbXgyNy1wd20iOwogCQkJCXJlZyA9IDwweDAyMGYwMDAwIDB4NDAwMD47CiAJCQkJaW50ZXJy
dXB0cyA9IDxHSUNfU1BJIDExNCBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKLQkJCQljbG9ja3MgPSA8
JmNsa3MgSU1YNlVMX0NMS19EVU1NWT4sCi0JCQkJCSA8JmNsa3MgSU1YNlVMX0NMS19EVU1NWT47
CisJCQkJY2xvY2tzID0gPCZjbGtzIElNWDZVTF9DTEtfUFdNNT4sCisJCQkJCSA8JmNsa3MgSU1Y
NlVMX0NMS19QV001PjsKIAkJCQljbG9jay1uYW1lcyA9ICJpcGciLCAicGVyIjsKIAkJCQkjcHdt
LWNlbGxzID0gPDI+OwogCQkJfTsKQEAgLTUxOCw4ICs1MTgsOCBAQAogCQkJCWNvbXBhdGlibGUg
PSAiZnNsLGlteDZ1bC1wd20iLCAiZnNsLGlteDI3LXB3bSI7CiAJCQkJcmVnID0gPDB4MDIwZjQw
MDAgMHg0MDAwPjsKIAkJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMTE1IElSUV9UWVBFX0xFVkVM
X0hJR0g+OwotCQkJCWNsb2NrcyA9IDwmY2xrcyBJTVg2VUxfQ0xLX0RVTU1ZPiwKLQkJCQkJIDwm
Y2xrcyBJTVg2VUxfQ0xLX0RVTU1ZPjsKKwkJCQljbG9ja3MgPSA8JmNsa3MgSU1YNlVMX0NMS19Q
V002PiwKKwkJCQkJIDwmY2xrcyBJTVg2VUxfQ0xLX1BXTTY+OwogCQkJCWNsb2NrLW5hbWVzID0g
ImlwZyIsICJwZXIiOwogCQkJCSNwd20tY2VsbHMgPSA8Mj47CiAJCQl9OwpAQCAtNTI4LDggKzUy
OCw4IEBACiAJCQkJY29tcGF0aWJsZSA9ICJmc2wsaW14NnVsLXB3bSIsICJmc2wsaW14MjctcHdt
IjsKIAkJCQlyZWcgPSA8MHgwMjBmODAwMCAweDQwMDA+OwogCQkJCWludGVycnVwdHMgPSA8R0lD
X1NQSSAxMTYgSVJRX1RZUEVfTEVWRUxfSElHSD47Ci0JCQkJY2xvY2tzID0gPCZjbGtzIElNWDZV
TF9DTEtfRFVNTVk+LAotCQkJCQkgPCZjbGtzIElNWDZVTF9DTEtfRFVNTVk+OworCQkJCWNsb2Nr
cyA9IDwmY2xrcyBJTVg2VUxfQ0xLX1BXTTc+LAorCQkJCQkgPCZjbGtzIElNWDZVTF9DTEtfUFdN
Nz47CiAJCQkJY2xvY2stbmFtZXMgPSAiaXBnIiwgInBlciI7CiAJCQkJI3B3bS1jZWxscyA9IDwy
PjsKIAkJCX07CkBAIC01MzgsOCArNTM4LDggQEAKIAkJCQljb21wYXRpYmxlID0gImZzbCxpbXg2
dWwtcHdtIiwgImZzbCxpbXgyNy1wd20iOwogCQkJCXJlZyA9IDwweDAyMGZjMDAwIDB4NDAwMD47
CiAJCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDExNyBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKLQkJ
CQljbG9ja3MgPSA8JmNsa3MgSU1YNlVMX0NMS19EVU1NWT4sCi0JCQkJCSA8JmNsa3MgSU1YNlVM
X0NMS19EVU1NWT47CisJCQkJY2xvY2tzID0gPCZjbGtzIElNWDZVTF9DTEtfUFdNOD4sCisJCQkJ
CSA8JmNsa3MgSU1YNlVMX0NMS19QV004PjsKIAkJCQljbG9jay1uYW1lcyA9ICJpcGciLCAicGVy
IjsKIAkJCQkjcHdtLWNlbGxzID0gPDI+OwogCQkJfTsKLS0gCjIuMS40CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWls
aW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
