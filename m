From: Stephan Gerhold <stephan@gerhold.net>
Subject: [RFC PATCH v2 0/4] Add initial device tree for MSM8916 A3U/A5U/L8150
Date: Mon, 22 Jul 2019 11:22:07 +0200
Message-ID: <20190722092211.100586-1-stephan@gerhold.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>
List-Id: devicetree@vger.kernel.org

This patch series adds initial device trees for the Samsung Galaxy A3/A5 (2015)
and the Wileyfox Swift (a re-branded Longcheer L8150), three smartphones
based on the MSM8916 SoC. The device trees provde basic support for SDHCI,
USB device mode and regulators.

The idea is to leverage the efforts that went into mainline for
the Dragonboard 410c. So far this is going quite well:

In addition to the functionality provided by the initial device trees,
Display/GPU, touchscreen, sound and sensors also seem to work in initial tests.
Those will be added in future patch sets.

Changes in v2:
  - Add initial device tree for Longcheer L8150
  - Document new device tree bindings

v1: https://lore.kernel.org/linux-arm-msm/20190624173341.5826-1-stephan@gerhold.net/

Stephan Gerhold (4):
  dt-bindings: vendor-prefixes: Add Longcheer Technology Co., Ltd.
  dt-bindings: qcom: Document bindings for new MSM8916 devices
  arm64: dts: qcom: Add device tree for Samsung Galaxy A3U/A5U
  arm64: dts: qcom: Add device tree for Longcheer L8150

 .../devicetree/bindings/arm/qcom.yaml         |   8 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/qcom/Makefile             |   3 +
 .../boot/dts/qcom/msm8916-longcheer-l8150.dts | 228 +++++++++++++++++
 .../qcom/msm8916-samsung-a2015-common.dtsi    | 236 ++++++++++++++++++
 .../boot/dts/qcom/msm8916-samsung-a3u-eur.dts |  10 +
 .../boot/dts/qcom/msm8916-samsung-a5u-eur.dts |  10 +
 7 files changed, 497 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts

-- 
2.22.0
