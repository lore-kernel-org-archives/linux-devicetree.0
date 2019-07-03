From: Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH 1/3] dt: bindings: update compatible dt properties for WCN3990 wifi node
Date: Wed,  3 Jul 2019 09:27:09 +0530
Message-ID: <20190703035711.25592-2-govinds@codeaurora.org>
References: <20190703035711.25592-1-govinds@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20190703035711.25592-1-govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

update compatible dt properties for WCN3990 wifi node to be
compatible across different MSM platforms.

Signed-off-by: Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
index ae661e65354e..baaa3f32ae44 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
@@ -5,6 +5,8 @@ Required properties:
 	* "qcom,ath10k"
 	* "qcom,ipq4019-wifi"
 	* "qcom,wcn3990-wifi"
+	* "qcom,sdm845-wcn39xx-wifi"
+	* "qcom,qcs40x-wcn39xx-wifi"
 
 PCI based devices uses compatible string "qcom,ath10k" and takes calibration
 data along with board specific data via "qcom,ath10k-calibration-data".
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
