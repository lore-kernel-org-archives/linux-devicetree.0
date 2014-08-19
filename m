From: Georgi Djakov <gdjakov@mm-sol.com>
Subject: [PATCH v1 0/3] pinctrl: qcom: Add APQ8084 pinctrl support
Date: Tue, 19 Aug 2014 20:22:13 +0300
Message-ID: <1408468936-12252-1-git-send-email-gdjakov@mm-sol.com>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: linus.walleij@linaro.org, galak@codeaurora.org, bjorn.andersson@sonymobile.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, grant.likely@linaro.org, sboyd@codeaurora.org, agross@codeaurora.org, iivanov@mm-sol.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, Georgi Djakov <gdjakov@mm-sol.com>
List-Id: devicetree@vger.kernel.org

This set of patches adds pinctrl support for the Qualcomm APQ8084 platform.
The first patch adds the pin definitions. The second patch contains the
devicetree documentation. The last patch adds the DT node.

Georgi Djakov (3):
  pinctrl: qcom: Add APQ8084 pinctrl support
  dt: Document Qualcomm APQ8084 pinctrl binding
  ARM: dts: Add TLMM DT node for apq8084

 .../bindings/pinctrl/qcom,apq8084-pinctrl.txt      |  109 ++
 arch/arm/boot/dts/qcom-apq8084.dtsi                |   10 +
 drivers/pinctrl/qcom/Kconfig                       |    8 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-apq8084.c             | 1302 ++++++++++++++++++++
 5 files changed, 1430 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,apq8084-pinctrl.txt
 create mode 100644 drivers/pinctrl/qcom/pinctrl-apq8084.c

-- 
1.7.9.5
