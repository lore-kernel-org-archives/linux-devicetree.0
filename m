From: Eric Anholt <eric@anholt.net>
Subject: [PATCH v4 4/5] ARM: bcm283x: Extend the WDT DT node out to cover the whole PM block. (v4)
Date: Wed, 12 Dec 2018 15:51:49 -0800
Message-ID: <20181212235150.6491-5-eric@anholt.net>
References: <20181212235150.6491-1-eric@anholt.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181212235150.6491-1-eric@anholt.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, Lee Jones <lee.jones@linaro.org>, Stefan Wahren <stefan.wahren@i2se.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
Cc: linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Eric Anholt <eric@anholt.net>
List-Id: devicetree@vger.kernel.org

It was covering part of the PM block's range, up to the WDT regs.  To
support the rest of the PM block's functionality, we need the full
register range plus the AXI Async Bridge regs for PM sequencing.

This doesn't convert any of the consumers over to the new binding yet,
since we will need to be careful in coordinating our usage of firmware
services that might power domains on and off versus the bcm2835-pm
driver's access of those same domains.

Signed-off-by: Eric Anholt <eric@anholt.net>
---

v4: Add the system-power-controller node.

 arch/arm/boot/dts/bcm283x.dtsi | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/bcm283x.dtsi b/arch/arm/boot/dts/bcm283x.dtsi
index 31b29646b14c..20ed8b1da11b 100644
--- a/arch/arm/boot/dts/bcm283x.dtsi
+++ b/arch/arm/boot/dts/bcm283x.dtsi
@@ -121,8 +121,17 @@
 		};
 
 		watchdog@7e100000 {
-			compatible = "brcm,bcm2835-pm-wdt";
-			reg = <0x7e100000 0x28>;
+			compatible = "brcm,bcm2835-pm", "brcm,bcm2835-pm-wdt";
+			#power-domain-cells = <1>;
+			#reset-cells = <1>;
+			reg = <0x7e100000 0x114>,
+			      <0x7e00a000 0x24>;
+			clocks = <&clocks BCM2835_CLOCK_V3D>,
+				 <&clocks BCM2835_CLOCK_PERI_IMAGE>,
+				 <&clocks BCM2835_CLOCK_H264>,
+				 <&clocks BCM2835_CLOCK_ISP>;
+			clock-names = "v3d", "peri_image", "h264", "isp";
+			system-power-controller;
 		};
 
 		clocks: cprman@7e101000 {
-- 
2.20.0.rc1
