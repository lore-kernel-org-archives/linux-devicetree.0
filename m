Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:55157 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750952Ab3HLRgp (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Mon, 12 Aug 2013 13:36:45 -0400
From: Stephen Warren <swarren@wwwdotorg.org>
Subject: [PATCH V5 4/6] of: call __of_parse_phandle_with_args from of_parse_phandle
Date: Mon, 12 Aug 2013 11:36:30 -0600
Message-Id: <1376328992-3115-4-git-send-email-swarren@wwwdotorg.org>
In-Reply-To: <1376328992-3115-1-git-send-email-swarren@wwwdotorg.org>
References: <1376328992-3115-1-git-send-email-swarren@wwwdotorg.org>
Sender: devicetree-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@linaro.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ian.campbell@citrix.com>, Kumar Gala <galak@kernel.crashing.org>, Stephen Warren <swarren@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

From: Stephen Warren <swarren@nvidia.com>

The simplest case of __of_parse_phandle_with_args() implements
of_parse_phandle(), except that it doesn't return the node referenced by
the phandle. Modify it to do so, and then rewrite of_parse_phandle() to
call __of_parse_phandle_with_args() rather than open-coding the simple
case.

Signed-off-by: Stephen Warren <swarren@nvidia.com>
---
v5: New patch.
---
 drivers/of/base.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 2f92522..79ed82c 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1202,14 +1202,16 @@ static int __of_parse_phandle_with_args(const struct device_node *np,
 struct device_node *of_parse_phandle(const struct device_node *np,
 				     const char *phandle_name, int index)
 {
-	const __be32 *phandle;
-	int size;
+	struct of_phandle_args args;
 
-	phandle = of_get_property(np, phandle_name, &size);
-	if ((!phandle) || (size < sizeof(*phandle) * (index + 1)))
+	if (index < 0)
+		return NULL;
+
+	if (__of_parse_phandle_with_args(np, phandle_name, NULL, 0,
+					 index, &args))
 		return NULL;
 
-	return of_find_node_by_phandle(be32_to_cpup(phandle + index));
+	return args.np;
 }
 EXPORT_SYMBOL(of_parse_phandle);
 
-- 
1.8.1.5

