From: Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH] ARM: dts: vf610-bk4: fix incorrect #address-cells for dspi3
Date: Sat, 12 Jan 2019 09:15:14 +0800
Message-ID: <20190112011514.8527-1-shawnguo@kernel.org>
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
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Lukasz Majewski <lukma@denx.de>
List-Id: devicetree@vger.kernel.org

The dspi3 is used as slave controller on vf610-bk4, and the default
'#address-cells = <1>;' setting in vfxxx.dtsi causes the following DTC
warning.

  DTC     arch/arm/boot/dts/vf610-bk4.dtb
../arch/arm/boot/dts/vfxxx.dtsi:550.24-563.6: Warning (spi_bus_bridge): /soc/aips-bus@40080000/spi@400ad000: incorrect #address-cells for SPI bus
  also defined at ../arch/arm/boot/dts/vf610-bk4.dts:107.8-119.3
arch/arm/boot/dts/vf610-bk4.dtb: Warning (spi_bus_reg): Failed prerequisite 'spi_bus_bridge'

For spi device used as slave controller, '#address-cells' should be 0.
Let's overwrite the property in vf610-bk4.dts to fix the warning.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Shawn Guo <shawnguo@kernel.org>
---
 arch/arm/boot/dts/vf610-bk4.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/vf610-bk4.dts b/arch/arm/boot/dts/vf610-bk4.dts
index 689c8930dce3..b08d561d6748 100644
--- a/arch/arm/boot/dts/vf610-bk4.dts
+++ b/arch/arm/boot/dts/vf610-bk4.dts
@@ -110,11 +110,11 @@
 	bus-num = <3>;
 	status = "okay";
 	spi-slave;
+	#address-cells = <0>;
 
-	slave@0 {
+	slave {
 		compatible = "lwn,bk4";
 		spi-max-frequency = <30000000>;
-		reg = <0>;
 	};
 };
 
-- 
2.18.0
