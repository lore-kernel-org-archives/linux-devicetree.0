From: Eric Anholt <eric@anholt.net>
Subject: [PATCH 5/5] ARM: bcm2835: Add the DPI hardware to the device tree.
Date: Fri, 18 Mar 2016 19:42:46 -0700
Message-ID: <1458355366-7073-6-git-send-email-eric@anholt.net>
References: <1458355366-7073-1-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1458355366-7073-1-git-send-email-eric@anholt.net>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: linux-rpi-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

SXQncyBjdXJyZW50bHkgbWFya2VkIGRpc2FibGVkLCBhcyBpdCdzIG5vdCB1c2VmdWwgd2l0aG91
dCBhIHBhbmVsCmFzc29jaWF0ZWQgd2l0aCBpdCBhbmQgdGhlIEdQSU8gcGlucyByb3V0ZWQgdG8g
QUxUMi4KClNpZ25lZC1vZmYtYnk6IEVyaWMgQW5ob2x0IDxlcmljQGFuaG9sdC5uZXQ+Ci0tLQog
YXJjaC9hcm0vYm9vdC9kdHMvYmNtMjgzeC5kdHNpIHwgMTEgKysrKysrKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMv
YmNtMjgzeC5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvYmNtMjgzeC5kdHNpCmluZGV4IGJiZTRl
YWIuLmQxZTYzNDAgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2JjbTI4M3guZHRzaQor
KysgYi9hcmNoL2FybS9ib290L2R0cy9iY20yODN4LmR0c2kKQEAgLTE2Niw2ICsxNjYsMTcgQEAK
IAkJCWludGVycnVwdHMgPSA8MiAxND47IC8qIHB3YTEgKi8KIAkJfTsKIAorCQlkcGk6IGRwaUA3
ZTIwODAwMCB7CisJCQljb21wYXRpYmxlID0gImJyY20sYmNtMjgzNS1kcGkiOworCQkJcmVnID0g
PDB4N2UyMDgwMDAgMHg4Yz47CisJCQljbG9ja3MgPSA8JmNsb2NrcyBCQ00yODM1X0NMT0NLX1ZQ
VT4sCisJCQkJIDwmY2xvY2tzIEJDTTI4MzVfQ0xPQ0tfRFBJPjsKKwkJCWNsb2NrLW5hbWVzID0g
ImNvcmUiLCAicGl4ZWwiOworCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CisJCQkjc2l6ZS1jZWxs
cyA9IDwwPjsKKwkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CisJCX07CisKIAkJYXV4OiBhdXhAMHg3
ZTIxNTAwMCB7CiAJCQljb21wYXRpYmxlID0gImJyY20sYmNtMjgzNS1hdXgiOwogCQkJI2Nsb2Nr
LWNlbGxzID0gPDE+OwotLSAKMi43LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
