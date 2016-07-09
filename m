From: Rajesh Bhagat <rajesh.bhagat-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH v2 5/5] arm: dts: ls1021a: enable chipidea driver and USB 2.0 PHY driver
Date: Sat, 9 Jul 2016 10:00:56 +0530
Message-ID: <1468038656-10345-6-git-send-email-rajesh.bhagat@nxp.com>
References: <1468038656-10345-1-git-send-email-rajesh.bhagat@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1468038656-10345-1-git-send-email-rajesh.bhagat-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Peter.Chen-3arQi8VN3Tc@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rajesh Bhagat <rajesh.bhagat-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds entries in dts to enable chipidea platform driver
and USB 2.0 PHY driver.

Signed-off-by: Rajesh Bhagat <rajesh.bhagat-3arQi8VN3Tc@public.gmane.org>
---
Changes in v2:
 - Reworked for latest changes

 arch/arm/boot/dts/ls1021a.dtsi | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.dtsi
index 5ae8e92..bbba1ba 100644
--- a/arch/arm/boot/dts/ls1021a.dtsi
+++ b/arch/arm/boot/dts/ls1021a.dtsi
@@ -612,10 +612,23 @@
 			};
 		};
 
+		usbphy0: usbphy@8600000 {
+			compatible = "fsl,qoriq-usb2-phy",
+				     "fsl,qoriq-usb2-phy-v1.0";
+			reg = <0x0 0x8600000 0x0 0x1000>;
+			#phy-cells = <0>;
+			phy_type = "ulpi";
+		};
+
 		usb@8600000 {
-			compatible = "fsl-usb2-dr-v2.5", "fsl-usb2-dr";
+			compatible =  "fsl,ci-qoriq-usb2",
+				      "fsl,ci-qoriq-usb2-v2.5";
 			reg = <0x0 0x8600000 0x0 0x1000>;
 			interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>;
+			phy-names = "usb2-phy";
+			phys = <&usbphy0>;
+			clock-names = "usb2-clock";
+			clocks = <&platform_clk 1>;
 			dr_mode = "host";
 			phy_type = "ulpi";
 		};
-- 
2.6.2.198.g614a2ac

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
