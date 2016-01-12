From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCH 13/14] ARM: dts: imx6ul: add gpmi support
Date: Tue, 12 Jan 2016 18:21:30 +0100
Message-ID: <1452619291-13625-14-git-send-email-LW@KARO-electronics.de>
References: <1452619291-13625-1-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-2-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-3-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-4-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-5-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-6-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-7-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-8-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-9-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-10-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-11-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-12-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-13-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1452619291-13625-13-git-send-email-LW@KARO-electronics.de>
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
LS0KIGFyY2gvYXJtL2Jvb3QvZHRzL2lteDZ1bC5kdHNpIHwgMzMgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDZ1bC5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMv
aW14NnVsLmR0c2kKaW5kZXggMDEyMzQ4MC4uNzEwZTZjYSAxMDA2NDQKLS0tIGEvYXJjaC9hcm0v
Ym9vdC9kdHMvaW14NnVsLmR0c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvaW14NnVsLmR0c2kK
QEAgLTE0MSw2ICsxNDEsMzkgQEAKIAkJCXJlZyA9IDwweDAwOTAwMDAwIDB4MjAwMDA+OwogCQl9
OwogCisJCWRtYV9hcGJoOiBkbWEtYXBiaEAwMTgwNDAwMCB7CisJCQljb21wYXRpYmxlID0gImZz
bCxpbXg2cS1kbWEtYXBiaCIsICJmc2wsaW14MjgtZG1hLWFwYmgiOworCQkJcmVnID0gPDB4MDE4
MDQwMDAgMHgyMDAwPjsKKwkJCWludGVycnVwdHMgPSA8MCAxMyBJUlFfVFlQRV9MRVZFTF9ISUdI
PiwKKwkJCQkgICAgIDwwIDEzIElSUV9UWVBFX0xFVkVMX0hJR0g+LAorCQkJCSAgICAgPDAgMTMg
SVJRX1RZUEVfTEVWRUxfSElHSD4sCisJCQkJICAgICA8MCAxMyBJUlFfVFlQRV9MRVZFTF9ISUdI
PjsKKwkJCWludGVycnVwdC1uYW1lcyA9ICJncG1pMCIsICJncG1pMSIsICJncG1pMiIsICJncG1p
MyI7CisJCQkjZG1hLWNlbGxzID0gPDE+OworCQkJZG1hLWNoYW5uZWxzID0gPDQ+OworCQkJY2xv
Y2tzID0gPCZjbGtzIElNWDZVTF9DTEtfQVBCSERNQT47CisJCX07CisKKwkJZ3BtaTogZ3BtaS1u
YW5kQDAxODA2MDAwICAgICAgICAgeworCQkJY29tcGF0aWJsZSA9ICJmc2wsaW14NnEtZ3BtaS1u
YW5kIjsKKwkJCSNhZGRyZXNzLWNlbGxzID0gPDE+OworCQkJI3NpemUtY2VsbHMgPSA8MT47CisJ
CQlyZWcgPSA8MHgwMTgwNjAwMCAweDIwMDA+LCA8MHgwMTgwODAwMCAweDIwMDA+OworCQkJcmVn
LW5hbWVzID0gImdwbWktbmFuZCIsICJiY2giOworCQkJaW50ZXJydXB0cyA9IDwwIDE1IElSUV9U
WVBFX0xFVkVMX0hJR0g+OworCQkJaW50ZXJydXB0LW5hbWVzID0gImJjaCI7CisJCQljbG9ja3Mg
PSA8JmNsa3MgSU1YNlVMX0NMS19HUE1JX0lPPiwKKwkJCQkgPCZjbGtzIElNWDZVTF9DTEtfR1BN
SV9BUEI+LAorCQkJCSA8JmNsa3MgSU1YNlVMX0NMS19HUE1JX0JDSD4sCisJCQkJIDwmY2xrcyBJ
TVg2VUxfQ0xLX0dQTUlfQkNIX0FQQj4sCisJCQkJIDwmY2xrcyBJTVg2VUxfQ0xLX1BFUl9CQ0g+
OworCQkJY2xvY2stbmFtZXMgPSAiZ3BtaV9pbyIsICJncG1pX2FwYiIsICJncG1pX2JjaCIsCisJ
CQkJICAgICAgImdwbWlfYmNoX2FwYiIsICJwZXIxX2JjaCI7CisJCQlkbWFzID0gPCZkbWFfYXBi
aCAwPjsKKwkJCWRtYS1uYW1lcyA9ICJyeC10eCI7CisJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwor
CQl9OworCiAJCWFpcHMxOiBhaXBzLWJ1c0AwMjAwMDAwMCB7CiAJCQljb21wYXRpYmxlID0gImZz
bCxhaXBzLWJ1cyIsICJzaW1wbGUtYnVzIjsKIAkJCSNhZGRyZXNzLWNlbGxzID0gPDE+OwotLSAK
Mi4xLjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hcm0ta2VybmVsCg==
