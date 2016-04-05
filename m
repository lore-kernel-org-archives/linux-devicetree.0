From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH v3 7/9] ARM: dts: vf610: add display nodes
Date: Mon,  4 Apr 2016 22:28:39 -0700
Message-ID: <1459834121-25997-8-git-send-email-stefan@agner.ch>
References: <1459834121-25997-1-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1459834121-25997-1-git-send-email-stefan@agner.ch>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, shawnguo@kernel.org, stefan@agner.ch
Cc: meng.yi@nxp.com, pawel.moll@arm.com, alison.wang@freescale.com, daniel.vetter@ffwll.ch, mturquette@baylibre.com, ijc+devicetree@hellion.org.uk, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, kernel@pengutronix.de, galak@codeaurora.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, alexander.stein@systec-electronic.com
List-Id: devicetree@vger.kernel.org

QWRkIHRoZSBkY3UgYW5kIHRjb24gbm9kZXMgdG8gZW5hYmxlIHRoZSBEaXNwbGF5IENvbnRyb2xs
ZXIgVW5pdAphbmQgVGltaW5nIENvbnRyb2xsZXIgaW4gVnlicmlkJ3MgU29DIGxldmVsIGRldmlj
ZS10cmVlIGZpbGUuCgpTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gQWduZXIgPHN0ZWZhbkBhZ25lci5j
aD4KLS0tCiBhcmNoL2FybS9ib290L2R0cy92Znh4eC5kdHNpIHwgMTkgKysrKysrKysrKysrKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNo
L2FybS9ib290L2R0cy92Znh4eC5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvdmZ4eHguZHRzaQpp
bmRleCBhOWNlYjViLi43OGUyNGM2IDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy92Znh4
eC5kdHNpCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3ZmeHh4LmR0c2kKQEAgLTIzNCw2ICsyMzQs
MTQgQEAKIAkJCQkJCQk8MjAwMDAwMDA+OwogCQkJfTsKIAorCQkJdGNvbjA6IHRpbWluZy1jb250
cm9sbGVyQDQwMDNkMDAwIHsKKwkJCQljb21wYXRpYmxlID0gImZzbCx2ZjYxMC10Y29uIjsKKwkJ
CQlyZWcgPSA8MHg0MDAzZDAwMCAweDEwMDA+OworCQkJCWNsb2NrcyA9IDwmY2xrcyBWRjYxMF9D
TEtfVENPTjA+OworCQkJCWNsb2NrLW5hbWVzID0gImlwZyI7CisJCQkJc3RhdHVzID0gImRpc2Fi
bGVkIjsKKwkJCX07CisKIAkJCXdkb2dhNTogd2RvZ0A0MDAzZTAwMCB7CiAJCQkJY29tcGF0aWJs
ZSA9ICJmc2wsdmY2MTAtd2R0IiwgImZzbCxpbXgyMS13ZHQiOwogCQkJCXJlZyA9IDwweDQwMDNl
MDAwIDB4MTAwMD47CkBAIC0zMzksNiArMzQ3LDE3IEBACiAJCQkJc3RhdHVzID0gImRpc2FibGVk
IjsKIAkJCX07CiAKKwkJCWRjdTA6IGRjdUA0MDA1ODAwMCB7CisJCQkJY29tcGF0aWJsZSA9ICJm
c2wsdmY2MTAtZGN1IjsKKwkJCQlyZWcgPSA8MHg0MDA1ODAwMCAweDEyMDA+OworCQkJCWludGVy
cnVwdHMgPSA8MzAgSVJRX1RZUEVfTEVWRUxfSElHSD47CisJCQkJY2xvY2tzID0gPCZjbGtzIFZG
NjEwX0NMS19EQ1UwPiwKKwkJCQkJPCZjbGtzIFZGNjEwX0NMS19EQ1UwX0RJVj47CisJCQkJY2xv
Y2stbmFtZXMgPSAiZGN1IiwgInBpeCI7CisJCQkJZnNsLHRjb24gPSA8JnRjb24wPjsKKwkJCQlz
dGF0dXMgPSAiZGlzYWJsZWQiOworCQkJfTsKKwogCQkJaTJjMDogaTJjQDQwMDY2MDAwIHsKIAkJ
CQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKIAkJCQkjc2l6ZS1jZWxscyA9IDwwPjsKLS0gCjIuNy40
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
