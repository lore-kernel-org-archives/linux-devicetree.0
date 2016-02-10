From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 7/8] arm64: dts: qcom: apq8016-sbc: enable bam dma node.
Date: Wed, 10 Feb 2016 11:37:17 +0000
Message-ID: <1455104237-10771-1-git-send-email-srinivas.kandagatla@linaro.org>
References: <1455104164-29356-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1455104164-29356-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

This patch enables bam dma node, dma is used for both tx and rx on spi
and on high speed serial.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index 8ab87e7..a1a39d0 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -33,6 +33,10 @@
 	};
 
 	soc {
+		dma@7884000 {
+			status = "okay";
+		};
+
 		serial@78af000 {
 			label = "LS-UART0";
 			status = "okay";
-- 
1.9.1
