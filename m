From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: [PATCH v1 0/2] Add gpu and camera thermal zones for msm8916
Date: Mon, 10 Sep 2018 12:47:13 +0530
Message-ID: <cover.1536563656.git.amit.kucheria@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, devicetree@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Expose temperature values from the tsens sensors next to the camera and
gpu.

Amit Kucheria (2):
  arm64: dts: msm8916: Add gpu thermal management
  arm64: dts: msm8916: Add camera thermal zone

 arch/arm64/boot/dts/qcom/msm8916.dtsi | 41 +++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

-- 
2.17.1
