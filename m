From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH trivial 16/16] of: Spelling s/anonymouns/anonymous/
Date: Tue, 11 Mar 2014 11:23:50 +0100
Message-ID: <1394533430-4746-16-git-send-email-geert@linux-m68k.org>
References: <1394533430-4746-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1394533430-4746-1-git-send-email-geert@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiri Kosina <trivial@kernel.org>
Cc: linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@linux-m68k.org>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Geert Uytterhoeven <geert+renesas@linux-m68k.org>

Signed-off-by: Geert Uytterhoeven <geert+renesas@linux-m68k.org>
Cc: Grant Likely <grant.likely@linaro.org>
Cc: devicetree@vger.kernel.org
---
 include/linux/of_platform.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/of_platform.h b/include/linux/of_platform.h
index 05cb4a928252..8cdd53bf1114 100644
--- a/include/linux/of_platform.h
+++ b/include/linux/of_platform.h
@@ -37,7 +37,7 @@
  * Note: Using an auxdata lookup table should be considered a last resort when
  * converting a platform to use the DT.  Normally the automatically generated
  * device name will not matter, and drivers should obtain data from the device
- * node instead of from an anonymouns platform_data pointer.
+ * node instead of from an anonymous platform_data pointer.
  */
 struct of_dev_auxdata {
 	char *compatible;
-- 
1.7.9.5
