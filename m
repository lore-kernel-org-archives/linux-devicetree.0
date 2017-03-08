From: Sylvain Lemieux <slemieux.tyco@gmail.com>
Subject: [PATCH 1/2] [kernel] ARM: dts: lpc32xx: phy3250: add clcd
 configuration
Date: Wed,  8 Mar 2017 12:46:37 -0500
Message-ID: <20170308174638.25578-2-slemieux.tyco@gmail.com>
References: <20170308174638.25578-1-slemieux.tyco@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170308174638.25578-1-slemieux.tyco@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: vz@mleia.com, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Liam Beguin <lbeguin@tycoint.com>

Updating CLCD board and panel definiton to use
up-to-date devicetree hardware description.

Signed-off-by: Liam Beguin <lbeguin@tycoint.com>
Signed-off-by: Sylvain Lemieux <slemieux@tycoint.com>
---
 arch/arm/boot/dts/lpc3250-phy3250.dts | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm/boot/dts/lpc3250-phy3250.dts b/arch/arm/boot/dts/lpc3250-phy3250.dts
index fd95e2b10357..1e5dbbad6cc4 100644
--- a/arch/arm/boot/dts/lpc3250-phy3250.dts
+++ b/arch/arm/boot/dts/lpc3250-phy3250.dts
@@ -72,7 +72,42 @@
 };
 
 &clcd {
+	interrupt-names = "combined";
+	max-memory-bandwidth = <11700000>; /* Bps, 240x320@60 16bpp */
 	status = "okay";
+
+	port {
+		clcd_pads: endpoint {
+			remote-endpoint = <&clcd_panel>;
+			arm,pl11x,tft-r0g0b0-pads = <3 10 19>; /* Set LCD to BGR 565 */
+		};
+	};
+
+	panel {
+		compatible = "panel-dpi";
+
+		port {
+			clcd_panel: endpoint {
+				remote-endpoint = <&clcd_pads>;
+			};
+		};
+
+		panel-timing {
+			clock-frequency = <5850000>;
+
+			hactive = <240>;
+			hback-porch = <11>;
+			hfront-porch = <22>;
+			hsync-len = <5>;
+
+			vactive = <320>;
+			vback-porch = <2>;
+			vfront-porch = <1>;
+			vsync-len = <2>;
+
+			pixelclk-active = <1>;
+		};
+	};
 };
 
 &i2c1 {
-- 
2.11.0
