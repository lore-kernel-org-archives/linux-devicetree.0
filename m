From: Liu Ying <Ying.Liu@freescale.com>
Subject: [PATCH RFC v3 14/18] ARM: dtsi: imx6qdl: Add support for MIPI DSI
 host controller
Date: Tue, 23 Dec 2014 11:46:35 +0800
Message-ID: <1419306399-9387-15-git-send-email-Ying.Liu@freescale.com>
References: <1419306399-9387-1-git-send-email-Ying.Liu@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1419306399-9387-1-git-send-email-Ying.Liu@freescale.com>
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
Cc: devicetree@vger.kernel.org, linux@arm.linux.org.uk, kernel@pengutronix.de, linux-kernel@vger.kernel.org, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, andyshrk@gmail.com
List-Id: devicetree@vger.kernel.org

VGhpcyBwYXRjaCBhZGRzIHN1cHBvcnQgZm9yIE1JUEkgRFNJIGhvc3QgY29udHJvbGxlci4KClNp
Z25lZC1vZmYtYnk6IExpdSBZaW5nIDxZaW5nLkxpdUBmcmVlc2NhbGUuY29tPgotLS0KdjItPnYz
OgogKiBBcyBzdWdnZXN0ZWQgYnkgUGhpbGxpcCBaYWJlbCwgY2hhbmdlIHRoZSBjbG9ja3MgYW5k
IHRoZSBjbG9jay1uYW1lcwogICBwcm9wZXJ0aWVzIHRvIHVzZSB0aGUgcGxscmVmIGFuZCBjb3Jl
X2NmZyBjbG9ja3Mgb25seS4KCnYxLT52MjoKICogTm9uZS4KCiBhcmNoL2FybS9ib290L2R0cy9p
bXg2cWRsLmR0c2kgfCA2ICsrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDZxZGwuZHRzaSBiL2FyY2gvYXJtL2Jv
b3QvZHRzL2lteDZxZGwuZHRzaQppbmRleCA5NmJmMmEwLi43YjFjMzEzIDEwMDY0NAotLS0gYS9h
cmNoL2FybS9ib290L2R0cy9pbXg2cWRsLmR0c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvaW14
NnFkbC5kdHNpCkBAIC0xMDA2LDcgKzEwMDYsMTMgQEAKIAkJCW1pcGlfZHNpOiBtaXBpQDAyMWUw
MDAwIHsKIAkJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKIAkJCQkjc2l6ZS1jZWxscyA9IDwwPjsK
KwkJCQljb21wYXRpYmxlID0gImZzbCxpbXg2cS1taXBpLWRzaSI7CiAJCQkJcmVnID0gPDB4MDIx
ZTAwMDAgMHg0MDAwPjsKKwkJCQlpbnRlcnJ1cHRzID0gPDAgMTAyIElSUV9UWVBFX0xFVkVMX0hJ
R0g+OworCQkJCWdwciA9IDwmZ3ByPjsKKwkJCQljbG9ja3MgPSA8JmNsa3MgSU1YNlFETF9DTEtf
TUlQSV9DT1JFX0NGRz4sCisJCQkJCSA8JmNsa3MgSU1YNlFETF9DTEtfTUlQSV9DT1JFX0NGRz47
CisJCQkJY2xvY2stbmFtZXMgPSAicGxscmVmIiwgImNvcmVfY2ZnIjsKIAkJCQlzdGF0dXMgPSAi
ZGlzYWJsZWQiOwogCiAJCQkJcG9ydHMgewotLSAKMi4xLjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
