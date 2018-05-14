From: Fabio Estevam <festevam@gmail.com>
Subject: [RFC] ARM: dts: imx7s: Fix the port reg properties
Date: Mon, 14 May 2018 11:09:56 -0300
Message-ID: <1526306996-25045-1-git-send-email-festevam@gmail.com>
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
To: shawnguo@kernel.org
Cc: Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Fabio Estevam <fabio.estevam@nxp.com>

The 'reg' property must match the unit address, so fix them
to avoid the following DTC warnings with W=1:

arch/arm/boot/dts/imx7d-cl-som-imx7.dtb: Warning (graph_port): /replicator/ports/port@2: graph node unit address error, expected "0"
arch/arm/boot/dts/imx7d-cl-som-imx7.dtb: Warning (graph_port): /soc/funnel@30041000/ports/port@2: graph node unit address error, expected "0"
arch/arm/boot/dts/imx7d-cl-som-imx7.dtb: Warning (graph_port): /soc/funnel@30083000/ports/port@2: graph node unit address error, expected "0"
arch/arm/boot/dts/imx7d-cl-som-imx7.dtb: Warning (graph_port): /soc/etf@30084000/ports/port@1: graph node unit address error, expected "0"

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
Hi Rob,

Is this the correct way to fix these warnings?

 arch/arm/boot/dts/imx7s.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
index 7d33993..55b6241 100644
--- a/arch/arm/boot/dts/imx7s.dtsi
+++ b/arch/arm/boot/dts/imx7s.dtsi
@@ -126,7 +126,7 @@
 
 			/* replicator input port */
 			port@2 {
-				reg = <0>;
+				reg = <2>;
 				replicator_in_port0: endpoint {
 					slave-mode;
 					remote-endpoint = <&etf_out_port>;
@@ -183,7 +183,7 @@
 
 				/* funnel output port */
 				port@2 {
-					reg = <0>;
+					reg = <2>;
 					ca_funnel_out_port0: endpoint {
 						remote-endpoint = <&hugo_funnel_in_port0>;
 					};
@@ -234,7 +234,7 @@
 				};
 
 				port@2 {
-					reg = <0>;
+					reg = <2>;
 					hugo_funnel_out_port0: endpoint {
 						remote-endpoint = <&etf_in_port>;
 					};
@@ -263,7 +263,7 @@
 				};
 
 				port@1 {
-					reg = <0>;
+					reg = <1>;
 					etf_out_port: endpoint {
 						remote-endpoint = <&replicator_in_port0>;
 					};
-- 
2.7.4
