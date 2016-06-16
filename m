From: Li Yang <leoyang.li@nxp.com>
Subject: [PATCH 1/2] arm64: dts: ls1043a: Add cache nodes for cacheinfo support
Date: Thu, 16 Jun 2016 18:35:03 -0500
Message-ID: <1466120104-12023-1-git-send-email-leoyang.li@nxp.com>
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
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, Stuart Yoder <stuart.yoder@nxp.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Li Yang <leoyang.li@nxp.com>
List-Id: devicetree@vger.kernel.org

Adds the cache nodes and next-level-cache property for the
cacheinfo to work.

Signed-off-by: Li Yang <leoyang.li@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
index de0323b..2b4aa2a 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
@@ -65,6 +65,7 @@
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x0>;
 			clocks = <&clockgen 1 0>;
+			next-level-cache = <&l2>;
 		};
 
 		cpu1: cpu@1 {
@@ -72,6 +73,7 @@
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x1>;
 			clocks = <&clockgen 1 0>;
+			next-level-cache = <&l2>;
 		};
 
 		cpu2: cpu@2 {
@@ -79,6 +81,7 @@
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x2>;
 			clocks = <&clockgen 1 0>;
+			next-level-cache = <&l2>;
 		};
 
 		cpu3: cpu@3 {
@@ -86,6 +89,11 @@
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x3>;
 			clocks = <&clockgen 1 0>;
+			next-level-cache = <&l2>;
+		};
+
+		l2: l2-cache {
+			compatible = "cache";
 		};
 	};
 
-- 
1.9.0
