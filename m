From: Can Guo <cang@codeaurora.org>
Subject: [PATCH v8 0/5] Support for Qualcomm UFS QMP PHY on SDM845
Date: Tue, 31 Jul 2018 18:09:09 +0800
Message-ID: <20180731100914.19856-1-cang@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: subhashj@codeaurora.org, asutoshd@codeaurora.org, vivek.gautam@codeaurora.org, mgautam@codeaurora.org, kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, Can Guo <cang@codeaurora.org>
List-Id: devicetree@vger.kernel.org

This patch series adds support for UFS QMP PHY on SDM845 and the
compatible string for it. This patch series depends on the current
proposed QMP V3 USB3 UNI PHY support for sdm845 driver [1], on
the DT bindings for the QMP V3 USB3 PHYs based dirver [2], and also
rebased on updated pipe_clk initialization sequence [3]. This series
can only be merged once the dependent patches do.
[1] http://lists-archives.com/linux-kernel/29071659-dt-bindings-phy-qcom-qmp-update-bindings-for-sdm845.html
[2] http://lists-archives.com/linux-kernel/29071660-phy-qcom-qmp-add-qmp-v3-usb3-uni-phy-support-for-sdm845.html
[3] https://patchwork.kernel.org/patch/10376551/

Changes since v7:
- Add one new change to update UFS PHY power on sequence
- Incorporated review comments from Evan, Vivek and Manu.

Changes since v6:
- Add one new change to clean up some structs and field
- Updates the PHY power control sequence.
- Incorporated review comments from Vivek and Manu.

Changes since v5:
- Updates the PHY power control sequence.
- Updates UFS PHY power on condition check.

Changes since v4:
- Adds 'ref_aux' clock back to SDM845 UFS PHY clock list.
- Power on PHY before serdes configuration starts.
- Updates the UFS PHY initialization sequence.
- Updates a few UFS PHY registers.
- Incorporated review comments from Vivek and Manu.

Changes since v3:
- Incorporated review comments from Vivek and Rob.

Changes since v2:
- Incorporated review comments from Vivek and Rob.
- Remove "ref_aux" from sdm845 ufs phy clock list structure.

Changes since v1:
- Incorporated review comments from Vivek and Manu.
- Update the commit title of patch 2.


Can Guo (5):
  phy: Update PHY power control sequence
  phy: General struct and field cleanup
  phy: Add QMP phy based UFS phy support for sdm845
  scsi: ufs: Power on phy after it is initialized
  dt-bindings: phy-qcom-qmp: Add UFS phy compatible string for sdm845

 .../devicetree/bindings/phy/qcom-qmp-phy.txt       |   4 +-
 drivers/phy/qualcomm/phy-qcom-qmp.c                | 216 +++++++++++++++++++--
 drivers/phy/qualcomm/phy-qcom-qmp.h                |  15 ++
 drivers/scsi/ufs/ufs-qcom.c                        |   4 +-
 drivers/scsi/ufs/ufs-qcom.h                        |   1 +
 5 files changed, 219 insertions(+), 21 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
