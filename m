From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 0/3] Qualcomm AOSS QMP side channel binding and driver
Date: Mon, 12 Nov 2018 00:05:54 -0800
Message-ID: <20181112080557.22698-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add binding and driver for the QMP based side-channel communication mechanism
to the AOSS, which is used to control resources not exposed through the RPMh
interface.

Currently implemented is a genpd provider, but pending some improvements in the
thermal framework a cooling device will be added at a later point.

Bjorn Andersson (3):
  dt-bindings: soc: qcom: Add AOSS QMP binding
  soc: qcom: Add AOSS QMP communication driver
  soc: qcom: Add AOSS QMP genpd provider

 .../bindings/soc/qcom/qcom,aoss-qmp.txt       |  63 ++++
 drivers/soc/qcom/Kconfig                      |  15 +
 drivers/soc/qcom/Makefile                     |   2 +
 drivers/soc/qcom/aoss-qmp-pd.c                | 135 ++++++++
 drivers/soc/qcom/aoss-qmp.c                   | 313 ++++++++++++++++++
 include/dt-bindings/power/qcom-aoss-qmp.h     |  15 +
 include/linux/soc/qcom/aoss-qmp.h             |  12 +
 7 files changed, 555 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
 create mode 100644 drivers/soc/qcom/aoss-qmp-pd.c
 create mode 100644 drivers/soc/qcom/aoss-qmp.c
 create mode 100644 include/dt-bindings/power/qcom-aoss-qmp.h
 create mode 100644 include/linux/soc/qcom/aoss-qmp.h

-- 
2.18.0
