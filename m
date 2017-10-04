From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 0/4] Sony Xperia Z2 Tablet Initial DTS
Date: Wed,  4 Oct 2017 11:58:53 -0700
Message-ID: <20171004185857.24510-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This has been sitting in my tree for a while, so let's get it out there for
others to build upon. Also fixes the defconfig situation wrt USB on 8974.

Bjorn Andersson (4):
  ARM: dts: qcom: msm8974: Add Sony Xperia Z2 Tablet
  ARM: qcom_defconfig: Resync with new Kconfig options
  ARM: qcom_defconfig: Disable DEBUG_GPIO
  ARM: qcom_defconfig: Enable Z2 Tablet related options

 arch/arm/boot/dts/Makefile                         |   1 +
 .../boot/dts/qcom-msm8974-sony-xperia-castor.dts   | 641 +++++++++++++++++++++
 arch/arm/boot/dts/qcom-msm8974.dtsi                |  14 +
 arch/arm/boot/dts/qcom-msm8974pro.dtsi             |  18 +
 arch/arm/configs/qcom_defconfig                    |  40 +-
 5 files changed, 699 insertions(+), 15 deletions(-)
 create mode 100644 arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dts
 create mode 100644 arch/arm/boot/dts/qcom-msm8974pro.dtsi

-- 
2.12.0
