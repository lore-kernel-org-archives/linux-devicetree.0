Return-Path: <SRS0=RRAG=27=yahoo.com=larturus@kernel.org>
From: Artur Lorincz <larturus@yahoo.com>
Subject: [PATCH 1/1] Default implementation for of_find_all_nodes(...).
Date: Wed, 22 Mar 2017 16:27:45 +0100
Message-Id: <1490196465-5846-1-git-send-email-larturus@yahoo.com>
To: robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, larturus@yahoo.com
List-ID: <devicetree@vger.kernel.org>

Added default implementation for of_find_all_nodes(). This function is
used by board.c from the board module (drivers/staging/board).

Signed-off-by: Artur Lorincz <larturus@yahoo.com>
---
 include/linux/of.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/of.h b/include/linux/of.h
index 21e6323..f1cff92 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -840,6 +840,11 @@ static inline void of_property_clear_flag(struct property *p, unsigned long flag

 #define of_match_ptr(_ptr)	NULL
 #define of_match_node(_matches, _node)	NULL
+
+static inline struct device_node *of_find_all_nodes(struct device_node *prev)
+{
+	return NULL;
+}
 #endif /* CONFIG_OF */

 /* Default string compare functions, Allow arch asm/prom.h to override */
--
1.9.1
