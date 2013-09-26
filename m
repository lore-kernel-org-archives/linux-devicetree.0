From: Rob Herring <robherring2@gmail.com>
Subject: [PATCH 04/21] arm64: remove unnecessary prom.h include
Date: Thu, 26 Sep 2013 13:50:39 -0500
Message-ID: <1380221456-11192-5-git-send-email-robherring2@gmail.com>
References: <1380221456-11192-1-git-send-email-robherring2@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1380221456-11192-1-git-send-email-robherring2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring@calxeda.com>

Remove unnecessary prom.h include in preparation to make prom.h optional.

Signed-off-by: Rob Herring <rob.herring@calxeda.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will.deacon@arm.com>
---
 arch/arm64/mm/init.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index de2de5d..c4b651e 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -31,7 +31,6 @@
 #include <linux/sort.h>
 #include <linux/of_fdt.h>
 
-#include <asm/prom.h>
 #include <asm/sections.h>
 #include <asm/setup.h>
 #include <asm/sizes.h>
-- 
1.8.1.2
