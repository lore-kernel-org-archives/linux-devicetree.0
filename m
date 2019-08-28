From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v4 2/5] dt-bindings: display: armada: Rename the binding doc file
Date: Wed, 28 Aug 2019 09:59:35 +0200
Message-ID: <20190828075938.318028-3-lkundrak@v3.sk>
References: <20190828075938.318028-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190828075938.318028-1-lkundrak@v3.sk>
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
index 3d824ecf96229..d379acd4f69ce 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9620,7 +9620,7 @@ T:	git git://git.armlinux.org.uk/~rmk/linux-arm.git=
 drm-armada-devel
 T:	git git://git.armlinux.org.uk/~rmk/linux-arm.git drm-armada-fixes
 F:	drivers/gpu/drm/armada/
 F:	include/uapi/drm/armada_drm.h
-F:	Documentation/devicetree/bindings/display/armada/
+F:	Documentation/devicetree/bindings/display/marvell,armada-lcdc.txt
 F:	Documentation/devicetree/bindings/reserved-memory/marvell,armada-fram=
ebuffer.txt
=20
 MARVELL ARMADA 3700 PHY DRIVERS
--=20
2.21.0
