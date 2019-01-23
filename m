Return-Path: <vkoul@kernel.org>
From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 3/3] arm64: dts: qcom: qcs404: Add AR8035 Phy node
Date: Wed, 23 Jan 2019 23:18:39 +0530
Message-Id: <20190123174839.5321-3-vkoul@kernel.org>
In-Reply-To: <20190123174839.5321-1-vkoul@kernel.org>
References: <20190123174839.5321-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Niklas Cassel <niklas.cassel@linaro.org>
List-ID: <devicetree@vger.kernel.org>

EVB-4000 has ethernet port with AR8035 Phy, so add phy node

Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts b/arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts
index 5c02e874be12..ec85647cfed1 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts
@@ -21,6 +21,17 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&ethernet_defaults>;
 
+	phy-handle = <&phy1>;
+	phy-mode = "rgmii";
+	mdio {
+		#address-cells = <0x1>;
+		#size-cells = <0x0>;
+		compatible = "snps,dwmac-mdio";
+		phy1: phy@4 {
+			device_type = "ethernet-phy";
+			reg = <0x4>;
+		};
+	};
 };
 
 &tlmm {
-- 
2.20.1
