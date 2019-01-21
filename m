From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: [PATCH v3 0/1] Thermal throttling for SDM845
Date: Mon, 21 Jan 2019 23:38:33 +0530
Message-ID: <cover.1548093127.git.amit.kucheria@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, edubezval@gmail.com, andy.gross@linaro.org, tdas@codeaurora.org, swboyd@chromium.org, dianders@chromium.org, mka@chromium.org, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Only one patch left in this series. This patch can be applied independently
but needs [1] and [2] merged to have throttling work out of the box.

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

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 225 +++++++++++++++++++++++++--
 1 file changed, 209 insertions(+), 16 deletions(-)

-- 
2.17.1
