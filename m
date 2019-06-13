From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v2 0/7] PM8005 and PMS405 regulator support
Date: Thu, 13 Jun 2019 07:21:57 -0700
Message-ID: <20190613142157.8674-1-jeffrey.l.hugo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
List-Id: devicetree@vger.kernel.org

The MSM8998 MTP reference platform supplies VDD_GFX from s1 of the
pm8005 PMIC.  VDD_GFX is needed to turn on the GPU.  As we are looking
to bring up the GPU, add the support for pm8005 and wire up s1 in a
basic manner so that we have this dependency out of the way and can
focus on enabling the GPU driver.

The s3 regulator of PMS405 is used for voltage scaling of the CPU on
QCS404.

Both PMICs are very similar in design, so add the base support with one,
and trivially add the support for the other on top.

v3:
-Allow PMS405 regulators to be enabled and disabled, instead of the
outdated "always on" concept

v2:
-Perform if statement cleanups per review discussion
-Pull in linear range support since its related, and simple
-Rework the PM8005 to minimize special cases in the driver
-"common2" is now ftsmps426 since that design first implemented it
-Reworked the PMS405 changes on top, since they are related to pm8005 and
trivial

Jeffrey Hugo (4):
  drivers: regulator: qcom_spmi: Refactor get_mode/set_mode
  dt-bindings: qcom_spmi: Document PM8005 regulators
  regulator: qcom_spmi: Add support for PM8005
  arm64: dts: msm8998-mtp: Add pm8005_s1 regulator

Jorge Ramirez (2):
  dt-bindings: qcom_spmi: Document pms405 support
  drivers: regulator: qcom: add PMS405 SPMI regulator

Jorge Ramirez-Ortiz (1):
  drivers: regulator: qcom_spmi: enable linear range info

 .../regulator/qcom,spmi-regulator.txt         |  28 +++
 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi     |  17 ++
 drivers/regulator/qcom_spmi-regulator.c       | 233 +++++++++++++++++-
 3 files changed, 271 insertions(+), 7 deletions(-)

-- 
2.17.1
