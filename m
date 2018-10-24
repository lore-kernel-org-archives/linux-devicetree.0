From: Eric Anholt <eric@anholt.net>
Subject: [PATCH 1/3] dt-bindings: new binding for Himax HX8357D display panels
Date: Wed, 24 Oct 2018 11:43:11 -0700
Message-ID: <20181024184313.2967-2-eric@anholt.net>
References: <20181024184313.2967-1-eric@anholt.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181024184313.2967-1-eric@anholt.net>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org, =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>, Eric Anholt <eric@anholt.net>
List-Id: devicetree@vger.kernel.org

This adds a new binding for Himax HX8357D display panels. It includes
a compatible string for one display (more can be added in the future).

The YX350HV15 panel[1] is found in the Adafruit PiTFT 3.5" Touch
Screen for Raspberry Pi.

[1] https://learn.adafruit.com/adafruit-pitft-3-dot-5-touch-screen-for-raspberry-pi/downloads

This binding is closely modeled after the ili9341 binding, for a
similar product from adafruit.  The primary difference is that the
hx8367d doesn't have a reset line that I can find in the schematics.

Signed-off-by: Eric Anholt <eric@anholt.net>
---
 .../bindings/display/himax,hx8357d.txt        | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/himax,hx8357d.txt

diff --git a/Documentation/devicetree/bindings/display/himax,hx8357d.txt b/Documentation/devicetree/bindings/display/himax,hx8357d.txt
new file mode 100644
index 000000000000..48586e570be0
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/himax,hx8357d.txt
@@ -0,0 +1,25 @@
+Himax HX8357D display panels
+
+This binding is for display panels using a Himax HX8357D controller in SPI
+mode, such as the Adafruit 3.5" TFT for Raspberry Pi.
+
+Required properties:
+- compatible:	"adafruit,yx350hv15", "himax,hx8357d"
+- dc-gpios:	D/C pin
+
+The node for this driver must be a child node of a SPI controller, hence
+all mandatory properties described in ../spi/spi-bus.txt must be specified.
+
+Optional properties:
+- rotation:	panel rotation in degrees counter clockwise (0,90,180,270)
+- backlight:	phandle of the backlight device attached to the panel
+
+Example:
+	display@0{
+		compatible = "adafruit,yx350hv15", "himax,hx8357d";
+		reg = <0>;
+		spi-max-frequency = <32000000>;
+		dc-gpios = <&gpio0 25 GPIO_ACTIVE_HIGH>;
+		rotation = <90>;
+		backlight = <&backlight>;
+	};
-- 
2.19.1
