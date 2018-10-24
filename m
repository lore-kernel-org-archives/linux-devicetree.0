From: Evan Green <evgreen@chromium.org>
Subject: [PATCH v4 0/5] arm64: dts: qcom: sdm845: Add UFS DT nodes
Date: Wed, 24 Oct 2018 10:27:30 -0700
Message-ID: <20181024172735.154304-1-evgreen@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Andy Gross <andy.gross@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>, Evan Green <evgreen@chromium.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, Can Guo <cang@codeaurora.org>, linux-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Vivek Gautam <vivek.gautam@codeaurora.org>, Manu Gautam <mgautam@codeaurora.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

Update the device tree bindings for the QMP PHY to properly
specify the registers for dual-lane PHYs. Update the driver to use
those new registers. Add the DT nodes for UFS on SDM845 and MTP.
Finally, fix up the USB3 PHY on SDM845, which also has a dual-lane phy

Changes in v4:
- Remove "status" from DT binding example (Rob)

Changes in v3:
 - Removed erroneous fixup for USB UniPro PHY, which is not dual lane (Doug)

Changes in v2:
- Added dt bindings change, corresponding driver fixup, and USB PHY fixup
- Renamed ufsphy to phy (Vivek)
- Removed #clock-cells (Vivek)

Can Guo (1):
  arm64: dts: qcom: sdm845: Add UFS nodes for sdm845-mtp

Evan Green (4):
  dt-bindings: phy-qcom-qmp: Fix register underspecification
  phy: qcom-qmp: Utilize fully-specified DT registers
  arm64: dts: qcom: sdm845: add UFS controller
  arm64: dts: qcom: sdm845: Add USB PHY lane two

 .../devicetree/bindings/phy/qcom-qmp-phy.txt       | 70 ++++++++++++++++++---
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts            | 14 +++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi               | 71 +++++++++++++++++++++-
 drivers/phy/qualcomm/phy-qcom-qmp.c                | 51 ++++++++++++----
 4 files changed, 184 insertions(+), 22 deletions(-)

-- 
2.16.4
