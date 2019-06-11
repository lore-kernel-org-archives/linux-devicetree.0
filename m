From: Olivier Moysan <olivier.moysan@st.com>
Subject: [PATCH] ARM: dts: stm32: add sai id registers to stm32mp157c
Date: Tue, 11 Jun 2019 13:45:56 +0200
Message-ID: <1560253556-18399-1-git-send-email-olivier.moysan@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-stm32@st-md-mailman.stormreply.com, alexandre.torgue@st.com, robh@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, olivier.moysan@st.com
List-Id: devicetree@vger.kernel.org

Add identification registers to address range
of SAI DT parent node, for stm32mp157c.

Change-Id: I696363794fab59ba8d7869b3ffbc041dacdf28de
Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
 arch/arm/boot/dts/stm32mp157c.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp157c.dtsi b/arch/arm/boot/dts/stm32mp157c.dtsi
index e98aad37ff9e..0c4e6ebc3529 100644
--- a/arch/arm/boot/dts/stm32mp157c.dtsi
+++ b/arch/arm/boot/dts/stm32mp157c.dtsi
@@ -746,7 +746,7 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0 0x4400a000 0x400>;
-			reg = <0x4400a000 0x4>;
+			reg = <0x4400a000 0x4>, <0x4400a3f0 0x10>;
 			interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
 			resets = <&rcc SAI1_R>;
 			status = "disabled";
@@ -778,7 +778,7 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0 0x4400b000 0x400>;
-			reg = <0x4400b000 0x4>;
+			reg = <0x4400b000 0x4>, <0x4400b3f0 0x10>;
 			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
 			resets = <&rcc SAI2_R>;
 			status = "disabled";
@@ -809,7 +809,7 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0 0x4400c000 0x400>;
-			reg = <0x4400c000 0x4>;
+			reg = <0x4400c000 0x4>, <0x4400c3f0 0x10>;
 			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
 			resets = <&rcc SAI3_R>;
 			status = "disabled";
@@ -1164,7 +1164,7 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0 0x50027000 0x400>;
-			reg = <0x50027000 0x4>;
+			reg = <0x50027000 0x4>, <0x500273f0 0x10>;
 			interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
 			resets = <&rcc SAI4_R>;
 			status = "disabled";
-- 
2.7.4
