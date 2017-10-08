From: Artur Lorincz <larturus2@gmail.com>
Subject: [PATCH] Added default implementation for of_find_all_nodes(). This function is used by board.c from the board module (drivers/staging/board).
Date: Sun,  8 Oct 2017 18:28:27 +0200
Message-ID: <1507480107-3576-2-git-send-email-larturus2@gmail.com>
References: <1504117946-3958-1-git-send-email-larturus2@gmail.com>
 <1507480107-3576-1-git-send-email-larturus2@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1507480107-3576-1-git-send-email-larturus2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, larturus@yahoo.com, Artur Lorincz <larturus2@gmail.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Artur Lorincz <larturus@yahoo.com>
---
 include/linux/of.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/of.h b/include/linux/of.h
index cfc34117fc92..250ab4d55fac 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -538,6 +538,11 @@ const char *of_prop_next_string(struct property *prop, const char *cur);

 bool of_console_check(struct device_node *dn, char *name, int index);

+static inline struct device_node *of_find_all_nodes(struct device_node *prev)
+{
+	return NULL;
+}
+
 #else /* CONFIG_OF */

 static inline void of_core_init(void)
--
2.13.6
