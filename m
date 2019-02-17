From: Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [PATCH v2 0/4] MSM8998 Multimedia Clock Controller
Date: Sat, 16 Feb 2019 21:31:25 -0700
Message-ID: <1550377885-10618-1-git-send-email-jhugo@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: bjorn.andersson@linaro.org, marc.w.gonzalez@free.fr, andy.gross@linaro.org, david.brown@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jeffrey Hugo <jhugo@codeaurora.org>
List-Id: devicetree@vger.kernel.org

The multimedia clock controller (mmcc) is the main clock controller for
the multimedia subsystem and is required to enable things like display and
camera.

Based upon the "Rewrite clk parent handling" series [1] to simplify handling
of the external clocks that feed into the MMCC.

Assumes the "orphan probe defer" change [2] so that exposing XO via the RPM is
safe for the UART in case of late probe per review comments.

Assumes the common clk_hw registration is in place from "Make common clk_hw
registrations" [3]

[1] https://lore.kernel.org/lkml/20190129061021.94775-1-sboyd@kernel.org/T/#u
[2] https://lkml.org/lkml/2019/2/11/1895
[3] https://lkml.org/lkml/2019/2/10/132

v2:
-Rebased on the "Rewrite clk parent handling" series and updated to the clk init
mechanisms introduced there.
-Marked XO clk as CLK_IGNORE_UNUSED to avoid the concern about the XO going away
"incorrectly" during late init
-Corrected the name of the XO clock to "xo"
-Dropped the fake XO clock in GCC to prevent a namespace conflict
-Fully enumerated the external clocks (DSI PLLs, etc) in the DT binding
-Cleaned up the weird newlines in the added DT node
-Added DT header file to msm8998 DT for future clients

Jeffrey Hugo (4):
  clk: qcom: smd: Add XO clock for MSM8998
  dt-bindings: clock: Add support for the MSM8998 mmcc
  clk: qcom: Add MSM8998 Multimedia Clock Controller (MMCC) driver
  arm64: dts: qcom: msm8998: Add mmcc node

 .../devicetree/bindings/clock/qcom,mmcc.txt        |    7 +
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |   15 +
 drivers/clk/qcom/Kconfig                           |    9 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/clk-smd-rpm.c                     |    4 +
 drivers/clk/qcom/mmcc-msm8998.c                    | 2937 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,mmcc-msm8998.h      |  210 ++
 7 files changed, 3183 insertions(+)
 create mode 100644 drivers/clk/qcom/mmcc-msm8998.c
 create mode 100644 include/dt-bindings/clock/qcom,mmcc-msm8998.h

-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
