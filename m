Return-Path: <vkoul@kernel.org>
From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v2 0/2] i2c: Add support for Qualcomm Camera Control Interface
Date: Tue, 17 Jul 2018 18:27:27 +0530
Message-Id: <20180717125729.23045-1-vkoul@kernel.org>
To: linux-i2c@vger.kernel.org
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, devicetree@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi,

This series adds support for Qualcomm Camera Control Interface (CCI). This
contains two I2C masters and registers two adapters for each of the masters.

Changes in v2:
 - Add support for two adapters

Todor Tomov (2):
  dt-bindings: i2c: Add binding document for Qualcomm CCI
  i2c: Add Qualcomm Camera Control Interface driver

 .../devicetree/bindings/i2c/i2c-qcom-cci.txt       |  46 ++
 drivers/i2c/busses/Kconfig                         |  10 +
 drivers/i2c/busses/Makefile                        |   1 +
 drivers/i2c/busses/i2c-qcom-cci.c                  | 793 +++++++++++++++++++++
 4 files changed, 850 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
 create mode 100644 drivers/i2c/busses/i2c-qcom-cci.c

-- 
2.14.4
