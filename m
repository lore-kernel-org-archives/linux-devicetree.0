From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH RFC 06/13] of: Add empty of_find_device_by_node() function
 definition
Date: Mon, 10 Dec 2012 20:41:32 +0100
Message-ID: <1355168499-5847-7-git-send-email-s.nawrocki@samsung.com>
References: <1355168499-5847-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1355168499-5847-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: g.liakhovetski@gmx.de, linux-media@vger.kernel.org
Cc: grant.likely@secretlab.ca, rob.herring@calxeda.com, thomas.abraham@linaro.org, t.figa@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: devicetree@vger.kernel.org

This allows users to be compiled without excluding this function
call with preprocessor directives when CONFIG_OF_DEVICE is disabled.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 include/linux/of_platform.h |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/of_platform.h b/include/linux/of_platform.h
index b47d204..d8f587f 100644
--- a/include/linux/of_platform.h
+++ b/include/linux/of_platform.h
@@ -96,6 +96,13 @@ extern int of_platform_populate(struct device_node *root,
 				struct device *parent);
 #endif /* CONFIG_OF_ADDRESS */
 
+#else  /* CONFIG_OF_DEVICE */
+static inline struct platform_device *of_find_device_by_node(
+					struct device_node *np)
+{
+	return NULL;
+}
+
 #endif /* CONFIG_OF_DEVICE */
 
 #if !defined(CONFIG_OF_ADDRESS)
-- 
1.7.9.5
