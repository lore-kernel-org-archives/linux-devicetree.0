From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v5 0/4] clk: qcom: Add support for SM8150 rpmh
Date: Mon, 26 Aug 2019 23:01:16 +0530
Message-ID: <20190826173120.2971-1-vkoul@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add support for rpm clock controller found in SM8150 and while at it update
the driver to support parent data clock scheme as suggested by Stephen.

Changes since v4:
 - Fix the .fw_name as xo instead of xo_board (v4 erroneously did for
   .name)

Changes since v3:
 - Make clock parent name as xo instead of xo_board

Changes since v2:
 - Add reviewed-by from Bjorn
 - Update the parent name as xo_board
 - Fix style issue

Changes since v1:
 - Describe parent clocks for rpmhcc
 - Add support for parent data scheme for rpmhcc

Vinod Koul (4):
  dt-bindings: clock: Document the parent clocks
  clk: qcom: clk-rpmh: Convert to parent data scheme
  dt-bindings: clock: Document SM8150 rpmh-clock compatible
  clk: qcom: clk-rpmh: Add support for SM8150

 .../bindings/clock/qcom,rpmh-clk.txt          |  7 +++-
 drivers/clk/qcom/clk-rpmh.c                   | 38 ++++++++++++++++++-
 2 files changed, 42 insertions(+), 3 deletions(-)

-- 
2.20.1
