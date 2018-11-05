From: Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH 0/2] Introduce a 'protected-clocks' property
Date: Mon,  5 Nov 2018 11:40:09 -0800
Message-ID: <20181105194011.43770-1-swboyd@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Taniya Das <tdas@codeaurora.org>
List-Id: devicetree@vger.kernel.org

See full explanation in patch #1. It looks like on qcom platforms
we're increasing the number of situations where we need to have
a set of clks that aren't touched by the OS because firmware
wants them for itself. This series introduces a method to do that
by specifying in DT what clks shouldn't be read or written and
then having the qcom clk driver neve register the ones that 
are protected.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Taniya Das <tdas@codeaurora.org>

Stephen Boyd (2):
  dt-bindings: clk: Introduce 'protected-clocks' property
  clk: qcom: Support 'protected-clocks' property

 .../bindings/clock/clock-bindings.txt          | 16 ++++++++++++++++
 drivers/clk/qcom/common.c                      | 18 ++++++++++++++++++
 2 files changed, 34 insertions(+)

-- 
Sent by a computer through tubes
