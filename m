From: Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 1/3] arm64: dts: add fifo size property for uart channels on exynos7
Date: Sun,  1 Mar 2015 21:53:44 +0530
Message-ID: <1425227026-5336-2-git-send-email-a.kesavan@samsung.com>
References: <1425227026-5336-1-git-send-email-a.kesavan@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425227026-5336-1-git-send-email-a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: catalin.marinas-5wv7dgnIgG8@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kesavan.abhilash-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Mark.Rutland-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

Specify the fifo sizes of the 4 uart channels on exynos7 via dt.

Signed-off-by: Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm64/boot/dts/exynos/exynos7.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
index d7a37c3..749c4b3 100644
--- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
@@ -192,6 +192,7 @@
 			clocks = <&clock_peric0 PCLK_UART0>,
 				 <&clock_peric0 SCLK_UART0>;
 			clock-names = "uart", "clk_uart_baud0";
+			samsung,uart-fifosize = <64>;
 			status = "disabled";
 		};
 
@@ -202,6 +203,7 @@
 			clocks = <&clock_peric1 PCLK_UART1>,
 				 <&clock_peric1 SCLK_UART1>;
 			clock-names = "uart", "clk_uart_baud0";
+			samsung,uart-fifosize = <256>;
 			status = "disabled";
 		};
 
@@ -212,6 +214,7 @@
 			clocks = <&clock_peric1 PCLK_UART2>,
 				 <&clock_peric1 SCLK_UART2>;
 			clock-names = "uart", "clk_uart_baud0";
+			samsung,uart-fifosize = <16>;
 			status = "disabled";
 		};
 
@@ -222,6 +225,7 @@
 			clocks = <&clock_peric1 PCLK_UART3>,
 				 <&clock_peric1 SCLK_UART3>;
 			clock-names = "uart", "clk_uart_baud0";
+			samsung,uart-fifosize = <64>;
 			status = "disabled";
 		};
 
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
