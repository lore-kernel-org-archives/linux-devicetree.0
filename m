From: Eric Anholt <eric@anholt.net>
Subject: [PATCH 6/7] ARM: bcm2835: Add the DDC I2C controller to the device
 tree.
Date: Wed, 12 Aug 2015 17:56:19 -0700
Message-ID: <1439427380-2436-7-git-send-email-eric@anholt.net>
References: <1439427380-2436-1-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1439427380-2436-1-git-send-email-eric@anholt.net>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

V2UgbmVlZCB0byB1c2UgaXQgZm9yIGdldHRpbmcgdmlkZW8gbW9kZXMgb3ZlciBIRE1JLgoKU2ln
bmVkLW9mZi1ieTogRXJpYyBBbmhvbHQgPGVyaWNAYW5ob2x0Lm5ldD4KLS0tCiBhcmNoL2FybS9i
b290L2R0cy9iY20yODM1LmR0c2kgfCA5ICsrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDkgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2JjbTI4MzUuZHRzaSBi
L2FyY2gvYXJtL2Jvb3QvZHRzL2JjbTI4MzUuZHRzaQppbmRleCAzMDFjNzNmLi44ZjNiYTg4IDEw
MDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9iY20yODM1LmR0c2kKKysrIGIvYXJjaC9hcm0v
Ym9vdC9kdHMvYmNtMjgzNS5kdHNpCkBAIC0xNDksNiArMTQ5LDE1IEBACiAJCQlzdGF0dXMgPSAi
ZGlzYWJsZWQiOwogCQl9OwogCisJCWkyYzI6IGkyY0A3ZTgwNTAwMCB7CisJCQljb21wYXRpYmxl
ID0gImJyY20sYmNtMjgzNS1pMmMiOworCQkJcmVnID0gPDB4N2U4MDUwMDAgMHgxMDAwPjsKKwkJ
CWludGVycnVwdHMgPSA8MiAyMT47CisJCQljbG9ja3MgPSA8JmNsa19pMmM+OworCQkJI2FkZHJl
c3MtY2VsbHMgPSA8MT47CisJCQkjc2l6ZS1jZWxscyA9IDwwPjsKKwkJfTsKKwogCQl1c2JAN2U5
ODAwMDAgewogCQkJY29tcGF0aWJsZSA9ICJicmNtLGJjbTI4MzUtdXNiIjsKIAkJCXJlZyA9IDww
eDdlOTgwMDAwIDB4MTAwMDA+OwotLSAKMi4xLjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
