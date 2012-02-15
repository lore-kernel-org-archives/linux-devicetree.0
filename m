From: Danny Kukawka <danny.kukawka@bisect.de>
Subject: [PATCH] of/fdt.c: asm/setup.h included twice
Date: Wed, 15 Feb 2012 18:55:28 +0100
Message-ID: <1329328528-4847-1-git-send-email-danny.kukawka@bisect.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Danny Kukawka <dkukawka@suse.de>, Rob Herring <rob.herring@calxeda.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

drivers/of/fdt.c included 'asm/setup.h' twice, remove the duplicate.

Signed-off-by: Danny Kukawka <danny.kukawka@bisect.de>
---
 drivers/of/fdt.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index ea2bd1b..91a375f 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -23,7 +23,6 @@
 #include <asm/machdep.h>
 #endif /* CONFIG_PPC */
 
-#include <asm/setup.h>
 #include <asm/page.h>
 
 char *of_fdt_get_string(struct boot_param_header *blob, u32 offset)
-- 
1.7.8.3
