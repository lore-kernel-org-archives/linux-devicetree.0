From: Bhagavathi Perumal S <bperumal-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v2 0/3] ath10k: Add support to configure BB timing for external FEM
Date: Mon,  3 Dec 2018 23:03:32 +0530
Message-ID: <1543858415-23953-1-git-send-email-bperumal@codeaurora.org>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bhagavathi Perumal S <bperumal-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds support to choose correct Base Band(BB) timing values based on
the input Front End Module(FEM) hardware name from Device Tree entry and
configure it in hardware through WMI interface. Since the BB timing values
can vary between FEM hardwares and not same as default value used
in reference hardware.

Bhagavathi Perumal S (3):
  dt-bindings: net: ath10k: fix node name and device type in qcom ath10k
    example
  dt-bindings: net: ath10k: add new dt entry to identify external FEM
  ath10k: Add support to configure BB timing over wmi

v2:
 Addressed review comments in dt:
  * Fixed node name and device type with new dt patch "dt-bindings: net: ath10k:
     fix node name and device type in qcom ath10k example".
  * Changed the dt patch subject to "dt-bindings: net: ath10k: add new dt entry
    to identify external FEM".
  * Added new property in existing example.
  * Enumarated some valid FEM names.

 .../bindings/net/wireless/qcom,ath10k.txt          | 11 +++--
 drivers/net/wireless/ath/ath10k/mac.c              | 47 ++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/wmi-ops.h          | 20 +++++++++
 drivers/net/wireless/ath/ath10k/wmi.c              | 23 +++++++++++
 drivers/net/wireless/ath/ath10k/wmi.h              | 26 ++++++++++++
 5 files changed, 124 insertions(+), 3 deletions(-)

-- 
1.9.1
