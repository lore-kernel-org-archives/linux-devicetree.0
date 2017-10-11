From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCH 3/4] ARM: dts: imx28-tx28: fix interrupt flags and use
 interrupts-extended property
Date: Wed, 11 Oct 2017 13:05:38 +0200
Message-ID: <1507719939-27250-4-git-send-email-LW@KARO-electronics.de>
References: <1507719939-27250-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1507719939-27250-1-git-send-email-LW@KARO-electronics.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Fabio Estevam <fabio.estevam@nxp.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
List-Id: devicetree@vger.kernel.org

VXNlIHRoZSBjb3JyZWN0IGludGVycnVwdCBmbGFncyBhbmQgY2hhbmdlIHRoZSAnaW50ZXJydXB0
LXBhcmVudCcsCidpbnRlcnJ1cHRzJyBwcm9wZXJ0eSBwYWlycyB0byAnaW50ZXJydXB0cy1leHRl
bmRlZCcuCgpTaWduZWQtb2ZmLWJ5OiBMb3RoYXIgV2HDn21hbm4gPExXQEtBUk8tZWxlY3Ryb25p
Y3MuZGU+Ci0tLQogYXJjaC9hcm0vYm9vdC9kdHMvaW14MjgtdHgyOC5kdHMgfCA5ICsrKy0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9pbXgyOC10eDI4LmR0cyBiL2FyY2gvYXJtL2Jvb3Qv
ZHRzL2lteDI4LXR4MjguZHRzCmluZGV4IDIxMWU2N2QuLjNjODUyZjcgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvYXJtL2Jvb3QvZHRzL2lteDI4LXR4MjguZHRzCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2lt
eDI4LXR4MjguZHRzCkBAIC0zMjgsOCArMzI4LDcgQEAKIAkJcmVnID0gPDB4MjA+OwogCQlwaW5j
dHJsLW5hbWVzID0gImRlZmF1bHQiOwogCQlwaW5jdHJsLTAgPSA8JnR4MjhfcGNhOTU1NF9waW5z
PjsKLQkJaW50ZXJydXB0LXBhcmVudCA9IDwmZ3BpbzM+OwotCQlpbnRlcnJ1cHRzID0gPDI4IDA+
OworCQlpbnRlcnJ1cHRzLWV4dGVuZGVkID0gPCZncGlvMyAyOCBJUlFfVFlQRV9OT05FPjsKIAkJ
Z3Bpby1jb250cm9sbGVyOwogCQkjZ3Bpby1jZWxscyA9IDwyPjsKIAkJaW50ZXJydXB0LWNvbnRy
b2xsZXI7CkBAIC0zNDEsOCArMzQwLDcgQEAKIAkJcmVnID0gPDB4Mzg+OwogCQlwaW5jdHJsLW5h
bWVzID0gImRlZmF1bHQiOwogCQlwaW5jdHJsLTAgPSA8JnR4MjhfZWR0X2Z0NXgwNl9waW5zPjsK
LQkJaW50ZXJydXB0LXBhcmVudCA9IDwmZ3BpbzI+OwotCQlpbnRlcnJ1cHRzID0gPDUgSVJRX1RZ
UEVfRURHRV9GQUxMSU5HPjsKKwkJaW50ZXJydXB0cy1leHRlbmRlZCA9IDwmZ3BpbzIgNSBJUlFf
VFlQRV9FREdFX0ZBTExJTkc+OwogCQlyZXNldC1ncGlvcyA9IDwmZ3BpbzIgNiBHUElPX0FDVElW
RV9MT1c+OwogCQl3YWtlLWdwaW9zID0gPCZncGlvNCA5IEdQSU9fQUNUSVZFX0hJR0g+OwogCX07
CkBAIC0zNTIsOCArMzUwLDcgQEAKIAkJcmVnID0gPDB4NDg+OwogCQlwaW5jdHJsLW5hbWVzID0g
ImRlZmF1bHQiOwogCQlwaW5jdHJsLTAgPSA8JnR4MjhfdHNjMjAwN19waW5zPjsKLQkJaW50ZXJy
dXB0LXBhcmVudCA9IDwmZ3BpbzM+OwotCQlpbnRlcnJ1cHRzID0gPDIwIDA+OworCQlpbnRlcnJ1
cHRzLWV4dGVuZGVkID0gPCZncGlvMyAyMCBJUlFfVFlQRV9FREdFX0ZBTExJTkc+OwogCQlwZW5k
b3duLWdwaW8gPSA8JmdwaW8zIDIwIEdQSU9fQUNUSVZFX0xPVz47CiAJCXRpLHgtcGxhdGUtb2ht
cyA9IC9iaXRzLyAxNiA8NjYwPjsKIAl9OwotLSAKMi4xLjQKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlz
dApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
