From: Joel Stanley <joel@jms.id.au>
Subject: [PATCH 2/7] ARM: aspeed: Select timer in each SoC
Date: Wed, 21 Aug 2019 15:25:25 +0930
Message-ID: <20190821055530.8720-3-joel@jms.id.au>
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

In preparation for adding the ast2600 which does not use this timer.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/mach-aspeed/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-aspeed/Kconfig b/arch/arm/mach-aspeed/Kconfig
index a15c3a291386..2979aa4daeea 100644
--- a/arch/arm/mach-aspeed/Kconfig
+++ b/arch/arm/mach-aspeed/Kconfig
@@ -5,7 +5,6 @@ menuconfig ARCH_ASPEED
 	select SRAM
 	select WATCHDOG
 	select ASPEED_WATCHDOG
-	select FTTMR010_TIMER
 	select MFD_SYSCON
 	select PINCTRL
 	help
@@ -18,6 +17,7 @@ config MACH_ASPEED_G4
 	depends on ARCH_MULTI_V5
 	select CPU_ARM926T
 	select PINCTRL_ASPEED_G4
+	select FTTMR010_TIMER
 	help
 	 Say yes if you intend to run on an Aspeed ast2400 or similar
 	 fourth generation BMCs, such as those used by OpenPower Power8
@@ -28,6 +28,7 @@ config MACH_ASPEED_G5
 	depends on ARCH_MULTI_V6
 	select CPU_V6
 	select PINCTRL_ASPEED_G5
+	select FTTMR010_TIMER
 	help
 	 Say yes if you intend to run on an Aspeed ast2500 or similar
 	 fifth generation Aspeed BMCs.
-- 
2.23.0.rc1
