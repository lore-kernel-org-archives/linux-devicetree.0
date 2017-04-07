From: "Wei.Xu" <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Subject: [PATCH 3/5] arm64: dts: hisi: add RoCE nodes for the hip07 SoC
Date: Fri, 7 Apr 2017 10:07:54 +0800
Message-ID: <1491530876-109791-4-git-send-email-xuwei5@hisilicon.com>
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

Add the infiniband node to support the RoCE function
on the hip07 SoC.

Signed-off-by: Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
---
 arch/arm64/boot/dts/hisilicon/hip07.dtsi | 81 ++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hip07.dtsi b/arch/arm64/boot/dts/hisilicon/hip07.dtsi
index 2feb362..bc54b61 100644
--- a/arch/arm64/boot/dts/hisilicon/hip07.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hip07.dtsi
@@ -1324,5 +1324,86 @@
 			status = "disabled";
 			dma-coherent;
 		};
+
+		infiniband@c4000000 {
+			compatible = "hisilicon,hns-roce-v1";
+			reg = <0x0 0xc4000000 0x0 0x100000>;
+			dma-coherent;
+			eth-handle = <&eth2 &eth3 0 0 &eth0 &eth1>;
+			dsaf-handle = <&dsaf0>;
+			node-guid = [00 9A CD 00 00 01 02 03];
+			#address-cells = <2>;
+			#size-cells = <2>;
+			interrupt-parent = <&mbigen_dsa_roce>;
+			interrupts = <722 1>,
+				     <723 1>,
+				     <724 1>,
+				     <725 1>,
+				     <726 1>,
+				     <727 1>,
+				     <728 1>,
+				     <729 1>,
+				     <730 1>,
+				     <731 1>,
+				     <732 1>,
+				     <733 1>,
+				     <734 1>,
+				     <735 1>,
+				     <736 1>,
+				     <737 1>,
+				     <738 1>,
+				     <739 1>,
+				     <740 1>,
+				     <741 1>,
+				     <742 1>,
+				     <743 1>,
+				     <744 1>,
+				     <745 1>,
+				     <746 1>,
+				     <747 1>,
+				     <748 1>,
+				     <749 1>,
+				     <750 1>,
+				     <751 1>,
+				     <752 1>,
+				     <753 1>,
+				     <785 1>,
+				     <754 4>;
+
+			interrupt-names = "hns-roce-comp-0",
+					  "hns-roce-comp-1",
+					  "hns-roce-comp-2",
+					  "hns-roce-comp-3",
+					  "hns-roce-comp-4",
+					  "hns-roce-comp-5",
+					  "hns-roce-comp-6",
+					  "hns-roce-comp-7",
+					  "hns-roce-comp-8",
+					  "hns-roce-comp-9",
+					  "hns-roce-comp-10",
+					  "hns-roce-comp-11",
+					  "hns-roce-comp-12",
+					  "hns-roce-comp-13",
+					  "hns-roce-comp-14",
+					  "hns-roce-comp-15",
+					  "hns-roce-comp-16",
+					  "hns-roce-comp-17",
+					  "hns-roce-comp-18",
+					  "hns-roce-comp-19",
+					  "hns-roce-comp-20",
+					  "hns-roce-comp-21",
+					  "hns-roce-comp-22",
+					  "hns-roce-comp-23",
+					  "hns-roce-comp-24",
+					  "hns-roce-comp-25",
+					  "hns-roce-comp-26",
+					  "hns-roce-comp-27",
+					  "hns-roce-comp-28",
+					  "hns-roce-comp-29",
+					  "hns-roce-comp-30",
+					  "hns-roce-comp-31",
+					  "hns-roce-async",
+					  "hns-roce-common";
+		};
 	};
 };
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
