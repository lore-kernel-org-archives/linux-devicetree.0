From: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH 0/2] phy: USB and PCIe phy drivers for Qcom chipsets
Date: Wed, 19 Oct 2016 16:13:45 +0530
Message-ID: <1476873827-7191-1-git-send-email-vivek.gautam@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kishon-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch series adds couple of PHY drivers for Qualcomm chipsets.
a) qcom-qusb2 phy driver: that provides High Speed USB functionality.
b) qcom-qmp phy driver: that is a combo phy providing support for
   USB3, PCIe and UFS controllers.[1]

These drivers are based on the work for msm that is available in
codeaurora[2].

The patches are based on next branch of linux-phy tree.

These have been tested on Dragon board db820c hardware with
required set of patches on integration tree maintained by
Linaro landing team for Qualcomm [3].

[1] Currently the qcom-qmp phy driver supports only USB3 and PCIe
controllers. Later, we plan to add the UFS phy support as well to this.
[2] https://source.codeaurora.org/quic/la/kernel/msm-4.4/log/?h=caf/3.18/msm-3.18
[3] https://git.linaro.org/?p=landing-teams/working/qualcomm/kernel.git;a=shortlog;h=refs/heads/integration-linux-qcomlt

Vivek Gautam (2):
  phy: qcom-qusb2: New driver for QUSB2 PHY on Qcom chips
  phy: qcom-qmp: new qmp phy driver for qcom-chipsets

 .../devicetree/bindings/phy/qcom-qmp-phy.txt       |   61 ++
 .../devicetree/bindings/phy/qcom-qusb2-phy.txt     |   37 +
 drivers/phy/Kconfig                                |   18 +
 drivers/phy/Makefile                               |    2 +
 drivers/phy/phy-qcom-qmp.c                         | 1154 ++++++++++++++++++++
 drivers/phy/phy-qcom-qusb2.c                       |  577 ++++++++++
 6 files changed, 1849 insertions(+)
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
