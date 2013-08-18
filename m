Return-Path: <devicetree-owner@vger.kernel.org>
Received: from georges.telenet-ops.be ([195.130.137.68]:46832 "EHLO
	georges.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754069Ab3HRLBp (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Sun, 18 Aug 2013 07:01:45 -0400
From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2] of_net.h: Make of_get_phy_mode() return int i.s.o. const int
Date: Sun, 18 Aug 2013 13:01:30 +0200
Message-Id: <1376823690-29179-1-git-send-email-geert@linux-m68k.org>
Sender: devicetree-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
List-ID: <devicetree@vger.kernel.org>

include/linux/of_net.h:16: warning: type qualifiers ignored on function return type

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
v2: update the actual function in drivers/of/of_net.c.

 drivers/of/of_net.c    |    2 +-
 include/linux/of_net.h |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/of/of_net.c b/drivers/of/of_net.c
index ea174c8..8f9be2e 100644
--- a/drivers/of/of_net.c
+++ b/drivers/of/of_net.c
@@ -39,7 +39,7 @@ static const char *phy_modes[] = {
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
1.7.9.5

