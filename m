From: Stephen Boyd <stephen.boyd@linaro.org>
Subject: [PATCH 2/2] of/resolver: Replace kmalloc + memcpy with kmemdup()
Date: Fri, 13 Oct 2017 00:35:58 -0700
Message-ID: <20171013073558.11518-3-stephen.boyd@linaro.org>
References: <20171013073558.11518-1-stephen.boyd@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171013073558.11518-1-stephen.boyd@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Save one line.

Signed-off-by: Stephen Boyd <stephen.boyd@linaro.org>
---
 drivers/of/resolver.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
index 2d58253bf2f7..bd21a66f6930 100644
--- a/drivers/of/resolver.c
+++ b/drivers/of/resolver.c
@@ -84,10 +84,9 @@ static int update_usages_of_a_phandle_reference(struct device_node *overlay,
 	int offset, len;
 	int err = 0;
 
-	value = kmalloc(prop_fixup->length, GFP_KERNEL);
+	value = kmemdup(prop_fixup->value, prop_fixup->length, GFP_KERNEL);
 	if (!value)
 		return -ENOMEM;
-	memcpy(value, prop_fixup->value, prop_fixup->length);
 
 	/* prop_fixup contains a list of tuples of path:property_name:offset */
 	end = value + prop_fixup->length;
-- 
2.14.GIT
