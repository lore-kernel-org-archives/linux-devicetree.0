From: Robert ABEL <rabel@cit-ec.uni-bielefeld.de>
Subject: [PATCH] of: resource: add WARN for invalid release_resource calls
Date: Thu, 30 Jul 2015 15:17:17 +0200
Message-ID: <1438262237-30889-2-git-send-email-rabel@cit-ec.uni-bielefeld.de>
References: <[PATCH v3 0/7] Introducing (yet again) Device Tree Overlays>
 <1438262237-30889-1-git-send-email-rabel@cit-ec.uni-bielefeld.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438262237-30889-1-git-send-email-rabel@cit-ec.uni-bielefeld.de>
Sender: linux-kernel-owner@vger.kernel.org
To: akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Robert ABEL <rabel@cit-ec.uni-bielefeld.de>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Robert ABEL <rabel@cit-ec.uni-bielefeld.de>
---
 kernel/resource.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/kernel/resource.c b/kernel/resource.c
index 0bcebff..b4c9b27 100644
--- a/kernel/resource.c
+++ b/kernel/resource.c
@@ -236,6 +236,13 @@ static int __release_resource(struct resource *old)
 {
 	struct resource *tmp, **p;
 
+    /* devicetree overlays:
+     * of code doesn't initialize parent, child, sibling
+     * gracefully 'do the right thing' here
+     */
+	if (WARN(!old->parent, "%s: uninitialized resource %s\n", __FUNCTION__, old->name))
+		return 0;
+
 	p = &old->parent->child;
 	for (;;) {
 		tmp = *p;
-- 
2.5.0
