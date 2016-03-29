From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/7] ARM: dts: lpc18xx: remove unit addresses from creg childs
Date: Wed, 30 Mar 2016 00:30:42 +0200
Message-ID: <1459290646-3592-4-git-send-email-manabian@gmail.com>
References: <1459290646-3592-1-git-send-email-manabian@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1459290646-3592-1-git-send-email-manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

DT nodes without reg properties should not have a unit address. This
fixes the following warnings from dtc.

 Warning (unit_address_vs_reg): Node /soc/syscon@40043000/phy@004 has a
 unit name, but no reg property
 Warning (unit_address_vs_reg): Node /soc/syscon@40043000/dma-mux@11c has
 a unit name, but no reg property

Signed-off-by: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/lpc18xx.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/lpc18xx.dtsi b/arch/arm/boot/dts/lpc18xx.dtsi
index fdc991b..fdb736c 100644
--- a/arch/arm/boot/dts/lpc18xx.dtsi
+++ b/arch/arm/boot/dts/lpc18xx.dtsi
@@ -201,13 +201,13 @@
 				#clock-cells = <1>;
 			};
 
-			usb0_otg_phy: phy@004 {
+			usb0_otg_phy: phy {
 				compatible = "nxp,lpc1850-usb-otg-phy";
 				clocks = <&ccu1 CLK_USB0>;
 				#phy-cells = <0>;
 			};
 
-			dmamux: dma-mux@11c {
+			dmamux: dma-mux {
 				compatible = "nxp,lpc1850-dmamux";
 				#dma-cells = <3>;
 				dma-requests = <64>;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
