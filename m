From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH 5/6] dt-bindings: display: armada: Add mmp2 compatible strings
Date: Sun, 20 Jan 2019 18:25:33 +0100
Message-ID: <20190120172534.24617-6-lkundrak@v3.sk>
References: <20190120172534.24617-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190120172534.24617-1-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
List-Id: devicetree@vger.kernel.org

The driver will work on a MMP2 as well.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 .../bindings/display/armada/marvell-armada-drm.txt   | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/armada/marvell-arm=
ada-drm.txt b/Documentation/devicetree/bindings/display/armada/marvell-ar=
mada-drm.txt
index 3dbfa8047f0b..53524077db25 100644
--- a/Documentation/devicetree/bindings/display/armada/marvell-armada-drm=
.txt
+++ b/Documentation/devicetree/bindings/display/armada/marvell-armada-drm=
.txt
@@ -6,8 +6,9 @@ nodes that comprise the graphics subsystem.
=20
 Required properties:
=20
- - compatible: value should be "marvell,dove-display-subsystem",
-   "marvell,armada-display-subsystem"
+ - compatible: value should be one of:
+	- "marvell,dove-display-subsystem", "marvell,armada-display-subsystem"
+	- "marvell,mmp2-display-subsystem", "marvell,armada-display-subsystem"
  - ports: a list of phandles pointing to display interface ports of CRTC
    devices
  - memory-region: phandle to a node describing memory to be used for the
@@ -27,7 +28,7 @@ Marvell Armada LCD controller
=20
 Required properties:
=20
- - compatible: value should be "marvell,dove-lcd".
+ - compatible: value should be "marvell,dove-lcd" or "marvell,mmp2-lcd"
  - reg: base address and size of the LCD controller
  - interrupts: single interrupt number for the LCD controller
=20
@@ -72,8 +73,9 @@ Memory set aside for allocation of Marvell Armada frame=
buffer objects.
=20
 Required properties:
=20
- - compatible: value should be "marvell,dove-framebuffer",
-   "marvell,armada-framebuffer".
+ - compatible: value should be one of:
+	- "marvell,dove-framebuffer", "marvell,armada-framebuffer"
+	- "marvell,mmp2-framebuffer", "marvell,armada-framebuffer"
=20
 This binding is compatible with the binding, specified in
 Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt..
--=20
2.20.1
