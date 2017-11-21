From: Tirupathi Reddy <tirupath@codeaurora.org>
Subject: [PATCH V7 0/2] clk: qcom: spmi_pmic clock divider support
Date: Tue, 21 Nov 2017 14:41:03 +0530
Message-ID: <1511255465-3984-1-git-send-email-tirupath@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: sboyd@codeaurora.org, robh+dt@kernel.org
Cc: mturquette@baylibre.com, mark.rutland@arm.com, andy.gross@linaro.org, david.brown@linaro.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, Tirupathi Reddy <tirupath@codeaurora.org>
List-Id: devicetree@vger.kernel.org

The SPMI_PMIC clock divider driver configures the clkdiv modules present
on Qualcomm Technologies, Inc. SPMI PMIC. This driver provides a clock
interface for each clkdiv module and allows clock operations such as enable,
disable, set_rate, recalc_rate and round_rate.

Tirupathi Reddy (2):
  clk: qcom: Add spmi_pmic clock divider support
  dt-bindings: Add qcom spmi_pmic clock divider bindings

 .../bindings/clock/qcom,spmi-pmic-div.txt          |  59 ++++
 drivers/clk/qcom/Kconfig                           |   9 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/clk-spmi-pmic-div.c               | 302 +++++++++++++++++++++
 4 files changed, 371 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,spmi-pmic-div.txt
 create mode 100644 drivers/clk/qcom/clk-spmi-pmic-div.c

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
