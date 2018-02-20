Return-Path: <SRS0=RDbo=FO=vger.kernel.org=devicetree-owner@kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:54358 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751341AbeBTKVu (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 20 Feb 2018 05:21:50 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] mmc: dw_mmc-k3: Fix out-of-bounds access through DT alias
Date: Tue, 20 Feb 2018 10:03:13 +0100
Message-Id: <1519117393-31302-1-git-send-email-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
To: Jaehoon Chung <jh80.chung@samsung.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <devicetree@vger.kernel.org>

The hs_timing_cfg[] array is indexed using a value derived from the
"mshcN" alias in DT, which may lead to an out-of-bounds access.

Fix this by adding a range check.

Fixes: 7d92895208a008a2 ("mmc: dw_mmc-k3: Fix out-of-bounds access through DT alias")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-tested only.

There is another possible out-of-bounds access in
drivers/mmc/host/dw_mmc.c:dw_mci_init_slot():

    if (drv_data && drv_data->caps)
	    mmc->caps |= drv_data->caps[ctrl_id];

With ctrl_id derived from "mshcN".

Unfortunately the upper bound is not known at run-time, without adding
such a field to struct dw_mci_drv_data first.
---
 drivers/mmc/host/dw_mmc-k3.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mmc/host/dw_mmc-k3.c b/drivers/mmc/host/dw_mmc-k3.c
index 73fd75c3c824904d..75ae5803b0db24dd 100644
--- a/drivers/mmc/host/dw_mmc-k3.c
+++ b/drivers/mmc/host/dw_mmc-k3.c
@@ -135,6 +135,9 @@ static int dw_mci_hi6220_parse_dt(struct dw_mci *host)
 	if (priv->ctrl_id < 0)
 		priv->ctrl_id = 0;
 
+	if (priv->ctrl_id >= TIMING_MODE)
+		return -EINVAL;
+
 	host->priv = priv;
 	return 0;
 }
-- 
2.7.4

