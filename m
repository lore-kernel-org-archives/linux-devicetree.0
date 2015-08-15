From: Mathieu Olivari <mathieu@codeaurora.org>
Subject: [PATCH 2/3] ARM: qcom: add SMEM device node to IPQ806x dts
Date: Fri, 14 Aug 2015 17:46:12 -0700
Message-ID: <1439599573-3932-3-git-send-email-mathieu@codeaurora.org>
References: <1439599573-3932-1-git-send-email-mathieu@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1439599573-3932-1-git-send-email-mathieu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, dwmw2@infradead.org, computersforpeace@gmail.com, agross@codeaurora.org, sboyd@codeaurora.org, bjorn.andersson@sonymobile.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Mathieu Olivari <mathieu@codeaurora.org>
List-Id: devicetree@vger.kernel.org

SMEM is used on IPQ806x to store various board related information such
as boot device and flash partition layout. We'll declare it as a device
so we can make use of it thanks to the new SMEM soc driver.

Signed-off-by: Mathieu Olivari <mathieu@codeaurora.org>
---
 arch/arm/boot/dts/qcom-ipq8064.dtsi | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
index 8d366ae..85dbccf 100644
--- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
@@ -55,7 +55,7 @@
 			no-map;
 		};
 
-		smem@41000000 {
+		smem: smem@41000000 {
 			reg = <0x41000000 0x200000>;
 			no-map;
 		};
@@ -341,4 +341,10 @@
 
 		#hwlock-cells = <1>;
 	};
+
+	smem {
+		compatible = "qcom,smem";
+		memory-region = <&smem>;
+		hwlocks = <&sfpb_mutex 3>;
+	};
 };
-- 
2.1.4
