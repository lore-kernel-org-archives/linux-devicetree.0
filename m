From: Meng Dongyang <daniel.meng-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [RESEND PATCH 1/2] Documentation: bindings: add DT documentation for
 u2phy and u2phy grf
Date: Wed,  1 Mar 2017 18:34:22 +0800
Message-ID: <1488364463-27075-2-git-send-email-daniel.meng@rock-chips.com>
References: <1488364463-27075-1-git-send-email-daniel.meng@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1488364463-27075-1-git-send-email-daniel.meng-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, daniel.meng-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Due to the u2phy registers are separated from general grf, we need to
add u2phy grf node and place u2phy node in it. And on some platform,
the 480m clock may need to assign clock parent in dts in stead of
clock driver. So this patch add u2phy grf node and property of
assigned-clocks and assigned-clock-parents to assign parent for 480m
clock.

Signed-off-by: Meng Dongyang <daniel.meng-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---
 .../bindings/phy/phy-rockchip-inno-usb2.txt        | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt b/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt
index 3c29c77..dda9f22 100644
--- a/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt
@@ -2,6 +2,7 @@ ROCKCHIP USB2.0 PHY WITH INNO IP BLOCK
 
 Required properties (phy (parent) node):
  - compatible : should be one of the listed compatibles:
+	* "rockchip,rk3328-usb2phy"
 	* "rockchip,rk3366-usb2phy"
 	* "rockchip,rk3399-usb2phy"
  - reg : the address offset of grf for usb-phy configuration.
@@ -11,6 +12,11 @@ Required properties (phy (parent) node):
 Optional properties:
  - clocks : phandle + phy specifier pair, for the input clock of phy.
  - clock-names : input clock name of phy, must be "phyclk".
+ - assigned-clocks : phandle of usb 480m clock.
+ - assigned-clock-parents : parent of usb 480m clock, select between
+		 usb-phy output 480m and xin24m.
+		 Refer to clk/clock-bindings.txt for generic clock
+		 consumer properties.
 
 Required nodes : a sub-node is required for each port the phy provides.
 		 The sub-node name is used to identify host or otg port,
@@ -62,3 +68,44 @@ grf: syscon@ff770000 {
 		};
 	};
 };
+
+Required properties (usb2phy grf node):
+ - compatible : should be one of the listed compatibles:
+		"rockchip,rk3328-usb2phy-grf", "syscon", "simple-mfd";
+ - reg : the address offset of grf for usb-phy configuration.
+ - #address-cells : should be 1.
+ - #size-cells : should be 1.
+
+Required nodes : a sub-node is required for the phy provides.
+		 The sub-node name is used to identify each phy,
+		 and shall be the following entries:
+
+Example:
+
+usb2phy_grf: syscon@ff450000 {
+	compatible = "rockchip,rk3328-usb2phy-grf", "syscon",
+		     "simple-mfd";
+	reg = <0x0 0xff450000 0x0 0x10000>;
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	u2phy: usb2-phy@100 {
+		compatible = "rockchip,rk3328-usb2phy";
+		reg = <0x100 0x10>;
+		clocks = <&xin24m>;
+		clock-names = "phyclk";
+		#clock-cells = <0>;
+		assigned-clocks = <&cru USB480M>;
+		assigned-clock-parents = <&u2phy>;
+		clock-output-names = "usb480m_phy";
+		status = "disabled";
+
+		u2phy_host: host-port {
+			#phy-cells = <0>;
+			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "linestate";
+			status = "disabled";
+		};
+	};
+};
+
-- 
1.9.1
