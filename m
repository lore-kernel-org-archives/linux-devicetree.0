From: frowand.list@gmail.com
Subject: [PATCH 08/12] of: Remove redundant size check
Date: Fri, 28 Oct 2016 23:26:28 -0700
Message-ID: <1477722392-32172-9-git-send-email-frowand.list@gmail.com>
References: <1477722392-32172-1-git-send-email-frowand.list@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1477722392-32172-1-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, pantelis.antoniou@konsulko.com, Pantelis Antoniou <panto@antoniou-consulting.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand@am.sony.com>

Remove a redundant check of buffer size.

Signed-off-by: Frank Rowand <frank.rowand@am.sony.com>
---
 drivers/of/resolver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
index 708daca1d522..76c09cb57eae 100644
--- a/drivers/of/resolver.c
+++ b/drivers/of/resolver.c
@@ -216,7 +216,7 @@ static int adjust_local_phandle_references(struct device_node *local_fixups,
 
 		for (i = 0; i < count; i++) {
 			off = be32_to_cpu(((__be32 *)prop_fix->value)[i]);
-			if (off >= prop->length || (off + 4) > prop->length)
+			if ((off + 4) > prop->length)
 				return -EINVAL;
 
 			phandle = be32_to_cpu(*(__be32 *)(prop->value + off));
-- 
1.9.1
