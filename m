From: Pantelis Antoniou <panto@antoniou-consulting.com>
Subject: [PATCH v2 1/5] OF: Introduce device tree node flag helpers.
Date: Thu,  7 Nov 2013 21:31:02 +0200
Message-ID: <1383852666-13551-2-git-send-email-panto@antoniou-consulting.com>
References: <1383852666-13551-1-git-send-email-panto@antoniou-consulting.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1383852666-13551-1-git-send-email-panto@antoniou-consulting.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Alexander Sverdlin <alexander.sverdlin@nsn.com>, Michael Stickel <ms@mycable.de>, Guenter Roeck <linux@roeck-us.net>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Ionut Nicu <ioan.nicu.ext@nsn.com>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Pantelis Antoniou <panto@antoniou-consulting.com>
List-Id: devicetree@vger.kernel.org

Helper functions for working with device node flags.

Signed-off-by: Pantelis Antoniou <panto@antoniou-consulting.com>
---
 include/linux/of.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/linux/of.h b/include/linux/of.h
index f95aee3..786c4f6 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -114,6 +114,26 @@ static inline void of_node_set_flag(struct device_node *n, unsigned long flag)
 	set_bit(flag, &n->_flags);
 }
 
+static inline void of_node_clear_flag(struct device_node *n, unsigned long flag)
+{
+	clear_bit(flag, &n->_flags);
+}
+
+static inline int of_property_check_flag(struct property *p, unsigned long flag)
+{
+	return test_bit(flag, &p->_flags);
+}
+
+static inline void of_property_set_flag(struct property *p, unsigned long flag)
+{
+	set_bit(flag, &p->_flags);
+}
+
+static inline void of_property_clear_flag(struct property *p, unsigned long flag)
+{
+	clear_bit(flag, &p->_flags);
+}
+
 extern struct device_node *of_find_all_nodes(struct device_node *prev);
 
 /*
-- 
1.7.12
