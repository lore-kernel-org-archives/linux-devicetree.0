From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 2/4] arm64: dts: actions: Add S900 SPS node
Date: Wed, 11 Apr 2018 22:10:34 +0530
Message-ID: <20180411164036.8046-3-manivannan.sadhasivam@linaro.org>
References: <20180411164036.8046-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180411164036.8046-1-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: afaerber@suse.de, robh+dt@kernel.org
Cc: liuwei@actions-semi.com, mp-cs@actions-semi.com, 96boards@ucrobotics.com, devicetree@vger.kernel.org, daniel.thompson@linaro.org, amit.kucheria@linaro.org, hzhang@ucrobotics.com, bdong@ucrobotics.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, manivannanece23@gmail.com, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Add Actions Semi S900 Smart Power System (SPS) node

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/actions/s900.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/actions/s900.dtsi b/arch/arm64/boot/dts/actions/s900.dtsi
index 11406f6d3a6d..0b29dbe0030e 100644
--- a/arch/arm64/boot/dts/actions/s900.dtsi
+++ b/arch/arm64/boot/dts/actions/s900.dtsi
@@ -154,6 +154,12 @@
 			status = "disabled";
 		};
 
+		sps: power-controller@e012e000 {
+			compatible = "actions,s900-sps";
+			reg = <0x0 0xe012e000 0x0 0x2000>;
+			#power-domain-cells = <1>;
+		};
+
 		timer: timer@e0228000 {
 			compatible = "actions,s900-timer";
 			reg = <0x0 0xe0228000 0x0 0x8000>;
-- 
2.14.1
