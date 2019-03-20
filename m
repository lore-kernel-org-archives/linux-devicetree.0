From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: [PATCHv1 0/2] qcom: pms405: adc fixes
Date: Wed, 20 Mar 2019 19:09:56 +0530
Message-ID: <cover.1553088982.git.amit.kucheria@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, andy.gross@linaro.org, David Brown <david.brown@linaro.org>
Cc: devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

A couple of fixes to the adc node in PMS405 to get thermistors to work
correctly.

Amit Kucheria (2):
  arm64: dts: qcom: pms405: calibrate the VADC correctly
  arm64: dts: qcom: pms405: Rename adc outputs as per schematics

 arch/arm64/boot/dts/qcom/pms405.dtsi | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

-- 
2.17.1
