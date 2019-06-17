From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v5 0/5] PM8005 and PMS405 regulator support
Date: Mon, 17 Jun 2019 11:36:43 -0700
Message-ID: <20190617183643.13449-1-jeffrey.l.hugo@gmail.com>
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

v5:
-drop accepted changes
-.get_voltage -> .get_voltage_sel
-made set_mode be 1:1 between API and hw

v4:
-fix the linear range change to use the correct implementation
-mask out the non-mode bits when reading the hardware reg
-correct the pms405 supply pins listing
-correct the pms405 s3 supply name in the match struct
-correct subject names to be more aligned with the subsystem history

v3:
-Allow PMS405 regulators to be enabled and disabled, instead of the
outdated "always on" concept

v2:
-Perform if statement cleanups per review discussion
-Pull in linear range support since its related, and simple
-Rework the PM8005 to minimize special cases in the driver
-"common2" is now ftsmps426 since that design first implemented it
-Reworked the PMS405 changes on top, since they are related to pm8005
and trivial

Jeffrey Hugo (3):
  dt-bindings: qcom_spmi: Document PM8005 regulators
  regulator: qcom_spmi: Add support for PM8005
  arm64: dts: msm8998-mtp: Add pm8005_s1 regulator

Jorge Ramirez (2):
  dt-bindings: qcom_spmi: Document pms405 support
  regulator: qcom_spmi: add PMS405 SPMI regulator

 .../regulator/qcom,spmi-regulator.txt         |  22 ++
 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi     |  17 ++
 drivers/regulator/qcom_spmi-regulator.c       | 213 ++++++++++++++++++
 3 files changed, 252 insertions(+)

-- 
2.17.1
