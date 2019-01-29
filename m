From: Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH 08/13] ARM: dts: lpc32xx: phy3250: setup LCD controller to
 panel interface
Date: Tue, 29 Jan 2019 21:20:44 +0200
Message-ID: <20190129192049.11223-9-vz@mleia.com>
References: <20190129192049.11223-1-vz@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190129192049.11223-1-vz@mleia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sylvain Lemieux <slemieux.tyco@gmail.com>, Russell King <linux@armlinux.org.uk>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The change adds description of Sharp LQ035Q7DB03 3.5" 320x240 TFT panel,
which is connected to Phytec phyCORE-LPC3250 board, ARM PrimeCell PL111
LCD controller on NXP LPC3250 SoC gets its configuration appropriately
to support graphics output to the panel.

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 arch/arm/boot/dts/lpc3250-phy3250.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/lpc3250-phy3250.dts b/arch/arm/boot/dts/lpc3250-phy3250.dts
index d2dad2b541ff..aff72f14ad83 100644
--- a/arch/arm/boot/dts/lpc3250-phy3250.dts
+++ b/arch/arm/boot/dts/lpc3250-phy3250.dts
@@ -39,6 +39,17 @@
 		};
 	};
 
+	panel: panel {
+		compatible = "sharp,lq035q7db03";
+		power-supply = <&reg_lcd>;
+
+		port {
+			panel_input: endpoint {
+				remote-endpoint = <&cldc_output>;
+			};
+		};
+	};
+
 	reg_backlight: regulator-backlight {
 		compatible = "regulator-fixed";
 		regulator-name = "backlight";
@@ -71,7 +82,15 @@
 };
 
 &clcd {
+	max-memory-bandwidth = <18710000>;
 	status = "okay";
+
+	port {
+		cldc_output: endpoint {
+			remote-endpoint = <&panel_input>;
+			arm,pl11x,tft-r0g0b0-pads = <0 8 16>;
+		};
+	};
 };
 
 &i2c1 {
-- 
2.20.1
