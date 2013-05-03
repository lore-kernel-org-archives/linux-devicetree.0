From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] of_net.h: Make of_get_phy_mode() return int i.s.o. const int
Date: Fri,  3 May 2013 23:32:34 +0200
Message-ID: <1367616754-5142-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>
Cc: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: devicetree@vger.kernel.org

include/linux/of_net.h:16: warning: type qualifiers ignored on function return type

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 include/linux/of_net.h |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
