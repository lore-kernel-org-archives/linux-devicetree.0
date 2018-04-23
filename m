From: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 2/5] ARM: dts: imx6dl-aristainetos2_4: Remove
 #address/#size-cells from display0
Date: Mon, 23 Apr 2018 16:50:30 -0300
Message-ID: <1524513033-21136-2-git-send-email-festevam@gmail.com>
References: <1524513033-21136-1-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1524513033-21136-1-git-send-email-festevam@gmail.com>
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
DTC warning:

arch/arm/boot/dts/imx6dl-aristainetos2_4.dtb: Warning (avoid_unnecessary_addr_size): /soc/aips-bus@2000000/spba-bus@2000000/ecspi@2008000/display@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 arch/arm/boot/dts/imx6dl-aristainetos2_4.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/imx6dl-aristainetos2_4.dts b/arch/arm/boot/dts/imx6dl-aristainetos2_4.dts
index 7128c76..29940ba 100644
--- a/arch/arm/boot/dts/imx6dl-aristainetos2_4.dts
+++ b/arch/arm/boot/dts/imx6dl-aristainetos2_4.dts
@@ -78,8 +78,6 @@
 
 &ecspi1 {
 	lcd_panel: display@0 {
-		#address-cells = <1>;
-		#size-cells = <1>;
 		compatible = "lg,lg4573";
 		spi-max-frequency = <10000000>;
 		reg = <0>;
-- 
2.7.4
