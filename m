From: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 5/9] ARM: davinci: da850: add SoC DT data
Date: Wed, 12 Sep 2012 22:05:28 +0530
Message-ID: <1347467732-1332-6-git-send-email-nsekhar@ti.com>
References: <1347467732-1332-1-git-send-email-nsekhar@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
In-Reply-To: <1347467732-1332-1-git-send-email-nsekhar-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
Errors-To: davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Kevin Hilman <khilman-l0cyMroinI0@public.gmane.org>
Cc: davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>

Add DT data for DA850 SoC. Only interrupt controller and
serial port information is being added at this time.

Signed-off-by: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
[nsekhar-l0cyMroinI0@public.gmane.org: refactored DT data into SoC specific and
board specific and include SoC data into .dtsi file]
Signed-off-by: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
---
 arch/arm/boot/dts/da850.dtsi |   60 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 arch/arm/boot/dts/da850.dtsi

diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
new file mode 100644
index 0000000..640ab75
--- /dev/null
+++ b/arch/arm/boot/dts/da850.dtsi
@@ -0,0 +1,60 @@
+/*
+ * Copyright 2012 DENX Software Engineering GmbH
+ * Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
+ *
+ * This program is free software; you can redistribute  it and/or modify it
+ * under  the terms of  the GNU General  Public License as published by the
+ * Free Software Foundation;  either version 2 of the  License, or (at your
+ * option) any later version.
+ */
+/include/ "skeleton.dtsi"
+
+/ {
+	arm {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		intc: interrupt-controller {
+			compatible = "ti,cp-intc";
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			ti,intc-size = <100>;
+			reg = <0xfffee000 0x2000>;
+		};
+	};
+	soc {
+		compatible = "simple-bus";
+		model = "da850";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x01c00000 0x400000>;
+
+		serial0: serial@1c42000 {
+			compatible = "ns16550a";
+			reg = <0x42000 0x100>;
+			clock-frequency = <150000000>;
+			reg-shift = <2>;
+			interrupts = <25>;
+			interrupt-parent = <&intc>;
+			status = "disabled";
+		};
+		serial1: serial@1d0c000 {
+			compatible = "ns16550a";
+			reg = <0x10c000 0x100>;
+			clock-frequency = <150000000>;
+			reg-shift = <2>;
+			interrupts = <53>;
+			interrupt-parent = <&intc>;
+			status = "disabled";
+		};
+		serial2: serial@1d0d000 {
+			compatible = "ns16550a";
+			reg = <0x10d000 0x100>;
+			clock-frequency = <150000000>;
+			reg-shift = <2>;
+			interrupts = <61>;
+			interrupt-parent = <&intc>;
+			status = "disabled";
+		};
+	};
+};
-- 
1.7.10.1
