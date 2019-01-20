From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH 4/6] dt-bindings: display: armada: Add display subsystem binding
Date: Sun, 20 Jan 2019 18:25:32 +0100
Message-ID: <20190120172534.24617-5-lkundrak@v3.sk>
References: <20190120172534.24617-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190120172534.24617-1-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
List-Id: devicetree@vger.kernel.org

The Marvell Armada DRM master device is a virtual device needed to list a=
ll
nodes that comprise the graphics subsystem.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 .../display/armada/marvell-armada-drm.txt     | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/armada/marvell-arm=
ada-drm.txt b/Documentation/devicetree/bindings/display/armada/marvell-ar=
mada-drm.txt
index de4cca9432c8..3dbfa8047f0b 100644
--- a/Documentation/devicetree/bindings/display/armada/marvell-armada-drm=
.txt
+++ b/Documentation/devicetree/bindings/display/armada/marvell-armada-drm=
.txt
@@ -1,3 +1,27 @@
+Marvell Armada DRM master device
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
+
+The Marvell Armada DRM master device is a virtual device needed to list =
all
+nodes that comprise the graphics subsystem.
+
+Required properties:
+
+ - compatible: value should be "marvell,dove-display-subsystem",
+   "marvell,armada-display-subsystem"
+ - ports: a list of phandles pointing to display interface ports of CRTC
+   devices
+ - memory-region: phandle to a node describing memory to be used for the
+   framebuffer
+
+Example:
+
+	display-subsystem {
+		compatible =3D "marvell,dove-display-subsystem",
+		             "marvell,armada-display-subsystem";
+		memory-region =3D <&display_reserved>;
+		ports =3D <&lcd0_port>;
+	};
+
 Marvell Armada LCD controller
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
=20
--=20
2.20.1
