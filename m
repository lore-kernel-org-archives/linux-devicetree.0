From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2] of_net.h: Make of_get_phy_mode() return int i.s.o. const int
Date: Thu, 16 May 2013 19:01:45 +0200
Message-ID: <1368723705-19500-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>
Cc: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: devicetree@vger.kernel.org

include/linux/of_net.h:16: warning: type qualifiers ignored on function return type

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
[v2] Update drivers/of/of_net.c, too

 drivers/of/of_net.c    |    2 +-
 include/linux/of_net.h |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/of/of_net.c b/drivers/of/of_net.c
index ffab033..fafb6ca 100644
--- a/drivers/of/of_net.c
+++ b/drivers/of/of_net.c
@@ -38,7 +38,7 @@ static const char *phy_modes[] = {
  * The function gets phy interface string from property 'phy-mode',
  * and return its index in phy_modes table, or errno in error case.
  */
-const int of_get_phy_mode(struct device_node *np)
+int of_get_phy_mode(struct device_node *np)
 {
 	const char *pm;
 	int err, i;
diff --git a/include/linux/of_net.h b/include/linux/of_net.h
index 61bf53b..34597c8 100644
--- a/include/linux/of_net.h
+++ b/include/linux/of_net.h
@@ -9,10 +9,10 @@
 
 #ifdef CONFIG_OF_NET
 #include <linux/of.h>
-extern const int of_get_phy_mode(struct device_node *np);
+extern int of_get_phy_mode(struct device_node *np);
 extern const void *of_get_mac_address(struct device_node *np);
 #else
-static inline const int of_get_phy_mode(struct device_node *np)
+static inline int of_get_phy_mode(struct device_node *np)
 {
 	return -ENODEV;
 }
-- 
1.7.0.4
