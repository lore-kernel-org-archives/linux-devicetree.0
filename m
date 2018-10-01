From: Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v2 3/4] dt: bindings: add bindings for wifi iommu node
Date: Mon,  1 Oct 2018 16:56:35 +0530
Message-ID: <20181001112636.31715-4-govinds@codeaurora.org>
References: <20181001112636.31715-1-govinds@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20181001112636.31715-1-govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
Cc: ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

WCN3990 wifi module can optionally make use of the IOMMU.
Add binding documentation for phandle to the IOMMU and
the stream id of wifi iommu block.

Signed-off-by: Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 .../devicetree/bindings/net/wireless/qcom,ath10k.txt        | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
index f831bb1c5952..2a2f44c461f7 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
@@ -65,6 +65,11 @@ Optional properties:
 - <supply-name>-supply: handle to the regulator device tree node
 			   optional "supply-name" are "vdd-0.8-cx-mx",
 			   "vdd-1.8-xo", "vdd-1.3-rfa" and "vdd-3.3-ch0".
+- iommus:
+	Usage: optional
+	Value type: <prop-encoded-array>
+	Definition: A list of phandle and IOMMU specifier pairs
+	            for "qcom,wcn3990-wifi" compatible target.
 
 Example (to supply the calibration data alone):
 
@@ -163,4 +168,5 @@ wifi@18000000 {
 		vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
 		vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
 		vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
+		iommus = <&apps_smmu 0x0040 0x1>;
 };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
