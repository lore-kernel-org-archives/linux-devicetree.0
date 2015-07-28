From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: [PATCH v3 0/5] Qualcomm Shared Memory & RPM drivers
Date: Mon, 27 Jul 2015 20:20:28 -0700
Message-ID: <1438053633-6659-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Andy Gross <agross@codeaurora.org>, David Brown <davidb@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>
Cc: Jeffrey Hugo <jhugo@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-soc@vger.kernel.org" <linux-soc@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>
List-Id: devicetree@vger.kernel.org

The third iteration of the patches to add support for the regulators provided
by the RPM on family B Qualcomm devices.

This depends on the SMEM implementation that Andy already picked up.

Changes since v2:
- Made smd copy functions work on words for the word access channels
- Corrected access of smem items from secure heap
- Updated error handling path in RPM driver
- Moved init of smd to postcore and rpm to arch
- Minor nits from Georgi on the SMD code
- Moved rpm driver from mfd to soc

Bjorn Andersson (5):
  soc: qcom: Add device tree binding for Shared Memory Device
  soc: qcom: Add Shared Memory Driver
  devicetree: soc: Add Qualcomm SMD based RPM DT binding
  soc: qcom: Driver for the Qualcomm RPM over SMD
  regulator: Regulator driver for the Qualcomm RPM

 .../devicetree/bindings/soc/qcom,smd-rpm.txt       |  117 ++
 .../devicetree/bindings/soc/qcom/qcom,smd.txt      |   79 ++
 drivers/regulator/Kconfig                          |   12 +
 drivers/regulator/Makefile                         |    1 +
 drivers/regulator/qcom_smd-regulator.c             |  349 ++++++
 drivers/soc/qcom/Kconfig                           |   22 +
 drivers/soc/qcom/Makefile                          |    2 +
 drivers/soc/qcom/smd-rpm.c                         |  244 ++++
 drivers/soc/qcom/smd.c                             | 1319 ++++++++++++++++++++
 include/linux/soc/qcom/smd-rpm.h                   |   35 +
 include/linux/soc/qcom/smd.h                       |   46 +
 11 files changed, 2226 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom,smd-rpm.txt
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smd.txt
 create mode 100644 drivers/regulator/qcom_smd-regulator.c
 create mode 100644 drivers/soc/qcom/smd-rpm.c
 create mode 100644 drivers/soc/qcom/smd.c
 create mode 100644 include/linux/soc/qcom/smd-rpm.h
 create mode 100644 include/linux/soc/qcom/smd.h

-- 
1.8.2.2
