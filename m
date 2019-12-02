Return-Path: <SRS0=pYa2=ZY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1A06C432C0
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 14:41:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B49462071F
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 14:41:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m5Uu3YHI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727455AbfLBOle (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Dec 2019 09:41:34 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:46110 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727362AbfLBOle (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 2 Dec 2019 09:41:34 -0500
Received: by mail-pg1-f194.google.com with SMTP id z124so2729535pgb.13
        for <devicetree@vger.kernel.org>; Mon, 02 Dec 2019 06:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=fNax18wcX7C+XdcgmNwyCdos/DnS6CZj6Krn7yJuSLo=;
        b=m5Uu3YHIeYeg96UchN1ICA2XS9xrqWDvhzV8iBxlPBvWvJKjVqdt2c7R4dZ5nURmVS
         6wFKRS/SwANUkaO5xasMyV8Dpp8ANEExTB1O5Q5WcCNm6KIfotVxT+L9tMW+Pp3f0WwI
         dNe3dkNPOit1wZwXsidSLLPxKPTiaRxSvBfe4GcjwZq8x6hLPV38mrabLVRYa0xVGbQx
         dDhT6aUTDMcoYAaHTGfODhPH3C9fkFsM+P8AgzaTaBZpoxcZu4xapFAKYy8J1ZqwGqyJ
         ccnbntgdYljcYcerWZzpJ5Wis9aBCBjOfiQEHjQDgJugGOCWrKxIGFoTCikL1xpDlr7C
         MnDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=fNax18wcX7C+XdcgmNwyCdos/DnS6CZj6Krn7yJuSLo=;
        b=cjDplySnIktFnBcQ4/HFq/Mgseoiy+NQyumDAoqja2wKjolEM+rjyOy8Tujc8sEfBL
         +Qlcm47UTD157/2nKjSsDoaK0r30d+jX4INvWDmEJo8Ev6QofSrpubkDcRFT5swoWXRs
         sJuGsLUAR1eaqVYOiKG9mv1q3yLIf+5/q3EgzEKZIAtffLeqyRxnR2CZ22DMwuDrhRiK
         uKeqPMUzAh2433pfuukzBHMpz85QCi2J0f9RIs/eXO8DS6qd48R5yot883HYQ7pEfQMN
         UNQZjthJXhCsd1fjRB33lBhxR1Hoi7Mz7wN8Q0Jww7kQpk0oFLFpa9zNf81AUXv2ans+
         uHhQ==
X-Gm-Message-State: APjAAAXU07q8oEZirKCf6dILhTkJR0xhYdmU/0byAPCVLjByqNdWGyfz
        MTKNGNo+UfJFrDDQCvAFzWkyXg==
X-Google-Smtp-Source: APXvYqzre6Yx5ByTcmXf9qDzGsbjnoVvvbAWKJTPq/fAMilUD+EZbL+d/adkkGA5wT9neooSXQnGXA==
X-Received: by 2002:aa7:870c:: with SMTP id b12mr12542985pfo.82.1575297693583;
        Mon, 02 Dec 2019 06:41:33 -0800 (PST)
Received: from localhost.localdomain (li519-153.members.linode.com. [66.175.222.153])
        by smtp.gmail.com with ESMTPSA id f30sm33985090pga.20.2019.12.02.06.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 06:41:33 -0800 (PST)
From:   Jun Nie <jun.nie@linaro.org>
To:     ulf.hansson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        adrian.hunter@intel.com, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 4/4] mmc: sdhci: Add DMA memory boundary workaround
Date:   Mon,  2 Dec 2019 22:41:04 +0800
Message-Id: <20191202144104.5069-5-jun.nie@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191202144104.5069-1-jun.nie@linaro.org>
References: <20191202144104.5069-1-jun.nie@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

DMA memory cannot cross specific boundary for some SDHCI controller,
such as DesignWare SDHCI controller. Add DMA memory boundary dt
property and workaround the limitation.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/mmc/host/sdhci.c | 20 +++++++++++++++++++-
 drivers/mmc/host/sdhci.h |  1 +
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
index d8a6c1c91448..56c53fbadd9d 100644
--- a/drivers/mmc/host/sdhci.c
+++ b/drivers/mmc/host/sdhci.c
@@ -763,9 +763,25 @@ static void sdhci_adma_table_pre(struct sdhci_host *host,
 		BUG_ON(len > 65536);
 
 		/* tran, valid */
-		if (len)
+		if (len) {
+			unsigned int boundary = host->dma_mem_boundary;
+			/*
+			 * work around for buffer across mem boundary, split
+			 * the buffer.
+			 */
+			if (boundary &&
+			    ((addr & (boundary - 1)) + len) > boundary) {
+				offset = boundary - (addr & (boundary - 1));
+				__sdhci_adma_write_desc(host, &desc,
+							addr, offset,
+							ADMA2_TRAN_VALID);
+				addr += offset;
+				len -= offset;
+			}
+
 			__sdhci_adma_write_desc(host, &desc, addr, len,
 						ADMA2_TRAN_VALID);
+		}
 
 		/*
 		 * If this triggers then we have a calculation bug
@@ -3634,6 +3650,8 @@ void __sdhci_read_caps(struct sdhci_host *host, const u16 *ver,
 			     "sdhci-caps-mask", &dt_caps_mask);
 	of_property_read_u64(mmc_dev(host->mmc)->of_node,
 			     "sdhci-caps", &dt_caps);
+	of_property_read_u32(mmc_dev(host->mmc)->of_node,
+			     "sdhci-dma-mem-boundary", &host->dma_mem_boundary);
 
 	if (of_property_read_u32(mmc_dev(host->mmc)->of_node,
 				 "sdhci-ctrl-hs400", &host->sdhci_ctrl_hs400))
diff --git a/drivers/mmc/host/sdhci.h b/drivers/mmc/host/sdhci.h
index cac4d819f62c..954ac08c4fb0 100644
--- a/drivers/mmc/host/sdhci.h
+++ b/drivers/mmc/host/sdhci.h
@@ -608,6 +608,7 @@ struct sdhci_host {
 
 	/* SDHCI_CTRL_HS400 value */
 	u32			sdhci_ctrl_hs400;
+	u32			dma_mem_boundary;
 
 	unsigned long private[0] ____cacheline_aligned;
 };
-- 
2.17.1

