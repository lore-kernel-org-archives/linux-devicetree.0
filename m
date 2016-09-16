From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 0/2] dts: arm64: db820c: adds support to pmic pins
Date: Fri, 16 Sep 2016 18:41:19 +0100
Message-ID: <1474047681-6821-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linus.walleij@linaro.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi Andy/Linus W,

This patchset adds support to pm8994 gpios/mpps on db820c board.
DB820c board Low Speed expansion GPIO_F is connected to PM8994_GPIO5

Its better if we take this patchset from single tree, as dts patch has
dependency on the dt-bindings include file.

Without this patchset GPIO_F on LS expansion would be at 2.7v
instead of 1.8v.

Thanks,
srini

Srinivas Kandagatla (2):
  pinctrl: pm8994: add pad voltage regulator defines
  dts: arm64: db820c: add pmic pins specific dts file

 arch/arm64/boot/dts/qcom/apq8096-db820c-pmic-pins.dtsi | 15 +++++++++++++++
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi           |  2 ++
 include/dt-bindings/pinctrl/qcom,pmic-gpio.h           |  4 ++++
 include/dt-bindings/pinctrl/qcom,pmic-mpp.h            |  6 ++++++
 4 files changed, 27 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/apq8096-db820c-pmic-pins.dtsi

-- 
2.7.4
