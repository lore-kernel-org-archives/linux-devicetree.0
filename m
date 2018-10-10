From: Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v3 0/3] Enable ath10k wcn3990 wifi driver support on sdm845
Date: Wed, 10 Oct 2018 17:22:53 +0530
Message-ID: <1539172376-19269-1-git-send-email-govinds@codeaurora.org>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series enables ath10k wifi driver support for WCN3990 target
on sdm845 SOC. This series also updates the missing dt binding documentation
and adds optional iommu property.

Changes since v2:
    dropped [v2,4/4] dts: arm64/sdm845: Enable iommu for WCN3990 wifi module
    device node patch from the series as dependent patch is not yet merged.
    Enabled status flag from sdm845-mtp.dts.

Changes since v1:
    Listed no of interrupts/clocks for each set of compatible.
    Added missing 'wifi' label to sdm845.dtsi.

Govind Singh (3):
  dt: bindings: add missing dt properties for WCN3990 wifi node
  dts: arm64/sdm845: Add WCN3990 WLAN module device node
  dt: bindings: add bindings for wifi iommu node

 .../bindings/net/wireless/qcom,ath10k.txt          | 33 +++++++++++++++++-----
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts            |  8 ++++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi               | 26 +++++++++++++++++
 3 files changed, 60 insertions(+), 7 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
