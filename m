From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v4 5/5] dt-bindings: display: armada: Document bus-width property
Date: Wed, 28 Aug 2019 09:59:38 +0200
Message-ID: <20190828075938.318028-6-lkundrak@v3.sk>
References: <20190828075938.318028-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190828075938.318028-1-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King <linux@armlinux.org.uk>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

This makes it possible to choose a different pixel format for the
endpoint. Modelled after what other LCD controllers use, including
marvell,pxa2xx-lcdc and atmel,hlcdc-display-controller and perhaps more.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
Reviewed-by: Rob Herring <robh@kernel.org>

---
Changes since v2:
- Collected the Reviewed-by tag

 .../devicetree/bindings/display/marvell,armada-lcdc.txt     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/marvell,armada-lcd=
c.txt b/Documentation/devicetree/bindings/display/marvell,armada-lcdc.txt
index 0ea4cbe5a32ee..d1dadaaeee734 100644
--- a/Documentation/devicetree/bindings/display/marvell,armada-lcdc.txt
+++ b/Documentation/devicetree/bindings/display/marvell,armada-lcdc.txt
@@ -25,6 +25,11 @@ Required child nodes:
=20
 - port: video output port with endpoints, as described by
   Documentation/devicetree/bindings/graph.txt
+  The endpoints can optionally specify the following property:
+
+  - bus-width: recognized values are <12>, <16>, <18> and <24>, that
+    select "rgb444", "rgb565", "rgb666" or "rgb888" pixel format
+    respectively. Defaults to <24> if unspecified.
=20
 Example:
=20
@@ -37,6 +42,7 @@ Example:
=20
 		lcd0_port: port {
 			lcd0_rgb_out: endpoint {
+				bus-width =3D <24>;
 				remote-endpoint =3D <&encoder_rgb_in>;
 			};
 		};
--=20
2.21.0
