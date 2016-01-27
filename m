From: Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>
Subject: [PATCH 05/13] dtb: amd: Misc changes for I2C device nodes
Date: Wed, 27 Jan 2016 15:11:53 -0600
Message-ID: <1453929121-12171-6-git-send-email-Suravee.Suthikulpanit@amd.com>
References: <1453929121-12171-1-git-send-email-Suravee.Suthikulpanit@amd.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453929121-12171-1-git-send-email-Suravee.Suthikulpanit@amd.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, arnd@arndb.de
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, arm@kernel.org, brijeshkumar.singh@amd.com, thomas.lendacky@amd.com, leo.duran@amd.com, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: devicetree@vger.kernel.org

From: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>

Add new i2c1 device node, and fix the incorrect clock frequency.

Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
Signed-off-by: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
---
 arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi b/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
index c7c759a..4be36fd 100644
--- a/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
+++ b/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
@@ -77,7 +77,15 @@
 			compatible = "snps,designware-i2c";
 			reg = <0 0xe1000000 0 0x1000>;
 			interrupts = <0 357 4>;
-			clocks = <&uartspiclk_100mhz>;
+			clocks = <&miscclk_250mhz>;
+		};
+
+		i2c1: i2c@e0050000 {
+			status = "disabled";
+			compatible = "snps,designware-i2c";
+			reg = <0 0xe0050000 0 0x1000>;
+			interrupts = <0 340 4>;
+			clocks = <&miscclk_250mhz>;
 		};
 
 		serial0: serial@e1010000 {
-- 
2.5.0
