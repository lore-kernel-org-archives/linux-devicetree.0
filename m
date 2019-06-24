From: Dinh Nguyen <dinguyen@kernel.org>
Subject: [PATCH] ARM: dts: socfpga: add the QSPI OCP reset property on arria10
Date: Mon, 24 Jun 2019 10:45:58 -0500
Message-ID: <20190624154558.5354-1-dinguyen@kernel.org>
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
To: robh+dt@kernel.org, mark.rutland@arm.com
Cc: dinguyen@kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The QSPI module needs the OCP reset bit deasserted as well.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 arch/arm/boot/dts/socfpga_arria10.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/socfpga_arria10.dtsi b/arch/arm/boot/dts/socfpga_arria10.dtsi
index a0a6d8507265..20af1543819a 100644
--- a/arch/arm/boot/dts/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/socfpga_arria10.dtsi
@@ -753,7 +753,8 @@
 			cdns,fifo-width = <4>;
 			cdns,trigger-address = <0x00000000>;
 			clocks = <&qspi_clk>;
-			resets = <&rst QSPI_RESET>;
+			resets = <&rst QSPI_RESET>, <&rst QSPI_OCP_RESET>;
+			reset-names = "qspi", "qspi-ocp";
 			status = "disabled";
 		};
 
-- 
2.20.0
