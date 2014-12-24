From: Liu Ying <Ying.Liu@freescale.com>
Subject: [PATCH RFC v5 17/21] ARM: dtsi: imx6qdl: Add support for MIPI DSI
 host controller
Date: Wed, 24 Dec 2014 16:39:39 +0800
Message-ID: <1419410383-6359-18-git-send-email-Ying.Liu@freescale.com>
References: <1419410383-6359-1-git-send-email-Ying.Liu@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1419410383-6359-1-git-send-email-Ying.Liu@freescale.com>
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
Cc: stefan.wahren@i2se.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, kernel@pengutronix.de, linux-kernel@vger.kernel.org, a.hajda@samsung.com, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, andyshrk@gmail.com
List-Id: devicetree@vger.kernel.org

VGhpcyBwYXRjaCBhZGRzIHN1cHBvcnQgZm9yIE1JUEkgRFNJIGhvc3QgY29udHJvbGxlci4KClNp
Z25lZC1vZmYtYnk6IExpdSBZaW5nIDxZaW5nLkxpdUBmcmVlc2NhbGUuY29tPgotLS0KdjQtPnY1
OgogKiBOb25lLgoKdjMtPnY0OgogKiBOb25lLgoKdjItPnYzOgogKiBBcyBzdWdnZXN0ZWQgYnkg
UGhpbGxpcCBaYWJlbCwgY2hhbmdlIHRoZSBjbG9ja3MgYW5kIHRoZSBjbG9jay1uYW1lcwogICBw
cm9wZXJ0aWVzIHRvIHVzZSB0aGUgcGxscmVmIGFuZCBjb3JlX2NmZyBjbG9ja3Mgb25seS4KCnYx
LT52MjoKICogTm9uZS4KCiBhcmNoL2FybS9ib290L2R0cy9pbXg2cWRsLmR0c2kgfCA2ICsrKysr
KwogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJt
L2Jvb3QvZHRzL2lteDZxZGwuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDZxZGwuZHRzaQpp
bmRleCA5NmJmMmEwLi43YjFjMzEzIDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9pbXg2
cWRsLmR0c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvaW14NnFkbC5kdHNpCkBAIC0xMDA2LDcg
KzEwMDYsMTMgQEAKIAkJCW1pcGlfZHNpOiBtaXBpQDAyMWUwMDAwIHsKIAkJCQkjYWRkcmVzcy1j
ZWxscyA9IDwxPjsKIAkJCQkjc2l6ZS1jZWxscyA9IDwwPjsKKwkJCQljb21wYXRpYmxlID0gImZz
bCxpbXg2cS1taXBpLWRzaSI7CiAJCQkJcmVnID0gPDB4MDIxZTAwMDAgMHg0MDAwPjsKKwkJCQlp
bnRlcnJ1cHRzID0gPDAgMTAyIElSUV9UWVBFX0xFVkVMX0hJR0g+OworCQkJCWdwciA9IDwmZ3By
PjsKKwkJCQljbG9ja3MgPSA8JmNsa3MgSU1YNlFETF9DTEtfTUlQSV9DT1JFX0NGRz4sCisJCQkJ
CSA8JmNsa3MgSU1YNlFETF9DTEtfTUlQSV9DT1JFX0NGRz47CisJCQkJY2xvY2stbmFtZXMgPSAi
cGxscmVmIiwgImNvcmVfY2ZnIjsKIAkJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwogCiAJCQkJcG9y
dHMgewotLSAKMi4xLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
