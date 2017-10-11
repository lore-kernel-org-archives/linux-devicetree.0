From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCH 5/7] ARM: dts: imx53-tx53: use explicit pad_ctl settings for
 I2C pins
Date: Wed, 11 Oct 2017 13:07:39 +0200
Message-ID: <1507720061-27666-6-git-send-email-LW@KARO-electronics.de>
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

RG9uJ3QgcmVseSBvbiB0aGUgcGFkY3RsIHNldHRpbmdzIGVzdGFibGlzaGVkIGJ5IHRoZSBib290
IGxvYWRlciwgYnV0CmV4cGxpY2l0bHkgc3BlY2lmeSB0aGUgcGFkY3RsIHZhbHVlcyBpbiBEVEIu
IFRoaXMgaXMgYWxzbyBuZWNlc3NhcnkgdG8KYmUgYWJsZSB0byB1c2UgdGhlIERUQiBmaWxlcyBm
cm9tIHRoZSBMaW51eCBrZXJuZWwgZm9yIGZ1dHVyZSBVLUJvb3QKdmVyc2lvbnMgdGhhdCBzdXBw
b3J0IEhXIGNvbmZpZ3VyYXRpb24gdmlhIERUQi4KClNpZ25lZC1vZmYtYnk6IExvdGhhciBXYcOf
bWFubiA8TFdAS0FSTy1lbGVjdHJvbmljcy5kZT4KLS0tCiBhcmNoL2FybS9ib290L2R0cy9pbXg1
My10eDUzLmR0c2kgfCA4ICsrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
LCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDUzLXR4
NTMuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDUzLXR4NTMuZHRzaQppbmRleCA3Mjk3MWRh
OC4uMzM5MzRlNSAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvaW14NTMtdHg1My5kdHNp
CisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDUzLXR4NTMuZHRzaQpAQCAtMzg5LDE1ICszODks
MTUgQEAKIAogCQlwaW5jdHJsX2kyYzE6IGkyYzFncnAgewogCQkJZnNsLHBpbnMgPSA8Ci0JCQkJ
TVg1M19QQURfRUlNX0QyMV9fSTJDMV9TQ0wJCTB4YzAwMDAwMDAKLQkJCQlNWDUzX1BBRF9FSU1f
RDI4X19JMkMxX1NEQQkJMHhjMDAwMDAwMAorCQkJCU1YNTNfUEFEX0VJTV9EMjFfX0kyQzFfU0NM
CQkweDQwMDAwMWU0CisJCQkJTVg1M19QQURfRUlNX0QyOF9fSTJDMV9TREEJCTB4NDAwMDAxZTQK
IAkJCT47CiAJCX07CiAKIAkJcGluY3RybF9pMmMzOiBpMmMzZ3JwIHsKIAkJCWZzbCxwaW5zID0g
PAotCQkJCU1YNTNfUEFEX0dQSU9fM19fSTJDM19TQ0wJCTB4YzAwMDAwMDAKLQkJCQlNWDUzX1BB
RF9HUElPXzZfX0kyQzNfU0RBCQkweGMwMDAwMDAwCisJCQkJTVg1M19QQURfR1BJT18zX19JMkMz
X1NDTAkJMHg0MDAwMDFlNAorCQkJCU1YNTNfUEFEX0dQSU9fNl9fSTJDM19TREEJCTB4NDAwMDAx
ZTQKIAkJCT47CiAJCX07CiAKLS0gCjIuMS40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgt
YXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
