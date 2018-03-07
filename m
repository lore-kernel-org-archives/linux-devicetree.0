Return-Path: <SRS0=lEEj=F5=vger.kernel.org=devicetree-owner@kernel.org>
Received: from aserp2130.oracle.com ([141.146.126.79]:51832 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750803AbeCGGSU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 7 Mar 2018 01:18:20 -0500
Date: Wed, 7 Mar 2018 09:18:08 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] of: unittest: fix an error test in of_unittest_overlay_8()
Message-ID: <20180307061808.GA15765@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, kernel-janitors@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

We changed this from of_overlay_apply() to overlay_data_apply().  The 
overlay_data_apply() function returns 1 on success and 0 on error so
the check for less than zero needs to be updated.

Fixes: 39a751a4cb7e ("of: change overlay apply input data from unflattened to FDT")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index ca5e86dadae2..b233f170b2ec 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -1666,8 +1666,7 @@ static void __init of_unittest_overlay_8(void)
 
 		overlay_name = overlay_name_from_nr(overlay_nr + i);
 
-		ret = overlay_data_apply(overlay_name, &ovcs_id);
-		if (ret < 0)  {
+		if (!overlay_data_apply(overlay_name, &ovcs_id)) {
 			unittest(0, "could not apply overlay \"%s\"\n",
 					overlay_name);
 			return;
