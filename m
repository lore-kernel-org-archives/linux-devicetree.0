From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 0/3] DT: APQ8064 remove mmc fixed regulators.
Date: Tue, 28 Jul 2015 09:11:56 +0100
Message-ID: <1438071116-30065-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: agross@codeaurora.org, linux-arm-msm@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi Andy, 

This patchset removes the fixed regulators with real regulators
on IFC6410 and QS600 board.

This patchset is based on qcom/dt branch.

Thanks,
srini

Srinivas Kandagatla (3):
  ARM: dts: apq8064: remove temporary fixed regulator for mmc
  ARM: dts: ifc6410: add real regulators for sdcc nodes.
  ARM: dts: qs600: Add real regulators to sdcc

 arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts | 20 ++++++++++++++++++++
 arch/arm/boot/dts/qcom-apq8064-ifc6410.dts  | 27 +++++++++++++++++++++++++++
 arch/arm/boot/dts/qcom-apq8064.dtsi         | 12 ------------
 3 files changed, 47 insertions(+), 12 deletions(-)

-- 
1.9.1
