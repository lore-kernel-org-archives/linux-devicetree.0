From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: [PATCH v2 01/11] pinctrl: dt-bindings: add documentation for AP806
 pin controllers
Date: Fri,  2 Jun 2017 16:23:08 +0200
Message-ID: <2d89fbc10d07c890336eabbd362e55cb2e5055b5.1496413293.git-series.gregory.clement@free-electrons.com>
References: <cover.8fe5f7c62a787452878ca071fa00b953e96988ef.1496413293.git-series.gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.8fe5f7c62a787452878ca071fa00b953e96988ef.1496413293.git-series.gregory.clement@free-electrons.com>
In-Reply-To: <cover.8fe5f7c62a787452878ca071fa00b953e96988ef.1496413293.git-series.gregory.clement@free-electrons.com>
References: <cover.8fe5f7c62a787452878ca071fa00b953e96988ef.1496413293.git-series.gregory.clement@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org, Omri Itach <omrii@marvell.com>, Nadav Haklai <nadavh@marvell.com>, Kostya Porotchkin <kostap@marvell.com>, Russell King <rmk+kernel@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, Neta Zur Hershkovits <neta@marvell.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Shadi Ammouri <shadi@marvell.com>, Marcin Wojtas <mw@semihalf.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Document the device tree binding for the pin controllers found on the
Armada 7K and Armada 8K SoCs.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
---
 Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt | 53 ++++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 46 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt b/Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt
index 888c50e0d64f..4228d158fb31 100644
--- a/Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt
+++ b/Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt
@@ -28,14 +28,53 @@ Required properties:
  - compatible: must be: "marvell,ap806-clock"
  - #clock-cells: must be set to 1
 
+Pinctrl:
+--------
+
+For common binding part and usage, refer to
+Documentation/devicetree/bindings/pinctrl/marvell,mvebu-pinctrl.txt.
+
+Required properties:
+- compatible must be "marvell,ap806-pinctrl",
+
+Available mpp pins/groups and functions:
+Note: brackets (x) are not part of the mpp name for marvell,function and given
+only for more detailed description in this document.
+
+name	pins	functions
+================================================================================
+mpp0	0	gpio, sdio(clk), spi0(clk)
+mpp1	1	gpio, sdio(cmd), spi0(miso)
+mpp2	2	gpio, sdio(d0), spi0(mosi)
+mpp3	3	gpio, sdio(d1), spi0(cs0n)
+mpp4	4	gpio, sdio(d2), i2c0(sda)
+mpp5	5	gpio, sdio(d3), i2c0(sdk)
+mpp6	6	gpio, sdio(ds)
+mpp7	7	gpio, sdio(d4), uart1(rxd)
+mpp8	8	gpio, sdio(d5), uart1(txd)
+mpp9	9	gpio, sdio(d6), spi0(cs1n)
+mpp10	10	gpio, sdio(d7)
+mpp11	11	gpio, uart0(txd)
+mpp12	12	gpio, sdio(pw_off), sdio(hw_rst)
+mpp13	13	gpio
+mpp14	14	gpio
+mpp15	15	gpio
+mpp16	16	gpio
+mpp17	17	gpio
+mpp18	18	gpio
+mpp19	19	gpio, uart0(rxd), sdio(pw_off)
+
 Example:
+ap_syscon: system-controller@6f4000 {
+	compatible = "syscon", "simple-mfd";
+	reg = <0x6f4000 0x1000>;
 
-	syscon: system-controller@6f4000 {
-		compatible = "syscon", "simple-mfd";
-		reg = <0x6f4000 0x1000>;
+	ap_clk: clock {
+		compatible = "marvell,ap806-clock";
+		#clock-cells = <1>;
+	};
 
-		ap_clk: clock {
-			compatible = "marvell,ap806-clock";
-			#clock-cells = <1>;
-		};
+	ap_pinctrl: pinctrl {
+		compatible = "marvell,ap806-pinctrl";
 	};
+};
-- 
git-series 0.9.1
