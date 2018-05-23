From: Can Guo <cang@codeaurora.org>
Subject: [PATCH v5 0/3] Support for Qualcomm UFS QMP PHY on SDM845
Date: Wed, 23 May 2018 11:47:09 +0800
Message-ID: <20180523034712.3420-1-cang@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: subhashj@codeaurora.org, asutoshd@codeaurora.org, vivek.gautam@codeaurora.org, mgautam@codeaurora.org, kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Can Guo <cang@codeaurora.org>
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

Can Guo (3):
  phy: Power on PHY before start Serdes configuration
  phy: Add QMP phy based UFS phy support for sdm845
  dt-bindings: phy-qcom-qmp: Add UFS phy compatible string for sdm845

 .../devicetree/bindings/phy/qcom-qmp-phy.txt       |   4 +-
 drivers/phy/qualcomm/phy-qcom-qmp.c                | 209 +++++++++++++++++++--
 drivers/phy/qualcomm/phy-qcom-qmp.h                |  15 ++
 3 files changed, 215 insertions(+), 13 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
