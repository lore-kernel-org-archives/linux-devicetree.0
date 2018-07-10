From: Fabio Estevam <fabio.estevam@nxp.com>
Subject: [PATCH v2 3/6] ARM: dts: imx51: Add tigerp support
Date: Tue, 10 Jul 2018 10:47:33 -0300
Message-ID: <1531230456-27717-3-git-send-email-fabio.estevam@nxp.com>
References: <1531230456-27717-1-git-send-email-fabio.estevam@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1531230456-27717-1-git-send-email-fabio.estevam@nxp.com>
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
Cc: devicetree@vger.kernel.org, Fabio Estevam <fabio.estevam@nxp.com>, robh+dt@kernel.org, kernel@pengutronix.de, sebastian.reichel@collabora.co.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

As per the i.MX51 Reference Manual add an entry for the
'tigerp' region in the device tree.

This is needed for accessing the ARM_GPC register to set the
DBGEN bit, so that the debug clocks can be turned on.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
Changes since v1:
- Newly introduced in this series.

 arch/arm/boot/dts/imx51.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/imx51.dtsi b/arch/arm/boot/dts/imx51.dtsi
index 113ddbc..da9d4ce 100644
--- a/arch/arm/boot/dts/imx51.dtsi
+++ b/arch/arm/boot/dts/imx51.dtsi
@@ -451,6 +451,11 @@
 				clocks = <&clks IMX5_CLK_IIM_GATE>;
 			};
 
+			tigerp: tigerp@83fa0000 {
+				compatible = "fsl,imx51-tigerp";
+				reg = <0x83fa0000 0x28>;
+			};
+
 			owire: owire@83fa4000 {
 				compatible = "fsl,imx51-owire", "fsl,imx21-owire";
 				reg = <0x83fa4000 0x4000>;
-- 
2.7.4
