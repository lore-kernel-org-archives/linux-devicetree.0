Return-Path: <SRS0=EXmG=33=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE835C352A3
	for <linux-devicetree@archiver.kernel.org>; Fri,  7 Feb 2020 09:03:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C2239217BA
	for <linux-devicetree@archiver.kernel.org>; Fri,  7 Feb 2020 09:03:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Fn+OG7lu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727114AbgBGJDC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 7 Feb 2020 04:03:02 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:41793 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727047AbgBGJDB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 7 Feb 2020 04:03:01 -0500
Received: by mail-pf1-f193.google.com with SMTP id j9so933400pfa.8
        for <devicetree@vger.kernel.org>; Fri, 07 Feb 2020 01:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U4T1sUZ5d5/lE7jdAROdnSabgnZhFUdcqE+KF1UFLYs=;
        b=Fn+OG7luKfdpaUPbm4ZGXmPEqV3LZyqVgV0nfHGsdtPTUzhxhdSATo8QnpvDaYb2q6
         DTPqGj/6KU5giBg6vcgCoA902QAvFzhJaHSKdzfQX2nHZEwnpkIc9oaXtunz5P5KAgtQ
         ckRDvto5jiIeXjaZOcNpQffkaCh4SGfGOnDVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U4T1sUZ5d5/lE7jdAROdnSabgnZhFUdcqE+KF1UFLYs=;
        b=MHrvUA9G+fKQ7GL6dftYRD0c8kAl0aUneATibfx7d9eXqXi4qSuBSLPW8SYKPhybwE
         OHve8TNnjQAFvK8hwWnuJ4pa48XHdQvdj/cJ30uE8/RR48K5LbmBbb5ReCM6V+HLKq9A
         4L36SJEDwGbZxUBuTpUO12bsnDxOSObX5MCH8Y+fqRdwokfyq2oiwEPBhMfF8lRJ8st/
         RaMl65dpOMoI8s1wIMbVsdL3wFpgpWAuwCdUBd8cLjuo4wHcaYYJVIj5ckYnsfeQbQWu
         T+XKoK7Ol0Ad0UrPCxjhJshTdmpIit2Cql/xlHl8t2ng5/0aiylmXywFYWILytPCE3kJ
         eGQA==
X-Gm-Message-State: APjAAAVIMluVwnNykzvQzKu89eswNxdynS4ipV/CXr0+DkZ/aLYjURsL
        YrtBUUElTFXZXSetBds6MqZQRA==
X-Google-Smtp-Source: APXvYqwt2xS7dRaSk9li7XQLco0yTFU/LJq7YNSPtj1ygZ/Wtqk85YoLi78cgiUvBFNXikSZvzMZ3A==
X-Received: by 2002:a63:a807:: with SMTP id o7mr8178878pgf.407.1581066180243;
        Fri, 07 Feb 2020 01:03:00 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:b852:bd51:9305:4261])
        by smtp.gmail.com with ESMTPSA id w6sm2309463pfq.99.2020.02.07.01.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2020 01:02:59 -0800 (PST)
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
Subject: [PATCH v6 5/5] media: mtk-mdp: Use correct aliases name
Date:   Fri,  7 Feb 2020 17:02:28 +0800
Message-Id: <20200207090227.250720-6-hsinyi@chromium.org>
X-Mailer: git-send-email 2.25.0.225.g125e21ebc7-goog
In-Reply-To: <20200207090227.250720-1-hsinyi@chromium.org>
References: <20200207090227.250720-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

aliases property name must include only lowercase and '-'. Fix in dts
and driver.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
index 9afe8161a8c0..0c4788af78dd 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
@@ -15,10 +15,10 @@
 
 
 static const char * const mtk_mdp_comp_stem[MTK_MDP_COMP_TYPE_MAX] = {
-	"mdp_rdma",
-	"mdp_rsz",
-	"mdp_wdma",
-	"mdp_wrot",
+	"mdp-rdma",
+	"mdp-rsz",
+	"mdp-wdma",
+	"mdp-wrot",
 };
 
 struct mtk_mdp_comp_match {
-- 
2.25.0.225.g125e21ebc7-goog

