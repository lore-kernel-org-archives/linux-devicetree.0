From: Moritz Fischer <moritz.fischer@ettus.com>
Subject: [PATCH v2] of: Fix issue where code would fall through to error case.
Date: Fri, 18 Nov 2016 16:48:09 -0800
Message-ID: <1479516489-5898-1-git-send-email-moritz.fischer@ettus.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: pantelis.antoniou@konsulko.com, robh+dt@kernel.org, frowand.list@gmail.com, devicetree@kernel.org, moritz@pure-entropy.org, Moritz Fischer <moritz.fischer@ettus.com>
List-Id: devicetree@vger.kernel.org

No longer fall through into the error case that prints out
an error if no error (err = 0) occurred.

Fixes d9181b20a83(of: Add back an error message, restructured)
Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
Reviewed-by: Frank Rowand <frank.rowand@am.sony.com>
---
Hi Rob,

this is Frank's suggestion. I don't have a strong preference one way or the other.
Feel free to pick one or the other.

Cheers,

Moritz
---
 drivers/of/resolver.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
index 783bd09..c47404f3 100644
--- a/drivers/of/resolver.c
+++ b/drivers/of/resolver.c
@@ -358,14 +358,14 @@ int of_resolve_phandles(struct device_node *overlay)
 
 		err = update_usages_of_a_phandle_reference(overlay, prop, phandle);
 		if (err)
-			break;
+			goto err_out;
 	}
-
-err_out:
-	pr_err("overlay phandle fixup failed: %d\n", err);
 out:
 	of_node_put(tree_symbols);
-
 	return err;
+
+err_out:
+	pr_err("overlay phandle fixup failed: %d\n", err);
+	goto out;
 }
 EXPORT_SYMBOL_GPL(of_resolve_phandles);
-- 
2.7.4
