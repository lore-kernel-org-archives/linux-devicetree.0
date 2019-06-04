From: Paul Cercueil <paul@crapouillou.net>
Subject: [RE-RESEND PATCH v3 2/4] memory: Kconfig: Drop dependency on MACH_JZ4780 for jz4780
Date: Tue,  4 Jun 2019 16:30:16 +0200
Message-ID: <20190604143018.11644-2-paul@crapouillou.net>
References: <20190604143018.11644-1-paul@crapouillou.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190604143018.11644-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <bbrezillon@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, od@zcrc.me, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

Depending on MACH_JZ4780 prevent us from creating a generic kernel that
works on more than one MIPS board. Instead, we just depend on MIPS being
set.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Reviewed-by: Boris Brezillon <bbrezillon@kernel.org>
---

Notes:
    v2: No change
    
    v3: No change

 drivers/memory/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
index 392ad4f5c570..dbdee02bb592 100644
--- a/drivers/memory/Kconfig
+++ b/drivers/memory/Kconfig
@@ -123,7 +123,7 @@ config FSL_IFC
 config JZ4780_NEMC
 	bool "Ingenic JZ4780 SoC NEMC driver"
 	default y
-	depends on MACH_JZ4780 || COMPILE_TEST
+	depends on MIPS || COMPILE_TEST
 	depends on HAS_IOMEM && OF
 	help
 	  This driver is for the NAND/External Memory Controller (NEMC) in
-- 
2.21.0.593.g511ec345e18
