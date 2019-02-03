From: Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH RESEND v2 04/12] dt-bindings: Add ANX6345 DP/eDP
 transmitter binding
Date: Sun,  3 Feb 2019 10:54:53 -0800
Message-ID: <20190203185501.8958-5-anarsoul@gmail.com>
References: <20190203185501.8958-1-anarsoul@gmail.com>
Reply-To: anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDV3B667TUHBBK7S3TRAKGQEHNHJECY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190203185501.8958-1-anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>

The ANX6345 is an ultra-low power DisplayPort/eDP transmitter designed
for portable devices.

Add a binding document for it.

Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Signed-off-by: Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 .../bindings/display/bridge/anx6345.txt       | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/anx6345.txt

diff --git a/Documentation/devicetree/bindings/display/bridge/anx6345.txt b/Documentation/devicetree/bindings/display/bridge/anx6345.txt
new file mode 100644
index 000000000000..e79a11348d11
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/anx6345.txt
@@ -0,0 +1,56 @@
+Analogix ANX6345 eDP Transmitter
+--------------------------------
+
+The ANX6345 is an ultra-low power Full-HD eDP transmitter designed for
+portable devices.
+
+Required properties:
+
+ - compatible		: "analogix,anx6345"
+ - reg			: I2C address of the device
+ - reset-gpios		: Which GPIO to use for reset
+
+Optional properties:
+
+ - dvdd12-supply	: Regulator for 1.2V digital core power.
+ - dvdd25-supply	: Regulator for 2.5V digital core power.
+ - Video ports for RGB input and eDP output using the DT bindings
+   defined in [1]
+
+[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
+
+Example:
+
+anx6345: anx6345@38 {
+	compatible = "analogix,anx6345";
+	reg = <0x38>;
+	reset-gpios = <&pio 3 24 GPIO_ACTIVE_HIGH>; /* PD24 */
+	dvdd25-supply = <&reg_dldo2>;
+	dvdd12-supply = <&reg_fldo1>;
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		anx6345_in: port@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+			anx6345_in_tcon0: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&tcon0_out_anx6345>;
+			};
+		};
+
+		anx6345_out: port@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			anx6345_out_panel: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&panel_in_edp>;
+			};
+		};
+	};
+};
-- 
2.20.1
