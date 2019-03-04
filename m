From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v2 5/5] dt-bindings: display: armada: Document bus-width property
Date: Mon,  4 Mar 2019 21:20:06 +0100
Message-ID: <20190304202006.3863-6-lkundrak@v3.sk>
References: <20190304202006.3863-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190304202006.3863-1-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King <linux@armlinux.org.uk>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
List-Id: devicetree@vger.kernel.org

This makes it possible to choose a different pixel format for the
endpoint. Modelled after what other LCD controllers use, including
marvell,pxa2xx-lcdc and atmel,hlcdc-display-controller and perhaps more.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 .../devicetree/bindings/display/marvell,armada-lcdc.txt     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/marvell,armada-lcd=
c.txt b/Documentation/devicetree/bindings/display/marvell,armada-lcdc.txt
index 4ef66bc2845c..181548d5be93 100644
--- a/Documentation/devicetree/bindings/display/marvell,armada-lcdc.txt
+++ b/Documentation/devicetree/bindings/display/marvell,armada-lcdc.txt
@@ -26,6 +26,11 @@ Required child nodes:
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
@@ -38,6 +43,7 @@ Example:
=20
 		lcd0_port: port {
 			lcd0_rgb_out: endpoint {
+				bus-width =3D <24>;
 				remote-endpoint =3D <&encoder_rgb_in>;
 			};
 		};
--=20
2.20.1
