Return-Path: <vkoul@kernel.org>
From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v4 0/2] i2c: Add support for Qcom CCI I2C controller
Date: Mon, 20 Aug 2018 12:09:51 +0530
Message-Id: <20180820063953.6866-1-vkoul@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Todor Tomov <todor.tomov@linaro.org>, Vinod Koul <vkoul@kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi,

This series adds support for Qualcomm Camera Control Interface (CCI) I2C
controller. This block contains one/two I2C masters and registers these
adapters based on the controller probed on.

Changes in v4:
 - Add pm support
 - Fix based on Bjorn feedback

Changes in v3:
 - Update DT binding per RobH comments
 - Add the subnode for bus instances
 - Move all compataible data to driver data
 - add num_master data and use that to register and use masters

Changes in v2:
 - Add support for two adapters




Todor Tomov (2):
  dt-bindings: i2c: Add binding for Qualcomm CCI I2C controller
  i2c: Add Qualcomm CCI I2C driver

 .../devicetree/bindings/i2c/i2c-qcom-cci.txt       |  83 ++
 drivers/i2c/busses/Kconfig                         |  10 +
 drivers/i2c/busses/Makefile                        |   1 +
 drivers/i2c/busses/i2c-qcom-cci.c                  | 879 +++++++++++++++++++++
 4 files changed, 973 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
 create mode 100644 drivers/i2c/busses/i2c-qcom-cci.c

-- 
2.14.4
