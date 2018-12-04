From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v4 0/8] drm/msm/dsi: Get PHY ref clocks from the DT
Date: Tue,  4 Dec 2018 14:42:26 -0800
Message-ID: <20181204224234.62619-1-mka@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Clark <robdclark@gmail.com>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>
Cc: Archit Taneja <architt@codeaurora.org>, Sean Paul <seanpaul@chromium.org>, Rajesh Yadav <ryadav@codeaurora.org>, Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>, Jeykumar Sankaran <jsanka@codeaurora.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org

The MSM DSI PHY drivers currently hardcode the name and the rate of
the PHY ref clock. Get the ref clock from the device tree instead.

Note: testing of this series was limited to SDM845 and the 10nm PHY

Major changes in v4:
- always use parent rate for 28nm and 28nm 8960 PHYs

Major changes in v3:
- keep supporting DTs without ref clock for the 28nm and the 28nm
  8960 PHYs
- added patch to add ref clock to qcom-apq8064.dtsi

Major changes in v2:
- apply to all MSM DSI PHY drivers, not only 10nm

Matthias Kaehlcke (8):
  dt-bindings: msm/dsi: Add ref clock for PHYs
  drm/msm/dsi: 28nm 8960 PHY: Get ref clock from the DT
  drm/msm/dsi: 28nm PHY: Get ref clock from the DT
  drm/msm/dsi: 14nm PHY: Get ref clock from the DT
  drm/msm/dsi: 10nm PHY: Get ref clock from the DT
  arm64: dts: qcom: msm8916: Set 'xo_board' as ref clock of the DSI PHY
  arm64: dts: sdm845: Set 'bi_tcxo' as ref clock of the DSI PHYs
  ARM: dts: qcom-apq8064: Set 'xo_board' as ref clock of the DSI PHY

 .../devicetree/bindings/display/msm/dsi.txt   |  1 +
 arch/arm/boot/dts/qcom-apq8064.dtsi           |  5 +--
 arch/arm64/boot/dts/qcom/msm8916.dtsi         |  5 +--
 arch/arm64/boot/dts/qcom/sdm845.dtsi          | 10 +++---
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c    | 13 ++++++-
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_14nm.c    | 16 +++++++--
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm.c    | 36 +++++++++++++------
 .../gpu/drm/msm/dsi/pll/dsi_pll_28nm_8960.c   | 24 ++++++++++---
 8 files changed, 82 insertions(+), 28 deletions(-)

-- 
2.20.0.rc1.387.gf8505762e3-goog
