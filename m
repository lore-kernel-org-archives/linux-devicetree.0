From: Lixin Wang <alan.1.wang@nokia-sbell.com>
Subject: [PATCH] of: overlay: fix memory leak related to duplicated property
Date: Fri, 13 Oct 2017 11:07:36 +0800
Message-ID: <1507864056-52089-1-git-send-email-alan.1.wang@nokia-sbell.com>
References: <1507859591-2337-1-git-send-email-alan.1.wang@nokia-sbell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1507859591-2337-1-git-send-email-alan.1.wang@nokia-sbell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, alawang <alan.1.wang@nokia-sbell.com>
List-Id: devicetree@vger.kernel.org

From: alawang <alan.1.wang@nokia-sbell.com>

Hello,

Sorry It was my fault in last email that wrote the wrong subject and sign off name.
Correct them this time.
Thanks

Function of_changeset_add_property or of_changeset_update_property may
fails. In this case the property just allocated is never deallocated.

Signed-off-by: Lixin Wang <alan.1.wang@nokia-sbell.com>
---
 drivers/of/overlay.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 8ecfee3..af3b9a1 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -162,6 +162,7 @@ static int of_overlay_apply_single_property(struct of_overlay *ov,
 		bool is_symbols_node)
 {
 	struct property *propn = NULL, *tprop;
+	int ret = 0;
 
 	/* NOTE: Multiple changes of single properties not supported */
 	tprop = of_find_property(target, prop->name, NULL);
@@ -186,10 +187,16 @@ static int of_overlay_apply_single_property(struct of_overlay *ov,
 
 	/* not found? add */
 	if (tprop == NULL)
-		return of_changeset_add_property(&ov->cset, target, propn);
-
-	/* found? update */
-	return of_changeset_update_property(&ov->cset, target, propn);
+		ret = of_changeset_add_property(&ov->cset, target, propn);
+	else /* found? update */
+		ret = of_changeset_update_property(&ov->cset, target, propn);
+
+	if (ret) {
+		kfree(propn->name);
+		kfree(propn->value);
+		kfree(propn);
+	}
+	return ret;
 }
 
 static int of_overlay_apply_single_device_node(struct of_overlay *ov,
-- 
2.6.2
