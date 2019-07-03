From: Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH 0/3] Move voltage regulator config to driver private data
Date: Wed,  3 Jul 2019 09:27:08 +0530
Message-ID: <20190703035711.25592-1-govinds@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

WCN3990 voltage regulator config is varying b/w different MSM platforms ex: SDM845/
QCS404. In order to have scalable config, move regulator config to driver
private data.

Tested HW: WCN3990(SDM845/QCS404)
Tested FW: WLAN.HL.3.1-01040-QCAHLSWMTPLZ-1

Govind Singh (3):
  dt: bindings: update compatible dt properties for WCN3990 wifi node
  ath10k: Move regulator config to driver private data
  arm64: dts: qcom: qcs404: Modify wifi dt node for SDM845/QCS404
    devices

 .../bindings/net/wireless/qcom,ath10k.txt     |  2 +
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi      |  3 ++
 arch/arm64/boot/dts/qcom/qcs404.dtsi          |  2 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  2 +-
 drivers/net/wireless/ath/ath10k/snoc.c        | 38 +++++++++++++++----
 drivers/net/wireless/ath/ath10k/snoc.h        | 23 ++++++-----
 6 files changed, 51 insertions(+), 19 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
