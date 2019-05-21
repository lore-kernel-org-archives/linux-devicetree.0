From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH 0/3] PM8005 regulator support for msm8998 GPU
Date: Tue, 21 May 2019 09:49:32 -0700
Message-ID: <20190521164932.14265-1-jeffrey.l.hugo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: agross@kernel.org, david.brown@linaro.org, bjorn.andersson@linaro.org, jcrouse@codeaurora.org, lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
List-Id: devicetree@vger.kernel.org

The MSM8998 MTP reference platform supplies VDD_GFX from s1 of the
pm8005 PMIC.  VDD_GFX is needed to turn on the GPU.  As we are looking
to bring up the GPU, add the support for pm8005 and wire up s1 in a
basic manner so that we have this dependency out of the way and can
focus on enabling the GPU driver.

Jeffrey Hugo (3):
  dt-bindings: qcom_spmi: Document PM8005 regulators
  regulator: qcom_spmi: Add support for PM8005
  arm64: dts: msm8998-mtp: Add pm8005_s1 regulator

 .../regulator/qcom,spmi-regulator.txt         |   4 +
 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi     |  17 ++
 drivers/regulator/qcom_spmi-regulator.c       | 203 +++++++++++++++++-
 3 files changed, 219 insertions(+), 5 deletions(-)

-- 
2.17.1
