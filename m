From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: [PATCH v4 0/1] Thermal throttling for SDM845
Date: Wed,  6 Feb 2019 16:04:48 +0530
Message-ID: <cover.1549448839.git.amit.kucheria@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, edubezval@gmail.com, andy.gross@linaro.org, tdas@codeaurora.org, swboyd@chromium.org, dianders@chromium.org, mka@chromium.org, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Only one patch left in this series. This patch depends on [1] and [2] which have been merged through by Rafael through the power tree.

Changes since v3:
 - first trip point increased to 90 degrees based on Matthias' testing
 - Added Acks

Changes since v2:
 - Split up the series into auto-register series for cpufreq[1] and
   miscellaneous patches[2][3]. [1] and [2] are needed for this patch to
   work.
 - Merged the two DT patches into one. We end up with 2 passive and 1
   critical trip point.
 - Remove unncessary cooling map for critical trip point, we're shutting down at
   that trip, duh!

 [1] https://lore.kernel.org/lkml/cover.1548084260.git.amit.kucheria@linaro.org/
 [2] https://lore.kernel.org/patchwork/patch/1033953/
 [3] https://lore.kernel.org/patchwork/cover/1033970/

Amit Kucheria (1):
  arm64: dts: sdm845: wireup the thermal trip points to cpufreq

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 241 ++++++++++++++++++++++++---
 1 file changed, 217 insertions(+), 24 deletions(-)

-- 
2.17.1
