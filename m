From: Artur Lorincz <larturus2@gmail.com>
Subject: [PATCH] default implementation for of_find_all_nodes(...)
Date: Wed, 30 Aug 2017 20:32:26 +0200
Message-ID: <1504117946-3958-1-git-send-email-larturus2@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: frowand.list@gmail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, larturus@yahoo.com, Artur Lorincz <larturus2@gmail.com>
List-Id: devicetree@vger.kernel.org

Added default implementation for of_find_all_nodes(). This function is
used by board.c from the board module (drivers/staging/board).

Signed-off-by: Artur Lorincz <larturus@yahoo.com>
---
 include/linux/of.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/of.h b/include/linux/of.h
index 4a8a709..0a9c17a 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -865,6 +865,11 @@ static inline void of_property_clear_flag(struct property *p, unsigned long flag

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
