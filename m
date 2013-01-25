From: Mrugesh Katepallewar <mrugesh.mk@ti.com>
Subject: [PATCH] ARM: davinci: da850: add RTC driver DT entries
Date: Fri, 25 Jan 2013 11:43:49 +0530
Message-ID: <1359094430-14724-1-git-send-email-mrugesh.mk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org, davinci-linux-open-source@linux.davincidsp.com, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: grant.likely@secretlab.ca, rob.herring@calxeda.com, rob@landley.net, nsekhar@ti.com, hs@denx.de
List-Id: devicetree@vger.kernel.org

Add RTC DT entries in da850 dts file.

Signed-off-by: Mrugesh Katepallewar <mrugesh.mk@ti.com>
---
Applies on top of v3.8-rc4 of linus tree.

Tested on da850-evm device.

Test Procedure:
date [YYYY.]MM.DD-hh:mm[:ss]
hwclock -w
reset board and check system time.

:100644 100644 37dc5a3... b16efd4... M	arch/arm/boot/dts/da850-evm.dts
:100644 100644 640ab75... a8eb1b1... M	arch/arm/boot/dts/da850.dtsi
 arch/arm/boot/dts/da850-evm.dts |    3 +++
 arch/arm/boot/dts/da850.dtsi    |    8 ++++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/da850-evm.dts b/arch/arm/boot/dts/da850-evm.dts
index 37dc5a3..b16efd4 100644
--- a/arch/arm/boot/dts/da850-evm.dts
+++ b/arch/arm/boot/dts/da850-evm.dts
@@ -24,5 +24,8 @@
 		serial2: serial@1d0d000 {
 			status = "okay";
 		};
+		rtc@1c23000 {
+			status = "okay";
+		};
 	};
 };
diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
index 640ab75..a8eb1b1 100644
--- a/arch/arm/boot/dts/da850.dtsi
+++ b/arch/arm/boot/dts/da850.dtsi
@@ -56,5 +56,13 @@
 			interrupt-parent = <&intc>;
 			status = "disabled";
 		};
+		rtc@1c23000 {
+			compatible = "ti,da830-rtc";
+			reg = <0x23000 0x1000>;
+			interrupts = <19
+				      19>;
+			interrupt-parent = <&intc>;
+			status = "disabled";
+		};
 	};
 };
-- 
1.7.9.5

