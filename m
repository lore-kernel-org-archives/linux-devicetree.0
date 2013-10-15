From: Rostislav Lisovy <lisovy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/4] ARM: dts: i.MX53: Add alternate pinmux option for i2c_3
Date: Wed, 16 Oct 2013 00:03:26 +0200
Message-ID: <1381874609-14464-2-git-send-email-lisovy@gmail.com>
References: <1381874609-14464-1-git-send-email-lisovy@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381874609-14464-1-git-send-email-lisovy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: pisa-/N2ztlQkxE7Ub/6JBqosbQ@public.gmane.org, Rostislav Lisovy <lisovy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Rostislav Lisovy <lisovy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

diff --git a/arch/arm/boot/dts/imx53.dtsi b/arch/arm/boot/dts/imx53.dtsi
index 4307e80..55e83d1 100644
--- a/arch/arm/boot/dts/imx53.dtsi
+++ b/arch/arm/boot/dts/imx53.dtsi
@@ -599,6 +599,13 @@
 							MX53_PAD_GPIO_5__I2C3_SCL 0xc0000000
 						>;
 					};
+
+					pinctrl_i2c3_2: i2c3grp-2 {
+						fsl,pins = <
+							MX53_PAD_GPIO_3__I2C3_SCL	0xc0000000
+							MX53_PAD_GPIO_6__I2C3_SDA	0xc0000000
+						>;
+					};
 				};
 
 				ipu_disp0 {
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
