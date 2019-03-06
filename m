From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 0/3] Qualcomm QCS404 Turing Clock Controller
Date: Wed,  6 Mar 2019 09:47:55 -0800
Message-ID: <20190306174758.22462-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The turing clock controller provides clocks necessary to run the compute
subsystem in QCS404.

Bjorn Andersson (3):
  dt-bindings: clock: Introduce Qualcomm Turing Clock controller
  clk: qcom: branch: Add AON clock ops
  clk: qcom: Add QCS404 TuringCC

 .../bindings/clock/qcom,turingcc.txt          |  19 ++
 drivers/clk/qcom/Kconfig                      |   6 +
 drivers/clk/qcom/Makefile                     |   1 +
 drivers/clk/qcom/clk-branch.c                 |   6 +
 drivers/clk/qcom/clk-branch.h                 |   1 +
 drivers/clk/qcom/turingcc-qcs404.c            | 170 ++++++++++++++++++
 .../dt-bindings/clock/qcom,turingcc-qcs404.h  |  15 ++
 7 files changed, 218 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,turingcc.txt
 create mode 100644 drivers/clk/qcom/turingcc-qcs404.c
 create mode 100644 include/dt-bindings/clock/qcom,turingcc-qcs404.h

-- 
2.18.0
