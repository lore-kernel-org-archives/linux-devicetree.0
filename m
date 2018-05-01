From: Taniya Das <tdas@codeaurora.org>
Subject: [v5 0/2] clk: qcom: clk-rpmh: Add QCOM RPMh clock driver
Date: Tue,  1 May 2018 14:11:31 +0530
Message-ID: <1525164093-16645-1-git-send-email-tdas@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, Odelu Kukatla <okukatla@codeaurora.org>, Amit Nischal <anischal@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Taniya Das <tdas@codeaurora.org>
List-Id: devicetree@vger.kernel.org

 [v5]
   * Addressed comments from Stephen
   * Introduced a new DT property to take clock divs

 [v4]
  * Addressed comments from Stephen

 [v3]
  * Addressed documentation & code review comments from Bjorn
  * Addressed bindings comments from Rob
  * Updated the patch series order for bindings

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

Taniya Das (2):
  dt-bindings: clock: Introduce QCOM RPMh clock bindings
  clk: qcom: clk-rpmh: Add QCOM RPMh clock driver

 .../devicetree/bindings/clock/qcom,rpmh-clk.txt    |  32 ++
 drivers/clk/qcom/Kconfig                           |   9 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/clk-rpmh.c                        | 387 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,rpmh.h              |  22 ++
 5 files changed, 451 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt
 create mode 100644 drivers/clk/qcom/clk-rpmh.c
 create mode 100644 include/dt-bindings/clock/qcom,rpmh.h

--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.
