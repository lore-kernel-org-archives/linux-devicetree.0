From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 0/9] arm64: apq8016: dt patches.
Date: Thu, 28 Jan 2016 17:42:40 +0000
Message-ID: <1454002960-3106-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi Andy,

Here are the reworked regulator patches with some additional dt patches
for spi.

Changes since v1:
	- Moved regulators under smd_rpm_regulators label.
	- Added few spi related fixes

thanks,
srini

Srinivas Kandagatla (9):
  arm64: dts: qcom: remove redundant spi cs pins from pinconf
  arm64: dts: qcom: add correct drive strenght on cs pins
  arm64: dts: apq8016-sbc: Add aliases to spi device.
  arm64: dts: remove s2 regulator from smd regulators.
  arm64: dts: qcom: add lable for smd rpm regulators
  arm64: dts: apq8016-sbc: add regulators support
  arm64: dts: apq8016-sbc: make 1.8v available on LS expansion
  arm64: dts: apq8016-sbc: move sdhci node under soc node
  arm64: dts: apq8016-sbc: Add real regulators and pinctrl for sdhc

 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi  | 132 ++++++++++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/msm8916-pins.dtsi |  24 +++---
 arch/arm64/boot/dts/qcom/msm8916.dtsi      |   3 +-
 3 files changed, 143 insertions(+), 16 deletions(-)

-- 
1.9.1
