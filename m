From: Harish Bandi <c-hbandi@codeaurora.org>
Subject: [PATCH v8 0/2] Enable Bluetooth functionality for WCN3998.
Date: Fri, 26 Apr 2019 19:26:00 +0530
Message-ID: <1556286962-3132-1-git-send-email-c-hbandi@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: marcel@holtmann.org, johan.hedberg@gmail.com
Cc: mka@chromium.org, linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org, linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org, anubhavg@codeaurora.org, devicetree@vger.kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, Harish Bandi <c-hbandi@codeaurora.org>
List-Id: devicetree@vger.kernel.org

This patch series we add support for WCN3998 BT chip set. This new chip set
is based from the WCN3990 with minimal power numbers. So here in this patch
The major difference between wcn3990 and WCN3998 is only power numbers.
where as init process and fw download is same with wcn3990.
So we add new compatible for WCN3998. 
Removed the Reading of regulator values from dts.
Added new compatible for WCN3998.
Changes in V8:
Removed export of qca_is_wcn399x() and added as inline function
Added robh reviewed by tag in commit text
Changes in V7:
Initialized rom_ver to 0 to fix compiler warning 
Changed Commit text for DT patch
Changes in V6:
changed return value to false in the qca_is_wcn399x()stub
Changes in V5:
changed is_qca_soc_type_wcn399x_family to
qca_is_wcn399x helper function 
Moved the qca_is_wcn399x function to btqca.c
modified the DT document for wcn399x as per driver code
Changes in V4:
Added is_qca_soc_type_wcn399x_family helper function 
to get the soc type is wcn399x or not.
Changes in V3:
updated to latest code base.

Harish Bandi (2):
  Bluetooth: hci_qca: Added support for WCN3998
  dt-bindings: net: bluetooth: Add device tree bindings for QTI chip
    WCN3998

 .../devicetree/bindings/net/qualcomm-bluetooth.txt |  5 +--
 drivers/bluetooth/btqca.c                          |  7 ++--
 drivers/bluetooth/btqca.h                          | 11 +++++-
 drivers/bluetooth/hci_qca.c                        | 40 ++++++++++++++--------
 4 files changed, 43 insertions(+), 20 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
