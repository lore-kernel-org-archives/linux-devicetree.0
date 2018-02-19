From: =?UTF-8?q?Myl=C3=A8ne=20Josserand?= <mylene.josserand@bootlin.com>
Subject: [PATCH v3 4/7] ARM: dts: sun8i: Add R_CPUCFG device node for the A83T
 dtsi
Date: Mon, 19 Feb 2018 09:18:34 +0100
Message-ID: <20180219081837.15482-5-mylene.josserand@bootlin.com>
References: <20180219081837.15482-1-mylene.josserand@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180219081837.15482-1-mylene.josserand@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: maxime.ripard@bootlin.com, wens@csie.org, linux@armlinux.org.uk, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, quentin.schulz@bootlin.com, linux-kernel@vger.kernel.org, clabbe.montjoie@gmail.com, thomas.petazzoni@bootlin.com, mylene.josserand@bootlin.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

VGhlIFJfQ1BVQ0ZHIGlzIGEgY29sbGVjdGlvbiBvZiByZWdpc3RlcnMgbmVlZGVkIGZvciBTTVAg
YnJpbmd1cApvbiBjbHVzdGVycyBhbmQgY2x1c3RlcidzIHJlc2V0LgpGb3IgdGhlIG1vbWVudCwg
ZG9jdW1lbnRhdGlvbiBhYm91dCB0aGlzIHJlZ2lzdGVyIGlzIGZvdW5kIGluCkFsbHdpbm5lcidz
IGNvZGUgb25seS4KClNpZ25lZC1vZmYtYnk6IE15bMOobmUgSm9zc2VyYW5kIDxteWxlbmUuam9z
c2VyYW5kQGJvb3RsaW4uY29tPgotLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL3N1bjhpLWE4M3QuZHRz
aSB8IDUgKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9hcmNoL2FybS9ib290L2R0cy9zdW44aS1hODN0LmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9z
dW44aS1hODN0LmR0c2kKaW5kZXggM2U3MzE3ZWMzZTQzLi43YWU2MzFmYzA0ZDUgMTAwNjQ0Ci0t
LSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N1bjhpLWE4M3QuZHRzaQorKysgYi9hcmNoL2FybS9ib290
L2R0cy9zdW44aS1hODN0LmR0c2kKQEAgLTcxNCw2ICs3MTQsMTEgQEAKIAkJCSNyZXNldC1jZWxs
cyA9IDwxPjsKIAkJfTsKIAorCQlyX2NwdWNmZ0AxZjAxYzAwIHsKKwkJCWNvbXBhdGlibGUgPSAi
YWxsd2lubmVyLHN1bjhpLWE4M3Qtci1jcHVjZmciOworCQkJcmVnID0gPDB4MWYwMWMwMCAweDEw
MD47CisJCX07CisKIAkJcl9waW86IHBpbmN0cmxAMWYwMmMwMCB7CiAJCQljb21wYXRpYmxlID0g
ImFsbHdpbm5lcixzdW44aS1hODN0LXItcGluY3RybCI7CiAJCQlyZWcgPSA8MHgwMWYwMmMwMCAw
eDQwMD47Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVs
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
