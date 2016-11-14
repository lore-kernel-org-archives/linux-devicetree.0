From: Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2] ARM: dts: vfxxx: Enable DMA for DSPI2 and DSPI3
Date: Mon, 14 Nov 2016 18:07:01 +0530
Message-ID: <20161114123701.4355-1-maitysanchayan@gmail.com>
References: <20161110114505.17618-1-maitysanchayan@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161110114505.17618-1-maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: stefan-XLVq0VzYD2Y@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Enable DMA for DSPI2 and DSPI3 on Vybrid.

Signed-off-by: Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
Changes since v1:

Add signed-off-by missing in v1.
---
 arch/arm/boot/dts/vfxxx.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/vfxxx.dtsi b/arch/arm/boot/dts/vfxxx.dtsi
index 000550f..e9d2847 100644
--- a/arch/arm/boot/dts/vfxxx.dtsi
+++ b/arch/arm/boot/dts/vfxxx.dtsi
@@ -573,6 +573,9 @@
 				clocks = <&clks VF610_CLK_DSPI2>;
 				clock-names = "dspi";
 				spi-num-chipselects = <2>;
+				dmas = <&edma1 0 10>,
+					<&edma1 0 11>;
+				dma-names = "rx", "tx";
 				status = "disabled";
 			};
 
@@ -585,6 +588,9 @@
 				clocks = <&clks VF610_CLK_DSPI3>;
 				clock-names = "dspi";
 				spi-num-chipselects = <2>;
+				dmas = <&edma1 0 12>,
+					<&edma1 0 13>;
+				dma-names = "rx", "tx";
 				status = "disabled";
 			};
 
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
