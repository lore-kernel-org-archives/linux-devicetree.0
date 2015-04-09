From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH v5 04/11] ARM: ARMv7M: define size of vector table for Vybrid
Date: Thu,  9 Apr 2015 22:04:08 +0200
Message-ID: <1428609855-27657-5-git-send-email-stefan@agner.ch>
References: <1428609855-27657-1-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1428609855-27657-1-git-send-email-stefan@agner.ch>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawn.guo@linaro.org, kernel@pengutronix.de, linux@arm.linux.org.uk, u.kleine-koenig@pengutronix.de, jason@lakedaemon.net, olof@lixom.net, arnd@arndb.de, daniel.lezcano@linaro.org, tglx@linutronix.de, mark.rutland@arm.com, pawel.moll@arm.com, robh+dt@kernel.org, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, marc.zyngier@arm.com, mcoquelin.stm32@gmail.com
Cc: devicetree@vger.kernel.org, Stefan Agner <stefan@agner.ch>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Vybrids has 112 peripherial interrupts which can be routed to the
Cortex-M4's NVIC interrupt controller.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 arch/arm/mm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mm/Kconfig b/arch/arm/mm/Kconfig
index 16d077e..8eebc0d 100644
--- a/arch/arm/mm/Kconfig
+++ b/arch/arm/mm/Kconfig
@@ -609,6 +609,7 @@ config CPUV7M_NUM_IRQ
 	depends on CPU_V7M
 	default 90 if ARCH_STM32
 	default 38 if ARCH_EFM32
+	default 112 if SOC_VF610
 	default 240
 	help
 	  This option indicates the number of interrupts connected to the NVIC.
-- 
2.3.5
