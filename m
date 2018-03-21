From: Can Guo <cang@codeaurora.org>
Subject: [PATCH v2 0/2] Support for Qualcomm UFS QMP PHY on SDM845
Date: Wed, 21 Mar 2018 13:37:18 +0800
Message-ID: <20180321053720.12780-1-cang@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: subhashj@codeaurora.org, asutoshd@codeaurora.org, vivek.gautam@codeaurora.org, mgautam@codeaurora.org, kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Can Guo <cang@codeaurora.org>
List-Id: devicetree@vger.kernel.org

This patch series adds support for UFS QMP PHY on SDM845 and the
compitable string for it. This patch series depends on the current
proposed QMP V3 USB3 UNI PHY support for sdm845 driver [1] and also based
on the DT bindings for the QMP V3 USB3 PHYs based dirver [2]. This series
can only be merged once the dependent patches do.
[1] http://lists-archives.com/linux-kernel/29071659-dt-bindings-phy-qcom-qmp-update-bindings-for-sdm845.html
[2] http://lists-archives.com/linux-kernel/29071660-phy-qcom-qmp-add-qmp-v3-usb3-uni-phy-support-for-sdm845.html

Changes since v1:
- Incorporated review comments from Vivek and Manu.
- Update the commit title of patch 2.

Can Guo (2):
  phy: Add QMP phy based UFS phy support for sdm845
  dt-bindings: phy-qcom-qmp: Add UFS phy compitable string for sdm845

 .../devicetree/bindings/phy/qcom-qmp-phy.txt       |   3 +-
 drivers/phy/qualcomm/phy-qcom-qmp.c                | 122 ++++++++++++++++++++-
 drivers/phy/qualcomm/phy-qcom-qmp.h                |   8 ++
 3 files changed, 129 insertions(+), 4 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
