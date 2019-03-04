From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v2 1/5] dt-bindings: reserved-memory: Add binding for Armada framebuffer
Date: Mon,  4 Mar 2019 21:20:02 +0100
Message-ID: <20190304202006.3863-2-lkundrak@v3.sk>
References: <20190304202006.3863-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190304202006.3863-1-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King <linux@armlinux.org.uk>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
List-Id: devicetree@vger.kernel.org

This is the binding for memory that is set aside for allocation of Marvel=
l
Armada framebuffer objects.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>

---
Changes since v1:
- Moved from bindings/display/armada/
- Removed the marvell,dove-framebuffer string
- Added to the MAINTAINERS entry

 .../marvell,armada-framebuffer.txt            | 22 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/mar=
vell,armada-framebuffer.txt

diff --git a/Documentation/devicetree/bindings/reserved-memory/marvell,ar=
mada-framebuffer.txt b/Documentation/devicetree/bindings/reserved-memory/=
marvell,armada-framebuffer.txt
new file mode 100644
index 000000000000..ab243e2bad45
--- /dev/null
+++ b/Documentation/devicetree/bindings/reserved-memory/marvell,armada-fr=
amebuffer.txt
@@ -0,0 +1,22 @@
+Marvell Armada framebuffer reserved memory
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Memory set aside for allocation of Marvell Armada framebuffer objects.
+
+Required properties:
+
+ - compatible: must be "marvell,armada-framebuffer"
+
+Please refer to Documentation/devicetree/bindings/reserved-memory/reserv=
ed-memory.txt
+for common reserved memory binding usage.
+
+Example:
+
+	reserved-memory {
+		display_reserved: framebuffer {
+			compatible =3D "marvell,armada-framebuffer";
+			size =3D <0x02000000>;
+			alignment =3D <0x02000000>;
+			no-map;
+		};
+	};
diff --git a/MAINTAINERS b/MAINTAINERS
index f3a5c97e3419..e71aa05fef29 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8967,6 +8967,7 @@ T:	git git://git.armlinux.org.uk/~rmk/linux-arm.git=
 drm-armada-fixes
 F:	drivers/gpu/drm/armada/
 F:	include/uapi/drm/armada_drm.h
 F:	Documentation/devicetree/bindings/display/armada/
+F:	Documentation/devicetree/bindings/reserved-memory/marvell,armada-fram=
ebuffer.txt
=20
 MARVELL CRYPTO DRIVER
 M:	Boris Brezillon <boris.brezillon@bootlin.com>
--=20
2.20.1
