From: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 4/6] ARM: dts: hix5hd2: add sata node
Date: Thu, 28 Aug 2014 13:34:18 +0800
Message-ID: <1409204060-9223-5-git-send-email-zhangfei.gao@linaro.org>
References: <1409204060-9223-1-git-send-email-zhangfei.gao@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1409204060-9223-1-git-send-email-zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mark.rutland-5wv7dgnIgG8@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, haifeng.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jchxue-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jiancheng Xue <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Jiancheng Xue <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Signed-off-by: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/hisi-x5hd2-dkb.dts |    5 +++++
 arch/arm/boot/dts/hisi-x5hd2.dtsi    |   20 ++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/hisi-x5hd2-dkb.dts b/arch/arm/boot/dts/hisi-x5hd2-dkb.dts
index 0da3f3b..375a10c 100644
--- a/arch/arm/boot/dts/hisi-x5hd2-dkb.dts
+++ b/arch/arm/boot/dts/hisi-x5hd2-dkb.dts
@@ -79,3 +79,8 @@
 		reg = <1>;
 	};
 };
+
+&ahci {
+        phys = <&sata_phy>;
+        phy-names = "sata-phy";
+};
diff --git a/arch/arm/boot/dts/hisi-x5hd2.dtsi b/arch/arm/boot/dts/hisi-x5hd2.dtsi
index 9252264..18f52f0 100644
--- a/arch/arm/boot/dts/hisi-x5hd2.dtsi
+++ b/arch/arm/boot/dts/hisi-x5hd2.dtsi
@@ -213,5 +213,25 @@
 			interrupts = <0 67 4>;
 			clocks = <&clock HIX5HD2_USB_CLK>;
 		};
+
+		peripheral_ctrl: syscon@a20000 {
+			compatible = "syscon";
+			reg = <0xa20000 0x1000>;
+		};
+
+		sata_phy: phy@1900000 {
+			compatible = "hisilicon,hix5hd2-sata-phy";
+			reg = <0x1900000 0x10000>;
+			#phy-cells = <0>;
+			hisilicon,peripheral-syscon = <&peripheral_ctrl>;
+			hisilicon,power-reg = <0x8 10>;
+		};
+
+		ahci: sata@1900000 {
+                        compatible = "hisilicon,hisi-ahci";
+                        reg = <0x1900000 0x10000>;
+                        interrupts = <0 70 4>;
+                        clocks = <&clock HIX5HD2_SATA_CLK>;
+		};
 	};
 };
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
