From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v2 0/2] clk: qcom: Add support for QCS404
Date: Wed, 10 Oct 2018 20:21:36 +0530
Message-ID: <20181010145138.17185-1-vkoul@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Shefali Jain <shefjain@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Anu Ramanathan <anur@codeaurora.org>, Taniya Das <tdas@codeaurora.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Add the clock driver for QCS404 SoC. This needs to export
clk_alpha_pll_configure() so first patch does that

Changes in v2:
 - Fix comments provided by Stephen & Taniya

Bjorn Andersson (1):
  clk: qcom: Export clk_alpha_pll_configure()

Shefali Jain (1):
  clk: qcom: gcc: Add global clock controller driver for QCS404

 .../devicetree/bindings/clock/qcom,gcc.txt         |    1 +
 drivers/clk/qcom/Kconfig                           |    8 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/clk-alpha-pll.c                   |    1 +
 drivers/clk/qcom/gcc-qcs404.c                      | 2744 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-qcs404.h        |  165 ++
 6 files changed, 2920 insertions(+)
 create mode 100644 drivers/clk/qcom/gcc-qcs404.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-qcs404.h

-- 
2.14.4
