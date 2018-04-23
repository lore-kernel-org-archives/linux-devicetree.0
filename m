From: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 2/5] ARM: dts: imx6: Remove #address/#size-cells from ipu nodes
Date: Mon, 23 Apr 2018 10:46:11 -0300
Message-ID: <1524491174-16878-2-git-send-email-festevam@gmail.com>
References: <1524491174-16878-1-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1524491174-16878-1-git-send-email-festevam@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawnguo@kernel.org
Cc: Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Fabio Estevam <fabio.estevam@nxp.com>

Remove unnecessary #address-cells/#size-cells to fix the following
DTC warnings:

arch/arm/boot/dts/imx6dl-apf6dev.dtb: Warning (avoid_unnecessary_addr_size): /soc/ipu@2400000/port@2: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
arch/arm/boot/dts/imx6dl-apf6dev.dtb: Warning (avoid_unnecessary_addr_size): /soc/ipu@2400000/port@3: unnecessary #address-cells/#size-cells without "ranges" or child "reg" propert

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 arch/arm/boot/dts/imx6q.dtsi   | 4 ----
 arch/arm/boot/dts/imx6qdl.dtsi | 4 ----
 2 files changed, 8 deletions(-)

diff --git a/arch/arm/boot/dts/imx6q.dtsi b/arch/arm/boot/dts/imx6q.dtsi
index ae7b3f1..48429e8 100644
--- a/arch/arm/boot/dts/imx6q.dtsi
+++ b/arch/arm/boot/dts/imx6q.dtsi
@@ -158,8 +158,6 @@
 			};
 
 			ipu2_di0: port@2 {
-				#address-cells = <1>;
-				#size-cells = <0>;
 				reg = <2>;
 
 				ipu2_di0_disp0: disp0-endpoint {
@@ -183,8 +181,6 @@
 			};
 
 			ipu2_di1: port@3 {
-				#address-cells = <1>;
-				#size-cells = <0>;
 				reg = <3>;
 
 				ipu2_di1_hdmi: hdmi-endpoint {
diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dtsi
index 1fbd970..5332fe7 100644
--- a/arch/arm/boot/dts/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/imx6qdl.dtsi
@@ -1294,8 +1294,6 @@
 			};
 
 			ipu1_di0: port@2 {
-				#address-cells = <1>;
-				#size-cells = <0>;
 				reg = <2>;
 
 				ipu1_di0_disp0: disp0-endpoint {
@@ -1319,8 +1317,6 @@
 			};
 
 			ipu1_di1: port@3 {
-				#address-cells = <1>;
-				#size-cells = <0>;
 				reg = <3>;
 
 				ipu1_di1_disp1: disp1-endpoint {
-- 
2.7.4
