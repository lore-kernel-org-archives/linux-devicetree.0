From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Subject: [PATCH v5 1/2] dt-bindings: panel: Add Sitronix ST7701
 panel documentation
Date: Tue, 11 Dec 2018 21:13:57 +0530
Message-ID: <20181211154358.25293-1-jagan@amarulasolutions.com>
Reply-To: jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD7MFH7A7EEBBTFWX7QAKGQEOXGRMDY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amarula-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Techstar TS8550B MIPI DSI panel is 480x854, 2-lane MIPI DSI LCD panel
with inbuilt ST7701 chip.

The default regulator names in ST7701 chip is renamed in Techstar TS8550B
so, add specific binding names for them.

Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
---
Changes for v5:
- found the chip from vendor, so added new chip binding
- here is v4: https://patchwork.kernel.org/patch/10680333/

 .../display/panel/sitronix,st7701.txt         | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/sitronix,st7701.txt

diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7701.txt b/Documentation/devicetree/bindings/display/panel/sitronix,st7701.txt
new file mode 100644
index 000000000000..ccd17597f1f6
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7701.txt
@@ -0,0 +1,30 @@
+Sitronix ST7701 based LCD panels
+
+ST7701 designed for small and medium sizes of TFT LCD display, is
+capable of supporting up to 480RGBX864 in resolution. It provides
+several system interfaces like MIPI/RGB/SPI.
+
+Techstar TS8550B is 480x854, 2-lane MIPI DSI LCD panel which has
+inbuilt ST7701 chip.
+
+Required properties:
+- compatible: must be "sitronix,st7701" and one of
+  * "techstar,ts8550b"
+- reset-gpios: a GPIO phandle for the reset pin
+
+Required properties for techstar,ts8550b:
+- reg: DSI virtual channel used by that screen
+- VCC-supply: analog regulator for MIPI circuit
+- IOVCC-supply: I/O system regulator
+
+Optional properties:
+- backlight: phandle for the backlight control.
+
+panel@0 {
+	compatible = "techstar,ts8550b", "sitronix,st7701";
+	reg = <0>;
+	VCC-supply = <&reg_dldo2>;
+	IOVCC-supply = <&reg_dldo2>;
+	reset-gpios = <&pio 3 24 GPIO_ACTIVE_HIGH>; /* LCD-RST: PD24 */
+	backlight = <&backlight>;
+};
-- 
2.18.0.321.gffc6fa0e3
