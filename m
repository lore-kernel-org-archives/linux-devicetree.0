From: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Subject: [PATCH v4 0/3] Qualcomm Resource Power Manager driver
Date: Tue, 15 Jul 2014 16:00:38 -0700
Message-ID: <1405465241-28684-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series adds a regulator driver for the Resource Power Manager found in
Qualcomm 8660, 8960 and 8064 based devices.

The RPM driver exposes resources to its child devices, that can be accessed to
implement drivers for the regulators, clocks and bus frequency control that's
owned by the RPM in these devices.

Changes since v3:
  - IPC register is acquired through syscon, as it's shared with others

Changes since v2:
  - Fix copy-paste error in dt binding
  - Correct incomplete move from mfd to soc
  - Correct const mistake in regulator driver

Changes since v1:
  - Moved rpm driver to drivers/soc
  - Extracted resource table structs from rpm struct, as per Srinivas request
  - Dropped mode setting support for the regulators for now. Unsure if we need
    it and it requires some rework from the codeaurora solution.
  - Using set_voltage_sel instead of rolling my own "snapping", as per Marks
    request
  - Split regulator ops in mV, uV and swtich versions as per Marks request.
  - Added devicetree property to enable pull down.

Bjorn Andersson (3):
  soc: devicetree: bindings: Add Qualcomm RPM DT binding
  soc: qcom-rpm: Driver for the Qualcomm RPM
  regulator: qcom-rpm: Regulator driver for the Qualcomm RPM

 .../devicetree/bindings/soc/qcom/qcom,rpm.txt      | 263 +++++++
 drivers/regulator/Kconfig                          |  12 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/qcom_rpm-regulator.c             | 787 +++++++++++++++++++++
 drivers/soc/qcom/Kconfig                           |  14 +
 drivers/soc/qcom/Makefile                          |   1 +
 drivers/soc/qcom/qcom_rpm.c                        | 596 ++++++++++++++++
 include/dt-bindings/soc/qcom,rpm.h                 | 142 ++++
 include/linux/soc/qcom_rpm.h                       |  12 +
 9 files changed, 1828 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,rpm.txt
 create mode 100644 drivers/regulator/qcom_rpm-regulator.c
 create mode 100644 drivers/soc/qcom/qcom_rpm.c
 create mode 100644 include/dt-bindings/soc/qcom,rpm.h
 create mode 100644 include/linux/soc/qcom_rpm.h

-- 
1.8.2.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
