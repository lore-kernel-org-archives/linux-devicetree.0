From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: [PATCH v1 00/12] qcom: dts: thermal cleanups
Date: Mon, 18 Feb 2019 18:05:14 +0530
Message-ID: <cover.1550493113.git.amit.kucheria@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, edubezval@gmail.com, andy.gross@linaro.org, David Brown <david.brown@linaro.org>
Cc: devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

- Expose all temperature sensors on msm8916, msm996, msm8998, sdm845
- split up the register address map for msm8998
- standardize names of the various thermal-zones across boards to make it
  easy for test scripts to parse

Amit Kucheria (12):
  arm64: dts: msm8998: thermal: split address space into two
  arm64: dts: msm8998: efficiency is not valid property
  arm64: dts: msm8916: thermal: Add sensor for modem
  arm64: dts: msm8996: thermal: Add temperature sensors near major
    peripherals
  arm64: dts: msm8998: thermal: Fix the cpu sensor numbers
  arm64: dts: msm8998: thermal: Fix the gpu sensor number
  arm64: dts: msm8998: thermal: GPU has two sensors, add the second
  arm64: dts: msm8998: thermal: Add temperature sensors near major
    peripherals
  arm64: dts: sdm845: thermal: Add temperature sensors near major
    peripherals
  arm64: dts: msm8998: thermal: Make trip names consistent
  arm64: dts: msm8916: thermal: Make trip names consistent
  arm64: dts: msm8996: thermal: Make trip names consistent

 arch/arm64/boot/dts/qcom/msm8916.dtsi |  30 +++--
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 122 ++++++++++++++++++--
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 154 ++++++++++++++++++--------
 arch/arm64/boot/dts/qcom/sdm845.dtsi  |  91 +++++++++++++++
 4 files changed, 328 insertions(+), 69 deletions(-)

-- 
2.17.1
