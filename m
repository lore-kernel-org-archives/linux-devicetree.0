From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v7 1/9] ARM: l2c: move cache-aurora-l2.h to asm/hardware
Date: Thu, 22 Nov 2018 13:11:34 +1300
Message-ID: <20181122001142.19187-2-chris.packham@alliedtelesis.co.nz>
References: <20181122001142.19187-1-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181122001142.19187-1-chris.packham@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: linux@armlinux.org.uk, bp@alien8.de, arnd@arndb.de, jlu@pengutronix.de, gregory.clement@bootlin.com, linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>
List-Id: devicetree@vger.kernel.org

From: Jan Luebbe <jlu@pengutronix.de>

This include file will be used by the AURORA EDAC code.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
Reviewed-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
=20arch/arm/{mm =3D> include/asm/hardware}/cache-aurora-l2.h | 0
=20arch/arm/mm/cache-l2x0.c                                | 2 +-
=202 files changed, 1 insertion(+), 1 deletion(-)
=20rename arch/arm/{mm =3D> include/asm/hardware}/cache-aurora-l2.h (100%=
)

diff --git a/arch/arm/mm/cache-aurora-l2.h b/arch/arm/include/asm/hardwar=
e/cache-aurora-l2.h
similarity index 100%
rename from arch/arm/mm/cache-aurora-l2.h
rename to arch/arm/include/asm/hardware/cache-aurora-l2.h
diff --git a/arch/arm/mm/cache-l2x0.c b/arch/arm/mm/cache-l2x0.c
index 808efbb89b88..a00d6f7fd34c 100644
--- a/arch/arm/mm/cache-l2x0.c
+++ b/arch/arm/mm/cache-l2x0.c
@@ -30,8 +30,8 @@
=20#include <asm/cp15.h>
=20#include <asm/cputype.h>
=20#include <asm/hardware/cache-l2x0.h>
+#include <asm/hardware/cache-aurora-l2.h>
=20#include "cache-tauros3.h"
-#include "cache-aurora-l2.h"
=20
=20struct l2c_init_data {
=20	const char *type;
--=20
2.19.1
