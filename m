From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCH 4/4] ARM: dts: imx28-tx28: add trickle-charge config for DS1339
Date: Wed, 11 Oct 2017 13:05:39 +0200
Message-ID: <1507719939-27250-5-git-send-email-LW@KARO-electronics.de>
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

QXMgdGhlIERTMTMzOSBkcml2ZXIgbm93IHN1cHBvcnRzIGVuYWJsaW5nIHRoZSB0cmlja2xlIGNo
YXJnZSBmZWF0dXJlCnZpYSBEVEIsIGFkZCB0aGUgYXBwcm9wcmlhdGUgcHJvcGVydGllcyB0byB1
dGlsaXplIHRoaXMgZmVhdHVyZS4KClNpZ25lZC1vZmYtYnk6IExvdGhhciBXYcOfbWFubiA8TFdA
S0FSTy1lbGVjdHJvbmljcy5kZT4KLS0tCiBhcmNoL2FybS9ib290L2R0cy9pbXgyOC10eDI4LmR0
cyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9h
cmNoL2FybS9ib290L2R0cy9pbXgyOC10eDI4LmR0cyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDI4
LXR4MjguZHRzCmluZGV4IDNjODUyZjcuLjQ2ODRkMmYgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jv
b3QvZHRzL2lteDI4LXR4MjguZHRzCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDI4LXR4Mjgu
ZHRzCkBAIC0zNTgsNiArMzU4LDggQEAKIAlkczEzMzk6IHJ0Y0A2OCB7CiAJCWNvbXBhdGlibGUg
PSAibXhpbSxkczEzMzkiOwogCQlyZWcgPSA8MHg2OD47CisJCXRyaWNrbGUtcmVzaXN0b3Itb2ht
cyA9IDwyNTA+OworCQl0cmlja2xlLWRpb2RlLWRpc2FibGU7CiAJfTsKIH07CiAKLS0gCjIuMS40
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJt
LWtlcm5lbAo=
