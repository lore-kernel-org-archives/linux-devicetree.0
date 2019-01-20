From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH 3/6] dt-bindings: display: armada: Add framebuffer reserved-mem binding
Date: Sun, 20 Jan 2019 18:25:31 +0100
Message-ID: <20190120172534.24617-4-lkundrak@v3.sk>
References: <20190120172534.24617-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190120172534.24617-1-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
List-Id: devicetree@vger.kernel.org

This is the binding for memory that is set aside for allocation of Marvel=
l
Armada framebuffer objects.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 .../display/armada/marvell-armada-drm.txt     | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/armada/marvell-arm=
ada-drm.txt b/Documentation/devicetree/bindings/display/armada/marvell-ar=
mada-drm.txt
index 2606a8efc956..de4cca9432c8 100644
--- a/Documentation/devicetree/bindings/display/armada/marvell-armada-drm=
.txt
+++ b/Documentation/devicetree/bindings/display/armada/marvell-armada-drm=
.txt
@@ -40,3 +40,28 @@ Example:
 			};
 		};
 	};
+
+Marvell Armada framebuffer reserved memory
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Memory set aside for allocation of Marvell Armada framebuffer objects.
+
+Required properties:
+
+ - compatible: value should be "marvell,dove-framebuffer",
+   "marvell,armada-framebuffer".
+
+This binding is compatible with the binding, specified in
+Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt..
+
+Example:
+
+	reserved-memory {
+		display_reserved: framebuffer {
+			compatible =3D "marvell,dove-framebuffer",
+			             "marvell,armada-framebuffer";
+			size =3D <0x02000000>;
+			alignment =3D <0x02000000>;
+			no-map;
+		};
+	};
--=20
2.20.1
