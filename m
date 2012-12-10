From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH RFC 12/13] v4l2-of: Corrected v4l2_of_parse_link() function
 declaration
Date: Mon, 10 Dec 2012 20:41:38 +0100
Message-ID: <1355168499-5847-13-git-send-email-s.nawrocki@samsung.com>
References: <1355168499-5847-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1355168499-5847-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: g.liakhovetski@gmx.de, linux-media@vger.kernel.org
Cc: grant.likely@secretlab.ca, rob.herring@calxeda.com, thomas.abraham@linaro.org, t.figa@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: devicetree@vger.kernel.org

v4l2_of_parse_link() return value type is int, not void.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 include/media/v4l2-of.h |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/media/v4l2-of.h b/include/media/v4l2-of.h
index 9b036e6..686d04b 100644
--- a/include/media/v4l2-of.h
+++ b/include/media/v4l2-of.h
@@ -49,10 +49,13 @@ int v4l2_of_parse_data_lanes(const struct device_node *node,
 struct device_node *v4l2_of_get_next_link(const struct device_node *parent,
 					struct device_node *previous);
 struct device_node *v4l2_of_get_remote(const struct device_node *node);
-#else
-static inline void v4l2_of_parse_link(const struct device_node *node,
+
+#else /* CONFIG_OF */
+
+static inline int v4l2_of_parse_link(const struct device_node *node,
 				      struct v4l2_of_link *link)
 {
+	return -ENOSYS;
 }
 
 static inline int v4l2_of_parse_data_lanes(const struct device_node *node,
-- 
1.7.9.5
