From: Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>
Subject: [PATCH V3 06/12] dtb: amd: Misc changes for SATA device tree nodes
Date: Wed, 10 Feb 2016 21:51:05 -0600
Message-ID: <1455162671-16044-7-git-send-email-Suravee.Suthikulpanit@amd.com>
References: <1455162671-16044-1-git-send-email-Suravee.Suthikulpanit@amd.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1455162671-16044-1-git-send-email-Suravee.Suthikulpanit@amd.com>
Sender: linux-kernel-owner@vger.kernel.org
To: olof@lixom.net, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, arnd@arndb.de
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, arm@kernel.org, brijeshkumar.singh@amd.com, thomas.lendacky@amd.com, leo.duran@amd.com, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: devicetree@vger.kernel.org

From: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>

Add new SATA1 device node, and fix the register range size of SATA0.

Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
Signed-off-by: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
---
 arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi b/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
index 4be36fd..9f59381 100644
--- a/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
+++ b/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
@@ -66,12 +66,22 @@
 
 		sata0: sata@e0300000 {
 			compatible = "snps,dwc-ahci";
-			reg = <0 0xe0300000 0 0x800>;
+			reg = <0 0xe0300000 0 0xf0000>;
 			interrupts = <0 355 4>;
 			clocks = <&sataclk_333mhz>;
 			dma-coherent;
 		};
 
+		/* This is for Rev B only */
+		sata1: sata@e0d00000 {
+			status = "disabled";
+			compatible = "snps,dwc-ahci";
+			reg = <0 0xe0d00000 0 0xf0000>;
+			interrupts = <0 354 4>;
+			clocks = <&sataclk_333mhz>;
+			dma-coherent;
+		};
+
 		i2c0: i2c@e1000000 {
 			status = "disabled";
 			compatible = "snps,designware-i2c";
-- 
2.5.0
