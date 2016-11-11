From: <christopher.spinrath@rwth-aachen.de>
Subject: [PATCH 1/2] ARM: dts: imx6q-cm-fx6: fix fec pinctrl
Date: Fri, 11 Nov 2016 16:59:38 +0100
Message-ID: <6cd823201b9f4cde8de8eddc910f39ce@rwthex-s1-b.rwth-ad.de>
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
To: shawnguo@kernel.org, kernel@pengutronix.de
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Christopher Spinrath <christopher.spinrath@rwth-aachen.de>, linux@armlinux.org.uk, robh+dt@kernel.org, grinberg@compulab.co.il, fabio.estevam@nxp.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Christopher Spinrath <christopher.spinrath@rwth-aachen.de>

According to the schematics of CompuLab's sbc-fx6 baseboard and the
vendor devicetree GPIO_16 is *not* muxed to ENET_REF_CLK but to SPDIF_IN.

Remove the wrong pinctrl setting.

Fixes: 682d055e6ac5 ("ARM: dts: Add initial support for cm-fx6.")
Signed-off-by: Christopher Spinrath <christopher.spinrath@rwth-aachen.de>
---
 arch/arm/boot/dts/imx6q-cm-fx6.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx6q-cm-fx6.dts b/arch/arm/boot/dts/imx6q-cm-fx6.dts
index 59bc5a4..a150bca 100644
--- a/arch/arm/boot/dts/imx6q-cm-fx6.dts
+++ b/arch/arm/boot/dts/imx6q-cm-fx6.dts
@@ -183,7 +183,6 @@
 			MX6QDL_PAD_ENET_REF_CLK__ENET_TX_CLK	0x1b0b0
 			MX6QDL_PAD_ENET_MDIO__ENET_MDIO		0x1b0b0
 			MX6QDL_PAD_ENET_MDC__ENET_MDC		0x1b0b0
-			MX6QDL_PAD_GPIO_16__ENET_REF_CLK	0x4001b0a8
 		>;
 	};
 
-- 
2.10.2
