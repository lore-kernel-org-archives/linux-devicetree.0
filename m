From: Lucas Stach <l.stach@pengutronix.de>
Subject: [PATCH 1/2] dt-bindings: phy-imx8mq-usb: add optional vbus supply
 regulator
Date: Thu,  4 Apr 2019 18:41:47 +0200
Message-ID: <20190404164148.11140-1-l.stach@pengutronix.de>
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
To: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, patchwork-lst@pengutronix.de, NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, Li Jun <jun.li@nxp.com>
List-Id: devicetree@vger.kernel.org

Add a vbus supply regulator phandle, so the PHY can enable the VBUS
voltage rail when powering up.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.txt b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.txt
index a22e853d710c..ed47e5cd067e 100644
--- a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.txt
+++ b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.txt
@@ -7,6 +7,9 @@ Required properties:
 - clocks:	phandles to the clocks for each clock listed in clock-names
 - clock-names:	must contain "phy"
 
+Optional properties:
+- vbus-supply: A phandle to the regulator for USB VBUS.
+
 Example:
 	usb3_phy0: phy@381f0040 {
 		compatible = "fsl,imx8mq-usb-phy";
-- 
2.20.1
