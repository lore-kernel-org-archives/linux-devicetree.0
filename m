From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2 0/7] Qualcomm AOSS QMP side channel binding and driver
Date: Sun,  6 Jan 2019 00:09:08 -0800
Message-ID: <20190106080915.4493-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Russell King <linux@armlinux.org.uk>, Ulf Hansson <ulf.hansson@linaro.org>, Arun Kumar Neelakantam <aneela@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add binding and driver for the QMP based side-channel communication mechanism
to the AOSS, which is used to control resources not exposed through the RPMh
interface.

Currently implemented is a genpd provider, but pending some improvements in the
thermal framework a cooling device will be added at a later point. Patch 7 is
an "RFC" for how we define and probe these cooling devices.

The remoteproc patches updates the MSS driver to vote for the necessary genpd
corners on SDM845.

Lastly patch 6 makes it possible to have a device on the amba bus where the
apb_pclk is controlled as part of a power-domain.

Bjorn Andersson (6):
  dt-bindings: soc: qcom: Add AOSS QMP binding
  soc: qcom: Add AOSS QMP communication driver
  soc: qcom: Add AOSS QMP genpd provider
  remoteproc: q6v5-mss: Active powerdomain for SDM845
  amba: Allow pclk to be controlled by power domain
  soc: qcom: aoss-qmp: Add cooling device support

Rajendra Nayak (1):
  remoteproc: q6v5-mss: Vote for rpmh power domains

 .../bindings/soc/qcom/qcom,aoss-qmp.txt       |  75 ++++
 drivers/amba/bus.c                            |   9 +-
 drivers/remoteproc/qcom_q6v5_mss.c            | 142 ++++++-
 drivers/soc/qcom/Kconfig                      |  18 +
 drivers/soc/qcom/Makefile                     |   2 +
 drivers/soc/qcom/aoss-qmp-pd.c                | 135 +++++++
 drivers/soc/qcom/aoss-qmp.c                   | 349 ++++++++++++++++++
 include/dt-bindings/power/qcom-aoss-qmp.h     |  15 +
 include/linux/soc/qcom/aoss-qmp.h             |  12 +
 9 files changed, 751 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
 create mode 100644 drivers/soc/qcom/aoss-qmp-pd.c
 create mode 100644 drivers/soc/qcom/aoss-qmp.c
 create mode 100644 include/dt-bindings/power/qcom-aoss-qmp.h
 create mode 100644 include/linux/soc/qcom/aoss-qmp.h

-- 
2.18.0
