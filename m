From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 1/9] dt-bindings: add binding for Rockchip hdmi phy using an Innosilicon IP
Date: Mon,  5 Feb 2018 15:34:27 +0100
Message-ID: <20180205143435.4723-2-heiko@sntech.de>
References: <20180205143435.4723-1-heiko@sntech.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180205143435.4723-1-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: hjc-TNX95d0MmH7DzftRWevZcw@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, zhengyang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Jose.Abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, algea.cao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Zheng Yang <zhengyang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

The phy is used so far in two Rockchip socs the rk3228 and the rk3328.

Signed-off-by: Zheng Yang <zhengyang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
 .../bindings/phy/phy-rockchip-inno-hdmi.txt        | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-rockchip-inno-hdmi.txt

diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-inno-hdmi.txt b/Documentation/devicetree/bindings/phy/phy-rockchip-inno-hdmi.txt
new file mode 100644
index 000000000000..7d36fd8d5d94
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-inno-hdmi.txt
@@ -0,0 +1,42 @@
+ROCKCHIP HDMI PHY WITH INNO IP BLOCK
+
+Required properties:
+ - compatible : should be one of the listed compatibles:
+	* "rockchip,rk3228-hdmi-phy",
+	* "rockchip,rk3328-hdmi-phy";
+ - reg : Address and length of the hdmi phy control register set
+ - clocks : phandle + clock specifier for the phy clocks
+ - clock-names : string, clock name, must contain "sysclk" for system
+	  control and register configuration and "refclk" for reference
+	  crystal oscillator clock input to PLL
+ - #clock-cells: should be 0.
+ - clock-output-names : shall be the name for the output clock.
+ - interrupts : phandle + interrupt specified for the hdmiphy interrupt
+ - #phy-cells : must be 0. See ./phy-bindings.txt for details.
+
+Optional properties for rk3328-hdmi-phy:
+ - nvmem-cells = phandle + nvmem specifier for the cpu-version efuse
+ - nvmem-cell-names : "cpu-version" to read the chip version, required
+	  for adjustment to some frequency settings
+
+Example:
+	hdmi_phy: hdmi-phy@12030000 {
+		compatible = "rockchip,rk3228-hdmi-phy";
+		reg = <0x12030000 0x10000>;
+		#phy-cells = <0>;
+		clocks = <&cru PCLK_HDMI_PHY>, <&xin24m>;
+		clock-names = "sysclk", "refclk";
+		#clock-cells = <0>;
+		clock-output-names = "hdmi_phy";
+		status = "disabled";
+	};
+
+Then the PHY can be used in other nodes such as:
+
+	hdmi: hdmi@200a0000 {
+		compatible = "rockchip,rk3228-dw-hdmi";
+		...
+		phys = <&hdmi_phy>;
+		phy-names = "hdmi";
+		...
+	};
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
