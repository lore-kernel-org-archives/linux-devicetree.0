From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: [PATCH 4/5] ARM: mach-stm32: add new STM32F769 MCU
Date: Mon, 11 Dec 2017 09:54:34 +0100
Message-ID: <1512982475-32661-5-git-send-email-alexandre.torgue@st.com>
References: <1512982475-32661-2-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1512982475-32661-2-git-send-email-alexandre.torgue@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add new st,stm32f769 compatible machine name for STM32F769 MCU and update
documentation.

Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/Documentation/arm/stm32/stm32f769-overview.txt b/Documentation/arm/stm32/stm32f769-overview.txt
new file mode 100644
index 0000000..9ab7e60
--- /dev/null
+++ b/Documentation/arm/stm32/stm32f769-overview.txt
@@ -0,0 +1,36 @@
+			STM32F769 Overview
+			==================
+
+  Introduction
+  ------------
+	The STM32F769 is a Cortex-M7 MCU aimed at various applications.
+	It features:
+	- Cortex-M7 core running up to @216MHz
+	- 2MB internal flash, 512KBytes internal RAM (+4KB of backup SRAM)
+	- FMC controller to connect SDRAM, NOR and NAND memories
+	- Dual mode QSPI
+	- SD/MMC/SDIO support*2
+	- Ethernet controller
+	- USB OTFG FS & HS controllers
+	- I2C*4, SPI*6, CAN*3 busses support
+	- Several 16 & 32 bits general purpose timers
+	- Serial Audio interface *2
+	- LCD controller
+	- HDMI-CEC
+	- DSI
+	- SPDIFRX
+	- MDIO salave interface
+
+  Resources
+  ---------
+	Datasheet and reference manual are publicly available on ST website:
+	- http://www.st.com/content/st_com/en/products/microcontrollers/stm32-32-bit-arm-cortex-mcus/stm32-high-performance-mcus/stm32f7-series/stm32f7x9/stm32f769ni.html
+
+  Document Author
+  ---------------
+	Alexandre Torgue <alexandre.torgue@st.com>
+
+
+
+
+
diff --git a/arch/arm/mach-stm32/board-dt.c b/arch/arm/mach-stm32/board-dt.c
index e918686..4824632 100644
--- a/arch/arm/mach-stm32/board-dt.c
+++ b/arch/arm/mach-stm32/board-dt.c
@@ -12,6 +12,7 @@ static const char *const stm32_compat[] __initconst = {
 	"st,stm32f429",
 	"st,stm32f469",
 	"st,stm32f746",
+	"st,stm32f769",
 	"st,stm32h743",
 	NULL
 };
-- 
2.7.4
