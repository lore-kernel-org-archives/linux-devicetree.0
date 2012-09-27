From: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Subject: [PATCH 02/14] of: add a dummy inline function for when CONFIG_OF is not defined
Date: Thu, 27 Sep 2012 16:07:21 +0200
Message-ID: <1348754853-28619-3-git-send-email-g.liakhovetski@gmx.de>
References: <1348754853-28619-1-git-send-email-g.liakhovetski@gmx.de>
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1348754853-28619-1-git-send-email-g.liakhovetski@gmx.de>
Sender: linux-sh-owner@vger.kernel.org
To: linux-media@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hverkuil@xs4all.nl>, Magnus Damm <magnus.damm@gmail.com>, linux-sh@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, Stephen Warren <swarren@wwwdotorg.org>, Arnd Bergmann <arnd@arndb.de>, Grant Likely <grant.likely@secretlab.ca>
List-Id: devicetree@vger.kernel.org

If CONFIG_OF isn't defined, no declaration of of_get_parent will be found
and compilation can fail. This patch adds a dummy inline function
definition to fix the problem.

Signed-off-by: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
---
 include/linux/of.h |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/include/linux/of.h b/include/linux/of.h
index 1b11632..54866e6 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -412,6 +412,11 @@ static inline int of_parse_phandle_with_args(struct device_node *np,
 	return -ENOSYS;
 }
 
+static inline struct device_node *of_get_parent(const struct device_node *np)
+{
+	return NULL;
+}
+
 static inline int of_alias_get_id(struct device_node *np, const char *stem)
 {
 	return -ENOSYS;
-- 
1.7.2.5

