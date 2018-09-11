From: andy.tang@nxp.com
Subject: [PATCH] powerpc/mpc85xx: fix issues in clock node
Date: Tue, 11 Sep 2018 10:12:24 +0800
Message-ID: <20180911021224.30558-1-andy.tang@nxp.com>
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
To: oss@buserror.net
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Yuantian Tang <andy.tang@nxp.com>, robh+dt@kernel.org, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

From: Yuantian Tang <andy.tang@nxp.com>

The compatible string is not correct in the clock node.
The clocks property refers to the wrong node too.
This patch is to fix them.

Signed-off-by: Tang Yuantian <andy.tang@nxp.com>
---
 arch/powerpc/boot/dts/fsl/t1023si-post.dtsi |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/boot/dts/fsl/t1023si-post.dtsi b/arch/powerpc/boot/dts/fsl/t1023si-post.dtsi
index 4908af5..763caf4 100644
--- a/arch/powerpc/boot/dts/fsl/t1023si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t1023si-post.dtsi
@@ -348,7 +348,7 @@
 		mux0: mux0@0 {
 			#clock-cells = <0>;
 			reg = <0x0 4>;
-			compatible = "fsl,core-mux-clock";
+			compatible = "fsl,qoriq-core-mux-2.0";
 			clocks = <&pll0 0>, <&pll0 1>;
 			clock-names = "pll0_0", "pll0_1";
 			clock-output-names = "cmux0";
@@ -356,9 +356,9 @@
 		mux1: mux1@20 {
 			#clock-cells = <0>;
 			reg = <0x20 4>;
-			compatible = "fsl,core-mux-clock";
-			clocks = <&pll0 0>, <&pll0 1>;
-			clock-names = "pll0_0", "pll0_1";
+			compatible = "fsl,qoriq-core-mux-2.0";
+			clocks = <&pll1 0>, <&pll1 1>;
+			clock-names = "pll1_0", "pll1_1";
 			clock-output-names = "cmux1";
 		};
 	};
-- 
1.7.1
