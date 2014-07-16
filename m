From: =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart@free-electrons.com>
Subject: [PATCH v3 06/12] Documentation: bindings: add doc for the Berlin USB
 PHY
Date: Wed, 16 Jul 2014 10:26:00 +0200
Message-ID: <1405499166-6726-7-git-send-email-antoine.tenart@free-electrons.com>
References: <1405499166-6726-1-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1405499166-6726-1-git-send-email-antoine.tenart@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: sebastian.hesselbarth@gmail.com, Peter.Chen@freescale.com, balbi@ti.com, p.zabel@pengutronix.de
Cc: thomas.petazzoni@free-electrons.com, zmxu@marvell.com, devicetree@vger.kernel.org, =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart@free-electrons.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, alexandre.belloni@free-electrons.com, jszhang@marvell.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

RG9jdW1lbnQgdGhlIGJpbmRpbmdzIG9mIHRoZSBNYXJ2ZWxsIEJlcmxpbiBVU0IgUEhZIGRyaXZl
ci4KClNpZ25lZC1vZmYtYnk6IEFudG9pbmUgVMOpbmFydCA8YW50b2luZS50ZW5hcnRAZnJlZS1l
bGVjdHJvbnMuY29tPgotLS0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkv
YmVybGluLXVzYi1waHkudHh0IHwgMTYgKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQs
IDE2IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvcGh5L2Jlcmxpbi11c2ItcGh5LnR4dAoKZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvYmVybGluLXVzYi1waHkudHh0IGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9iZXJsaW4tdXNiLXBoeS50eHQKbmV3
IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi5iZTMzNzgwZjY2OGUKLS0tIC9k
ZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L2Jlcmxp
bi11c2ItcGh5LnR4dApAQCAtMCwwICsxLDE2IEBACisqIE1hcnZlbGwgQmVybGluIFVTQiBQSFkK
KworUmVxdWlyZWQgcHJvcGVydGllczoKKy0gY29tcGF0aWJsZTogIm1hcnZlbGwsYmVybGluMi11
c2ItcGh5IiBvciAibWFydmVsbCxiZXJsaW4yY2QtdXNiLXBoeSIKKy0gcmVnOiBiYXNlIGFkZHJl
c3MgYW5kIGxlbmd0aCBvZiB0aGUgcmVnaXN0ZXJzCistICNwaHlzLWNlbGxzOiBzaG91bGQgYmUg
MAorLSByZXNldHM6IHJlZmVyZW5jZSB0byB0aGUgcmVzZXQgY29udHJvbGxlcgorCitFeGFtcGxl
OgorCisJdXNiLXBoeUBmNzc0MDAwIHsKKwkJY29tcGF0aWJsZSA9ICJtYXJ2ZWxsLGJlcmxpbjIt
dXNiLXBoeSI7CisJCXJlZyA9IDwweGY3NzQwMDAgMHgxMjg+OworCQkjcGh5LWNlbGxzID0gPDA+
OworCQlyZXNldHMgPSA8JmNoaXAgMHgxMDQgMTQ+OworCX07Ci0tIAoxLjkuMQoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwg
bWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
