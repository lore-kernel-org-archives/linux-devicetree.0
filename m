From: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v4 0/4] phy: USB and PCIe phy drivers for Qcom chipsets
Date: Tue, 10 Jan 2017 16:21:55 +0530
Message-ID: <1484045519-19030-1-git-send-email-vivek.gautam@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch series adds couple of PHY drivers for Qualcomm chipsets.
a) qcom-qusb2 phy driver: that provides High Speed USB functionality.
b) qcom-qmp phy driver: that is a combo phy providing support for
   USB3, PCIe, UFS and few other controllers.

The patches are based on next branch of linux-phy tree.

These have been tested on Dragon board db820c hardware with
required set of dt patches on integration tree maintained by
Linaro landing team for Qualcomm [1].

Couple of other patches [2,3,4] for nvmem are also pulled in for testing.
Patch series fixing DMA config for XHCI [5] is also pulled in for testing.

Changes since v3:
 - Addressed review comments given by Rob and Stephen for qusb2 phy
   and qmp phy bindings respectively.
 - Addressed review comments given by Stephen and Bjorn for qmp phy driver.

Changes since v2:
 - Addressed review comments given by Rob and Stephen for bindings.
 - Addressed the review comments given by Stephen for the qusb2 and qmp
   phy drivers.

Changes since v1:
 - Moved device tree binding documentation to separate patches, as suggested
   by Rob.
 - Addressed review comment regarding qfprom accesses by qusb2 phy driver,
   given by Rob.
 - Addressed review comments from Kishon.
 - Addressed review comments from Srinivas for QMP phy driver.
 - Addressed kbuild warning.

Please see individual patches for detailed changelogs.

[1] https://git.linaro.org/landing-teams/working/qualcomm/kernel.git/log/?h=integration-linux-qcomlt
[2] https://lkml.org/lkml/2016/11/17/21
[3] https://lkml.org/lkml/2016/12/19/18
[4] http://www.spinics.net/lists/linux-arm-msm/msg25483.html
[5] https://lkml.org/lkml/2016/11/17/339

Vivek Gautam (4):
  dt-bindings: phy: Add support for QUSB2 phy
  phy: qcom-qusb2: New driver for QUSB2 PHY on Qcom chips
  dt-bindings: phy: Add support for QMP phy
  phy: qcom-qmp: new qmp phy driver for qcom-chipsets

 .../devicetree/bindings/phy/qcom-qmp-phy.txt       |   76 ++
 .../devicetree/bindings/phy/qcom-qusb2-phy.txt     |   45 +
 drivers/phy/Kconfig                                |   18 +
 drivers/phy/Makefile                               |    2 +
 drivers/phy/phy-qcom-qmp.c                         | 1206 ++++++++++++++++++++
 drivers/phy/phy-qcom-qusb2.c                       |  539 +++++++++
 6 files changed, 1886 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
 create mode 100644 Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
 create mode 100644 drivers/phy/phy-qcom-qmp.c
 create mode 100644 drivers/phy/phy-qcom-qusb2.c

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
