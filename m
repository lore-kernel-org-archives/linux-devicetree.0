From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH 2/5] ARM: dts: mmp2: fix the SPI nodes
Date: Thu, 25 Jul 2019 13:07:28 +0200
Message-ID: <20190725110731.3294411-3-lkundrak@v3.sk>
References: <20190725110731.3294411-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190725110731.3294411-1-lkundrak@v3.sk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Olof Johansson <olof@lixom.net>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The SPI bus has a single address cell and not size cells.

Also, dtc thinks the SPI nodes are preferrably called "spi" and it is
right to think so.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 arch/arm/boot/dts/mmp2.dtsi | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/mmp2.dtsi b/arch/arm/boot/dts/mmp2.dtsi
index 50b6c38b39cc3..e64639ce57a91 100644
--- a/arch/arm/boot/dts/mmp2.dtsi
+++ b/arch/arm/boot/dts/mmp2.dtsi
@@ -346,35 +346,43 @@
 				status = "disabled";
 			};
 
-			ssp1: ssp@d4035000 {
+			ssp1: spi@d4035000 {
 				compatible = "marvell,mmp2-ssp";
 				reg = <0xd4035000 0x1000>;
 				clocks = <&soc_clocks MMP2_CLK_SSP0>;
 				interrupts = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				status = "disabled";
 			};
 
-			ssp2: ssp@d4036000 {
+			ssp2: spi@d4036000 {
 				compatible = "marvell,mmp2-ssp";
 				reg = <0xd4036000 0x1000>;
 				clocks = <&soc_clocks MMP2_CLK_SSP1>;
 				interrupts = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				status = "disabled";
 			};
 
-			ssp3: ssp@d4037000 {
+			ssp3: spi@d4037000 {
 				compatible = "marvell,mmp2-ssp";
 				reg = <0xd4037000 0x1000>;
 				clocks = <&soc_clocks MMP2_CLK_SSP2>;
 				interrupts = <20>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				status = "disabled";
 			};
 
-			ssp4: ssp@d4039000 {
+			ssp4: spi@d4039000 {
 				compatible = "marvell,mmp2-ssp";
 				reg = <0xd4039000 0x1000>;
 				clocks = <&soc_clocks MMP2_CLK_SSP3>;
 				interrupts = <21>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				status = "disabled";
 			};
 		};
-- 
2.21.0
