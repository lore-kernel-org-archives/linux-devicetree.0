From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] of: unittest: fix an error code in
 of_unittest_apply_overlay()
Date: Wed, 14 Mar 2018 23:08:28 +0300
Message-ID: <20180314200828.GA10588@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: devicetree@vger.kernel.org

We accidentally return zero on failure instead of a negative error code.

Fixes: 39a751a4cb7e ("of: change overlay apply input data from unflattened to FDT")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index dede77a79820..bc03902693b7 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -1417,15 +1417,13 @@ static int __init of_unittest_apply_overlay(int overlay_nr, int unittest_nr,
 		int *overlay_id)
 {
 	const char *overlay_name;
-	int ret;
 
 	overlay_name = overlay_name_from_nr(overlay_nr);
 
-	ret = overlay_data_apply(overlay_name, overlay_id);
-	if (!ret) {
+	if (!overlay_data_apply(overlay_name, overlay_id)) {
 		unittest(0, "could not apply overlay \"%s\"\n",
 				overlay_name);
-		return ret;
+		return -EFAULT;
 	}
 	of_unittest_track_overlay(*overlay_id);
 
