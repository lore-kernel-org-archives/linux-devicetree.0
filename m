From: Peter Rosin <peda@axentia.se>
Subject: [PATCH v3 1/5] dt-bindings: display: bridge: fork out ti,ds90c185
 from lvds-transmitter
Date: Sat, 29 Dec 2018 07:07:19 +0000
Message-ID: <20181229070649.21308-2-peda@axentia.se>
References: <20181229070649.21308-1-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181229070649.21308-1-peda@axentia.se>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Peter Rosin <peda@axentia.se>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Archit Taneja <architt@codeaurora.org>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

DS90C185 has a shutdown pin which does not fit in the lvds-transmitter
binding, which is meant to be generic.

The sister chip DS90C187 is similar to DS90C185, describe it here as well.

Signed-off-by: Peter Rosin <peda@axentia.se>
---
 .../bindings/display/bridge/lvds-transmitter.txt   |  8 +---
 .../bindings/display/bridge/ti,ds90c185.txt        | 55 ++++++++++++++++++=
++++
 2 files changed, 56 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,ds9=
0c185.txt

diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-transmit=
ter.txt b/Documentation/devicetree/bindings/display/bridge/lvds-transmitter=
.txt
index 50220190c203..fd39ad34c383 100644
--- a/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
+++ b/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
@@ -22,13 +22,7 @@ among others.
=20
 Required properties:
=20
-- compatible: Must be one or more of the following
-  - "ti,ds90c185" for the TI DS90C185 FPD-Link Serializer
-  - "lvds-encoder" for a generic LVDS encoder device
-
-  When compatible with the generic version, nodes must list the
-  device-specific version corresponding to the device first
-  followed by the generic version.
+- compatible: Must be "lvds-encoder"
=20
 Required nodes:
=20
diff --git a/Documentation/devicetree/bindings/display/bridge/ti,ds90c185.t=
xt b/Documentation/devicetree/bindings/display/bridge/ti,ds90c185.txt
new file mode 100644
index 000000000000..e575f996959a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/ti,ds90c185.txt
@@ -0,0 +1,55 @@
+Texas Instruments FPD-Link (LVDS) Serializer
+--------------------------------------------
+
+The DS90C185 and DS90C187 are low-power serializers for portable
+battery-powered applications that reduces the size of the RGB
+interface between the host GPU and the display.
+
+Required properties:
+
+- compatible: Should be
+  "ti,ds90c185", "lvds-encoder"  for the TI DS90C185 FPD-Link Serializer
+  "ti,ds90c187", "lvds-encoder"  for the TI DS90C187 FPD-Link Serializer
+
+Optional properties:
+
+- powerdown-gpios: Power down control GPIO (the PDB pin, active-low)
+
+Required nodes:
+
+The devices have two video ports. Their connections are modeled using the =
OF
+graph bindings specified in Documentation/devicetree/bindings/graph.txt.
+
+- Video port 0 for parallel input
+- Video port 1 for LVDS output
+
+
+Example
+-------
+
+lvds-encoder {
+	compatible =3D "ti,ds90c185", "lvds-encoder";
+
+	powerdown-gpios =3D <&gpio 17 GPIO_ACTIVE_LOW>;
+
+	ports {
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+
+		port@0 {
+			reg =3D <0>;
+
+			lvds_enc_in: endpoint {
+				remote-endpoint =3D <&lcdc_out_rgb>;
+			};
+		};
+
+		port@1 {
+			reg =3D <1>;
+
+			lvds_enc_out: endpoint {
+				remote-endpoint =3D <&lvds_panel_in>;
+			};
+		};
+	};
+};
--=20
2.11.0
