From: Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v4 0/2] Add QCOM graphics clock controller driver for SDM845
Date: Sun, 25 Nov 2018 10:06:06 +0530
Message-ID: <1543120569-14444-1-git-send-email-tdas@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, Taniya Das <tdas@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Changes in v4:
* Cleanup the GPUCC code to keep only the clocks which would be requested
  from the GPU client SW.
* Clean up of code as well as header file clock IDs.
* Due to the above cleanup the patches to enable/disable clocks for GPU GDSC
  requirement is not supported : https://patchwork.kernel.org/patch/10563889/
* The GPU_GX RCG support is also removed from the main driver, so the corresponding
  RCG ops are removed : https://patchwork.kernel.org/patch/10563891/

Changes in v3:
* Modified the determine_rate() op to use the min/max rate range
  to round the requested rate within the set_rate range. With this,
  requested set rate will always stay within the limits.

Changes in v2:
Addressed review comments given by Stephen: https://lkml.org/lkml/2018/6/6/294
* Introduce clk_rcg2_gfx3d_determine_rate ops to return the best parent
  as 'gpucc_pll0_even' and best parent rate as twice of the requested rate
  always. This will eliminate the need of frequency table as source and
  div-2 are fixed for gfx3d_clk_src.
  Also modified the clk_rcg2_set_rate ops to configure the fixed source and
  div.
* Add support to check if requested rate falls within allowed set_rate range.
  This will not let the source gpucc_pll0 to go out of the supported range
  and also client can request the rate within the range.
* Fixed comment text in probe function and added module description for GPUCC
  driver.

The graphics clock driver depends upon the below change.
	https://lkml.org/lkml/2018/6/23/108

Changes in v1:
This patch series adds support for graphics clock controller for SDM845.
Below is the brief description for each change:

1. For some of the GDSCs, there is requirement to enable/disable the
   few clocks before turning on/off the gdsc power domain. This patch
   will add support to enable/disable the clock associated with the
   gdsc along with power domain on/off callbacks.

2. To turn on the gpu_gx_gdsc, there is a hardware requirement to
   turn on the root clock (GFX3D RCG) first which would be the turn
   on signal for the gdsc along with the SW_COLLAPSE. As per the
   current implementation of clk_rcg2_shared_ops, it clears the
   root_enable bit in the enable() clock ops. But due to the above
   said requirement for GFX3D shared RCG, root_enable bit would be
   already set by gdsc driver and rcg2_shared_ops should not clear
   the root unless the disable() is called.

   This patch add support for the same by reusing the existing
   clk_rcg2_shared_ops and deriving "clk_rcg2_gfx3d_ops" clk_ops
   for GFX3D clock to take care of the root set/clear requirement.

3. Add device tree bindings for graphics clock controller for SDM845.

4. Add graphics clock controller (GPUCC) driver for SDM845.

[v1] : https://lore.kernel.org/patchwork/project/lkml/list/?series=348697
[v2] : https://lore.kernel.org/patchwork/project/lkml/list/?series=359012

Amit Nischal (2):
  dt-bindings: clock: Introduce QCOM Graphics clock bindings
  clk: qcom: Add graphics clock controller driver for SDM845

 .../devicetree/bindings/clock/qcom,gpucc.txt       |  18 ++
 drivers/clk/qcom/Kconfig                           |   9 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/gpucc-sdm845.c                    | 231 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,gpucc-sdm845.h      |  24 +++
 5 files changed, 283 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gpucc.txt
 create mode 100644 drivers/clk/qcom/gpucc-sdm845.c
 create mode 100644 include/dt-bindings/clock/qcom,gpucc-sdm845.h

--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.
