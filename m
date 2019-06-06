From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v2 0/3] MSM8998 GPUCC Support
Date: Wed,  5 Jun 2019 18:58:44 -0700
Message-ID: <20190606015844.2285-1-jeffrey.l.hugo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: agross@kernel.org, david.brown@linaro.org, bjorn.andersson@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, marc.w.gonzalez@free.fr, jcrouse@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
List-Id: devicetree@vger.kernel.org

The Adreno GPU on MSM8998 has its own clock controller, which is a
dependency for bringing up the GPU.  This series gets the gpucc all in
place as another step on the road to getting the GPU enabled.

v2:
-drop desd code

Jeffrey Hugo (3):
  dt-bindings: clock: Document gpucc for msm8998
  clk: qcom: Add MSM8998 GPU Clock Controller (GPUCC) driver
  arm64: dts: qcom: msm8998: Add gpucc node

 .../devicetree/bindings/clock/qcom,gpucc.txt  |   4 +-
 arch/arm64/boot/dts/qcom/msm8998.dtsi         |  15 +
 drivers/clk/qcom/Kconfig                      |   8 +
 drivers/clk/qcom/Makefile                     |   1 +
 drivers/clk/qcom/gpucc-msm8998.c              | 364 ++++++++++++++++++
 .../dt-bindings/clock/qcom,gpucc-msm8998.h    |  29 ++
 6 files changed, 420 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/qcom/gpucc-msm8998.c
 create mode 100644 include/dt-bindings/clock/qcom,gpucc-msm8998.h

-- 
2.17.1
