Return-Path: <SRS0=EXmG=33=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB847C352A3
	for <linux-devicetree@archiver.kernel.org>; Fri,  7 Feb 2020 09:02:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AF54B21741
	for <linux-devicetree@archiver.kernel.org>; Fri,  7 Feb 2020 09:02:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hza1KTfZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbgBGJCw (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 7 Feb 2020 04:02:52 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:44123 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726903AbgBGJCv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 7 Feb 2020 04:02:51 -0500
Received: by mail-pl1-f195.google.com with SMTP id d9so723138plo.11
        for <devicetree@vger.kernel.org>; Fri, 07 Feb 2020 01:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8M/+JKdLoe27r1QkgI6hunqV9+SJ7vAk/tNBmFTl07w=;
        b=hza1KTfZrcZ1cLVYVEDdUr/jIvAsku9QluA+QDTmDgNY77zs49q/Reb269x5AY4UM8
         QD7+elleyDZCAVm98iEvDjiwuBd5NXfl72cNGcJuMiO3AR72ZzeMikqXRvs2X6ZLVlN0
         mq4AtBDFJu+EfKYkx+7F3RiBIUd67rDHTfCb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8M/+JKdLoe27r1QkgI6hunqV9+SJ7vAk/tNBmFTl07w=;
        b=E1xkj1XW7ELEkcmts1HGtSz4twTkOewiuUBzvIyx78tNBm7lp7cYnPoD3IHtVZfQnz
         DLMtve1x1yLBtXEYHSbNXEeFdQg3WHf2I18YxEOf2TApyStGi097QYGmxg4+KUFGNa5A
         4m5Us5x1dMXGGzABgbDwUhOhoBRU4waSGTpneTQ4OI1LK2HlWPZCX3Nr2ut5Sgsoba8A
         Iy0lF/NwonFh0P+Ktr77/LuGeM0sgO01KCeJo/cFeJE90ZL4HnZHx2Zf17uDNp7JSp+c
         2LY48/KVuj6Ys7bMDlzzNWDKlKRt9dyNTxb8eEqA9jCr4zBkOv7Sl07kmD9JqfbOB29l
         fFsg==
X-Gm-Message-State: APjAAAWgssuc8i4mFUsmIYiU/5htHzyn8Fk84RO8wLd8n1wsq2/BQzox
        nSNdDB27/gHiX++iBZAeEjo8mg==
X-Google-Smtp-Source: APXvYqza2ipEubZur+4araOCqPbin70u2BC7nswqmXBXRQtznLERXJQIUiGybrHjcZpaHRX2VAs0Qw==
X-Received: by 2002:a17:90a:26ec:: with SMTP id m99mr2658469pje.130.1581066170832;
        Fri, 07 Feb 2020 01:02:50 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:b852:bd51:9305:4261])
        by smtp.gmail.com with ESMTPSA id w6sm2309463pfq.99.2020.02.07.01.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2020 01:02:50 -0800 (PST)
From:   Hsin-Yi Wang <hsinyi@chromium.org>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Nicolas Boichat <drinkcat@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Daniel Kurtz <djkurtz@chromium.org>
Subject: [PATCH v6 2/5] arm64: dts: mt8173: add uart aliases
Date:   Fri,  7 Feb 2020 17:02:25 +0800
Message-Id: <20200207090227.250720-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.25.0.225.g125e21ebc7-goog
In-Reply-To: <20200207090227.250720-1-hsinyi@chromium.org>
References: <20200207090227.250720-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add serial as uart aliases in mt8173.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 8b4e806d5119..790cd64aa447 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -50,6 +50,10 @@ aliases {
 		mdp_wdma0 = &mdp_wdma0;
 		mdp_wrot0 = &mdp_wrot0;
 		mdp_wrot1 = &mdp_wrot1;
+		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
+		serial3 = &uart3;
 	};
 
 	cluster0_opp: opp_table0 {
-- 
2.25.0.225.g125e21ebc7-goog

