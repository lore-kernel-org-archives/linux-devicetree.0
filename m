From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] of: Fix typo in kerneldoc
Date: Fri, 26 Jul 2019 12:17:44 +0200
Message-ID: <20190726101744.27118-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

"Findfrom" is not a word. Replace the function synopsis by something
that makes sense.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 include/linux/of.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/of.h b/include/linux/of.h
index 0cf857012f11..844f89e1b039 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -1164,7 +1164,7 @@ static inline int of_property_read_string_index(const struct device_node *np,
 }
 
 /**
- * of_property_read_bool - Findfrom a property
+ * of_property_read_bool - Find a property
  * @np:		device node from which the property value is to be read.
  * @propname:	name of the property to be searched.
  *
-- 
2.22.0
