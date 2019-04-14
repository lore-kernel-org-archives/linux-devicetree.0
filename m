From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v3 RESEND 2/4] memory: Kconfig: Drop dependency on MACH_JZ4780 for jz4780
Date: Sun, 14 Apr 2019 13:47:00 +0200
Message-ID: <20190414114702.8236-2-paul@crapouillou.net>
References: <20190414114702.8236-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190414114702.8236-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <bbrezillon@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, od@zcrc.me, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

Depending on MACH_JZ4780 prevent us from creating a generic kernel that
works on more than one MIPS board. Instead, we just depend on MIPS being
set.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Reviewed-by: Boris Brezillon <bbrezillon@kernel.org>
---

v2: No change

v3: No change

 drivers/memory/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
index 2d91b00e3591..3d411575fcb6 100644
--- a/drivers/memory/Kconfig
+++ b/drivers/memory/Kconfig
@@ -122,7 +122,7 @@ config FSL_IFC
 config JZ4780_NEMC
 	bool "Ingenic JZ4780 SoC NEMC driver"
 	default y
-	depends on MACH_JZ4780 || COMPILE_TEST
+	depends on MIPS || COMPILE_TEST
 	depends on HAS_IOMEM && OF
 	help
 	  This driver is for the NAND/External Memory Controller (NEMC) in
-- 
2.11.0
