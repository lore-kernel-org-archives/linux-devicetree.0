From: Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v11 3/3] MAINTAINERS: Add entry for the Nuvoton NPCM architecture
Date: Thu, 15 Feb 2018 18:40:11 -0800
Message-ID: <20180216024011.189157-4-brendanhiggins@google.com>
References: <20180216024011.189157-1-brendanhiggins@google.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180216024011.189157-1-brendanhiggins@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, linux@armlinux.org.uk, mark.rutland@arm.com, tmaimon77@gmail.com, avifishman70@gmail.com, julien.thierry@arm.com, pombredanne@nexb.com, arnd@arndb.de, olof@lixom.net, khilman@kernel.org
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Brendan Higgins <brendanhiggins@google.com>
List-Id: devicetree@vger.kernel.org

Add maintainers and reviewers for the Nuvoton NPCM architecture.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Reviewed-by: Tomer Maimon <tmaimon77@gmail.com>
Reviewed-by: Avi Fishman <avifishman70@gmail.com>
---
 MAINTAINERS | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3bdc260e36b7..02d1b0345298 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1700,6 +1700,20 @@ F:	Documentation/devicetree/bindings/arm/ste-*
 F:	Documentation/devicetree/bindings/arm/ux500/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
 
+ARM/NUVOTON NPCM ARCHITECTURE
+M:	Avi Fishman <avifishman70@gmail.com>
+M:	Tomer Maimon <tmaimon77@gmail.com>
+R:	Patrick Venture <venture@google.com>
+R:	Nancy Yuen <yuenn@google.com>
+R:	Brendan Higgins <brendanhiggins@google.com>
+L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
+S:	Supported
+F:	arch/arm/mach-npcm/
+F:	arch/arm/boot/dts/nuvoton-npcm*
+F:	include/dt-bindings/clock/nuvoton,npcm7xx-clks.h
+F:	drivers/*/*npcm*
+F:	Documentation/*/*npcm*
+
 ARM/NUVOTON W90X900 ARM ARCHITECTURE
 M:	Wan ZongShun <mcuos.com@gmail.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.16.1.291.g4437f3f132-goog
