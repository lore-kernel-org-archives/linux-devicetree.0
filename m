From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCH 4/7] ARM: dts: imx53-tx53: add trickle-charge config for DS1339
Date: Wed, 11 Oct 2017 13:07:38 +0200
Message-ID: <1507720061-27666-5-git-send-email-LW@KARO-electronics.de>
References: <1507720061-27666-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1507720061-27666-1-git-send-email-LW@KARO-electronics.de>
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

QXMgdGhlIERTMTMzOSBkcml2ZXIgbm93IHN1cHBvcnRzIGVuYWJsaW5nIHRoZSB0cmlja2xlIGNo
YXJnZSBmZWF0dXJlCnZpYSBEVEIsIGFkZCB0aGUgYXBwcm9wcmlhdGUgcHJvcGVydGllcyB0byB1
dGlsaXplIHRoaXMgZmVhdHVyZS4KClNpZ25lZC1vZmYtYnk6IExvdGhhciBXYcOfbWFubiA8TFdA
S0FSTy1lbGVjdHJvbmljcy5kZT4KLS0tCiBhcmNoL2FybS9ib290L2R0cy9pbXg1My10eDUzLmR0
c2kgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
YXJjaC9hcm0vYm9vdC9kdHMvaW14NTMtdHg1My5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvaW14
NTMtdHg1My5kdHNpCmluZGV4IGEzZTdjZjkuLjcyOTcxZGE4IDEwMDY0NAotLS0gYS9hcmNoL2Fy
bS9ib290L2R0cy9pbXg1My10eDUzLmR0c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvaW14NTMt
dHg1My5kdHNpCkBAIC0yNDUsNiArMjQ1LDggQEAKIAkJcGluY3RybC0wID0gPCZwaW5jdHJsX2Rz
MTMzOT47CiAJCWludGVycnVwdC1wYXJlbnQgPSA8JmdwaW80PjsKIAkJaW50ZXJydXB0cyA9IDwy
MCAwPjsKKwkJdHJpY2tsZS1yZXNpc3Rvci1vaG1zID0gPDI1MD47CisJCXRyaWNrbGUtZGlvZGUt
ZGlzYWJsZTsKIAl9OwogfTsKIAotLSAKMi4xLjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51
eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
