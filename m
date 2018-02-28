From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: [PATCH v2 3/4] ARM: stm32: Select ARM_MPU for cortex-M7 machines
Date: Wed, 28 Feb 2018 14:10:57 +0100
Message-ID: <1519823458-27734-4-git-send-email-alexandre.torgue@st.com>
References: <1519823458-27734-1-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1519823458-27734-1-git-send-email-alexandre.torgue@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, arnd@arndb.de, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, patrice.chotard@st.com, lee.jones@linaro.org
Cc: devicetree@vger.kernel.org, vladimir.murzin@arm.com, Alexandre Torgue <alexandre.torgue@st.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

STM32 MCUs embed a Memory Protection Unit. Enabling ARM_MPU flag will
allow the Kernel to configure the MPU according to the devicetree.

Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/arch/arm/mach-stm32/Kconfig b/arch/arm/mach-stm32/Kconfig
index 713c068..c2ad8e9 100644
--- a/arch/arm/mach-stm32/Kconfig
+++ b/arch/arm/mach-stm32/Kconfig
@@ -29,15 +29,18 @@ config MACH_STM32F469
 config MACH_STM32F746
 	bool "STMicroelectronics STM32F746"
 	select ARM_AMBA
+	select ARM_MPU
 	default y
 
 config MACH_STM32F769
 	bool "STMicroelectronics STM32F769"
 	select ARM_AMBA
+	select ARM_MPU
 	default y
 
 config MACH_STM32H743
 	bool "STMicroelectronics STM32H743"
+	select ARM_MPU
 	default y
 
 endif # ARMv7-M
-- 
2.7.4
