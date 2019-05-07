From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.14 73/95] xtensa: xtfpga.dtsi: fix dtc warnings about SPI
Date: Tue,  7 May 2019 01:38:02 -0400
Message-ID: <20190507053826.31622-73-sashal@kernel.org>
References: <20190507053826.31622-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190507053826.31622-1-sashal@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Max Filippov <jcmvbkbc@gmail.com>, Sasha Levin <alexander.levin@microsoft.com>, devicetree@vger.kernel.org, linux-xtensa@linux-xtensa.org
List-Id: devicetree@vger.kernel.org

From: Max Filippov <jcmvbkbc@gmail.com>

[ Upstream commit f37598be4e3896359e87c824be57ddddc280cc3f ]

Rename SPI controller node in the XTFPGA DTS to spi@...
This fixes the following build warnings:

arch/xtensa/boot/dts/kc705_nommu.dtb: Warning (spi_bus_bridge):
 /soc/spi-master@0d0a0000: node name for SPI buses should be 'spi'
arch/xtensa/boot/dts/kc705_nommu.dtb: Warning (spi_bus_reg):
 Failed prerequisite 'spi_bus_bridge'
arch/xtensa/boot/dts/lx200mx.dtb: Warning (spi_bus_bridge):
 /soc/spi-master@0d0a0000: node name for SPI buses should be 'spi'
arch/xtensa/boot/dts/lx200mx.dtb: Warning (spi_bus_reg):
 Failed prerequisite 'spi_bus_bridge'
arch/xtensa/boot/dts/kc705.dtb: Warning (spi_bus_bridge):
 /soc/spi-master@0d0a0000: node name for SPI buses should be 'spi'
arch/xtensa/boot/dts/kc705.dtb: Warning (spi_bus_reg):
 Failed prerequisite 'spi_bus_bridge'
arch/xtensa/boot/dts/ml605.dtb: Warning (spi_bus_bridge):
 /soc/spi-master@0d0a0000: node name for SPI buses should be 'spi'
arch/xtensa/boot/dts/ml605.dtb: Warning (spi_bus_reg):
 Failed prerequisite 'spi_bus_bridge'
arch/xtensa/boot/dts/lx60.dtb: Warning (spi_bus_bridge):
 /soc/spi-master@0d0a0000: node name for SPI buses should be 'spi'
arch/xtensa/boot/dts/lx60.dtb: Warning (spi_bus_reg):
 Failed prerequisite 'spi_bus_bridge'

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Sasha Levin <alexander.levin@microsoft.com>
---
 arch/xtensa/boot/dts/xtfpga.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/xtensa/boot/dts/xtfpga.dtsi b/arch/xtensa/boot/dts/xtfpga.dtsi
index 1090528825ec..e46ae07bab05 100644
--- a/arch/xtensa/boot/dts/xtfpga.dtsi
+++ b/arch/xtensa/boot/dts/xtfpga.dtsi
@@ -103,7 +103,7 @@
 			};
 		};
 
-		spi0: spi-master@0d0a0000 {
+		spi0: spi@0d0a0000 {
 			compatible = "cdns,xtfpga-spi";
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.20.1
