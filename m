From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH v2 2/7] dt-bindings: add binding for the
 Allwinner A64 DE2 bus
Date: Fri, 22 Jun 2018 20:45:35 +0800
Message-ID: <20180622124540.56203-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBWO7WPMQKGQEOED7FFY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

All the sub-blocks of Allwinner A64 DE2 needs the SRAM C on A64 SoC to
be claimed, otherwise the whole DE2 space is inaccessible.

Add a device tree binding of the DE2 part as a sub-bus.

Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
---
No changes since v1.

 .../bindings/bus/sun50i-de2-bus.txt           | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/sun50i-de2-bus.txt

diff --git a/Documentation/devicetree/bindings/bus/sun50i-de2-bus.txt b/Documentation/devicetree/bindings/bus/sun50i-de2-bus.txt
new file mode 100644
index 000000000000..87dfb33fb3be
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/sun50i-de2-bus.txt
@@ -0,0 +1,37 @@
+Device tree bindings for Allwinner A64 DE2 bus
+
+The Allwinner A64 DE2 is on a special bus, which needs a SRAM region (SRAM C)
+to be claimed for enabling the access.
+
+Required properties:
+
+ - compatible:		Should contain "allwinner,sun50i-a64-de2"
+ - reg:			A resource specifier for the register space
+ - #address-cells:	Must be set to 1
+ - #size-cells:		Must be set to 1
+ - ranges:		Must be set up to map the address space inside the
+			DE2, for the sub-blocks of DE2.
+ - allwinner,sram:	the SRAM that needs to be claimed
+
+Example:
+
+	de2@1000000 {
+		compatible = "allwinner,sun50i-a64-de2";
+		reg = <0x1000000 0x400000>;
+		allwinner,sram = <&de2_sram 1>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0x1000000 0x400000>;
+
+		display_clocks: clock@0 {
+			compatible = "allwinner,sun50i-a64-de2-clk";
+			reg = <0x0 0x100000>;
+			clocks = <&ccu CLK_DE>,
+				 <&ccu CLK_BUS_DE>;
+			clock-names = "mod",
+				      "bus";
+			resets = <&ccu RST_BUS_DE>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+	};
-- 
2.17.1
