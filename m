From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v2 0/3] ipinctrl: qcom: Add support for SM8150
Date: Tue,  2 Jul 2019 16:20:42 +0530
Message-ID: <20190702105045.27646-1-vkoul@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This series adds binding and driver for SM8150 pinctrl block. Also fixes one
binding missing gpio node for msm8998.

Changes since v2:
 - Order the function names and squash functions
 - document gpio-ranges and gpio-reserved-ranges
 - change ufs reset to be after gpios
 - fix pin58 having qdss_cti twice
 - remove .owner
 - Add one patch for missing gpio nodes

Prasad Sodagudi (2):
  dt-bindings: pinctrl: qcom: Add SM8150 pinctrl binding
  pinctrl: qcom: Add SM8150 pinctrl driver

Vinod Koul (1):
  dt-bindings: pinctrl: qcom: Document missing gpio nodes

 .../bindings/pinctrl/qcom,msm8998-pinctrl.txt |   10 +
 .../bindings/pinctrl/qcom,sm8150-pinctrl.txt  |  190 ++
 drivers/pinctrl/qcom/Kconfig                  |    9 +
 drivers/pinctrl/qcom/Makefile                 |    1 +
 drivers/pinctrl/qcom/pinctrl-sm8150.c         | 1548 +++++++++++++++++
 5 files changed, 1758 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm8150-pinctrl.txt
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sm8150.c

-- 
2.20.1
