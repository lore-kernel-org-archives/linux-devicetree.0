From: Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v1 0/2] Add Global Clock controller (GCC) driver for SC7180
Date: Wed,  7 Aug 2019 23:42:59 +0530
Message-ID: <20190807181301.15326-1-tdas@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc: David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, Taniya Das <tdas@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add driver support for Global Clock controller for SC7180 and also update
device tree bindings for the various clocks supported in the clock controller.


Taniya Das (2):
  clk: qcom: Add DT bindings for SC7180 gcc clock controller
  clk: qcom: Add Global Clock controller (GCC) driver for SC7180

 .../devicetree/bindings/clock/qcom,gcc.txt    |    1 +
 drivers/clk/qcom/Kconfig                      |    9 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/gcc-sc7180.c                 | 2496 +++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sc7180.h   |  155 +
 5 files changed, 2662 insertions(+)
 create mode 100644 drivers/clk/qcom/gcc-sc7180.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-sc7180.h

--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.
