From: =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart@free-electrons.com>
Subject: [PATCH 5/9] Documentation: bindings: add doc for the Berlin USB PHY
Date: Thu,  5 Jun 2014 17:48:42 +0200
Message-ID: <1401983326-19205-6-git-send-email-antoine.tenart@free-electrons.com>
References: <1401983326-19205-1-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1401983326-19205-1-git-send-email-antoine.tenart@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: sebastian.hesselbarth@gmail.com, balbi@ti.com
Cc: thomas.petazzoni@free-electrons.com, zmxu@marvell.com, devicetree@vger.kernel.org, =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart@free-electrons.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, alexandre.belloni@free-electrons.com, jszhang@marvell.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

RG9jdW1lbnQgdGhlIGJpbmRpbmdzIG9mIHRoZSBNYXJ2ZWxsIEJlcmxpbiBVU0IgUEhZIGRyaXZl
ci4KClNpZ25lZC1vZmYtYnk6IEFudG9pbmUgVMOpbmFydCA8YW50b2luZS50ZW5hcnRAZnJlZS1l
bGVjdHJvbnMuY29tPgotLS0KIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9iZXJsaW4tdXNi
cGh5LnR4dCAgICAgICAgICB8IDE4ICsrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQs
IDE4IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvdXNiL2Jlcmxpbi11c2JwaHkudHh0CgpkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9iZXJsaW4tdXNicGh5LnR4dCBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvYmVybGluLXVzYnBoeS50eHQKbmV3IGZp
bGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi5kOTdlYjFmOWQ1M2YKLS0tIC9kZXYv
bnVsbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2Jlcmxpbi11
c2JwaHkudHh0CkBAIC0wLDAgKzEsMTggQEAKKyogTWFydmVsbCBCZXJsaW4gVVNCIFBIWQorCitS
ZXF1aXJlZCBwcm9wZXJ0aWVzOgorLSBjb21wYXRpYmxlOiBzaG91bGQgYmUgIm1hcnZlbGwsYmVy
bGluLXVzYnBoeSIKKy0gcmVnOiBiYXNlIGFkZHJlc3MgYW5kIGxlbmd0aCBvZiB0aGUgcmVnaXN0
ZXJzCistICNwaHlzLWNlbGxzOiBzaG91bGQgYmUgMAorLSByZXNldDogcmVmZXJlbmNlIHRvIHRo
ZSByZXNldCBjb250cm9sbGVyCistIHBvd2VyLWdwaW86IHJlZmVyZW5jZSB0aGUgR1BJTyBwaW4g
dG8gcG93ZXIgdGhlIFBIWQorCitFeGFtcGxlOgorCisJdXNicGh5QGY3NzQwMDAgeworCQljb21w
YXRpYmxlID0gIm1hcnZlbGwsYmVybGluLXVzYnBoeSI7CisJCXJlZyA9IDwweGY3NzQwMDAgMHgx
Mjg+OworCQkjcGh5LWNlbGxzID0gPDA+OworCQlyZXNldHMgPSA8JmNoaXAgMTQ+OworCQlwb3dl
ci1ncGlvID0gPCZwb3J0YiA4IEdQSU9fQUNUSVZFX0hJR0g+OworCX07Ci0tIAoxLjkuMQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1r
ZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJu
ZWwK
