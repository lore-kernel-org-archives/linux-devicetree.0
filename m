From: Bhagavathi Perumal S <bperumal-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH 0/2] ath10k: Add support to configure BB timing for external FEM
Date: Thu,  4 Oct 2018 17:12:42 +0530
Message-ID: <1538653364-1239-1-git-send-email-bperumal@codeaurora.org>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bperumal-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This adds support to choose correct Base Band(BB) timing values based on
the input Front End Module(FEM) hardware name from Device Tree entry and
configure it in hardware through WMI interface. Since the BB timing values
can vary between FEM hardwares and not same as default value used
in reference hardware.

Bhagavathi Perumal S (2):
  dt: bindings: add new dt entry to indentify external FEM
  ath10k: Add support to configure BB timing over wmi

 .../bindings/net/wireless/qcom,ath10k.txt          | 22 ++++++++++
 drivers/net/wireless/ath/ath10k/mac.c              | 47 ++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi-ops.h          | 20 +++++++++
 drivers/net/wireless/ath/ath10k/wmi.c              | 23 +++++++++++
 drivers/net/wireless/ath/ath10k/wmi.h              | 26 ++++++++++++
 5 files changed, 138 insertions(+)

-- 
1.9.1
