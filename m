From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCHv3 2/5] ARM: dts: imx6-tx6: remove LED pinctrl setting from
 hoggrp
Date: Thu, 31 Mar 2016 14:33:42 +0200
Message-ID: <1459427625-15568-3-git-send-email-LW@KARO-electronics.de>
References: <1459427625-15568-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1459427625-15568-1-git-send-email-LW@KARO-electronics.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Dan Williams <dan.j.williams@intel.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Vinod Koul <vinod.koul@intel.com>, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
List-Id: devicetree@vger.kernel.org

TW92ZSB0aGUgcGluY3RybCBzZXR0aW5nIGZvciB0aGUgYm9hcmQgTEVEIGZyb20gdGhlIGhvZ2dy
cCBub2RlCnRvIGEgc2VwYXJhdGUgbm9kZSByZWZlcmVuY2VkIGJ5IHRoZSBMRUQgZHJpdmVyLCBz
byB0aGF0IHRoZSBwaW4gaXMKZnJlZSB0byBiZSB1c2VkIGZvciBkaWZmZXJlbnQgcHVycG9zZSB3
aGVuIHRoZSBMRUQgZHJpdmVyIGlzIGRpc2FibGVkLgoKU2lnbmVkLW9mZi1ieTogTG90aGFyIFdh
w59tYW5uIDxMV0BLQVJPLWVsZWN0cm9uaWNzLmRlPgotLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL2lt
eDZxZGwtdHg2LmR0c2kgfCA5ICsrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDZx
ZGwtdHg2LmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9pbXg2cWRsLXR4Ni5kdHNpCmluZGV4IGEz
ZTM3YTcuLmQ5NmRiYTIgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDZxZGwtdHg2
LmR0c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvaW14NnFkbC10eDYuZHRzaQpAQCAtODgsNiAr
ODgsOCBAQAogCiAJCXVzZXJfbGVkOiB1c2VyIHsKIAkJCWxhYmVsID0gIkhlYXJ0YmVhdCI7CisJ
CQlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOworCQkJcGluY3RybC0wID0gPCZwaW5jdHJsX3Vz
ZXJfbGVkPjsKIAkJCWdwaW9zID0gPCZncGlvMiAyMCBHUElPX0FDVElWRV9ISUdIPjsKIAkJCWxp
bnV4LGRlZmF1bHQtdHJpZ2dlciA9ICJoZWFydGJlYXQiOwogCQl9OwpAQCAtMzI4LDcgKzMzMCw2
IEBACiAKIAlwaW5jdHJsX2hvZzogaG9nZ3JwIHsKIAkJZnNsLHBpbnMgPSA8Ci0JCQlNWDZRRExf
UEFEX0VJTV9BMThfX0dQSU8yX0lPMjAJCTB4MWIwYjEgLyogTEVEICovCiAJCQlNWDZRRExfUEFE
X1NEM19EQVQyX19HUElPN19JTzA2CQkweDFiMGIxIC8qIEVUTiBQSFkgUkVTRVQgKi8KIAkJCU1Y
NlFETF9QQURfU0QzX0RBVDRfX0dQSU83X0lPMDEJCTB4MWIwYjEgLyogRVROIFBIWSBJTlQgKi8K
IAkJCU1YNlFETF9QQURfRUlNX0EyNV9fR1BJTzVfSU8wMgkJMHgxYjBiMSAvKiBQV1IgQlROICov
CkBAIC02MzQsNiArNjM1LDEyIEBACiAJCQlNWDZRRExfUEFEX1NEM19DTEtfX0dQSU83X0lPMDMJ
CTB4MTcwYjAgLyogU0QyIENEICovCiAJCT47CiAJfTsKKworCXBpbmN0cmxfdXNlcl9sZWQ6IHVz
ZXItbGVkZ3JwIHsKKwkJZnNsLHBpbnMgPSA8CisJCQlNWDZRRExfUEFEX0VJTV9BMThfX0dQSU8y
X0lPMjAJCTB4MWIwYjEgLyogTEVEICovCisJCT47CisJfTsKIH07CiAKICZrcHAgewotLSAKMi4x
LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
cm0ta2VybmVsCg==
