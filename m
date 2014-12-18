From: Liu Ying <Ying.Liu@freescale.com>
Subject: [PATCH RFC v2 10/14] ARM: dtsi: imx6qdl: Add support for MIPI DSI
 host controller
Date: Thu, 18 Dec 2014 15:11:32 +0800
Message-ID: <1418886696-11636-11-git-send-email-Ying.Liu@freescale.com>
References: <1418886696-11636-1-git-send-email-Ying.Liu@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1418886696-11636-1-git-send-email-Ying.Liu@freescale.com>
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
Cc: devicetree@vger.kernel.org, linux@arm.linux.org.uk, kernel@pengutronix.de, linux-kernel@vger.kernel.org, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

VGhpcyBwYXRjaCBhZGRzIHN1cHBvcnQgZm9yIE1JUEkgRFNJIGhvc3QgY29udHJvbGxlci4KClNp
Z25lZC1vZmYtYnk6IExpdSBZaW5nIDxZaW5nLkxpdUBmcmVlc2NhbGUuY29tPgotLS0KdjEtPnYy
OgogKiBOb25lLgoKIGFyY2gvYXJtL2Jvb3QvZHRzL2lteDZxZGwuZHRzaSB8IDcgKysrKysrKwog
MSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jv
b3QvZHRzL2lteDZxZGwuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDZxZGwuZHRzaQppbmRl
eCA5NmJmMmEwLi5iZmMzOWZkIDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9pbXg2cWRs
LmR0c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvaW14NnFkbC5kdHNpCkBAIC0xMDA2LDcgKzEw
MDYsMTQgQEAKIAkJCW1pcGlfZHNpOiBtaXBpQDAyMWUwMDAwIHsKIAkJCQkjYWRkcmVzcy1jZWxs
cyA9IDwxPjsKIAkJCQkjc2l6ZS1jZWxscyA9IDwwPjsKKwkJCQljb21wYXRpYmxlID0gImZzbCxp
bXg2cS1taXBpLWRzaSI7CiAJCQkJcmVnID0gPDB4MDIxZTAwMDAgMHg0MDAwPjsKKwkJCQlpbnRl
cnJ1cHRzID0gPDAgMTAyIElSUV9UWVBFX0xFVkVMX0hJR0g+OworCQkJCWdwciA9IDwmZ3ByPjsK
KwkJCQljbG9ja3MgPSA8JmNsa3MgSU1YNlFETF9DTEtfVklERU9fMjdNPiwKKwkJCQkJIDwmY2xr
cyBJTVg2UURMX0NMS19IU0lfVFg+LAorCQkJCQkgPCZjbGtzIElNWDZRRExfQ0xLX0hTSV9UWD47
CisJCQkJY2xvY2stbmFtZXMgPSAicGxscmVmIiwgInBsbHJlZl9nYXRlIiwgImNvcmVfY2ZnIjsK
IAkJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwogCiAJCQkJcG9ydHMgewotLSAKMi4xLjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
