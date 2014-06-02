From: =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart@free-electrons.com>
Subject: [PATCH 4/5] ARM: dts: berlin: add SMP related nodes and properties
 for BG2
Date: Mon,  2 Jun 2014 11:21:05 +0200
Message-ID: <1401700866-24804-5-git-send-email-antoine.tenart@free-electrons.com>
References: <1401700866-24804-1-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1401700866-24804-1-git-send-email-antoine.tenart@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: sebastian.hesselbarth@gmail.com
Cc: thomas.petazzoni@free-electrons.com, zmxu@marvell.com, devicetree@vger.kernel.org, =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart@free-electrons.com>, linux-kernel@vger.kernel.org, alexandre.belloni@free-electrons.com, jszhang@marvell.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

QWRkIHJlcXVpcmVkIG5vZGVzIGFuZCBwcm9wZXJ0aWVzIGludG8gdGhlIEJlcmxpbiBCRzIgZGV2
aWNlIHRyZWUgdG8KdGFrZSBhZHZhbnRhZ2Ugb2YgdGhlIG5ld2x5IGludHJvZHVjZWQgU01QIHN1
cHBvcnQuIEFkZCB0aGUgc2N1IGFuZApjcHUtY3RybCBub2RlcyBhbG9uZyB3aXRoIHRoZSBDUFVz
IGVuYWJsZS1tZXRob2QgcHJvcGVydHkuCgpTaWduZWQtb2ZmLWJ5OiBBbnRvaW5lIFTDqW5hcnQg
PGFudG9pbmUudGVuYXJ0QGZyZWUtZWxlY3Ryb25zLmNvbT4KLS0tCiBhcmNoL2FybS9ib290L2R0
cy9iZXJsaW4yLmR0c2kgfCAxMSArKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDExIGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9iZXJsaW4yLmR0c2kgYi9h
cmNoL2FybS9ib290L2R0cy9iZXJsaW4yLmR0c2kKaW5kZXggNTZhMWFmMmYxMDUyLi5mMzhkZGRh
OGE3NWUgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2JlcmxpbjIuZHRzaQorKysgYi9h
cmNoL2FybS9ib290L2R0cy9iZXJsaW4yLmR0c2kKQEAgLTIxLDYgKzIxLDcgQEAKIAljcHVzIHsK
IAkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CiAJCSNzaXplLWNlbGxzID0gPDA+OworCQllbmFibGUt
bWV0aG9kID0gIm1hcnZlbGwsYmVybGluLXNtcCI7CiAKIAkJY3B1QDAgewogCQkJY29tcGF0aWJs
ZSA9ICJtYXJ2ZWxsLHBqNGIiOwpAQCAtNzIsNiArNzMsMTEgQEAKIAkJCWNhY2hlLWxldmVsID0g
PDI+OwogCQl9OwogCisJCXNjdTogc25vb3AtY29udHJvbC11bml0QGFkMDAwMCB7CisJCQljb21w
YXRpYmxlID0gImFybSxjb3J0ZXgtYTktc2N1IjsKKwkJCXJlZyA9IDwweGFkMDAwMCAweDU4PjsK
KwkJfTsKKwogCQlnaWM6IGludGVycnVwdC1jb250cm9sbGVyQGFkMTAwMCB7CiAJCQljb21wYXRp
YmxlID0gImFybSxjb3J0ZXgtYTktZ2ljIjsKIAkJCXJlZyA9IDwweGFkMTAwMCAweDEwMDA+LCA8
MHhhZDAxMDAgMHgwMTAwPjsKQEAgLTg2LDYgKzkyLDExIEBACiAJCQljbG9ja3MgPSA8JnN5c2Ns
az47CiAJCX07CiAKKwkJY3B1LWN0cmxAZGQwMDAwIHsKKwkJCWNvbXBhdGlibGUgPSAibWFydmVs
bCxiZXJsaW4tY3B1LWN0cmwiOworCQkJcmVnID0gPDB4ZGQwMDAwIDB4MTAwMDA+OworCQl9Owor
CiAJCWFwYkBlODAwMDAgewogCQkJY29tcGF0aWJsZSA9ICJzaW1wbGUtYnVzIjsKIAkJCSNhZGRy
ZXNzLWNlbGxzID0gPDE+OwotLSAKMS45LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1h
cm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
