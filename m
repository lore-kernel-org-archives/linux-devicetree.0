From: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 2/2] ARM: dts: iimx51-eukrea-mbimxsd51-baseboard: Fix USB PHY
 duplicate unit-address
Date: Mon, 14 May 2018 15:29:36 -0300
Message-ID: <1526322576-5838-2-git-send-email-festevam@gmail.com>
References: <1526322576-5838-1-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1526322576-5838-1-git-send-email-festevam@gmail.com>
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

Currently the following DTC warning is seen with W=1:

arch/arm/boot/dts/imx51-eukrea-mbimxsd51-baseboard.dtb: Warning (unique_unit_address): /usbphy/usbphy@0: duplicate unit-address (also used in node /usbphy/usbh1phy@0)

Fix it by moving the USB PHY node outside of simple-bus and drop the
unneeded unit-address.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 .../arm/boot/dts/imx51-eukrea-mbimxsd51-baseboard.dts | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/imx51-eukrea-mbimxsd51-baseboard.dts b/arch/arm/boot/dts/imx51-eukrea-mbimxsd51-baseboard.dts
index b3d952f..29b0b7b 100644
--- a/arch/arm/boot/dts/imx51-eukrea-mbimxsd51-baseboard.dts
+++ b/arch/arm/boot/dts/imx51-eukrea-mbimxsd51-baseboard.dts
@@ -83,19 +83,12 @@
 		fsl,mux-ext-port = <3>;
 	};
 
-	usbphy {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		compatible = "simple-bus";
-
-		usbh1phy: usbh1phy@0 {
-			compatible = "usb-nop-xceiv";
-			reg = <0>;
-			clocks = <&clks IMX5_CLK_USB_PHY_GATE>;
-			clock-names = "main_clk";
-			clock-frequency = <19200000>;
-			#phy-cells = <0>;
-		};
+	usbh1phy: usbphy {
+		compatible = "usb-nop-xceiv";
+		clocks = <&clks IMX5_CLK_USB_PHY_GATE>;
+		clock-names = "main_clk";
+		clock-frequency = <19200000>;
+		#phy-cells = <0>;
 	};
 };
 
-- 
2.7.4
