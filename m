From: Bai Ping <ping.bai@nxp.com>
Subject: [PATCH v2 09/12] ARM: debug: Add low level debug support for imx6sll
Date: Tue, 27 Dec 2016 17:47:47 +0800
Message-ID: <1482832070-22668-10-git-send-email-ping.bai@nxp.com>
References: <1482832070-22668-1-git-send-email-ping.bai@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1482832070-22668-1-git-send-email-ping.bai@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawnguo@kernel.org, mturquette@baylibre.com, sboyd@codeaurora.org, robh+dt@kernel.org, mark.rutland@arm.com, linus.walleij@linaro.org
Cc: devicetree@vger.kernel.org, kernel@pengutronix.de, daniel.lezcano@linaro.org, linux-gpio@vger.kernel.org, p.zabel@pengutronix.de, jacky.baip@gmail.com, fabio.estevam@nxp.com, tglx@linutronix.de, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add low level debug support for i.MX6SLL.

Signed-off-by: Bai Ping <ping.bai@nxp.com>
---
 arch/arm/Kconfig.debug            |  9 +++++++++
 arch/arm/include/debug/imx-uart.h | 10 ++++++++++
 2 files changed, 19 insertions(+)

diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index 408540f..d52d48c 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -405,6 +405,13 @@ choice
 		  Say Y here if you want kernel low-level debugging support
 		  on i.MX6SL.
 
+	config DEBUG_IMX6SLL_UART
+		bool "i.MX6SLL Debug UART"
+		depends on SOC_IMX6SLL
+		help
+		  Say Y here if you want kernel low-level debugging support
+		  on i.MX6SLL.
+
 	config DEBUG_IMX6SX_UART
 		bool "i.MX6SX Debug UART"
 		depends on SOC_IMX6SX
@@ -1374,6 +1381,7 @@ config DEBUG_IMX_UART_PORT
 						DEBUG_IMX53_UART || \
 						DEBUG_IMX6Q_UART || \
 						DEBUG_IMX6SL_UART || \
+						DEBUG_IMX6SLL_UART || \
 						DEBUG_IMX6SX_UART || \
 						DEBUG_IMX6UL_UART || \
 						DEBUG_IMX7D_UART
@@ -1428,6 +1436,7 @@ config DEBUG_LL_INCLUDE
 				 DEBUG_IMX53_UART ||\
 				 DEBUG_IMX6Q_UART || \
 				 DEBUG_IMX6SL_UART || \
+				 DEBUG_IMX6SLL_UART || \
 				 DEBUG_IMX6SX_UART || \
 				 DEBUG_IMX6UL_UART || \
 				 DEBUG_IMX7D_UART
diff --git a/arch/arm/include/debug/imx-uart.h b/arch/arm/include/debug/imx-uart.h
index bce58e9..24e60ce 100644
--- a/arch/arm/include/debug/imx-uart.h
+++ b/arch/arm/include/debug/imx-uart.h
@@ -81,6 +81,14 @@
 #define IMX6SL_UART_BASE_ADDR(n) IMX6SL_UART##n##_BASE_ADDR
 #define IMX6SL_UART_BASE(n)	IMX6SL_UART_BASE_ADDR(n)
 
+#define IMX6SLL_UART1_BASE_ADDR 0x02020000
+#define IMX6SLL_UART2_BASE_ADDR 0x02024000
+#define IMX6SLL_UART3_BASE_ADDR 0x02034000
+#define IMX6SLL_UART4_BASE_ADDR 0x02018000
+#define IMX6SLL_UART5_BASE_ADDR 0x021f4000
+#define IMX6SLL_UART_BASE_ADDR(n) IMX6SLL_UART##n##_BASE_ADDR
+#define IMX6SLL_UART_BASE(n)	IMX6SLL_UART_BASE_ADDR(n)
+
 #define IMX6SX_UART1_BASE_ADDR	0x02020000
 #define IMX6SX_UART2_BASE_ADDR	0x021e8000
 #define IMX6SX_UART3_BASE_ADDR	0x021ec000
@@ -133,6 +141,8 @@
 #define UART_PADDR	IMX_DEBUG_UART_BASE(IMX6Q)
 #elif defined(CONFIG_DEBUG_IMX6SL_UART)
 #define UART_PADDR	IMX_DEBUG_UART_BASE(IMX6SL)
+#elif defined(CONFIG_DEBUG_IMX6SLL_UART)
+#define UART_PADDR	IMX_DEBUG_UART_BASE(IMX6SLL)
 #elif defined(CONFIG_DEBUG_IMX6SX_UART)
 #define UART_PADDR	IMX_DEBUG_UART_BASE(IMX6SX)
 #elif defined(CONFIG_DEBUG_IMX6UL_UART)
-- 
1.9.1
