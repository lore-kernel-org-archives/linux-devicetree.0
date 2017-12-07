From: Damien Riegel <damien.riegel@savoirfairelinux.com>
Subject: [PATCH v2 00/10] arm64: dts: qcom: dts improvements
Date: Thu,  7 Dec 2017 10:19:32 -0500
Message-ID: <20171207151942.5805-1-damien.riegel@savoirfairelinux.com>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, kernel@savoirfairelinux.com, Damien Riegel <damien.riegel@savoirfairelinux.com>
List-Id: devicetree@vger.kernel.org

The goal of this series was to add missing I2C bindings for BLSP_I2C1,
BLSP_I2C3, and BLSP_I2C5. But while working on this, I noticed some
styling issues and decided to tackle them in the same patchset, mostly
because they touch the same files and the same people will be involved
for the review.

In this second version, I followed the recommandation of Bjorn Andersson
and splitted pinmuxing and pinconf. The reason behind that is that the
pinmuxing is common as functions cannot be routed to other pins, but
pinconfs are board-specific.

Damien Riegel (10):
  arm64: dts: qcom: pm8916: fix wcd_codec indentation
  arm64: dts: qcom: msm8916-pins: remove assignments to bias-disable
  arm64: dts: qcom: msm8916-pins: keep cdc_dmic pins in suspend mode
  arm64: dts: qcom: msm8916: drop unused board-specific nodes
  arm64: dts: qcom: apq8016-sbc: sort nodes alphabetically
  arm64: dts: qcom: msm8916: move pinconfs to board files
  arm64: dts: qcom: msm8916: drop remaining unused pinconfs
  arm64: dts: qcom: msm8916-pins: move sdhc2 cd node with its siblings
  arm64: dts: qcom: msm8916: normalize I2C and SPI nodes
  arm64: dts: qcom: msm8916: add nodes for i2c1, i2c3, i2c5

 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi  | 446 ++++++++++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/msm8916-mtp.dtsi  |  17 ++
 arch/arm64/boot/dts/qcom/msm8916-pins.dtsi | 393 ++++---------------------
 arch/arm64/boot/dts/qcom/msm8916.dtsi      |  69 ++++-
 arch/arm64/boot/dts/qcom/pm8916.dtsi       |  82 +++---
 5 files changed, 604 insertions(+), 403 deletions(-)

-- 
2.15.0
