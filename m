From: Rob Herring <robh@kernel.org>
Subject: [PATCH] arm: dts: imx7: Fix error in coresight TPIU graph connection
Date: Tue,  8 May 2018 08:59:28 -0500
Message-ID: <20180508135930.5768-4-robh@kernel.org>
References: <20180508135930.5768-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180508135930.5768-1-robh@kernel.org>
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
Cc: Fabio Estevam <fabio.estevam@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

OF graph endpoint connections must be bidirectional and dtc will now
warn if they are not. i.MX7 based DTs have an error and generate
warnings:

Warning (graph_endpoint): /replicator/ports/port@0/endpoint: graph connection to node '/soc/tpiu@30087000/port/endpoint' is not bidirectional
Warning (graph_endpoint): /soc/tpiu@30087000/port/endpoint: graph connection to node '/replicator/ports/port@1/endpoint' is not bidirectional

This appears to be a copy-n-paste error and the TPIU input should be
connected to replicator port 0 instead of port 1.

Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/arm/boot/dts/imx7s.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
index 4d42335c0dee..5db530ec756e 100644
--- a/arch/arm/boot/dts/imx7s.dtsi
+++ b/arch/arm/boot/dts/imx7s.dtsi
@@ -321,7 +321,7 @@
 			port {
 				tpiu_in_port: endpoint {
 					slave-mode;
-					remote-endpoint = <&replicator_out_port1>;
+					remote-endpoint = <&replicator_out_port0>;
 				};
 			};
 		};
-- 
2.17.0
