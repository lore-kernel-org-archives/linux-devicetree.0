From: Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 2/2] ARM: dts: vfxxx: Add property for minimum sample time
Date: Wed, 24 Jun 2015 14:03:41 +0530
Message-ID: <36fa3cef10b6a21b39e96283ea5d6961e9f6d972.1435134626.git.maitysanchayan@gmail.com>
References: <cover.1435134626.git.maitysanchayan@gmail.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1435134626.git.maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <cover.1435134626.git.maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <cover.1435134626.git.maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, B38611-KZfg59tc24xl57MIdRCFDg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org, Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a device tree property which allows to specify the minimum sample
time which can be used to calculate the actual ADC cycles required
depending on the hardware.

Signed-off-by: Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/vfxxx.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/vfxxx.dtsi b/arch/arm/boot/dts/vfxxx.dtsi
index 90a03d5..71d9c08 100644
--- a/arch/arm/boot/dts/vfxxx.dtsi
+++ b/arch/arm/boot/dts/vfxxx.dtsi
@@ -229,6 +229,7 @@
 				status = "disabled";
 				fsl,adck-max-frequency = <30000000>, <40000000>,
 							<20000000>;
+				min-sample-time = <1000>;
 			};
 
 			wdoga5: wdog@4003e000 {
@@ -447,6 +448,7 @@
 				status = "disabled";
 				fsl,adck-max-frequency = <30000000>, <40000000>,
 							<20000000>;
+				min-sample-time = <1000>;
 			};
 
 			esdhc1: esdhc@400b2000 {
-- 
2.4.4
