From: Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v2 2/4] dts: arm64/sdm845: Add WCN3990 WLAN module device node
Date: Mon,  1 Oct 2018 16:56:34 +0530
Message-ID: <20181001112636.31715-3-govinds@codeaurora.org>
References: <20181001112636.31715-1-govinds@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20181001112636.31715-1-govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
Cc: ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add device node for the ath10k SNOC platform driver probe
and add resources required for WCN3990 on SDM845 soc.

Signed-off-by: Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts |  7 +++++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi    | 26 +++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
index eedfaf8922e2..4de57f7df93c 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
@@ -440,3 +440,10 @@
 		bias-pull-up;
 	};
 };
+
+&wifi {
+	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
+	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
+	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
+	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
+};
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index e080072cdfdb..36c716cf3a0c 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -86,6 +86,11 @@
 			reg = <0 0x86200000 0 0x2d00000>;
 			no-map;
 		};
+
+		wlan_msa_mem: reserved-memory@96700000 {
+			no-map;
+			reg = <0 0x96700000 0 0x100000>;
+		};
 	};
 
 	cpus {
@@ -1200,5 +1205,26 @@
 				status = "disabled";
 			};
 		};
+
+		wifi: wifi@18800000 {
+			compatible = "qcom,wcn3990-wifi";
+			status = "disabled";
+			reg = <0x18800000 0x800000>;
+			reg-names = "membase";
+			memory-region = <&wlan_msa_mem>;
+			interrupts =
+				<0 413 0 /* CE0 */ >,
+				<0 414 0 /* CE1 */ >,
+				<0 415 0 /* CE2 */ >,
+				<0 416 0 /* CE3 */ >,
+				<0 417 0 /* CE4 */ >,
+				<0 418 0 /* CE5 */ >,
+				<0 420 0 /* CE6 */ >,
+				<0 421 0 /* CE7 */ >,
+				<0 422 0 /* CE8 */ >,
+				<0 423 0 /* CE9 */ >,
+				<0 424 0 /* CE10 */ >,
+				<0 425 0 /* CE11 */ >;
+		};
 	};
 };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
