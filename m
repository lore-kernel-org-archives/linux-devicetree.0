From: Liu Ying <Ying.Liu@freescale.com>
Subject: [PATCH RFC v7 17/21] ARM: dtsi: imx6qdl: Add support for MIPI DSI
 host controller
Date: Tue, 30 Dec 2014 11:34:07 +0800
Message-ID: <1419910451-15268-18-git-send-email-Ying.Liu@freescale.com>
References: <1419910451-15268-1-git-send-email-Ying.Liu@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1419910451-15268-1-git-send-email-Ying.Liu@freescale.com>
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
Z25lZC1vZmYtYnk6IExpdSBZaW5nIDxZaW5nLkxpdUBmcmVlc2NhbGUuY29tPgotLS0KdjYtPnY3
OgogKiBOb25lLgoKdjUtPnY2OgogKiBOb25lLgoKdjMtPnY0OgogKiBOb25lLgoKdjItPnYzOgog
KiBBcyBzdWdnZXN0ZWQgYnkgUGhpbGxpcCBaYWJlbCwgY2hhbmdlIHRoZSBjbG9ja3MgYW5kIHRo
ZSBjbG9jay1uYW1lcwogICBwcm9wZXJ0aWVzIHRvIHVzZSB0aGUgcGxscmVmIGFuZCBjb3JlX2Nm
ZyBjbG9ja3Mgb25seS4KCnYxLT52MjoKICogTm9uZS4KCiBhcmNoL2FybS9ib290L2R0cy9pbXg2
cWRsLmR0c2kgfCA2ICsrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDZxZGwuZHRzaSBiL2FyY2gvYXJtL2Jvb3Qv
ZHRzL2lteDZxZGwuZHRzaQppbmRleCA5NmJmMmEwLi43YjFjMzEzIDEwMDY0NAotLS0gYS9hcmNo
L2FybS9ib290L2R0cy9pbXg2cWRsLmR0c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvaW14NnFk
bC5kdHNpCkBAIC0xMDA2LDcgKzEwMDYsMTMgQEAKIAkJCW1pcGlfZHNpOiBtaXBpQDAyMWUwMDAw
IHsKIAkJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKIAkJCQkjc2l6ZS1jZWxscyA9IDwwPjsKKwkJ
CQljb21wYXRpYmxlID0gImZzbCxpbXg2cS1taXBpLWRzaSI7CiAJCQkJcmVnID0gPDB4MDIxZTAw
MDAgMHg0MDAwPjsKKwkJCQlpbnRlcnJ1cHRzID0gPDAgMTAyIElSUV9UWVBFX0xFVkVMX0hJR0g+
OworCQkJCWdwciA9IDwmZ3ByPjsKKwkJCQljbG9ja3MgPSA8JmNsa3MgSU1YNlFETF9DTEtfTUlQ
SV9DT1JFX0NGRz4sCisJCQkJCSA8JmNsa3MgSU1YNlFETF9DTEtfTUlQSV9DT1JFX0NGRz47CisJ
CQkJY2xvY2stbmFtZXMgPSAicGxscmVmIiwgImNvcmVfY2ZnIjsKIAkJCQlzdGF0dXMgPSAiZGlz
YWJsZWQiOwogCiAJCQkJcG9ydHMgewotLSAKMi4xLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
