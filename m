From: frowand.list@gmail.com
Subject: [PATCH 5/6] of: remove kbasename(of->full_name) from of_reserved_mem.c
Date: Sun, 25 Feb 2018 18:22:29 -0800
Message-ID: <1519611750-22355-6-git-send-email-frowand.list@gmail.com>
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
 drivers/of/of_reserved_mem.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 9a4f4246231d..e770cab4b95b 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -405,15 +405,13 @@ void of_reserved_mem_device_release(struct device *dev)
  */
 struct reserved_mem *of_reserved_mem_lookup(struct device_node *np)
 {
-	const char *name;
 	int i;
 
 	if (!np->full_name)
 		return NULL;
 
-	name = kbasename(np->full_name);
 	for (i = 0; i < reserved_mem_count; i++)
-		if (!strcmp(reserved_mem[i].name, name))
+		if (!strcmp(reserved_mem[i].name, np->full_name))
 			return &reserved_mem[i];
 
 	return NULL;
-- 
Frank Rowand <frank.rowand@sony.com>
