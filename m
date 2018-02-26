From: frowand.list@gmail.com
Subject: [PATCH 6/6] of: remove kbasename(of->full_name) from platform.c
Date: Sun, 25 Feb 2018 18:22:30 -0800
Message-ID: <1519611750-22355-7-git-send-email-frowand.list@gmail.com>
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
 drivers/of/platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index c00d81dfac0b..17116f5ce6ba 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -94,7 +94,7 @@ static void of_device_make_bus_id(struct device *dev)
 
 		/* format arguments only used if dev_name() resolves to NULL */
 		dev_set_name(dev, dev_name(dev) ? "%s:%s" : "%s",
-			     kbasename(node->full_name), dev_name(dev));
+			     node->full_name, dev_name(dev));
 		node = node->parent;
 	}
 }
-- 
Frank Rowand <frank.rowand@sony.com>
