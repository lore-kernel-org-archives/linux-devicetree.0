From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 2/4] memory: jz4780_nemc: Drop dependency on MACH_JZ4780, use COMPILE_TEST
Date: Wed, 22 Aug 2018 19:29:51 +0200
Message-ID: <20180822172953.11281-2-paul@crapouillou.net>
References: <20180822172953.11281-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180822172953.11281-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alex Smith <alex@alex-smith.me.uk>
Cc: od@zcrc.me, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

Depending on MACH_JZ4780 prevent us from creating a generic kernel that
works on more than one MIPS board. Instead, we just depend on MIPS being
set.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/memory/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
index 8d731d6c3e54..68bf8b2b45f6 100644
--- a/drivers/memory/Kconfig
+++ b/drivers/memory/Kconfig
@@ -120,8 +120,8 @@ config FSL_IFC
 
 config JZ4780_NEMC
 	bool "Ingenic JZ4780 SoC NEMC driver"
-	default y
-	depends on MACH_JZ4780
+	default MACH_JZ4780
+	depends on MIPS || COMPILE_TEST
 	help
 	  This driver is for the NAND/External Memory Controller (NEMC) in
 	  the Ingenic JZ4780. This controller is used to handle external
-- 
2.18.0
