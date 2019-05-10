From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v8 1/9] ARM: l2c: move cache-aurora-l2.h to asm/hardware
Date: Fri, 10 May 2019 22:15:28 +1200
Message-ID: <20190510101536.6724-2-chris.packham@alliedtelesis.co.nz>
References: <20190510101536.6724-1-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190510101536.6724-1-chris.packham@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: linux@armlinux.org.uk, bp@alien8.de, mark.rutland@arm.com, robh+dt@kernel.org, mchehab@kernel.org, james.morse@arm.com, jlu@pengutronix.de, gregory.clement@bootlin.com
Cc: linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Gregory CLEMENT <gregory.clement@free-electrons.com>, Chris Packham <chris.packham@alliedtelesis.co.nz>
List-Id: devicetree@vger.kernel.org

From: Jan Luebbe <jlu@pengutronix.de>

This include file will be used by the AURORA EDAC code.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
Reviewed-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 arch/arm/{mm =3D> include/asm/hardware}/cache-aurora-l2.h | 0
 arch/arm/mm/cache-l2x0.c                                | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename arch/arm/{mm =3D> include/asm/hardware}/cache-aurora-l2.h (100%)

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
 #include <asm/cp15.h>
 #include <asm/cputype.h>
 #include <asm/hardware/cache-l2x0.h>
+#include <asm/hardware/cache-aurora-l2.h>
 #include "cache-tauros3.h"
-#include "cache-aurora-l2.h"
=20
 struct l2c_init_data {
 	const char *type;
--=20
2.21.0
