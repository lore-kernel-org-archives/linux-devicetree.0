From: Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v2 0/4] Enable ath10k wcn3990 wifi driver support on sdm845
Date: Mon,  1 Oct 2018 16:56:32 +0530
Message-ID: <20181001112636.31715-1-govinds@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
Cc: ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series enables ath10k wifi driver support for WCN3990 target
on sdm845 SOC. This series also updates the missing dt binding documentation
and adds optional iommu property.

sdm845 dtsi changes in this series are based on top of
https://patchwork.kernel.org/cover/10573121/ change.

Changes since v1:
	Listed no of interrupts/clocks for each set of compatible.
	Added missing 'wifi' label to sdm845.dtsi.

Govind Singh (4):
  dt: bindings: add missing dt properties for WCN3990 wifi node
  dts: arm64/sdm845: Add WCN3990 WLAN module device node
  dt: bindings: add bindings for wifi iommu node
  dts: arm64/sdm845: Enable iommu for WCN3990 wifi module device node

 .../bindings/net/wireless/qcom,ath10k.txt     | 34 +++++++++++++++----
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts       |  7 ++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi          | 27 +++++++++++++++
 3 files changed, 61 insertions(+), 7 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
