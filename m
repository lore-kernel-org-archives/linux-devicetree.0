From: Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH 4/4] dts: arm64/sdm845: Enable iommu for WCN3990 wifi module device node
Date: Fri, 21 Sep 2018 14:39:07 +0530
Message-ID: <20180921090907.25937-5-govinds@codeaurora.org>
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
Add phandle to the iommu and stream id of wifi iommu block.

Signed-off-by: Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index b0b107641e74..5f5848cb1699 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -1224,6 +1224,7 @@
 				<0 423 0 /* CE9 */ >,
 				<0 424 0 /* CE10 */ >,
 				<0 425 0 /* CE11 */ >;
+			iommus = <&apps_smmu 0x0040 0x1>;
 		};
 	};
 };
-- 
2.17.0
