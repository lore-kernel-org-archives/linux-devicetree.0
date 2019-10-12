From: nikitos.tr@gmail.com
Subject: [PATCH 1/2] arm64: dts: msm8916-longcheer-l8150: Enable WCNSS for WiFi and BT
Date: Sat, 12 Oct 2019 19:58:20 +0500
Message-ID: <20191012145821.20846-1-nikitos.tr@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: agross@kernel.org, bjorn.andersson@linaro.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, stephan@gerhold.net, Nikita Travkin <nikitos.tr@gmail.com>
List-Id: devicetree@vger.kernel.org

From: Nikita Travkin <nikitos.tr@gmail.com>

WCNSS is used on L8150 for WiFi and BT.
Its firmware isn't relocatable and must be loaded at specific address.

Signed-off-by: Nikita Travkin <nikitos.tr@gmail.com>
---
 .../boot/dts/qcom/msm8916-longcheer-l8150.dts      | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
index 2b28e383fd0b..e4d467e7dedb 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
@@ -18,6 +18,16 @@
 		stdout-path = "serial0";
 	};
 
+	reserved-memory {
+		// wcnss.mdt is not relocatable, so it must be loaded at 0x8b600000
+		/delete-node/ wcnss@89300000;
+
+		wcnss_mem: wcnss@8b600000 {
+			reg = <0x0 0x8b600000 0x0 0x600000>;
+			no-map;
+		};
+	};
+
 	soc {
 		sdhci@7824000 {
 			status = "okay";
@@ -68,6 +78,10 @@
 			};
 		};
 
+		wcnss@a21b000 {
+			status = "okay";
+		};
+
 		/*
 		 * Attempting to enable these devices causes a "synchronous
 		 * external abort". Suspected cause is that the debug power
-- 
2.19.1
