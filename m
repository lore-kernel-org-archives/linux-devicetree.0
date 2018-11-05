From: Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v4 0/3] Enable ath10k wcn3990 wifi driver support on sdm845
Date: Mon,  5 Nov 2018 18:38:35 +0530
Message-ID: <1541423318-19312-1-git-send-email-govinds@codeaurora.org>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series enables ath10k wifi driver support for WCN3990 target
on sdm845 SOC. This series also updates the missing dt binding documentation
and adds optional iommu property.

Changes since v3:
    Moved interrupt/reg/reg-name to required property.
    Removed unused clocks.
    Corrected interrupt no's.

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

 .../bindings/net/wireless/qcom,ath10k.txt          | 62 ++++++++++++++--------
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts            |  8 +++
 arch/arm64/boot/dts/qcom/sdm845.dtsi               | 26 +++++++++
 3 files changed, 74 insertions(+), 22 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
