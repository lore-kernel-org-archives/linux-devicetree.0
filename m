From: "Wei.Xu" <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Subject: [PATCH 1/5] arm64: dts: hisi: add mbigen nodes for the hip07 SoC
Date: Fri, 7 Apr 2017 10:07:52 +0800
Message-ID: <1491530876-109791-2-git-send-email-xuwei5@hisilicon.com>
References: <1491530876-109791-1-git-send-email-xuwei5@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1491530876-109791-1-git-send-email-xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
Cc: xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, john.garry-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, gabriele.paoloni-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, liudongdong3-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, yisen.zhuang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, salil.mehta-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, majun258-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, wangkefeng.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, guohanjun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, linuxarm-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, liguozhu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, yimin-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, chenxiang66-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, tanxiaofei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, lipeng321-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, yankejian-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, huangdaode-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, charles.chenxin-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, shameerali.kolothum.thodi-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>

Add mbigen nodes for the hip07 SoC those will be used
for the SAS, XGE and PCIe host controllers.

Signed-off-by: Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
---
 arch/arm64/boot/dts/hisilicon/hip07.dtsi | 61 ++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hip07.dtsi b/arch/arm64/boot/dts/hisilicon/hip07.dtsi
index 5144eb1..6077def 100644
--- a/arch/arm64/boot/dts/hisilicon/hip07.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hip07.dtsi
@@ -1014,6 +1014,34 @@
 		compatible = "hisilicon,mbigen-v2";
 		reg = <0x0 0xa0080000 0x0 0x10000>;
 
+		mbigen_pcie2_a: intc_pcie2_a {
+			msi-parent = <&p0_its_dsa_a 0x40087>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			num-pins = <10>;
+		};
+
+		mbigen_sas1: intc_sas1 {
+			msi-parent = <&p0_its_dsa_a 0x40000>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			num-pins = <128>;
+		};
+
+		mbigen_sas2: intc_sas2 {
+			msi-parent = <&p0_its_dsa_a 0x40040>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			num-pins = <128>;
+		};
+
+		mbigen_smmu_pcie: intc_smmu_pcie {
+			msi-parent = <&p0_its_dsa_a 0x40b0c>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			num-pins = <3>;
+		};
+
 		mbigen_usb: intc_usb {
 			msi-parent = <&p0_its_dsa_a 0x40080>;
 			interrupt-controller;
@@ -1022,6 +1050,39 @@
 		};
 	};
 
+	p0_mbigen_dsa_a: interrupt-controller@c0080000 {
+		compatible = "hisilicon,mbigen-v2";
+		reg = <0x0 0xc0080000 0x0 0x10000>;
+
+		mbigen_dsaf0: intc_dsaf0 {
+			msi-parent = <&p0_its_dsa_a 0x40800>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			num-pins = <409>;
+		};
+
+		mbigen_dsa_roce: intc-roce {
+			msi-parent = <&p0_its_dsa_a 0x40B1E>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			num-pins = <34>;
+		};
+
+		mbigen_sas0: intc-sas0 {
+			msi-parent = <&p0_its_dsa_a 0x40900>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			num-pins = <128>;
+		};
+
+		mbigen_smmu_dsa: intc_smmu_dsa {
+			msi-parent = <&p0_its_dsa_a 0x40b20>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			num-pins = <3>;
+		};
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
