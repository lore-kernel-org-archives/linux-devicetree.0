From: Joe.C <srv_yingjoe.chen@mediatek.com>
Subject: [PATCH v3 7/7] arm: mediatek: Add earlyprintk support for mt8127 &
 mt8135
Date: Fri, 19 Sep 2014 11:04:19 +0800
Message-ID: <1411095859-18737-8-git-send-email-srv_yingjoe.chen@mediatek.com>
References: <1411095859-18737-1-git-send-email-srv_yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1411095859-18737-1-git-send-email-srv_yingjoe.chen@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, arm@kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Anders Berg <anders.berg@lsi.com>, Russell King <linux@arm.linux.org.uk>, srv_heupstream@mediatek.com, yingjoe.chen@gmail.com, Ian Campbell <ijc+devicetree@hellion.org.uk>, hc.yen@mediatek.com, Linus Walleij <linus.walleij@linaro.org>, yh.chen@mediatek.com, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, nathan.chung@mediatek.com, Kumar Gala <galak@codeaurora.org>, yingjoe.chen@mediatek.com, eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: "Joe.C" <yingjoe.chen@mediatek.com>

Enable low-level debug for Mediatek mt8127 & mt8135 SoC.

Signed-off-by: Joe.C <yingjoe.chen@mediatek.com>
---
 arch/arm/Kconfig.debug | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index cfdd1c0..ecc9984 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -842,6 +842,22 @@ choice
 		  Say Y here if you want kernel low-level debugging support
 		  for Mediatek mt6589 based platforms on UART0.
 
+	config DEBUG_MT8127_UART0
+		bool "Mediatek mt8127 UART0"
+		depends on ARCH_MEDIATEK
+		select DEBUG_UART_8250
+		help
+		  Say Y here if you want kernel low-level debugging support
+		  for Mediatek mt8127 based platforms on UART0.
+
+	config DEBUG_MT8135_UART3
+		bool "Mediatek mt8135 UART3"
+		depends on ARCH_MEDIATEK
+		select DEBUG_UART_8250
+		help
+		  Say Y here if you want kernel low-level debugging support
+		  for Mediatek mt8135 based platforms on UART3.
+
 	config DEBUG_VEXPRESS_UART0_DETECT
 		bool "Autodetect UART0 on Versatile Express Cortex-A core tiles"
 		depends on ARCH_VEXPRESS && CPU_CP15_MMU
@@ -1083,7 +1099,9 @@ config DEBUG_UART_PHYS
 	default 0x10126000 if DEBUG_RK3X_UART1
 	default 0x101f1000 if ARCH_VERSATILE
 	default 0x101fb000 if DEBUG_NOMADIK_UART
+	default 0x11002000 if DEBUG_MT8127_UART0
 	default 0x11006000 if DEBUG_MT6589_UART0
+	default 0x11009000 if DEBUG_MT8135_UART3
 	default 0x16000000 if ARCH_INTEGRATOR
 	default 0x18000300 if DEBUG_BCM_5301X
 	default 0x1c090000 if DEBUG_VEXPRESS_UART0_RS1
@@ -1146,7 +1164,9 @@ config DEBUG_UART_VIRT
 	default 0xf01fb000 if DEBUG_NOMADIK_UART
 	default 0xf0201000 if DEBUG_BCM2835
 	default 0xf1000300 if DEBUG_BCM_5301X
+	default 0xf1002000 if DEBUG_MT8127_UART0
 	default 0xf1006000 if DEBUG_MT6589_UART0
+	default 0xf1009000 if DEBUG_MT8135_UART3
 	default 0xf11f1000 if ARCH_VERSATILE
 	default 0xf1600000 if ARCH_INTEGRATOR
 	default 0xf1c28000 if DEBUG_SUNXI_UART0
-- 
1.8.1.1.dirty
