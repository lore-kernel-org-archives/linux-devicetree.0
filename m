From: Li Yang <leoyang.li@nxp.com>
Subject: [PATCH 2/2] arm64: dts: ls2080a: Add cache nodes for cacheinfo support
Date: Thu, 16 Jun 2016 18:35:04 -0500
Message-ID: <1466120104-12023-2-git-send-email-leoyang.li@nxp.com>
References: <1466120104-12023-1-git-send-email-leoyang.li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1466120104-12023-1-git-send-email-leoyang.li@nxp.com>
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
 arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
index 3187c82..0f4b9c1 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
@@ -67,6 +67,7 @@
 			compatible = "arm,cortex-a57";
 			reg = <0x0 0x0>;
 			clocks = <&clockgen 1 0>;
+			next-level-cache = <&cluster0_l2>;
 		};
 
 		cpu@1 {
@@ -74,6 +75,7 @@
 			compatible = "arm,cortex-a57";
 			reg = <0x0 0x1>;
 			clocks = <&clockgen 1 0>;
+			next-level-cache = <&cluster0_l2>;
 		};
 
 		cpu@100 {
@@ -81,6 +83,7 @@
 			compatible = "arm,cortex-a57";
 			reg = <0x0 0x100>;
 			clocks = <&clockgen 1 1>;
+			next-level-cache = <&cluster1_l2>;
 		};
 
 		cpu@101 {
@@ -88,6 +91,7 @@
 			compatible = "arm,cortex-a57";
 			reg = <0x0 0x101>;
 			clocks = <&clockgen 1 1>;
+			next-level-cache = <&cluster1_l2>;
 		};
 
 		cpu@200 {
@@ -95,6 +99,7 @@
 			compatible = "arm,cortex-a57";
 			reg = <0x0 0x200>;
 			clocks = <&clockgen 1 2>;
+			next-level-cache = <&cluster2_l2>;
 		};
 
 		cpu@201 {
@@ -102,6 +107,7 @@
 			compatible = "arm,cortex-a57";
 			reg = <0x0 0x201>;
 			clocks = <&clockgen 1 2>;
+			next-level-cache = <&cluster2_l2>;
 		};
 
 		cpu@300 {
@@ -109,6 +115,7 @@
 			compatible = "arm,cortex-a57";
 			reg = <0x0 0x300>;
 			clocks = <&clockgen 1 3>;
+			next-level-cache = <&cluster3_l2>;
 		};
 
 		cpu@301 {
@@ -116,6 +123,23 @@
 			compatible = "arm,cortex-a57";
 			reg = <0x0 0x301>;
 			clocks = <&clockgen 1 3>;
+			next-level-cache = <&cluster3_l2>;
+		};
+
+		cluster0_l2: l2-cache0 {
+			compatible = "cache";
+		};
+
+		cluster1_l2: l2-cache1 {
+			compatible = "cache";
+		};
+
+		cluster2_l2: l2-cache2 {
+			compatible = "cache";
+		};
+
+		cluster3_l2: l2-cache3 {
+			compatible = "cache";
 		};
 	};
 
-- 
1.9.0
