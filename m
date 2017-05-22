From: Nikita Yushchenko <nikita.yoush-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH] ARM: dts: vf610-zii-dev-rev-b: add hi8435 device
Date: Mon, 22 May 2017 16:10:10 +0300
Message-ID: <20170522131010.3537-1-nikita.yoush@cogentembedded.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chris Healy <Chris.Healy-c8ZVq/bFV1I@public.gmane.org>, Jeff White <Jeff.White-c8ZVq/bFV1I@public.gmane.org>, Nikita Yushchenko <nikita.yoush-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

ZII dev board rev B has a Holt Hi8435 connected to dspi2.
Add it to device tree.

ZII dev board rev C does not have that, so use rev-b dts file,
not common dtsi file.

Signed-off-by: Nikita Yushchenko <nikita.yoush-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
---
 arch/arm/boot/dts/vf610-zii-dev-rev-b.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/vf610-zii-dev-rev-b.dts b/arch/arm/boot/dts/vf610-zii-dev-rev-b.dts
index 37f95427616f..f433465c3a7c 100644
--- a/arch/arm/boot/dts/vf610-zii-dev-rev-b.dts
+++ b/arch/arm/boot/dts/vf610-zii-dev-rev-b.dts
@@ -348,6 +348,25 @@
 	};
 };
 
+&edma1 {
+	status = "okay";
+};
+
+&dspi2 {
+	bus-num = <1>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_dspi2>;
+	status = "okay";
+	spi-num-chipselects = <2>;
+
+	hi8435@1 {
+		compatible = "holt,hi8435";
+		reg = <1>;
+		spi-max-frequency = <20000000>;
+		gpios = <&gpio5 3 0>;
+	};
+};
+
 &i2c0 {
 	clock-frequency = <100000>;
 	pinctrl-names = "default";
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
