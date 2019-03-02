From: Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH 0/2] Add xo calibration support for wifi rf clock
Date: Sat,  2 Mar 2019 10:36:33 +0530
Message-ID: <20190302050635.17694-1-govinds@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

PMIC XO is the clock source for wifi rf clock in integrated wifi
chipset ex: WCN3990. Due to board layout errors XO frequency drifts
can cause wifi rf clock inaccuracy.
XO calibration test tree in Factory Test Mode is used to find the
best frequency offset(for example +/-2KHz )by programming XO trim
register. This ensure system clock stays within required 20 ppm
WLAN rf clock.

Retrieve the xo trim offset via system firmware (e.g., device tree),
especially in the case where the device doesn't have a useful EEPROM
on which to store the calibrated XO offset (e.g., for integrated Wifi).
Calibrated XO offset is sent to fw, which compensate the clock drift
by programing the XO trim register.

Testing:
        Tested on QCS404 platform(WCN3990 HW)
        Tested FW: WLAN.HL.3.1-00959-QCAHLSWMTPLZ-1

Govind Singh (2):
  dt: bindings: add dt entry for XO calibration support
  ath10k: Add xo calibration support for wifi rf clock

 .../devicetree/bindings/net/wireless/qcom,ath10k.txt |  1 +
 drivers/net/wireless/ath/ath10k/qmi.c                | 12 ++++++++++++
 drivers/net/wireless/ath/ath10k/snoc.c               | 10 ++++++++++
 drivers/net/wireless/ath/ath10k/snoc.h               |  2 ++
 4 files changed, 25 insertions(+)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
