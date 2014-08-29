From: Pramod Gurav <pramod.gurav@smartplayin.com>
Subject: [PATCH 1/4] ARM: DT: APQ8064: Add pinctrl support
Date: Thu, 28 Aug 2014 20:22:47 -0700
Message-ID: <1409282570-27299-2-git-send-email-pramod.gurav@smartplayin.com>
References: <1409282570-27299-1-git-send-email-pramod.gurav@smartplayin.com>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1409282570-27299-1-git-send-email-pramod.gurav@smartplayin.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Pramod Gurav <pramod.gurav@smartplayin.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds device tree nodes to support pinctrl for apq8064 SOC

CC: Rob Herring <robh+dt@kernel.org>
CC: Pawel Moll <pawel.moll@arm.com>
CC: Mark Rutland <mark.rutland@arm.com>
CC: Ian Campbell <ijc+devicetree@hellion.org.uk>
CC: Kumar Gala <galak@codeaurora.org>
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org

Signed-off-by: Pramod Gurav <pramod.gurav@smartplayin.com>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index d66fb25..e23303e 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -73,6 +73,17 @@
 		ranges;
 		compatible = "simple-bus";
 
+		msm_gpio: pinctrl@800000 {
+			compatible = "qcom,apq8064-pinctrl";
+			reg = <0x800000 0x4000>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupts = <0 16 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		intc: interrupt-controller@2000000 {
 			compatible = "qcom,msm-qgic2";
 			interrupt-controller;
-- 
1.7.0.4
