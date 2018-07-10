From: Fabio Estevam <fabio.estevam@nxp.com>
Subject: [PATCH v3 4/6] ARM: dts: imx53: Add tigerp support
Date: Tue, 10 Jul 2018 13:08:45 -0300
Message-ID: <1531238927-19579-4-git-send-email-fabio.estevam@nxp.com>
References: <1531238927-19579-1-git-send-email-fabio.estevam@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1531238927-19579-1-git-send-email-fabio.estevam@nxp.com>
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

As per the i.MX53 Reference Manual add an entry for the
'tigerp' region in the device tree.

This is needed for accessing the ARM_GPC register to set the
DBGEN bit, so that the debug clocks can be turned on.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
Changes since v2:
- None

 arch/arm/boot/dts/imx53.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/imx53.dtsi b/arch/arm/boot/dts/imx53.dtsi
index 1a7a7bb..3fd553c 100644
--- a/arch/arm/boot/dts/imx53.dtsi
+++ b/arch/arm/boot/dts/imx53.dtsi
@@ -672,6 +672,11 @@
 				status = "disabled";
 			};
 
+			tigerp: tigerp@63fa0000 {
+				compatible = "fsl,imx53-tigerp", "fsl,imx51-tigerp";
+				reg = <0x63fa0000 0x28>;
+			};
+
 			owire: owire@63fa4000 {
 				compatible = "fsl,imx53-owire", "fsl,imx21-owire";
 				reg = <0x63fa4000 0x4000>;
-- 
2.7.4
