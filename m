From: Evan Green <evgreen@chromium.org>
Subject: [PATCH v2 0/5] arm64: dts: qcom: sdm845: Add UFS DT nodes
Date: Thu, 18 Oct 2018 14:09:28 -0700
Message-ID: <20181018210933.113592-1-evgreen@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>, Douglas Anderson <dianders@chromium.org>, Manu Gautam <mgautam@codeaurora.org>, Can Guo <cang@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, swboyd@chromium.org
Cc: Evan Green <evgreen@chromium.org>
List-Id: devicetree@vger.kernel.org

This series updates the device tree bindings for the QMP PHY to
properly specify the registers for dual-lane PHYs. It then updates
the driver to use those new registers. Then it adds the DT nodes for
UFS on SDM845, and activates them on the MTP platform. Finally, it
fixes up the USB3 PHY on SDM845, which is also a dual lane PHY.

The DT binding change is needed because it was discovered that the UFS PHY
driver was reaching beyond its register region, which only happened to work by
virtue of the page size granularity.

Changes since v1:
 - Added dt bindings change, corresponding driver fixup, and USB PHY fixup
 - Renamed ufsphy to phy (Vivek).
 - Removed #clock-cells (Vivek).

This applies atop linux-next 20181018 with the addition of Doug's
changes [1] and [2].

[1] https://lore.kernel.org/lkml/20181012213632.252346-1-dianders@chromium.org/
[2] https://lore.kernel.org/lkml/20181012213926.253765-1-dianders@chromium.org/

Can Guo (1):
  arm64: dts: qcom: sdm845: Add UFS nodes for sdm845-mtp

Evan Green (4):
  dt-bindings: phy-qcom-qmp: Fix register underspecification
  phy: qcom-qmp: Utilize fully-specified DT registers
  arm64: dts: qcom: sdm845: add UFS controller
  arm64: dts: qcom: sdm845: Add USB PHY lane two

 .../devicetree/bindings/phy/qcom-qmp-phy.txt       | 73 ++++++++++++++++++---
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts            | 14 ++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi               | 75 +++++++++++++++++++++-
 drivers/phy/qualcomm/phy-qcom-qmp.c                | 51 +++++++++++----
 4 files changed, 190 insertions(+), 23 deletions(-)

-- 
2.16.4
