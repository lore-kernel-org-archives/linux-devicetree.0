From: Damien Riegel <damien.riegel@savoirfairelinux.com>
Subject: [PATCH 0/4] arm64: dts: qcom: dts improvements
Date: Wed,  1 Nov 2017 13:53:31 -0400
Message-ID: <20171101175335.22123-1-damien.riegel@savoirfairelinux.com>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, kernel@savoirfairelinux.com, Damien Riegel <damien.riegel@savoirfairelinux.com>
List-Id: devicetree@vger.kernel.org

The goal of this series was to add missing I2C bindings for BLSP_I2C1,
BLSP_I2C3, and BLSP_I2C5. But while working on this, I noticed some
styling issues and decided to tackle them in the same patchset, mostly
because they touch the same files and the same people will be involved
for the review. Let me know if you'd rather see them sent separately.

First patch reindents the wcd_codec block in pm8916.dtsi with respect
to the kernel standards.

Second patch and third patch makes existing I2C more in sync with the
rest of the bindings by dropping assignments to a property that doesn't
take a value, and by making their style matches thus of SPI bindings.

Last patch add bindings of I2C cores 1, 3, and 5.

Damien Riegel (4):
  arm64: dts: qcom: pm8916: fix wcd_codec indentation
  arm64: dts: qcom: msm8916-pins: remove assignments to bias-disable
  arm64: dts: qcom: msm8916: normalize I2C bindings
  arm64: dts: qcom: msm8916: add bindings for i2c1, i2c3, i2c5

 arch/arm64/boot/dts/qcom/msm8916-pins.dtsi | 84 +++++++++++++++++++++++++++---
 arch/arm64/boot/dts/qcom/msm8916.dtsi      | 57 +++++++++++++++++---
 arch/arm64/boot/dts/qcom/pm8916.dtsi       | 82 ++++++++++++++---------------
 3 files changed, 169 insertions(+), 54 deletions(-)

-- 
2.15.0
