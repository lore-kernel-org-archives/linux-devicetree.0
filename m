From: Ashish Kumar <Ashish.Kumar@nxp.com>
Subject: [PATCH] arm64: dts: ls1046a: Add QSPI node for ls1046afrwy
Date: Tue, 10 Sep 2019 17:50:52 +0530
Message-ID: <1568118055-9740-2-git-send-email-Ashish.Kumar@nxp.com>
References: <1568118055-9740-1-git-send-email-Ashish.Kumar@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1568118055-9740-1-git-send-email-Ashish.Kumar@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, robh@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Ashish Kumar <Ashish.Kumar@nxp.com>
List-Id: devicetree@vger.kernel.org

This board has a single 64MB mt25qu512a flash.
QUAD I/O read and single I/O write is tested.

Signed-off-by: Ashish Kumar <Ashish.Kumar@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dts
index 3595be0..c95d1ca 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dts
@@ -112,6 +112,21 @@
 
 };
 
+&qspi {
+	status = "okay";
+
+	qflash0: mt25qu512a@0 {
+		compatible = "micron,mt25qu512a", "jedec,spi-nor";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		m25p,fast-read;
+		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
+		reg = <0>;
+	};
+};
+
 #include "fsl-ls1046-post.dtsi"
 
 &fman0 {
-- 
2.7.4
