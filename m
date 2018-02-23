From: =?UTF-8?q?Myl=C3=A8ne=20Josserand?= <mylene.josserand@bootlin.com>
Subject: [PATCH v4 04/10] ARM: sun8i: smp: Add hotplug support for sun8i-a83t
Date: Fri, 23 Feb 2018 14:37:36 +0100
Message-ID: <20180223133742.26044-5-mylene.josserand@bootlin.com>
References: <20180223133742.26044-1-mylene.josserand@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180223133742.26044-1-mylene.josserand@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: maxime.ripard@bootlin.com, linux@armlinux.org.uk, wens@csie.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, quentin.schulz@bootlin.com, linux-kernel@vger.kernel.org, clabbe.montjoie@gmail.com, thomas.petazzoni@bootlin.com, mylene.josserand@bootlin.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

QWRkIGhvdHBsdWcgc3VwcG9ydCBmb3Igc3VuOGktYTgzdC4KCkhvdHBsdWcgQ1BVIGZvciBDUFUw
IGlzIGN1cnJlbnRseSBub3Qgd29ya2luZy4KUmVtb3ZlIHRoZSBwb3NzaWJpbGl0eSB0byBkaXNh
YmxlIENQVTAgb25seSBmb3Igc3VuOGktYTgzdC4KClNpZ25lZC1vZmYtYnk6IE15bMOobmUgSm9z
c2VyYW5kIDxteWxlbmUuam9zc2VyYW5kQGJvb3RsaW4uY29tPgotLS0KIGFyY2gvYXJtL21hY2gt
c3VueGkvbWNfc21wLmMgfCA4ICsrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vbWFjaC1zdW54aS9tY19z
bXAuYyBiL2FyY2gvYXJtL21hY2gtc3VueGkvbWNfc21wLmMKaW5kZXggM2JkOTA2NmExNDIyLi5m
MmMyY2ZjYTI4Y2QgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL21hY2gtc3VueGkvbWNfc21wLmMKKysr
IGIvYXJjaC9hcm0vbWFjaC1zdW54aS9tY19zbXAuYwpAQCAtNTc5LDYgKzU3OSw4IEBAIHN0YXRp
YyBpbnQgc3VueGlfY2x1c3Rlcl9wb3dlcmRvd24odW5zaWduZWQgaW50IGNsdXN0ZXIpCiAJcmVn
ID0gcmVhZGwocHJjbV9iYXNlICsgUFJDTV9QV1JPRkZfR0FUSU5HX1JFRyhjbHVzdGVyKSk7CiAJ
aWYgKGlzX3N1bjlpKQogCQlyZWcgfD0gUFJDTV9QV1JPRkZfR0FUSU5HX1JFR19DTFVTVEVSX1NV
TjlJOworCWVsc2UKKwkJcmVnIHw9IFBSQ01fUFdST0ZGX0dBVElOR19SRUdfQ0xVU1RFUl9TVU44
STsKIAl3cml0ZWwocmVnLCBwcmNtX2Jhc2UgKyBQUkNNX1BXUk9GRl9HQVRJTkdfUkVHKGNsdXN0
ZXIpKTsKIAl1ZGVsYXkoMjApOwogCkBAIC02NjAsOCArNjYyLDEyIEBAIHN0YXRpYyBpbnQgc3Vu
eGlfbWNfc21wX2NwdV9raWxsKHVuc2lnbmVkIGludCBsX2NwdSkKIAlyZXR1cm4gIXJldDsKIH0K
IAotc3RhdGljIGJvb2wgc3VueGlfbWNfc21wX2NwdV9jYW5fZGlzYWJsZSh1bnNpZ25lZCBpbnQg
X191bnVzZWQpCitzdGF0aWMgYm9vbCBzdW54aV9tY19zbXBfY3B1X2Nhbl9kaXNhYmxlKHVuc2ln
bmVkIGludCBjcHUpCiB7CisJLyogQ1BVMCBob3RwbHVnIGhhbmRsZWQgb25seSBmb3Igc3VuOWkg
Ki8KKwlpZiAoIWlzX3N1bjlpKQorCQlpZiAoY3B1ID09IDApCisJCQlyZXR1cm4gZmFsc2U7CiAJ
cmV0dXJuIHRydWU7CiB9CiAjZW5kaWYKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0
CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
