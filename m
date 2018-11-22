From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v7 2/9] ARM: aurora-l2: add prefix to MAX_RANGE_SIZE
Date: Thu, 22 Nov 2018 13:11:35 +1300
Message-ID: <20181122001142.19187-3-chris.packham@alliedtelesis.co.nz>
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

The macro name is too generic, so add a AURORA_ prefix.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
Reviewed-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
=20arch/arm/include/asm/hardware/cache-aurora-l2.h | 2 +-
=20arch/arm/mm/cache-l2x0.c                        | 4 ++--
=202 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/include/asm/hardware/cache-aurora-l2.h b/arch/arm/i=
nclude/asm/hardware/cache-aurora-l2.h
index c86124769831..dc5c479ec4c3 100644
--- a/arch/arm/include/asm/hardware/cache-aurora-l2.h
+++ b/arch/arm/include/asm/hardware/cache-aurora-l2.h
@@ -41,7 +41,7 @@
=20#define AURORA_ACR_FORCE_WRITE_THRO_POLICY	\
=20	(2 << AURORA_ACR_FORCE_WRITE_POLICY_OFFSET)
=20
-#define MAX_RANGE_SIZE		1024
+#define AURORA_MAX_RANGE_SIZE	1024
=20
=20#define AURORA_WAY_SIZE_SHIFT	2
=20
diff --git a/arch/arm/mm/cache-l2x0.c b/arch/arm/mm/cache-l2x0.c
index a00d6f7fd34c..7d2d2a3c67d0 100644
--- a/arch/arm/mm/cache-l2x0.c
+++ b/arch/arm/mm/cache-l2x0.c
@@ -1364,8 +1364,8 @@ static unsigned long aurora_range_end(unsigned long=
=20start, unsigned long end)
=20	 * since cache range operations stall the CPU pipeline
=20	 * until completion.
=20	 */
-	if (end > start + MAX_RANGE_SIZE)
-		end =3D start + MAX_RANGE_SIZE;
+	if (end > start + AURORA_MAX_RANGE_SIZE)
+		end =3D start + AURORA_MAX_RANGE_SIZE;
=20
=20	/*
=20	 * Cache range operations can't straddle a page boundary.
--=20
2.19.1
