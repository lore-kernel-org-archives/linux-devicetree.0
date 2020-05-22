Return-Path: <SRS0=I+Xt=7E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FBC7C433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 May 2020 12:08:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 25A48206F6
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 May 2020 12:08:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="z09pplDz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729961AbgEVMI1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 22 May 2020 08:08:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729184AbgEVMH0 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 22 May 2020 08:07:26 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D550C05BD43
        for <devicetree@vger.kernel.org>; Fri, 22 May 2020 05:07:24 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id u1so8429451wmn.3
        for <devicetree@vger.kernel.org>; Fri, 22 May 2020 05:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SYamWCGpGqZL1TdMciPU3s1N0hd2ppZ++0/IfJ1caGY=;
        b=z09pplDzbGu8zzHYZwmUG8WYuN5QnZoIThbQYmhBMWEdeanmgiQmeEaOJAAsMBH5co
         Vc9SJuMdt4nXdaLIqtA5xDnvUSVBnfcy8+HUHt+7XekAI9e36/NJH0qHuP3oPkZSLY28
         LxPlZYlsDw4W1ckHD0Es7lqGaXILSlhaTD2WhJ45RQCKFru6rVsyfbYXPtNE6rVrSQRh
         IE0Bnp/5oPPCepTQASBnHTtpJDXwfdNkKtDoTYs/yLZbblVMktuo8Y5utgxPeh07MRaN
         2JzjgOFu1d/xixp3xct7DO4Siv8YXryeMOIM+u9ZZWnonUMTeRGBc7bTnOhr9As4Kam8
         2eFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SYamWCGpGqZL1TdMciPU3s1N0hd2ppZ++0/IfJ1caGY=;
        b=SQ7/72AkCQNC/8D6B/mMuE5CByexKOvP42iH61Pj7kowPMySioVyZbiFcowSXxwYD+
         b/XV8vobfOGqU0pE5uE2/2nzhO5EBjTKma9I3jod5p/r2LIXfNjBH29LoQWi02WKEj6G
         W33xfSf9/nGzmWimLOTiaZmmXjQd5EIjlV62cpVEaIOfbNerQm1LA2om5TPmV5nCh3Fv
         9IFG2K3zVfy7Pk/unjX4IwnO/I9eZEpV18ymfLgci3AGdrANAe2rMa5Am2S4AcI1o9rd
         sC7DZxh2IP3VRAovR8XzdoFCDpOZJ4Pdywh3Ej7nmghGbRvHjtvt7L9SBcUNmc+Y4PN2
         j79A==
X-Gm-Message-State: AOAM5313m0W/4HSFwxu8fSXXyYZi3JOXn1dv3WOGTXDYNrog6NrOKmTI
        fbl/hiwbK5pvz6cTcleK+QqnaQ==
X-Google-Smtp-Source: ABdhPJw0hJl3cQP5flK/6nQax5Ceb2AK3ZRifZ2de+tpHbVYDyDSC0mU0F2KKkWDNbi4cMfQO0bWhg==
X-Received: by 2002:a1c:5402:: with SMTP id i2mr14046163wmb.185.1590149243221;
        Fri, 22 May 2020 05:07:23 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id f128sm9946233wme.1.2020.05.22.05.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 05:07:22 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Rob Herring <robh+dt@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Crispin <john@phrozen.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Mark Lee <Mark-MC.Lee@mediatek.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Fabien Parent <fparent@baylibre.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Edwin Peer <edwin.peer@broadcom.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Stephane Le Provost <stephane.leprovost@mediatek.com>,
        Pedro Tsai <pedro.tsai@mediatek.com>,
        Andrew Perepech <andrew.perepech@mediatek.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v5 02/11] dt-bindings: add new compatible to mediatek,pericfg
Date:   Fri, 22 May 2020 14:06:51 +0200
Message-Id: <20200522120700.838-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200522120700.838-1-brgl@bgdev.pl>
References: <20200522120700.838-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The PERICFG controller is present on the MT8516 SoC. Add an appropriate
compatible variant.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 .../devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
index 1340c6288024..55209a2baedc 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
@@ -25,6 +25,7 @@ properties:
           - mediatek,mt8135-pericfg
           - mediatek,mt8173-pericfg
           - mediatek,mt8183-pericfg
+          - mediatek,mt8516-pericfg
         - const: syscon
       - items:
         # Special case for mt7623 for backward compatibility
-- 
2.25.0

