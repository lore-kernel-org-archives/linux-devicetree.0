From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: [PATCH 0/3] Qualcomm 8974 RPM & Regulator drivers
Date: Mon, 13 Apr 2015 14:57:59 -0700
Message-ID: <1428962282-32430-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Andy Gross <agross@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Samuel Ortiz <sameo@linux.intel.com>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

In 8974 Qualcomm replaced the previously used special purpose mmio
communication with SMD; a packet based point-to-point communication interface
used since the dawn of time for communicating with the modem - now used to
communicate with everything.

This series adds a smd client for the RPM as well as the regulator driver ontop
of this RPM abstraction. It depends on the pending smd patches:
 https://patchwork.kernel.org/patch/6200611/

Bjorn Andersson (3):
  mfd: devicetree: bindings: Add Qualcomm SMD based RPM DT binding
  mfd: qcom-smd-rpm: Driver for the Qualcomm RPM over SMD
  regulator: qcom: smd: Regulator driver for the Qualcomm RPM

 .../devicetree/bindings/mfd/qcom-rpm-smd.txt       | 136 ++++++++
 drivers/mfd/Kconfig                                |  14 +
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/qcom-smd-rpm.c                         | 234 ++++++++++++++
 drivers/regulator/Kconfig                          |  12 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/qcom_smd-regulator.c             | 351 +++++++++++++++++++++
 include/linux/mfd/qcom-smd-rpm.h                   |  35 ++
 8 files changed, 784 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/qcom-rpm-smd.txt
 create mode 100644 drivers/mfd/qcom-smd-rpm.c
 create mode 100644 drivers/regulator/qcom_smd-regulator.c
 create mode 100644 include/linux/mfd/qcom-smd-rpm.h

-- 
1.8.2.2
