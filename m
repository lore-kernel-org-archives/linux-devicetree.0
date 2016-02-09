From: Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1 1/2] ARM: dts: vfxxx: Add DAC node for Vybrid SoC
Date: Tue,  9 Feb 2016 10:56:05 +0530
Message-ID: <537afe56ca3ceafe130604d66636bc90bc827298.1454939346.git.maitysanchayan@gmail.com>
References: <cover.1454939346.git.maitysanchayan@gmail.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1454939346.git.maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <cover.1454939346.git.maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <cover.1454939346.git.maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org, Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a device tree node entry for DAC peripheral on Vybrid SoC.

Signed-off-by: Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/vfxxx.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/vfxxx.dtsi b/arch/arm/boot/dts/vfxxx.dtsi
index a5f07e3..8238069 100644
--- a/arch/arm/boot/dts/vfxxx.dtsi
+++ b/arch/arm/boot/dts/vfxxx.dtsi
@@ -602,6 +602,24 @@
 				status = "disabled";
 			};
 
+			dac0: dac@400cc000 {
+				compatible = "fsl,vf610-dac";
+				reg = <0x400cc000 1000>;
+				interrupts = <55 IRQ_TYPE_LEVEL_HIGH>;
+				clock-names = "dac";
+				clocks = <&clks VF610_CLK_DAC0>;
+				status = "disabled";
+			};
+
+			dac1: dac@400cd000 {
+				compatible = "fsl,vf610-dac";
+				reg = <0x400cd000 1000>;
+				interrupts = <56 IRQ_TYPE_LEVEL_HIGH>;
+				clock-names = "dac";
+				clocks = <&clks VF610_CLK_DAC1>;
+				status = "disabled";
+			};
+
 			fec0: ethernet@400d0000 {
 				compatible = "fsl,mvf600-fec";
 				reg = <0x400d0000 0x1000>;
-- 
2.7.1
