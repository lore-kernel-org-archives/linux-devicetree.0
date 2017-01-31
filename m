From: Alexandre TORGUE <alexandre.torgue@st.com>
Subject: [PATCH 5/8] ARM: stm32: Add a new SOC - STM32H743
Date: Tue, 31 Jan 2017 14:14:22 +0100
Message-ID: <1485868465-30446-6-git-send-email-alexandre.torgue@st.com>
References: <1485868465-30446-1-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1485868465-30446-1-git-send-email-alexandre.torgue@st.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, Olof Johansson <olof@lixom.net>, lee.jones@linaro.org, Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The STM32H743 is a Cortex-M7 MCU running at 400MHz and containing 1MBytes
internal RAM.

Signed-off-by: Alexandre TORGUE <alexandre.torgue@st.com>

diff --git a/Documentation/arm/stm32/stm32h743-overview.txt b/Documentation/arm/stm32/stm32h743-overview.txt
new file mode 100644
index 0000000..3031cba
--- /dev/null
+++ b/Documentation/arm/stm32/stm32h743-overview.txt
@@ -0,0 +1,30 @@
+			STM32H743 Overview
+			==================
+
+  Introduction
+  ------------
+	The STM32H743 is a Cortex-M7 MCU aimed at various applications.
+	It features:
+	- Cortex-M7 core running up to @400MHz
+	- 2MB internal flash, 1MBytes internal RAM
+	- FMC controller to connect SDRAM, NOR and NAND memories
+	- Dual mode QSPI
+	- SD/MMC/SDIO support
+	- Ethernet controller
+	- USB OTFG FS & HS controllers
+	- I2C, SPI, CAN busses support
+	- Several 16 & 32 bits general purpose timers
+	- Serial Audio interface
+	- LCD controller
+	- HDMI-CEC
+	- SPDIFRX
+	- DFSDM
+
+  Resources
+  ---------
+	Datasheet and reference manual are publicly available on ST website:
+	- http://www.st.com/en/microcontrollers/stm32h7x3.html?querycriteria=productId=LN2033
+
+  Document Author
+  ---------------
+	Alexandre Torgue <alexandre.torgue@st.com>
diff --git a/arch/arm/mach-stm32/board-dt.c b/arch/arm/mach-stm32/board-dt.c
index c354222..e918686 100644
--- a/arch/arm/mach-stm32/board-dt.c
+++ b/arch/arm/mach-stm32/board-dt.c
@@ -12,6 +12,7 @@
 	"st,stm32f429",
 	"st,stm32f469",
 	"st,stm32f746",
+	"st,stm32h743",
 	NULL
 };
 
-- 
1.9.1

