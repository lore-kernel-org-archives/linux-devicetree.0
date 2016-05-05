From: Reza Arbab <arbab@linux.vnet.ibm.com>
Subject: [PATCH] of: fix device compatibility scoring
Date: Thu,  5 May 2016 13:30:48 -0500
Message-ID: <1462473048-10001-1-git-send-email-arbab@linux.vnet.ibm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, Kevin Hao <haokexin@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

If a constraint given to __of_device_is_compatible() does not
match, we should just move to the next constraint without adding
to the compatibility score. Instead, the function immediately
returns 0.

Do not return from __of_device_is_compatible() until a complete
score has been calculated.

Signed-off-by: Reza Arbab <arbab@linux.vnet.ibm.com>
---
 drivers/of/base.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 017dd94..942a60e 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -455,22 +455,18 @@ static int __of_device_is_compatible(const struct device_node *device,
 				break;
 			}
 		}
-		if (!score)
-			return 0;
 	}
 
 	/* Matching type is better than matching name */
 	if (type && type[0]) {
-		if (!device->type || of_node_cmp(type, device->type))
-			return 0;
-		score += 2;
+		if (device->type && !of_node_cmp(type, device->type))
+			score += 2;
 	}
 
 	/* Matching name is a bit better than not */
 	if (name && name[0]) {
-		if (!device->name || of_node_cmp(name, device->name))
-			return 0;
-		score++;
+		if (device->name && !of_node_cmp(name, device->name))
+			score++;
 	}
 
 	return score;
-- 
1.8.3.1
