From: "Ivan T. Ivanov" <ivan.ivanov@linaro.org>
Subject: [PATCH 0/7] ARM: dts: qcom: Add more device coniguration nodes
Date: Wed,  1 Apr 2015 18:05:08 +0300
Message-ID: <1427900715-26273-1-git-send-email-ivan.ivanov@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Recent Qualcomm PMIC's devices are accessed over SPMI bus.
Every PMIC has several "sub-function" devices inside.

First three patches are adding device nodes to PM8841, PM8941 and PMA8084 PMIC's.
Next two are introducing PM8916 PMIC chip with its device nodes.
Sixth add restart device node for MSM8916 chip.
And the last one add initial GPIO definitions for APQ8016 SBC board.

All compatible drivers are already merged or will soon be merged,
hopefully in the 4.1 merge window. This is why checkpatch will complain about
"appears un-documented". checkpatch will also complain about
"line over 80 characters", but I hope that in this case this is in favor
in readability.

Patches are created top of Kumar's kernel tree and tags/qcom-dt-for-4.1 [1].

Any comments are welcome.

Regards,
Ivan

[1] https://lkml.org/lkml/2015/3/27/599

Ivan T. Ivanov (7):
  ARM: dts: qcom: Add PM8841 functions device nodes
  ARM: dts: qcom: Add PM8941 functions device nodes
  ARM: dts: qcom: Add PMA8084 functions device nodes
  arm64: dts: qcom: Add SPMI PMIC Arbiter node for MSM8916
  arm64: dts: qcom: Add 8x16 chipset SPMI PMIC's nodes
  arm64: dts: qcom: Add MSM8916 restart device node
  arm64: dts: qcom: Add initial set of PMIC and SoC pins for APQ8016 SBC
    board

 arch/arm/boot/dts/qcom-pm8841.dtsi                 | 14 ++++
 arch/arm/boot/dts/qcom-pm8941.dtsi                 | 98 ++++++++++++++++++++++
 arch/arm/boot/dts/qcom-pma8084.dtsi                | 70 ++++++++++++++++
 .../arm64/boot/dts/qcom/apq8016-sbc-pmic-pins.dtsi | 30 +++++++
 arch/arm64/boot/dts/qcom/apq8016-sbc-soc-pins.dtsi | 21 +++++
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi          |  3 +
 arch/arm64/boot/dts/qcom/msm8916-mtp.dtsi          |  1 +
 arch/arm64/boot/dts/qcom/msm8916.dtsi              | 25 +++++-
 arch/arm64/boot/dts/qcom/pm8916.dtsi               | 93 ++++++++++++++++++++
 9 files changed, 354 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/qcom/apq8016-sbc-pmic-pins.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/apq8016-sbc-soc-pins.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm8916.dtsi

--
1.9.1
