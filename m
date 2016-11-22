From: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: [PATCH v2 0/4] phy: USB and PCIe phy drivers for Qcom chipsets
Date: Tue, 22 Nov 2016 17:32:39 +0530
Message-ID: <1479816163-5260-1-git-send-email-vivek.gautam@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: srinivas.kandagatla@linaro.org, sboyd@codeaurora.org, linux-arm-msm@vger.kernel.org, Vivek Gautam <vivek.gautam@codeaurora.org>
List-Id: devicetree@vger.kernel.org

This patch series adds couple of PHY drivers for Qualcomm chipsets.
a) qcom-qusb2 phy driver: that provides High Speed USB functionality.
b) qcom-qmp phy driver: that is a combo phy providing support for
   USB3, PCIe and UFS controllers.[1]

The patches are based on next branch of linux-phy tree.

These have been tested on Dragon board db820c hardware with
required set of patches on integration tree maintained by
Linaro landing team for Qualcomm [2]. The QUSB2 phy driver
is also based on qfprom patch [3]:
[PATCH v2] nvmem: qfprom: Allow single byte accesses for read/write

Changes since v1:
 - Moved device tree binding documentation to separate patches, as suggested
   by Rob.
 - Addressed review comment from Rob, regarding qfprom accesses by qusb2 phy driver,
   given by Rob.
 - Addressed review comments from Kishon.
 - Addressed review comments from Srinivas for QMP phy driver.
 - Addressed kbuild warning.
 - Please see patches 2 & 4 in the series for details on changes in v2.

[1] Currently the qcom-qmp phy driver supports only USB3 and PCIe
controllers. Later, we plan to add the UFS phy support as well to this.
[2] https://git.linaro.org/?p=landing-teams/working/qualcomm/kernel.git;a=shortlog;h=refs/heads/integration-linux-qcomlt
[3] https://lkml.org/lkml/2016/11/17/21

Vivek Gautam (4):
  dt-bindings: phy: Add support for QUSB2 phy
  phy: qcom-qusb2: New driver for QUSB2 PHY on Qcom chips
  dt-bindings: phy: Add support for QMP phy
  phy: qcom-qmp: new qmp phy driver for qcom-chipsets

 .../devicetree/bindings/phy/qcom-qmp-phy.txt       |   74 ++
 .../devicetree/bindings/phy/qcom-qusb2-phy.txt     |   55 +
 drivers/phy/Kconfig                                |   20 +
 drivers/phy/Makefile                               |    2 +
 drivers/phy/phy-qcom-qmp.c                         | 1141 ++++++++++++++++++++
 drivers/phy/phy-qcom-qusb2.c                       |  549 ++++++++++
 6 files changed, 1841 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
 create mode 100644 Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
 create mode 100644 drivers/phy/phy-qcom-qmp.c
 create mode 100644 drivers/phy/phy-qcom-qusb2.c

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
