From: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
Subject: [PATCH] arch: arm: mach-mxs: mach-mxs.c:  Remove unused function
Date: Sun,  7 Dec 2014 02:19:27 +0100
Message-ID: <1417915167-8750-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawn.guo@linaro.org>, Sascha Hauer <kernel@pengutronix.de>
Cc: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>, Russell King <linux@arm.linux.org.uk>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Remove the function __mxs_togl() that is not used anywhere.

This was partially found by using a static code analysis program called cppcheck.

Signed-off-by: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
---
 arch/arm/mach-mxs/mach-mxs.c |    5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm/mach-mxs/mach-mxs.c b/arch/arm/mach-mxs/mach-mxs.c
index 2e7cec8..3362f48 100644
--- a/arch/arm/mach-mxs/mach-mxs.c
+++ b/arch/arm/mach-mxs/mach-mxs.c
@@ -72,11 +72,6 @@ static inline void __mxs_clrl(u32 mask, void __iomem *reg)
 	__raw_writel(mask, reg + MXS_CLR_ADDR);
 }
 
-static inline void __mxs_togl(u32 mask, void __iomem *reg)
-{
-	__raw_writel(mask, reg + MXS_TOG_ADDR);
-}
-
 #define OCOTP_WORD_OFFSET		0x20
 #define OCOTP_WORD_COUNT		0x20
 
-- 
1.7.10.4
