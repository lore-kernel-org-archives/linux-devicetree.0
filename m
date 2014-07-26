From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v2 13/15] ARM: dts: rockchip: add both clocks to uart nodes
Date: Sun, 27 Jul 2014 01:18:29 +0200
Message-ID: <1406416711-28006-14-git-send-email-heiko@sntech.de>
References: <1406416711-28006-1-git-send-email-heiko@sntech.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1406416711-28006-1-git-send-email-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arnd-r2nGTMty4D4@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, max.schwarz-BGeptl67XyCzQB+pC5nmwQ@public.gmane.org
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Use the newly ammended dw_8250 clock binding to define both the baudclk as
well as the pclk supplying the ip.

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
 arch/arm/boot/dts/rk3xxx.dtsi | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/rk3xxx.dtsi b/arch/arm/boot/dts/rk3xxx.dtsi
index d3fa4d1..989c337 100644
--- a/arch/arm/boot/dts/rk3xxx.dtsi
+++ b/arch/arm/boot/dts/rk3xxx.dtsi
@@ -75,7 +75,8 @@
 		interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
 		reg-shift = <2>;
 		reg-io-width = <1>;
-		clocks = <&cru SCLK_UART0>;
+		clock-names = "baudclk", "apb_pclk";
+		clocks = <&cru SCLK_UART0>, <&cru PCLK_UART0>;
 		status = "disabled";
 	};
 
@@ -85,7 +86,8 @@
 		interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
 		reg-shift = <2>;
 		reg-io-width = <1>;
-		clocks = <&cru SCLK_UART1>;
+		clock-names = "baudclk", "apb_pclk";
+		clocks = <&cru SCLK_UART1>, <&cru PCLK_UART1>;
 		status = "disabled";
 	};
 
@@ -207,7 +209,8 @@
 		interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
 		reg-shift = <2>;
 		reg-io-width = <1>;
-		clocks = <&cru SCLK_UART2>;
+		clock-names = "baudclk", "apb_pclk";
+		clocks = <&cru SCLK_UART2>, <&cru PCLK_UART2>;
 		status = "disabled";
 	};
 
@@ -217,7 +220,8 @@
 		interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
 		reg-shift = <2>;
 		reg-io-width = <1>;
-		clocks = <&cru SCLK_UART3>;
+		clock-names = "baudclk", "apb_pclk";
+		clocks = <&cru SCLK_UART3>, <&cru PCLK_UART3>;
 		status = "disabled";
 	};
 };
-- 
2.0.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
