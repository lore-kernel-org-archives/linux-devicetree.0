From: frowand.list@gmail.com
Subject: [PATCH 3/6] of: remove kbasename(of->full_name) from base.c
Date: Sun, 25 Feb 2018 18:22:27 -0800
Message-ID: <1519611750-22355-4-git-send-email-frowand.list@gmail.com>
References: <1519611750-22355-1-git-send-email-frowand.list@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1519611750-22355-1-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, pantelis.antoniou@konsulko.com, Pantelis Antoniou <panto@antoniou-consulting.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, geert@linux-m68k.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand@sony.com>

struct device_node full_name has been changed to include the
basename instead of the full path.  kbasename() is no longer
needed to extract the basename from full_name.

Signed-off-by: Frank Rowand <frank.rowand@sony.com>
---
 drivers/of/base.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index ad28de96e13f..926d08b8674d 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -691,8 +691,8 @@ struct device_node *__of_find_node_by_path(struct device_node *parent,
 		return NULL;
 
 	__for_each_child_of_node(parent, child) {
-		const char *name = kbasename(child->full_name);
-		if (strncmp(path, name, len) == 0 && (strlen(name) == len))
+		if (strncmp(path, child->full_name, len) == 0 &&
+		    (strlen(child->full_name) == len))
 			return child;
 	}
 	return NULL;
-- 
Frank Rowand <frank.rowand@sony.com>
