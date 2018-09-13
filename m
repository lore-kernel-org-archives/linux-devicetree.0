From: Rob Herring <robh@kernel.org>
Subject: [PATCH] arm64: dts: amd: Fix SPI bus warnings
Date: Thu, 13 Sep 2018 13:12:40 -0500
Message-ID: <20180913181245.25484-16-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Brijesh Singh <brijeshkumar.singh@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: devicetree@vger.kernel.org

dtc has new checks for SPI buses. Fix the warnings in node names.

arch/arm64/boot/dts/amd/amd-overdrive.dtb: Warning (spi_bus_bridge): /smb/ssp@e1030000: node name for SPI buses should be 'spi'
arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dtb: Warning (spi_bus_bridge): /smb/ssp@e1030000: node name for SPI buses should be 'spi'
arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dtb: Warning (spi_bus_bridge): /smb/ssp@e1030000: node name for SPI buses should be 'spi'

Cc: Brijesh Singh <brijeshkumar.singh@amd.com>
Cc: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
Please apply to the sub-arch tree. The dtc changes haven't landed, but 
will for 4.20.

 arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi b/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
index 125f4deb52fe..b664e7af74eb 100644
--- a/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
+++ b/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
@@ -107,7 +107,7 @@
 			clock-names = "uartclk", "apb_pclk";
 		};
 
-		spi0: ssp@e1020000 {
+		spi0: spi@e1020000 {
 			status = "disabled";
 			compatible = "arm,pl022", "arm,primecell";
 			reg = <0 0xe1020000 0 0x1000>;
@@ -117,7 +117,7 @@
 			clock-names = "apb_pclk";
 		};
 
-		spi1: ssp@e1030000 {
+		spi1: spi@e1030000 {
 			status = "disabled";
 			compatible = "arm,pl022", "arm,primecell";
 			reg = <0 0xe1030000 0 0x1000>;
-- 
2.17.1
