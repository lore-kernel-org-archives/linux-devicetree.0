From: Julien Grossholtz <julien.grossholtz-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Subject: [PATCH] ARM: dts: TS-4800: Add gpio driver
Date: Fri, 19 Feb 2016 15:59:02 -0500
Message-ID: <1455915542-14467-1-git-send-email-julien.grossholtz@savoirfairelinux.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org, Julien Grossholtz <julien.grossholtz-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add dts nodes for TS-4800 FPGA gpio chips.

Signed-off-by: Julien Grossholtz <julien.grossholtz-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
---
 arch/arm/boot/dts/imx51-ts4800.dts | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm/boot/dts/imx51-ts4800.dts b/arch/arm/boot/dts/imx51-ts4800.dts
index 0ff76a1..c72c944 100644
--- a/arch/arm/boot/dts/imx51-ts4800.dts
+++ b/arch/arm/boot/dts/imx51-ts4800.dts
@@ -165,6 +165,35 @@
 			reg = <0x12000 0x1000>;
 			syscon = <&syscon 0x10 6>;
 		};
+
+		fpga_gpio0: fpga_gpio0@b0010020 {
+			compatible = "technologic,ts4800-gpio";
+			reg = <0x10020 0x6>;
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
+		fpga_gpio1: fpga_gpio1@b0010028 {
+			compatible = "technologic,ts4800-gpio";
+			reg = <0x10028 0x6>;
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
+		fpga_gpio2: fpga_gpio2@b0010030 {
+			compatible = "technologic,ts4800-gpio";
+			reg = <0x10030 0x6>;
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
+		fpga_gpio3: fpga_gpio3@b0010038 {
+			compatible = "technologic,ts4800-gpio";
+			reg = <0x10038 0x6>;
+			gpio-controller;
+			ngpios = <8>;
+			#gpio-cells = <2>;
+		};
 	};
 };
 
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
