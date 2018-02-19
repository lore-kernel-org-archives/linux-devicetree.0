From: =?UTF-8?q?Myl=C3=A8ne=20Josserand?= <mylene.josserand@bootlin.com>
Subject: [PATCH v3 2/7] ARM: dts: sun8i: Add CPUCFG device node for A83T dtsi
Date: Mon, 19 Feb 2018 09:18:32 +0100
Message-ID: <20180219081837.15482-3-mylene.josserand@bootlin.com>
References: <20180219081837.15482-1-mylene.josserand@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180219081837.15482-1-mylene.josserand@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: maxime.ripard@bootlin.com, wens@csie.org, linux@armlinux.org.uk, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, quentin.schulz@bootlin.com, linux-kernel@vger.kernel.org, clabbe.montjoie@gmail.com, thomas.petazzoni@bootlin.com, mylene.josserand@bootlin.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

QXMgd2UgZm91bmQgaW4gc3VuOWktYTgwLCBDUFVDRkcgaXMgYSBjb2xsZWN0aW9uIG9mIHJlZ2lz
dGVycyB0aGF0IGFyZQptYXBwZWQgdG8gdGhlIFNvQydzIHNpZ25hbHMgZnJvbSBlYWNoIGluZGl2
aWR1YWwgcHJvY2Vzc29yIGNvcmUgYW5kCmFzc29jaWF0ZWQgcGVyaXBoZXJhbHMuCgpUaGVzZSBy
ZWdpc3RlcnMgYXJlIHVzZWQgZm9yIFNNUCBicmluZ3VwIGFuZCBDUFUgaG90cGx1Z2dpbmcuCgpT
aWduZWQtb2ZmLWJ5OiBNeWzDqG5lIEpvc3NlcmFuZCA8bXlsZW5lLmpvc3NlcmFuZEBib290bGlu
LmNvbT4KLS0tCiBhcmNoL2FybS9ib290L2R0cy9zdW44aS1hODN0LmR0c2kgfCA1ICsrKysrCiAx
IGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9v
dC9kdHMvc3VuOGktYTgzdC5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3VuOGktYTgzdC5kdHNp
CmluZGV4IDdmNDk1NWE1ZmFiNy4uZTQ1YmFiODM2NjIwIDEwMDY0NAotLS0gYS9hcmNoL2FybS9i
b290L2R0cy9zdW44aS1hODN0LmR0c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3VuOGktYTgz
dC5kdHNpCkBAIC0yMDgsNiArMjA4LDExIEBACiAJCQl9OwogCQl9OwogCisJCWNwdWNmZ0AxNzAw
MDAwIHsKKwkJCWNvbXBhdGlibGUgPSAiYWxsd2lubmVyLHN1bjhpLWE4M3QtY3B1Y2ZnIjsKKwkJ
CXJlZyA9IDwweDAxNzAwMDAwIDB4NDAwPjsKKwkJfTsKKwogCQlzeXNjb246IHN5c2NvbkAxYzAw
MDAwIHsKIAkJCWNvbXBhdGlibGUgPSAiYWxsd2lubmVyLHN1bjhpLWE4M3Qtc3lzdGVtLWNvbnRy
b2xsZXIiLAogCQkJCSJzeXNjb24iOwotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QK
bGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
