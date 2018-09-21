From: Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH 3/4] dt: bindings: add bindings for wifi iommu node
Date: Fri, 21 Sep 2018 14:39:06 +0530
Message-ID: <20180921090907.25937-4-govinds@codeaurora.org>
References: <20180921090907.25937-1-govinds@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180921090907.25937-1-govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

WCN3990 wifi module can optionally make use of the IOMMU.
Add binding documentation for phandle to the IOMMU and
the stream id of wifi iommu block.

Signed-off-by: Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 .../devicetree/bindings/net/wireless/qcom,ath10k.txt         | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
index 22dea7d83ee8..07e58008c665 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
@@ -59,6 +59,10 @@ Optional properties:
 - <supply-name>-supply: handle to the regulator device tree node
 			   optional "supply-name" are "vdd-0.8-cx-mx",
 			   "vdd-1.8-xo", "vdd-1.3-rfa" and "vdd-3.3-ch0".
+- iommus:
+	Usage: optional
+	Value type: <prop-encoded-array>
+	Definition: A list of phandle and IOMMU specifier pairs.
 
 Example (to supply the calibration data alone):
 
@@ -157,4 +161,5 @@ wifi@18000000 {
 		vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
 		vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
 		vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
+		iommus = <&apps_smmu 0x0040 0x1>;
 };
-- 
2.17.0
