From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 2/5] arm64: dts: apq8016-sbc: move sdhci node under soc node
Date: Tue, 12 Jan 2016 13:46:52 +0000
Message-ID: <1452606412-24659-1-git-send-email-srinivas.kandagatla@linaro.org>
References: <1452606358-24569-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452606358-24569-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, linux-arm-msm@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

To be consistent with other nodes move sdhci node under the soc node,
rather than using lable references.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index f6cd323..b635149 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -268,9 +268,9 @@
 				default-state = "off";
 			};
 		};
-	};
-};
 
-&sdhc_1 {
-	status = "okay";
+		sdhci@07824000 {
+			status = "okay";
+		};
+	};
 };
-- 
1.9.1
