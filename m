From: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 7/9] ARM: davinci: add support for am1808 based EnBW CMC board
Date: Thu, 6 Sep 2012 21:08:32 +0530
Message-ID: <1346945914-7802-8-git-send-email-nsekhar@ti.com>
References: <1346945914-7802-1-git-send-email-nsekhar@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
In-Reply-To: <1346945914-7802-1-git-send-email-nsekhar-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
Errors-To: davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
Cc: Kevin Hilman <khilman-l0cyMroinI0@public.gmane.org>, Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>

This board supports:

- AM1808 based board
- 64 MiB DDR ram
- 2 MiB Nor flash
- 128 MiB NAND flash
- use internal RTC
- I2C support
- hwmon lm75 support
- UBI/UBIFS support
- MMC support
- USB OTG support

This patch adds the basic DTS file enabling the serial ports.
Other features will be added in due course of time.

Signed-off-by: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
Cc: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Cc: Kevin Hilman <khilman-l0cyMroinI0@public.gmane.org>
Cc: Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>
[nsekhar-l0cyMroinI0@public.gmane.org: modified after dtsi refactoring and added binding
documentation]
Signed-off-by: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/davinci.txt |    4 +++
 arch/arm/boot/dts/da850-enbw-cmc.dts              |   30 +++++++++++++++++++++
 arch/arm/mach-davinci/da8xx-dt.c                  |    1 +
 3 files changed, 35 insertions(+)
 create mode 100644 arch/arm/boot/dts/da850-enbw-cmc.dts

diff --git a/Documentation/devicetree/bindings/arm/davinci.txt b/Documentation/devicetree/bindings/arm/davinci.txt
index 2dda756..cfaeda4 100644
--- a/Documentation/devicetree/bindings/arm/davinci.txt
+++ b/Documentation/devicetree/bindings/arm/davinci.txt
@@ -5,6 +5,10 @@ DA850/OMAP-L138/AM18x Evaluation Module (EVM) board
 Required root node properties:
     - compatible = "ti,da850-evm", "ti,da850";
 
+EnBW AM1808 based CMC board
+Required root node properties:
+    - compatible = "enbw,cmc", "ti,da850;
+
 Generic DaVinci Boards
 ----------------------
 
diff --git a/arch/arm/boot/dts/da850-enbw-cmc.dts b/arch/arm/boot/dts/da850-enbw-cmc.dts
new file mode 100644
index 0000000..422fdb3
--- /dev/null
+++ b/arch/arm/boot/dts/da850-enbw-cmc.dts
@@ -0,0 +1,30 @@
+/*
+ * Device Tree for AM1808 EnBW CMC board
+ *
+ * Copyright 2012 DENX Software Engineering GmbH
+ * Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
+ *
+ * This program is free software; you can redistribute  it and/or modify it
+ * under  the terms of  the GNU General  Public License as published by the
+ * Free Software Foundation;  either version 2 of the  License, or (at your
+ * option) any later version.
+ */
+/dts-v1/;
+/include/ "da850.dtsi"
+
+/ {
+	compatible = "enbw,cmc", "ti,da850";
+	model = "EnBW CMC";
+
+	soc {
+		serial0: serial@1c42000 {
+			status = "okay";
+		};
+		serial1: serial@1d0c000 {
+			status = "okay";
+		};
+		serial2: serial@1d0d000 {
+			status = "okay";
+		};
+	};
+};
diff --git a/arch/arm/mach-davinci/da8xx-dt.c b/arch/arm/mach-davinci/da8xx-dt.c
index 94b09fd..37c27af 100644
--- a/arch/arm/mach-davinci/da8xx-dt.c
+++ b/arch/arm/mach-davinci/da8xx-dt.c
@@ -47,6 +47,7 @@ static void __init da850_init_machine(void)
 }
 
 static const char *da850_boards_compat[] __initdata = {
+	"enbw,cmc",
 	"ti,da850-evm",
 	"ti,da850",
 	NULL,
-- 
1.7.10.1
