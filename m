From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH 2/2] ARM: dts: pfla02: add ksz9031 clock skew values
Date: Mon,  4 Feb 2019 16:29:56 +0100
Message-ID: <20190204152956.13471-2-m.felsch@pengutronix.de>
References: <20190204152956.13471-1-m.felsch@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190204152956.13471-1-m.felsch@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawnguo@kernel.org, kernel@pengutronix.de, fabio.estevam@nxp.com, linux-imx@nxp.com, robh+dt@kernel.org, c.hemp@phytec.de
Cc: devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Philipp Zabel <p.zabel@pengutronix.de>

The pfla02 SoM has a Micrel KSZ9031RNX ethernet phy connected to the FEC,
which needs RX and TX clock skew settings to compensate for differences
in line length. The skew values are taken from barebox commit
4c65c20f1071 ("ARM: pfla02: Set new ethernet phy tx timings"), which
is based on patches originally provided by Phytec:

    TX_CLK line is approx. 54mm longer than other TX lines which adds
    a delay of 0.36ns. RGMII need a delay of min. 1.0ns. This mean we
    have to add a delay of 0.64ns. We choose 0.78 to have a little gap.
    This can be done by setting GTX pad skew value to 11100
    Also add a delay for the RX delay lines, needed for the Duallite
    variant.  => Set register 2.8 (RGMII Clock Pad Skew) to 0x039F.

Cc: Christian Hemp <c.hemp@phytec.de>
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 arch/arm/boot/dts/imx6qdl-phytec-pfla02.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl-phytec-pfla02.dtsi b/arch/arm/boot/dts/imx6qdl-phytec-pfla02.dtsi
index 35d56e25c4a0..673711f445b6 100644
--- a/arch/arm/boot/dts/imx6qdl-phytec-pfla02.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-phytec-pfla02.dtsi
@@ -89,10 +89,23 @@
 &fec {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_enet>;
+	phy-handle = <&ethphy>;
 	phy-mode = "rgmii";
 	phy-reset-gpios = <&gpio3 23 GPIO_ACTIVE_LOW>;
 	phy-supply = <&vdd_eth_io_reg>;
 	status = "disabled";
+
+	fec_mdio: mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy: ethernet-phy@0 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
+			txc-skew-ps = <1680>;
+			rxc-skew-ps = <1860>;
+		};
+	};
 };
 
 &gpmi {
-- 
2.20.1
