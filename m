From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
Subject: [PATCH v5 2/3] dt-bindings: Add Rocktech jh057n00900 panel bindings
Date: Mon,  1 Apr 2019 12:35:34 +0200
Message-ID: <ec59b22907ac28764ffb3bec33445b6e019945a4.1554114302.git.agx@sigxcpu.org>
References: <cover.1554114302.git.agx@sigxcpu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1554114302.git.agx@sigxcpu.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@baylibre.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Johan Hovold <johan@kernel.org>, "David S. Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
List-Id: devicetree@vger.kernel.org

The Rocktec jh057n00900 is a 5.5" MIPI DSI video mode panel with a
720x1440 resolution and a built in backlight.

Signed-off-by: Guido Günther <agx@sigxcpu.org>
---
 .../display/panel/rocktech,jh057n00900.txt     | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.txt

diff --git a/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.txt b/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.txt
new file mode 100644
index 000000000000..1b5763200cf6
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/rocktech,jh057n00900.txt
@@ -0,0 +1,18 @@
+Rocktech jh057n00900 5.5" 720x1440 TFT LCD panel
+
+Required properties:
+- compatible: should be "rocktech,jh057n00900"
+- reg: DSI virtual channel of the peripheral
+- reset-gpios: panel reset gpio
+- backlight: phandle of the backlight device attached to the panel
+
+Example:
+
+	&mipi_dsi {
+		panel@0 {
+			compatible = "rocktech,jh057n00900";
+			reg = <0>;
+			backlight = <&backlight>;
+			reset-gpios = <&gpio3 13 GPIO_ACTIVE_LOW>;
+		};
+	};
-- 
2.20.1
