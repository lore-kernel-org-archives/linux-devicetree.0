Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 3/3] arm64: renesas: Add Renesas R8A77990 Kconfig support
Date: Wed, 11 Apr 2018 18:35:53 +0900
Message-Id: <1523439353-980-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1523439353-980-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1523439353-980-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Add configuration option for the R-Car E3 (R8A77990) SoC.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/Kconfig.platforms | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 2b1535c..d5aeac3 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -208,6 +208,12 @@ config ARCH_R8A77980
 	help
 	  This enables support for the Renesas R-Car V3H SoC.
 
+config ARCH_R8A77990
+	bool "Renesas R-Car E3 SoC Platform"
+	depends on ARCH_RENESAS
+	help
+	  This enables support for the Renesas R-Car E3 SoC.
+
 config ARCH_R8A77995
 	bool "Renesas R-Car D3 SoC Platform"
 	depends on ARCH_RENESAS
-- 
1.9.1
