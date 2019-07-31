From: Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v2] arm64: dts: qcom: qcs404: Add wifi rails in QCS404 dt node for proxy votes
Date: Wed, 31 Jul 2019 17:37:04 +0530
Message-ID: <20190731120704.7039-1-govinds@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add wifi regulators in qcs404 dt node for proxy vote. Proxy votes are
required for handling driver recovery scenarios to prevent
un-clocked register access during driver recovery.

Signed-off-by: Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index 11c0a7137823..2289b01ee9f0 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -270,6 +270,9 @@
 
 &wifi {
 	status = "okay";
+	vdd-0.8-cx-mx-supply = <&vreg_l2_1p275>;
+	vdd-1.8-xo-supply = <&vreg_l5_1p8>;
+	vdd-1.3-rfa-supply = <&vreg_l1_1p3>;
 };
 
 /* PINCTRL - additions to nodes defined in qcs404.dtsi */
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
