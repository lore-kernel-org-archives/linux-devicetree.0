From: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] arm: zynq: Add adv7511 on i2c bus for zc70x
Date: Thu, 20 Jul 2017 15:32:08 +0200
Message-ID: <c6907f2c425af0dafa849f64873c30f13fef639d.1500557521.git.michal.simek@xilinx.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Christian Kohn <christian.kohn-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Crosthwaite <peter.crosthwaite-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Josh Cartwright <josh.cartwright-acOepvfBmUk@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Christian Kohn <christian.kohn-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>

Describe adv7511 on i2c bus.

Signed-off-by: Christian Kohn <christian.kohn-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
---

 arch/arm/boot/dts/zynq-zc702.dts | 15 +++++++++++++++
 arch/arm/boot/dts/zynq-zc706.dts | 15 +++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/arch/arm/boot/dts/zynq-zc702.dts b/arch/arm/boot/dts/zynq-zc702.dts
index 0735909165fd..a096275d903d 100644
--- a/arch/arm/boot/dts/zynq-zc702.dts
+++ b/arch/arm/boot/dts/zynq-zc702.dts
@@ -132,6 +132,21 @@
 			};
 		};
 
+		i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+			adv7511: hdmi-tx@39 {
+				compatible = "adi,adv7511";
+				reg = <0x39>;
+				adi,input-depth = <8>;
+				adi,input-colorspace = "yuv422";
+				adi,input-clock = "1x";
+				adi,input-style = <3>;
+				adi,input-justification = "right";
+			};
+		};
+
 		i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
diff --git a/arch/arm/boot/dts/zynq-zc706.dts b/arch/arm/boot/dts/zynq-zc706.dts
index 3f6e4cb958f6..689ec9d6f7b9 100644
--- a/arch/arm/boot/dts/zynq-zc706.dts
+++ b/arch/arm/boot/dts/zynq-zc706.dts
@@ -88,6 +88,21 @@
 			};
 		};
 
+		i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+			adv7511: hdmi-tx@39 {
+				compatible = "adi,adv7511";
+				reg = <0x39>;
+				adi,input-depth = <8>;
+				adi,input-colorspace = "yuv422";
+				adi,input-clock = "1x";
+				adi,input-style = <3>;
+				adi,input-justification = "evenly";
+			};
+		};
+
 		i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
