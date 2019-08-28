From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v4 3/5] dt-bindings: display: armada: Improve the LCDC documentation
Date: Wed, 28 Aug 2019 09:59:36 +0200
Message-ID: <20190828075938.318028-4-lkundrak@v3.sk>
References: <20190828075938.318028-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190828075938.318028-1-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King <linux@armlinux.org.uk>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

The port is a child, not a property. And should be accompanied by an
example. Plus a pair of cosmetic changes that don't seem to deserve a
separate commit.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
Reviewed-by: Rob Herring <robh@kernel.org>

---
Changes since v3:
- Actually collected the Reviewed-by tag

Changes since v2:
- Collected the Reviewed-by tag

Changes since v1:
- Minor adjustments to the commit message wording.

 .../bindings/display/marvell,armada-lcdc.txt     | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/marvell,armada-lcd=
c.txt b/Documentation/devicetree/bindings/display/marvell,armada-lcdc.txt
index 46525ea3e646e..2606a8efc9568 100644
--- a/Documentation/devicetree/bindings/display/marvell,armada-lcdc.txt
+++ b/Documentation/devicetree/bindings/display/marvell,armada-lcdc.txt
@@ -1,10 +1,11 @@
-Device Tree bindings for Armada DRM CRTC driver
+Marvell Armada LCD controller
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
=20
 Required properties:
+
  - compatible: value should be "marvell,dove-lcd".
  - reg: base address and size of the LCD controller
  - interrupts: single interrupt number for the LCD controller
- - port: video output port with endpoints, as described by graph.txt
=20
 Optional properties:
=20
@@ -19,6 +20,11 @@ Note: all clocks are optional but at least one must be=
 specified.
 Further clocks may be added in the future according to requirements of
 different SoCs.
=20
+Required child nodes:
+
+- port: video output port with endpoints, as described by
+  Documentation/devicetree/bindings/graph.txt
+
 Example:
=20
 	lcd0: lcd-controller@820000 {
@@ -27,4 +33,10 @@ Example:
 		interrupts =3D <47>;
 		clocks =3D <&si5351 0>;
 		clock-names =3D "ext_ref_clk_1";
+
+		lcd0_port: port {
+			lcd0_rgb_out: endpoint {
+				remote-endpoint =3D <&encoder_rgb_in>;
+			};
+		};
 	};
--=20
2.21.0
