From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 0/4] Qualcomm QCS404 TLMM pinctrl driver
Date: Wed, 19 Sep 2018 18:37:08 -0700
Message-ID: <20180920013712.2361-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This series introduces register accessor functions and a level of indirection
for these, in order to handle dispersed tiles. It then adds the TLMM binder and
driver for the QCS404 platform.

Avaneesh Kumar Dwivedi (1):
  pinctrl: qcom: Add qcs404 pinctrl driver

Bjorn Andersson (3):
  pinctrl: qcom: Introduce readl/writel accessors
  pinctrl: qcom: Support dispersed tiles
  dt-bindings: pinctrl: qcom: Add QCS404 pinctrl binding

 .../bindings/pinctrl/qcom,qcs404-pinctrl.txt  |  195 +++
 drivers/pinctrl/qcom/Kconfig                  |    8 +
 drivers/pinctrl/qcom/Makefile                 |    1 +
 drivers/pinctrl/qcom/pinctrl-msm.c            |  116 +-
 drivers/pinctrl/qcom/pinctrl-msm.h            |    4 +
 drivers/pinctrl/qcom/pinctrl-qcs404.c         | 1523 +++++++++++++++++
 6 files changed, 1804 insertions(+), 43 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,qcs404-pinctrl.txt
 create mode 100644 drivers/pinctrl/qcom/pinctrl-qcs404.c

-- 
2.18.0
