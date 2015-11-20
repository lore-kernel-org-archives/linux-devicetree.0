From: Yendapally Reddy Dhananjaya Reddy <yrdreddy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 3/3] ARM: dts: enable pinctrl for Broadcom NSP
Date: Fri, 20 Nov 2015 12:58:29 -0500
Message-ID: <1448042309-46445-1-git-send-email-yrdreddy@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yendapally Reddy Dhananjaya Reddy <yrdreddy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This enables the pinctrl support for Broadcom NSP SoC

Signed-off-by: Yendapally Reddy Dhananjaya Reddy <yrdreddy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 arch/arm/boot/dts/bcm-nsp.dtsi   | 7 +++++++
 arch/arm/boot/dts/bcm958625k.dts | 9 +++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/bcm-nsp.dtsi b/arch/arm/boot/dts/bcm-nsp.dtsi
index b74438c..a16d743 100644
--- a/arch/arm/boot/dts/bcm-nsp.dtsi
+++ b/arch/arm/boot/dts/bcm-nsp.dtsi
@@ -226,5 +226,12 @@
 			interrupts = <GIC_SPI 89 IRQ_TYPE_NONE>;
 			clock-frequency = <100000>;
 		};
+
+		pinctrl: pinctrl@3f1c0 {
+			compatible = "brcm,nsp-pinmux";
+			reg = <0x3f1c0 0x04>,
+			      <0x30028 0x04>,
+			      <0x3f408 0x04>;
+		};
 	};
 };
diff --git a/arch/arm/boot/dts/bcm958625k.dts b/arch/arm/boot/dts/bcm958625k.dts
index b966955..e298450 100644
--- a/arch/arm/boot/dts/bcm958625k.dts
+++ b/arch/arm/boot/dts/bcm958625k.dts
@@ -105,3 +105,12 @@
 		};
 	};
 };
+
+&pinctrl {
+	pinctrl-names = "default";
+	pinctrl-0 = <&nand_sel>;
+	nand_sel: nand_sel {
+		function = "nand";
+		groups = "nand_grp";
+	};
+};
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
