From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Subject: [PATCH 0/3] qcom: add PMS405 SPMI regulator
Date: Mon, 28 Jan 2019 12:45:01 +0100
Message-ID: <1548675904-18324-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jorge.ramirez-ortiz@linaro.org, lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, bjorn.andersson@linaro.org, vinod.koul@linaro.org, niklas.cassel@linaro.org, khasim.mohammed@linaro.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The following patchset applies cleanly on linux 5.0-rc2.

It adds support for the pms405 spmi regulators and configures s3 as a
supply.

The dts modifications required to enable voltage scaling will be
posted after the currently pending cpufreq patches are merged.

Jorge Ramirez-Ortiz (3):
  dt-bindings: qcom_spmi: Document pms405 support
  drivers: regulator: qcom: add PMS405 SPMI regulator
  arm64: dts: qcom: pms405: add spmi regulators

 .../bindings/regulator/qcom,spmi-regulator.txt     |  24 +++
 arch/arm64/boot/dts/qcom/pms405.dtsi               |  20 +++
 drivers/regulator/qcom_spmi-regulator.c            | 197 +++++++++++++++++++--
 3 files changed, 224 insertions(+), 17 deletions(-)

-- 
2.7.4
