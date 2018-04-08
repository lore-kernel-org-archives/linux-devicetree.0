From: Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v2 0/2] Add QCOM RPMh Clock driver
Date: Sun,  8 Apr 2018 16:02:11 +0530
Message-ID: <1523183533-23171-1-git-send-email-tdas@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, Odelu Kukatla <okukatla@codeaurora.org>, Amit Nischal <anischal@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Taniya Das <tdas@codeaurora.org>
List-Id: devicetree@vger.kernel.org

 [v2]
  * Addressed comments from Stephen
  * Addressed comments from Evan

This patch series adds a driver and device tree documentation binding
for the clock control via Resource Power Manager-hardened (RPMh) on some
Qualcomm Technologies, Inc, SoCs such as SDM845. The clock RPMh driver
would send requests for the RPMh managed clock resources.

The RPMh clock driver depends upon the RPMh driver [1] and command DB
driver [2] which are both still undergoing review.

Thanks,
Taniya

[1]: https://lkml.org/lkml/2018/3/9/979
[2]: https://lkml.org/lkml/2018/3/14/787

Amit Nischal (2):
  clk: qcom: clk-rpmh: Add QCOM RPMh clock driver
  dt-bindings: clock: Introduce QCOM RPMh clock bindings

 .../devicetree/bindings/clock/qcom,rpmh-clk.txt |  22 ++
 drivers/clk/qcom/Kconfig                        |   9 +
 drivers/clk/qcom/Makefile                       |   1 +
 drivers/clk/qcom/clk-rpmh.c                     | 394 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,rpmh.h           |  25 ++
 5 files changed, 451 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt
 create mode 100644 drivers/clk/qcom/clk-rpmh.c
 create mode 100644 include/dt-bindings/clock/qcom,rpmh.h

--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.
