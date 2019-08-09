From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH 13/19] ARM: mmp: define MMP_CHIPID by the means of CIU_REG()
Date: Fri,  9 Aug 2019 11:31:52 +0200
Message-ID: <20190809093158.7969-14-lkundrak@v3.sk>
References: <20190809093158.7969-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190809093158.7969-1-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
List-Id: devicetree@vger.kernel.org

A rather trivial cosmetic improvement.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 arch/arm/mach-mmp/common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-mmp/common.c b/arch/arm/mach-mmp/common.c
index 2ee08c78e8bc9..24c689a01ecb7 100644
--- a/arch/arm/mach-mmp/common.c
+++ b/arch/arm/mach-mmp/common.c
@@ -17,7 +17,7 @@
=20
 #include "common.h"
=20
-#define MMP_CHIPID	(AXI_VIRT_BASE + 0x82c00)
+#define MMP_CHIPID	CIU_REG(0x00)
=20
 unsigned int mmp_chip_id;
 EXPORT_SYMBOL(mmp_chip_id);
--=20
2.21.0
