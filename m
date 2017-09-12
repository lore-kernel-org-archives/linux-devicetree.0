From: SZ Lin <sz.lin@moxa.com>
Subject: [RESEND PATCH] ARM: dts: ls1021a: Add support for QSPI with ls1021a
 SoC
Date: Tue, 12 Sep 2017 14:49:25 +0800
Message-ID: <20170912064925.24571-1-sz.lin@moxa.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, andy.tang@nxp.com, yi.sheng.lin@nxp.com, Zhiqiang.Hou@nxp.com, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, Minghuan.Lian@nxp.com, SZ Lin <sz.lin@moxa.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add QSPI node support, and this function is disabled by default
This setting could be overwritten in board-level definitions

Signed-off-by: SZ Lin <sz.lin@moxa.com>
---
 arch/arm/boot/dts/ls1021a.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.dtsi
index 7bb9df2c1460..9da876e47810 100644
--- a/arch/arm/boot/dts/ls1021a.dtsi
+++ b/arch/arm/boot/dts/ls1021a.dtsi
@@ -154,6 +154,20 @@
 			big-endian;
 		};
 
+		qspi: quadspi@1550000 {
+			compatible = "fsl,ls1021a-qspi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0 0x1550000 0x0 0x10000>,
+			      <0x0 0x40000000 0x0 0x40000000>;
+			reg-names = "QuadSPI", "QuadSPI-memory";
+			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "qspi_en", "qspi";
+			clocks = <&clockgen 4 1>, <&clockgen 4 1>;
+			big-endian;
+			status = "disabled";
+		};
+
 		esdhc: esdhc@1560000 {
 			compatible = "fsl,esdhc";
 			reg = <0x0 0x1560000 0x0 0x10000>;
-- 
2.14.1
