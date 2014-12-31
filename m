From: Liu Ying <Ying.Liu@freescale.com>
Subject: [PATCH RFC v8 17/21] ARM: dtsi: imx6qdl: Add support for MIPI DSI
 host controller
Date: Wed, 31 Dec 2014 16:23:35 +0800
Message-ID: <1420014219-915-18-git-send-email-Ying.Liu@freescale.com>
References: <1420014219-915-1-git-send-email-Ying.Liu@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1420014219-915-1-git-send-email-Ying.Liu@freescale.com>
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
Z25lZC1vZmYtYnk6IExpdSBZaW5nIDxZaW5nLkxpdUBmcmVlc2NhbGUuY29tPgotLS0KdjctPnY4
OgogKiBOb25lLgoKdjYtPnY3OgogKiBOb25lLgoKdjUtPnY2OgogKiBOb25lLgoKdjMtPnY0Ogog
KiBOb25lLgoKdjItPnYzOgogKiBBcyBzdWdnZXN0ZWQgYnkgUGhpbGxpcCBaYWJlbCwgY2hhbmdl
IHRoZSBjbG9ja3MgYW5kIHRoZSBjbG9jay1uYW1lcwogICBwcm9wZXJ0aWVzIHRvIHVzZSB0aGUg
cGxscmVmIGFuZCBjb3JlX2NmZyBjbG9ja3Mgb25seS4KCnYxLT52MjoKICogTm9uZS4KCiBhcmNo
L2FybS9ib290L2R0cy9pbXg2cWRsLmR0c2kgfCA2ICsrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDZxZGwuZHRz
aSBiL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDZxZGwuZHRzaQppbmRleCA5NmJmMmEwLi43YjFjMzEz
IDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9pbXg2cWRsLmR0c2kKKysrIGIvYXJjaC9h
cm0vYm9vdC9kdHMvaW14NnFkbC5kdHNpCkBAIC0xMDA2LDcgKzEwMDYsMTMgQEAKIAkJCW1pcGlf
ZHNpOiBtaXBpQDAyMWUwMDAwIHsKIAkJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKIAkJCQkjc2l6
ZS1jZWxscyA9IDwwPjsKKwkJCQljb21wYXRpYmxlID0gImZzbCxpbXg2cS1taXBpLWRzaSI7CiAJ
CQkJcmVnID0gPDB4MDIxZTAwMDAgMHg0MDAwPjsKKwkJCQlpbnRlcnJ1cHRzID0gPDAgMTAyIElS
UV9UWVBFX0xFVkVMX0hJR0g+OworCQkJCWdwciA9IDwmZ3ByPjsKKwkJCQljbG9ja3MgPSA8JmNs
a3MgSU1YNlFETF9DTEtfTUlQSV9DT1JFX0NGRz4sCisJCQkJCSA8JmNsa3MgSU1YNlFETF9DTEtf
TUlQSV9DT1JFX0NGRz47CisJCQkJY2xvY2stbmFtZXMgPSAicGxscmVmIiwgImNvcmVfY2ZnIjsK
IAkJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwogCiAJCQkJcG9ydHMgewotLSAKMi4xLjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
