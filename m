From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v2 2/5] dt-bindings: display: armada: Rename the binding doc file
Date: Mon,  4 Mar 2019 21:20:03 +0100
Message-ID: <20190304202006.3863-3-lkundrak@v3.sk>
References: <20190304202006.3863-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190304202006.3863-1-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King <linux@armlinux.org.uk>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
List-Id: devicetree@vger.kernel.org

Use a more generic name, since it will document more compatible LCD
controllers than just that of Dove. Also, there's no point putting it in
a separate directory.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>

---
Changes since v1:
- Choose a better name than armada/marvell-armada-drm.txt, since
  there will be no display-subsystem master node and thus it will
  only document just the LCDC.

 .../{armada/marvell,dove-lcd.txt =3D> marvell,armada-lcdc.txt}    | 0
 MAINTAINERS                                                     | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/display/{armada/marvell,dove-lc=
d.txt =3D> marvell,armada-lcdc.txt} (100%)

diff --git a/Documentation/devicetree/bindings/display/armada/marvell,dov=
e-lcd.txt b/Documentation/devicetree/bindings/display/marvell,armada-lcdc=
.txt
similarity index 100%
rename from Documentation/devicetree/bindings/display/armada/marvell,dove=
-lcd.txt
rename to Documentation/devicetree/bindings/display/marvell,armada-lcdc.t=
xt
diff --git a/MAINTAINERS b/MAINTAINERS
index e71aa05fef29..890cbd6e0b7b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8966,7 +8966,7 @@ T:	git git://git.armlinux.org.uk/~rmk/linux-arm.git=
 drm-armada-devel
 T:	git git://git.armlinux.org.uk/~rmk/linux-arm.git drm-armada-fixes
 F:	drivers/gpu/drm/armada/
 F:	include/uapi/drm/armada_drm.h
-F:	Documentation/devicetree/bindings/display/armada/
+F:	Documentation/devicetree/bindings/display/marvell,armada-lcdc.txt
 F:	Documentation/devicetree/bindings/reserved-memory/marvell,armada-fram=
ebuffer.txt
=20
 MARVELL CRYPTO DRIVER
--=20
2.20.1
