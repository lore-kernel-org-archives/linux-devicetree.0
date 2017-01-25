From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 1/2] mtd: name the mtd device with an optional label
 property
Date: Wed, 25 Jan 2017 19:17:34 +0100
Message-ID: <1485368255-12038-2-git-send-email-clg@kaod.org>
References: <1485368255-12038-1-git-send-email-clg@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1485368255-12038-1-git-send-email-clg@kaod.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: linux-mtd@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

VGhpcyBjYW4gYmUgdXNlZCB0byBlYXNpbHkgaWRlbnRpZnkgYSBzcGVjaWZpYyBjaGlwIG9uIGEg
c3lzdGVtIHdpdGgKbXVsdGlwbGUgY2hpcHMuCgpEcml2ZXJzIHdhbnRpbmcgdG8gc3VwcG9ydCB0
aGlzIG5ldyBsYWJlbCBwcm9wZXJ0eSB3aWxsIGJlbmVmaXQgZnJvbQppdCB3aXRob3V0IGEgY2hh
bmdlLiBUaGV5IG1pZ2h0IHdhbnQgdG8gY2hlY2sgaW4gdGhlIGZ1dHVyZSB0aGF0Cm10ZC0+bmFt
ZSBpcyBOVUxMIGJlZm9yZSBhc3NpZ25pbmcgYSBkZWZhdWx0IG5hbWUgdG8gdGhlIG10ZCBkZXZp
Y2UuCk90aGVyIGRyaXZlcnMgd2lsbCBrZWVwIHRoZSBjdXJyZW50IGJlaGF2aW9yLCB3aGljaCBp
cyB0byBvdmVycmlkZQptdGQtPm5hbWUgd2l0aCB0aGVpciBvd24gdmFsdWUuCgpTdWdnZXN0ZWQt
Ynk6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGZyZWUtZWxlY3Ryb25zLmNvbT4K
U2lnbmVkLW9mZi1ieTogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4KLS0tCgogQ2hh
bmdlcyBzaW5jZSB2MToKCiAtIG1vdmVkIHRoZSB1c2Ugb2YgdGhlICJsYWJlbCIgcHJvcGVydHkg
ZnJvbSBtdGRfc2V0X2Rldl9kZWZhdWx0cygpCiAgIHRvIG10ZF9zZXRfb2Zfbm9kZSgpIHRvIGxl
dCBkcml2ZXJzIGtlZXAgY29udHJvbCBvbiBob3cgbXRkLT5uYW1lCiAgIGlzIHNldCBhbmQgYWxs
b2NhdGVkLgoKIGluY2x1ZGUvbGludXgvbXRkL210ZC5oIHwgMiArKwogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbXRkL210ZC5oIGIv
aW5jbHVkZS9saW51eC9tdGQvbXRkLmgKaW5kZXggMTNmODA1MmI5ZmY5Li5mNGZlMTU1MTcyOTUg
MTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvbXRkL210ZC5oCisrKyBiL2luY2x1ZGUvbGludXgv
bXRkL210ZC5oCkBAIC0yNCw2ICsyNCw3IEBACiAjaW5jbHVkZSA8bGludXgvdWlvLmg+CiAjaW5j
bHVkZSA8bGludXgvbm90aWZpZXIuaD4KICNpbmNsdWRlIDxsaW51eC9kZXZpY2UuaD4KKyNpbmNs
dWRlIDxsaW51eC9vZi5oPgogCiAjaW5jbHVkZSA8bXRkL210ZC1hYmkuaD4KIApAQCAtMzg1LDYg
KzM4Niw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBtdGRfc2V0X29mX25vZGUoc3RydWN0IG10ZF9p
bmZvICptdGQsCiAJCQkJICAgc3RydWN0IGRldmljZV9ub2RlICpucCkKIHsKIAltdGQtPmRldi5v
Zl9ub2RlID0gbnA7CisJb2ZfcHJvcGVydHlfcmVhZF9zdHJpbmcobnAsICJsYWJlbCIsICZtdGQt
Pm5hbWUpOwogfQogCiBzdGF0aWMgaW5saW5lIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbXRkX2dldF9v
Zl9ub2RlKHN0cnVjdCBtdGRfaW5mbyAqbXRkKQotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
