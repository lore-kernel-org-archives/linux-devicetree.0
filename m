From: <gabriel.fernandez@st.com>
Subject: [PATCH] clk: stm32: fix: stm32 clock drivers are not compiled by
 default
Date: Tue, 17 Apr 2018 11:15:19 +0200
Message-ID: <1523956519-20976-1-git-send-email-gabriel.fernandez@st.com>
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
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>, benjamin GAIGNARD <benjamin.gaignard@st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, gabriel.fernandez@st.com
List-Id: devicetree@vger.kernel.org

From: Gabriel Fernandez <gabriel.fernandez@st.com>

Clock driver is mandatory if the machine is selected.
Then don't use 'bool' and 'depends on' commands, but 'def_bool'
with the machine(s).

Fixes: da32d3539fca ("clk: stm32: add configuration flags for each of the stm32 drivers")


Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
---
 drivers/clk/Kconfig | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 41492e9..34968a3 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -266,15 +266,13 @@ config COMMON_CLK_STM32MP157
 	  Support for stm32mp157 SoC family clocks
 
 config COMMON_CLK_STM32F
-	bool "Clock driver for stm32f4 and stm32f7 SoC families"
-	depends on MACH_STM32F429 || MACH_STM32F469 || MACH_STM32F746
+	def_bool COMMON_CLK && (MACH_STM32F429 || MACH_STM32F469 || MACH_STM32F746)
 	help
 	---help---
 	  Support for stm32f4 and stm32f7 SoC families clocks
 
 config COMMON_CLK_STM32H7
-	bool "Clock driver for stm32h7 SoC family"
-	depends on MACH_STM32H743
+	def_bool COMMON_CLK && MACH_STM32H743
 	help
 	---help---
 	  Support for stm32h7 SoC family clocks
-- 
1.9.1
