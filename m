Return-Path: <SRS0=+eCa=5Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 509A7C3815B
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Apr 2020 17:52:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 27C73206F5
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Apr 2020 17:52:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="icsrGpdR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726657AbgDIRww (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Apr 2020 13:52:52 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:36273 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726638AbgDIRwv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 9 Apr 2020 13:52:51 -0400
Received: by mail-wr1-f67.google.com with SMTP id k1so12954108wrm.3;
        Thu, 09 Apr 2020 10:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+npoMRH1DogTx3QRDDmEwhJHjrDR5km4V6W1qEq1dIw=;
        b=icsrGpdRQJY9lszK58AQnbiy670BvHRajERyWY4p4p9uE5zH9pW+2+DWyU6grB83Q3
         oXn9h9KkLl36xZ9HU5i/vD8C5L9dRVSgBxB5pK8u/j20zUz/USaWrS01RNGUnyp/bDMJ
         tfPlemKjaYbjFXXugxm0hX6D0okBg5t6w5kskS64s7hQHXHtr6drjuDyWE9S9eKL1mNU
         YYG6TPJFD4lgcR9Lw7Z3uQcU6LcndAAWKLem9hgj9fnBIMqWVeQTAU1oW4oyXy3N45Hb
         Xs4FMgcTTISlc6WLt5O+MuC6ckB72wflNMeFgIP+pI8veVsMZ9YKhfbWw2OWkgIgbKP4
         v1MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+npoMRH1DogTx3QRDDmEwhJHjrDR5km4V6W1qEq1dIw=;
        b=GuTPzB48MN0jceFRj72IjtUq7ugNhIS+YD6NckoqFi4yk1zGl+mM/rHnUfRKbS3VP2
         icZah5vXal0nKSXBKzCxdrdrPnESn1rJMzCtskXEo4geDlSP06rbtvewoin2OuQOoAsc
         PYGmkdwSkN4VDZU2KFru+CJaX5eyBvP196y7nQ/omcWZyQ8uHF1YMnT28jVtFFJJCfje
         qCrKpLGUGjWCxIU0B3KeaQLN1CuCbyolKwg7uViaQ7Q471bw8kJpjjssOtx/FXaKPH4N
         IQGYYGqDDSJLfw2N/Rnj1GpsbYISAalw2GL353fKRBVbVz32PO5ZLtAUs9VEz0BMd5wp
         Ttbw==
X-Gm-Message-State: AGi0PubaCfB8R37w3DK/Dk/trJQRlleq4+/AC4W43p2j0D20d4RFM7sQ
        F2D8Tw582f9+qHLd+FXWKrU=
X-Google-Smtp-Source: APiQypLkNEMayEReLKHpNAw3KW7p+Ln/jI3qzu1rsT25+Lx1TXXou8ePxrBQpRZ8TpLH/DlfeODV3g==
X-Received: by 2002:adf:fe4b:: with SMTP id m11mr341985wrs.20.1586454770160;
        Thu, 09 Apr 2020 10:52:50 -0700 (PDT)
Received: from localhost (pD9E51D62.dip0.t-ipconnect.de. [217.229.29.98])
        by smtp.gmail.com with ESMTPSA id k3sm4437176wmf.16.2020.04.09.10.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 10:52:49 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 03/14] of: reserved-memory: Support multiple regions per device
Date:   Thu,  9 Apr 2020 19:52:27 +0200
Message-Id: <20200409175238.3586487-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200409175238.3586487-1-thierry.reding@gmail.com>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

While the lookup/initialization code already supports multiple memory
regions per device, the release code will only ever release the first
matching memory region.

Enhance the code to release all matching regions. Each attachment of
a region to a device is uniquely identifiable using a struct device
pointer and a pointer to the memory region's struct reserved_mem.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/of/of_reserved_mem.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index ed2ff6f01d32..f61e8739502a 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -385,24 +385,22 @@ EXPORT_SYMBOL_GPL(of_reserved_mem_device_init_by_name);
  */
 void of_reserved_mem_device_release(struct device *dev)
 {
-	struct rmem_assigned_device *rd;
-	struct reserved_mem *rmem = NULL;
+	struct rmem_assigned_device *rd, *tmp;
+	LIST_HEAD(release_list);
 
 	mutex_lock(&of_rmem_assigned_device_mutex);
-	list_for_each_entry(rd, &of_rmem_assigned_device_list, list) {
-		if (rd->dev == dev) {
-			rmem = rd->rmem;
-			list_del(&rd->list);
-			kfree(rd);
-			break;
-		}
+	list_for_each_entry_safe(rd, tmp, &of_rmem_assigned_device_list, list) {
+		if (rd->dev == dev)
+			list_move_tail(&rd->list, &release_list);
 	}
 	mutex_unlock(&of_rmem_assigned_device_mutex);
 
-	if (!rmem || !rmem->ops || !rmem->ops->device_release)
-		return;
+	list_for_each_entry_safe(rd, tmp, &release_list, list) {
+		if (rd->rmem && rd->rmem->ops && rd->rmem->ops->device_release)
+			rd->rmem->ops->device_release(rd->rmem, dev);
 
-	rmem->ops->device_release(rmem, dev);
+		kfree(rd);
+	}
 }
 EXPORT_SYMBOL_GPL(of_reserved_mem_device_release);
 
-- 
2.24.1

