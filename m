From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCH 09/14] ARM: dts: imx6ul: add sdma support
Date: Tue, 12 Jan 2016 18:21:26 +0100
Message-ID: <1452619291-13625-10-git-send-email-LW@KARO-electronics.de>
References: <1452619291-13625-1-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-2-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-3-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-4-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-5-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-6-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-7-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-8-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-9-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1452619291-13625-9-git-send-email-LW@KARO-electronics.de>
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
LS0KIGFyY2gvYXJtL2Jvb3QvZHRzL2lteDZ1bC5kdHNpIHwgMTEgKysrKysrKysrKysKIDEgZmls
ZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9k
dHMvaW14NnVsLmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9pbXg2dWwuZHRzaQppbmRleCBhNTc4
YjIzLi45NmI3OGE5IDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9pbXg2dWwuZHRzaQor
KysgYi9hcmNoL2FybS9ib290L2R0cy9pbXg2dWwuZHRzaQpAQCAtNTU2LDYgKzU1NiwxNyBAQAog
CQkJCWNsb2NrLW5hbWVzID0gImlwZyIsICJwZXIiOwogCQkJfTsKIAorCQkJc2RtYTogc2RtYUAw
MjBlYzAwMCB7CisJCQkJY29tcGF0aWJsZSA9ICJmc2wsaW14NnEtc2RtYSIsICJmc2wsaW14MzUt
c2RtYSI7CisJCQkJcmVnID0gPDB4MDIwZWMwMDAgMHg0MDAwPjsKKwkJCQlpbnRlcnJ1cHRzID0g
PEdJQ19TUEkgMiBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKKwkJCQljbG9ja3MgPSA8JmNsa3MgSU1Y
NlVMX0NMS19TRE1BPiwKKwkJCQkJIDwmY2xrcyBJTVg2VUxfQ0xLX1NETUE+OworCQkJCWNsb2Nr
LW5hbWVzID0gImlwZyIsICJhaGIiOworCQkJCSNkbWEtY2VsbHMgPSA8Mz47CisJCQkJZnNsLHNk
bWEtcmFtLXNjcmlwdC1uYW1lID0gImlteC9zZG1hL3NkbWEtaW14NnEuYmluIjsKKwkJCX07CisK
IAkJCXB3bTU6IHB3bUAwMjBmMDAwMCB7CiAJCQkJY29tcGF0aWJsZSA9ICJmc2wsaW14NnVsLXB3
bSIsICJmc2wsaW14MjctcHdtIjsKIAkJCQlyZWcgPSA8MHgwMjBmMDAwMCAweDQwMDA+OwotLSAK
Mi4xLjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hcm0ta2VybmVsCg==
