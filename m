From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] ARM: make ARCH_S3C24XX select USE_OF and clean-up
 boot/dts/Makefile
Date: Mon, 27 Nov 2017 11:19:23 +0900
Message-ID: <1511749163-11057-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arm@kernel.org, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Masahiro Yamada <yamada.masahiro@socionext.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

ARCH_S3C24XX is a very exceptional platform that some DT files in
arch/arm/boot/dts/, but does not select USE_OF.

All the other platforms with DT files correctly select USE_OF
directly or indirectly (Most of them are either ARCH_MULTIPLATFORM
or ARM_SINGLE_ARMV7M).

With ARCH_S3C24XX fixed, "ifeq ($(CONFIG_OF),y)" in DT Makefile
can be deleted.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/arm/Kconfig           | 1 +
 arch/arm/boot/dts/Makefile | 3 ---
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 51c8df5..5604497 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -595,6 +595,7 @@ config ARCH_S3C24XX
 	select MULTI_IRQ_HANDLER
 	select NEED_MACH_IO_H
 	select SAMSUNG_ATAGS
+	select USE_OF
 	help
 	  Samsung S3C2410, S3C2412, S3C2413, S3C2416, S3C2440, S3C2442, S3C2443
 	  and S3C2450 SoCs based systems, such as the Simtec Electronics BAST
diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index d0381e9..6f7f25d 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1,6 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
-ifeq ($(CONFIG_OF),y)
-
 dtb-$(CONFIG_ARCH_ALPINE) += \
 	alpine-db.dtb
 dtb-$(CONFIG_MACH_ARTPEC6) += \
@@ -1104,4 +1102,3 @@ dtb-$(CONFIG_ARCH_ZX) += zx296702-ad1.dtb
 dtb-$(CONFIG_ARCH_ASPEED) += aspeed-bmc-opp-palmetto.dtb \
 	aspeed-bmc-opp-romulus.dtb \
 	aspeed-ast2500-evb.dtb
-endif
-- 
2.7.4
