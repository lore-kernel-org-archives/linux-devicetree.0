From: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: [PATCH v5 1/9] ARM: Kconfig: Introduce MACH_STM32F429 flag
Date: Wed,  3 Feb 2016 12:04:37 +0100
Message-ID: <1454497485-464-2-git-send-email-mcoquelin.stm32@gmail.com>
References: <1454497485-464-1-git-send-email-mcoquelin.stm32@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1454497485-464-1-git-send-email-mcoquelin.stm32@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: patrice.chotard@st.com, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org, arnd@arndb.de
Cc: devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>, bruherrera@gmail.com, linux-kernel@vger.kernel.org, afaerber@suse.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch introduces the MACH_STM32F429 to make possible to only select
STM32F429 pinctrl driver.

By default, all the MACH_STM32Fxxx flags will be set with STM32 defconfig.

Acked-by: Patrice Chotard <patrice.chotard@st.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Maxime Coquelin <mcoquelin.stm32@gmail.com>
---
 arch/arm/Kconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 4f799e5..ca16120 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -883,6 +883,11 @@ config ARCH_STM32
 	help
 	  Support for STMicroelectronics STM32 processors.
 
+config MACH_STM32F429
+	bool "STMicrolectronics STM32F429"
+	depends on ARCH_STM32
+	default y
+
 # Definitions to make life easier
 config ARCH_ACORN
 	bool
-- 
1.9.1
