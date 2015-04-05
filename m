From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 2/3] of: OF_IRQ should depend on IRQ_DOMAIN
Date: Sun,  5 Apr 2015 16:59:24 +0200
Message-ID: <1428245965-19618-3-git-send-email-geert@linux-m68k.org>
References: <1428245965-19618-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1428245965-19618-1-git-send-email-geert@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: devicetree@vger.kernel.org

If CONFIG_IRQ_DOMAIN=3Dn:

drivers/of/irq.c: In function =E2=80=98of_irq_get=E2=80=99:
drivers/of/irq.c:406: error: implicit declaration of function =E2=80=98=
irq_find_host=E2=80=99
drivers/of/irq.c:406: warning: assignment makes pointer from integer wi=
thout a cast
make[2]: *** [drivers/of/irq.o] Error 1

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/of/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
index 4c98f14694458794..92adecd3ecb28fc7 100644
--- a/drivers/of/Kconfig
+++ b/drivers/of/Kconfig
@@ -50,7 +50,7 @@ config OF_ADDRESS_PCI
=20
 config OF_IRQ
 	def_bool y
-	depends on !SPARC
+	depends on !SPARC && IRQ_DOMAIN
=20
 config OF_NET
 	depends on NETDEVICES
--=20
1.9.1
