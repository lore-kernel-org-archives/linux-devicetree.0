From: =?UTF-8?q?Myl=C3=A8ne=20Josserand?= <mylene.josserand@bootlin.com>
Subject: [PATCH v9 03/12] ARM: dts: sun8i: Add CPUCFG device node for A83T dtsi
Date: Fri,  4 May 2018 21:05:36 +0200
Message-ID: <20180504190545.5114-4-mylene.josserand@bootlin.com>
References: <20180504190545.5114-1-mylene.josserand@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180504190545.5114-1-mylene.josserand@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux@armlinux.org.uk, maxime.ripard@bootlin.com, wens@csie.org, marc.zyngier@arm.com, mark.rutland@arm.com, robh+dt@kernel.org, horms@verge.net.au, geert@linux-m68k.org, magnus.damm@gmail.com
Cc: devicetree@vger.kernel.org, opendmb@gmail.com, quentin.schulz@bootlin.com, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, f.fainelli@gmail.com, clabbe.montjoie@gmail.com, thomas.petazzoni@bootlin.com, mylene.josserand@bootlin.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

QXMgd2UgZm91bmQgaW4gc3VuOWktYTgwLCBDUFVDRkcgaXMgYSBjb2xsZWN0aW9uIG9mIHJlZ2lz
dGVycyB0aGF0IGFyZQptYXBwZWQgdG8gdGhlIFNvQydzIHNpZ25hbHMgZnJvbSBlYWNoIGluZGl2
aWR1YWwgcHJvY2Vzc29yIGNvcmUgYW5kCmFzc29jaWF0ZWQgcGVyaXBoZXJhbHMuCgpUaGVzZSBy
ZWdpc3RlcnMgYXJlIHVzZWQgZm9yIFNNUCBicmluZ3VwIGFuZCBDUFUgaG90cGx1Z2dpbmcuCgpT
aWduZWQtb2ZmLWJ5OiBNeWzDqG5lIEpvc3NlcmFuZCA8bXlsZW5lLmpvc3NlcmFuZEBib290bGlu
LmNvbT4KUmV2aWV3ZWQtYnk6IENoZW4tWXUgVHNhaSA8d2Vuc0Bjc2llLm9yZz4KLS0tCiBhcmNo
L2FybS9ib290L2R0cy9zdW44aS1hODN0LmR0c2kgfCA1ICsrKysrCiAxIGZpbGUgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvc3VuOGktYTgz
dC5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3VuOGktYTgzdC5kdHNpCmluZGV4IDM3OTk4MTM4
OWVlYS4uYTUwY2NiNDc1ZGU4IDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9zdW44aS1h
ODN0LmR0c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3VuOGktYTgzdC5kdHNpCkBAIC0zNDks
NiArMzQ5LDExIEBACiAJCQl9OwogCQl9OwogCisJCWNwdWNmZ0AxNzAwMDAwIHsKKwkJCWNvbXBh
dGlibGUgPSAiYWxsd2lubmVyLHN1bjhpLWE4M3QtY3B1Y2ZnIjsKKwkJCXJlZyA9IDwweDAxNzAw
MDAwIDB4NDAwPjsKKwkJfTsKKwogCQlzeXNjb246IHN5c2NvbkAxYzAwMDAwIHsKIAkJCWNvbXBh
dGlibGUgPSAiYWxsd2lubmVyLHN1bjhpLWE4M3Qtc3lzdGVtLWNvbnRyb2xsZXIiLAogCQkJCSJz
eXNjb24iOwotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5l
bEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
