From: Stephen Boyd <stephen.boyd@linaro.org>
Subject: [PATCH 1/2] of/resolver: Simplify to be32_add_cpu()
Date: Fri, 13 Oct 2017 00:35:57 -0700
Message-ID: <20171013073558.11518-2-stephen.boyd@linaro.org>
References: <20171013073558.11518-1-stephen.boyd@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171013073558.11518-1-stephen.boyd@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This is the same as be32_add_cpu(), so simplify the code and
remove the now unused local variable.

Signed-off-by: Stephen Boyd <stephen.boyd@linaro.org>
---
 drivers/of/resolver.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
index 99309cb7d372..2d58253bf2f7 100644
--- a/drivers/of/resolver.c
+++ b/drivers/of/resolver.c
@@ -165,7 +165,6 @@ static int adjust_local_phandle_references(struct device_node *local_fixups,
 	struct property *prop_fix, *prop;
 	int err, i, count;
 	unsigned int off;
-	phandle phandle;
 
 	if (!local_fixups)
 		return 0;
@@ -195,9 +194,7 @@ static int adjust_local_phandle_references(struct device_node *local_fixups,
 			if ((off + 4) > prop->length)
 				return -EINVAL;
 
-			phandle = be32_to_cpu(*(__be32 *)(prop->value + off));
-			phandle += phandle_delta;
-			*(__be32 *)(prop->value + off) = cpu_to_be32(phandle);
+			be32_add_cpu(prop->value + off, phandle_delta);
 		}
 	}
 
-- 
2.14.GIT
