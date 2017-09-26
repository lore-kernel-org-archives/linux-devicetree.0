From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH 00/11] Add remaining clocks for QCOM IPQ8074
Date: Tue, 26 Sep 2017 17:53:53 +0530
Message-ID: <1506428644-2996-1-git-send-email-absahu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Abhishek Sahu <absahu@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch series adds following IPQ8074 clocks

- Remaining General PLL’s, NSS UBI PLL and NSS Crypto PLL.
- 2 instances of PCIE, USB, SDCC.
- 2 NSS UBI core and common NSS clocks. NSS is network.
  switching subsystem which accelerates the ethernet traffic.
  IPQ8074 has two UBI cores and each core uses some separate
  core clocks and remaining common clocks.
- NSS Crypto Engine clocks
- NSS ethernet port clocks. IPQ8074 has 6 Ethernet ports and each
  port uses different clocks
- Crypto engine clocks
- PCIE and NSS MISC resets.

Abhishek Sahu (11):
  clk: qcom: add read-only divider operations
  clk: qcom: add parent map for regmap mux
  clk: qcom: ipq8074: fix missing GPLL0 divider width
  dt-bindings: clock: qcom: add remaining clocks for IPQ8074
  clk: qcom: ipq8074: add remaining PLL’s
  clk: qcom: ipq8074: add PCIE, USB and SDCC clocks
  clk: qcom: ipq8074: add NSS clocks
  clk: qcom: ipq8074: add NSS ethernet port clocks
  clk: qcom: ipq8074: add GP and Crypto clocks
  dt-bindings: clock: qcom: add misc resets for PCIE and NSS
  clk: qcom: ipq8074: add misc resets for PCIE and NSS

 drivers/clk/qcom/clk-rcg.h                   |   10 -
 drivers/clk/qcom/clk-regmap-divider.c        |   29 +
 drivers/clk/qcom/clk-regmap-divider.h        |    1 +
 drivers/clk/qcom/clk-regmap-mux.c            |    6 +
 drivers/clk/qcom/clk-regmap-mux.h            |    2 +
 drivers/clk/qcom/common.h                    |   11 +-
 drivers/clk/qcom/gcc-ipq8074.c               | 3736 ++++++++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-ipq8074.h |  222 ++
 8 files changed, 4006 insertions(+), 11 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

