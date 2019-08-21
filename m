From: Joel Stanley <joel@jms.id.au>
Subject: [PATCH 3/7] ARM: aspeed: Add ASPEED AST2600 architecture
Date: Wed, 21 Aug 2019 15:25:26 +0930
Message-ID: <20190821055530.8720-4-joel@jms.id.au>
References: <20190821055530.8720-1-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190821055530.8720-1-joel@jms.id.au>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Ryan Chen <ryan_chen@aspeedtech.com>, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The AST2600 is a Cortex A7 dual core CPU that uses the ARM GIC for
interrupts and ARM timer as a clocksource.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/mach-aspeed/Kconfig | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-aspeed/Kconfig b/arch/arm/mach-aspeed/Kconfig
index 2979aa4daeea..56007b0b6120 100644
--- a/arch/arm/mach-aspeed/Kconfig
+++ b/arch/arm/mach-aspeed/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 menuconfig ARCH_ASPEED
 	bool "Aspeed BMC architectures"
-	depends on ARCH_MULTI_V5 || ARCH_MULTI_V6
+	depends on ARCH_MULTI_V5 || ARCH_MULTI_V6 || ARCH_MULTI_V7
 	select SRAM
 	select WATCHDOG
 	select ASPEED_WATCHDOG
@@ -33,4 +33,16 @@ config MACH_ASPEED_G5
 	 Say yes if you intend to run on an Aspeed ast2500 or similar
 	 fifth generation Aspeed BMCs.
 
+config MACH_ASPEED_G6
+	bool "Aspeed SoC 6th Generation"
+	depends on ARCH_MULTI_V7
+	select CPU_V7
+	select PINCTRL_ASPEED_G6
+	select ARM_GIC
+	select HAVE_ARM_ARCH_TIMER
+	select HAVE_SMP
+	help
+	 Say yes if you intend to run on an Aspeed ast2600 or similar
+	 sixth generation Aspeed BMCs.
+
 endif
-- 
2.23.0.rc1
