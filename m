From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: [PATCH v1 0/2] Expose thermal information for pms405 PMIC
Date: Wed, 12 Dec 2018 15:47:53 +0530
Message-ID: <cover.1544599950.git.amit.kucheria@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, andy.gross@linaro.org, mka@chromium.org, khasim.mohammed@linaro.org, devicetree@vger.kernel.org, David Brown <david.brown@linaro.org>, Douglas Anderson <dianders@chromium.org>, Hartmut Knaack <knaack.h@gmx.de>, Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Mark Rutland <mark.rutland@arm.com>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Siddartha Mohanadoss <smohanad@codeaurora.org>, "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Expose the on-die temperature sensor on the pms405 PMIC through the
spmi-temp-alarm driver.

This series applies on top of the qcs404 DT series by Vinod[1]

[1] https://patchwork.kernel.org/cover/10675575/

Amit Kucheria (2):
  dt-bindings: iio: adc: Add binding for ADC on pms405 PMIC
  arm64: dts: pms405: Export PMIC temperature to thermal framework

 .../bindings/iio/adc/qcom,spmi-vadc.txt       |  1 +
 arch/arm64/boot/dts/qcom/pms405.dtsi          | 79 +++++++++++++++++++
 2 files changed, 80 insertions(+)

-- 
2.17.1
