From: Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v3 3/3] MAINTAINERS: Add entry for the Nuvoton NPCM architecture
Date: Tue,  5 Sep 2017 17:30:16 -0700
Message-ID: <20170906003016.2159-4-brendanhiggins@google.com>
References: <20170906003016.2159-1-brendanhiggins@google.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170906003016.2159-1-brendanhiggins@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, avifishman70@gmail.com, tmaimon77@gmail.com, raltherr@google.com, f.fainelli@gmail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, Brendan Higgins <brendanhiggins@google.com>
List-Id: devicetree@vger.kernel.org

Add maintainers and reviewers for the Nuvoton NPCM architecture.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Reviewed-by: Tomer Maimon <tmaimon77@gmail.com>
Reviewed-by: Avi Fishman <avifishman70@gmail.com>
---
 MAINTAINERS | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 44cb004c765d..67064bf11904 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1598,6 +1598,19 @@ F:	drivers/pinctrl/nomadik/
 F:	drivers/i2c/busses/i2c-nomadik.c
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
 
+ARM/NUVOTON NPCM ARCHITECTURE
+M:	Avi Fishman <avifishman70@gmail.com>
+M:	Tomer Maimon <tmaimon77@gmail.com>
+R:	Brendan Higgins <brendanhiggins@google.com>
+R:	Rick Altherr <raltherr@google.com>
+L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
+S:	Maintained
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
2.14.1.581.gf28d330327-goog
