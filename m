From: "Ivan T. Ivanov" <ivan.ivanov@linaro.org>
Subject: [PATCH 2/2] arm64: dts: qcom: 8x16: UART2 use DMA for RX and TX
Date: Sat, 12 Sep 2015 16:03:15 +0300
Message-ID: <1442062995-13523-2-git-send-email-ivan.ivanov@linaro.org>
References: <1442062995-13523-1-git-send-email-ivan.ivanov@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1442062995-13523-1-git-send-email-ivan.ivanov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Andy Gross <agross@codeaurora.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Stanimir Varbanov <stanimir.varbanov@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


Signed-off-by: Ivan T. Ivanov <ivan.ivanov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index f10ff7a2d0e3..6874221ec355 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -120,6 +120,8 @@
 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&gcc GCC_BLSP1_UART2_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
 			clock-names = "core", "iface";
+			dmas = <&blsp_dma 3>, <&blsp_dma 2>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};

--
1.9.1
