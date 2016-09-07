From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 0/2] phy: Add support msm8996/apq8096 pcie phy
Date: Wed,  7 Sep 2016 11:55:31 +0100
Message-ID: <1473245733-17260-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

This patch adds supports to pcie phy found in msm8996/apq8096.
This phy block has 3 ports each one supported a single root complex.

Most of the code is derived from qualcomms downstream 3.18 kernel.

I tested this patch on DB820c based on APQ8096 on port A and
port A using sata and ethernet controllers.

Thanks,
srini

Srinivas Kandagatla (2):
  dt-bindings: msm8996-pcie-phy: add support for msm8996 pcie phy
  phy: msm8996-pcie-phy: Add support to msm8996 pcie phy

 .../bindings/phy/qcom-msm8996-pcie-phy.txt         |  62 +++
 drivers/phy/Kconfig                                |   7 +
 drivers/phy/Makefile                               |   1 +
 drivers/phy/phy-qcom-msm8996-pcie.c                | 492 +++++++++++++++++++++
 4 files changed, 562 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom-msm8996-pcie-phy.txt
 create mode 100644 drivers/phy/phy-qcom-msm8996-pcie.c

-- 
2.7.4
