From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH v3 9/9] ARM: dts: ls1021a: add pix clock to DCU dts node
Date: Mon,  4 Apr 2016 22:28:41 -0700
Message-ID: <1459834121-25997-10-git-send-email-stefan@agner.ch>
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

VGhlIERDVSBJUCBoYXMgZGlzdGluY3QgY2xvY2sgaW5wdXRzIGZvciByZWdpc3RlciBhY2Nlc3Mg
YW5kIHRoZQpwaXhlbCBjbG9ja3MsIGF0IGxlYXN0IGluIHNvbWUgaW1wbGVtZW50YXRpb25zLiBM
UzEwMjFhIHNlZW1zIHRvCnVzZSB0aGUgc2FtZSBjbG9jaywgdGhlcmVmb3JlIHNwZWNpZnkgdGhl
IHNhbWUgY2xvY2sgZm9yICJkY3UiCmFuZCAicGl4Ii4KClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBB
Z25lciA8c3RlZmFuQGFnbmVyLmNoPgotLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL2xzMTAyMWEuZHRz
aSB8IDUgKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvbHMxMDIxYS5kdHNpIGIvYXJjaC9h
cm0vYm9vdC9kdHMvbHMxMDIxYS5kdHNpCmluZGV4IDJjODRjYTIuLmNkNWM3NmQgMTAwNjQ0Ci0t
LSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2xzMTAyMWEuZHRzaQorKysgYi9hcmNoL2FybS9ib290L2R0
cy9sczEwMjFhLmR0c2kKQEAgLTQ0Myw4ICs0NDMsOSBAQAogCQkJY29tcGF0aWJsZSA9ICJmc2ws
bHMxMDIxYS1kY3UiOwogCQkJcmVnID0gPDB4MCAweDJjZTAwMDAgMHgwIDB4MTAwMDA+OwogCQkJ
aW50ZXJydXB0cyA9IDxHSUNfU1BJIDE3MiBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKLQkJCWNsb2Nr
cyA9IDwmcGxhdGZvcm1fY2xrIDA+OwotCQkJY2xvY2stbmFtZXMgPSAiZGN1IjsKKwkJCWNsb2Nr
cyA9IDwmcGxhdGZvcm1fY2xrIDA+LAorCQkJCTwmcGxhdGZvcm1fY2xrIDA+OworCQkJY2xvY2st
bmFtZXMgPSAiZGN1IiwgInBpeCI7CiAJCQliaWctZW5kaWFuOwogCQkJc3RhdHVzID0gImRpc2Fi
bGVkIjsKIAkJfTsKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
