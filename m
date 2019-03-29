From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: [PATCH v2 00/13] qcom: dts: thermal cleanups
Date: Fri, 29 Mar 2019 15:42:06 +0530
Message-ID: <cover.1553853990.git.amit.kucheria@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, edubezval@gmail.com, andy.gross@linaro.org, David Brown <david.brown@linaro.org>
Cc: devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Changes since v1:
- Devices that are not associated with cooling-maps use the 'hot' type
- Remove critical trip from such devices too and restrict that type of CPUs
- For 8916, add the sensor on the modem

Description:
- Expose all temperature sensors on msm8916, msm996, msm8998, sdm845
- split up the register address map for msm8998
- standardize names of the various thermal-zones across boards to make it
  easy for test scripts to parse

Amit Kucheria (13):
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
  arm64: dts: msm8916: thermal: Convert camera trip type to hot

 arch/arm64/boot/dts/qcom/msm8916.dtsi |  41 +++--
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 174 ++++++++++++++++--
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 242 +++++++++++++++++++++-----
 arch/arm64/boot/dts/qcom/sdm845.dtsi  | 205 ++++++++++++++++++++++
 4 files changed, 589 insertions(+), 73 deletions(-)

-- 
2.17.1
