Return-Path: <SRS0=uNWD=7Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A592C433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:20:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B48C20792
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:20:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mo+Brxis"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726557AbgFLOUK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 12 Jun 2020 10:20:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726523AbgFLOUJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Jun 2020 10:20:09 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63307C03E96F;
        Fri, 12 Jun 2020 07:20:09 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id x6so9881517wrm.13;
        Fri, 12 Jun 2020 07:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CkDU/9COAIynQZ3sVXAHvVVdh7gsIrjT4HUFVA0nUus=;
        b=Mo+Brxisf5J+PGK7Sl8s21Kh6Ngw+5GiTYs1NwVn36Cxnhu7JaifEpGrJN1rISbTqD
         4g5fswL4nwoToJ9igsRBeGjw1ZhtFMWPeFcH4pXLcM11/4fGLeIDYGIEseO3nbIo+WWo
         /v7nl8zcw7ziA6IxllXFq+DUFdKMqfxNZqXdQNrGCXcI/Pza0rMLpKAN0I8l/Tv46fkP
         TtiJS8LpSqhMlRQF+l2iBMEuPNBGoYs4BlxirUBcON7ZJT1jjMAVll0iXfTJM231fRfV
         W18LaznoES1jAII6qgRLmamRftPYOmrX00IbHxTNdYCXoRG3GfPc8gOjbg2vwz14+ly1
         nrhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CkDU/9COAIynQZ3sVXAHvVVdh7gsIrjT4HUFVA0nUus=;
        b=ZTGL/F+ldss0Omjk0r9tCx2ihz6txDXS0/So57QhDHWAgR7+xr9qP0jYr19a7n2on2
         92/2HL9d5Oe/bOWVTyk6Ly7E36ltAxg3km7qmMSQYlyUjZFEjqvu9DlcFJHMjd5GNum5
         eClgpHDLKWaZtOZzaHbq2FJqXanISukwJAfwkJ0un5siCfRhra5XD8HuVwg1pw/yzl2+
         XRrqQH0l6iSiWo2balPiOQNDXidclcZJpnq+CMSS2ChKCOB8NS5LVn6XUJrh8cvxWdqe
         WgdBJy1TmXTaFUQ4hFaFxLkATspQKkS6VywkuM0x3D82At13Nwidi6BCGrGig8j7gy3q
         WDRw==
X-Gm-Message-State: AOAM533hzykvWHEQGP84b5LIylI40jhhd1B/DybqPodBBMBYxUd9BhwT
        uuVm7UAw1cng26RRvWkh4hOElg6/
X-Google-Smtp-Source: ABdhPJyrs3p3+wp3IVKMCX9vr+EVEnxI0Dq637fbYfRQEpZXv4mRLtAoSNef3HiuW7ZoWbu/ksjfyg==
X-Received: by 2002:adf:d852:: with SMTP id k18mr15435121wrl.177.1591971608184;
        Fri, 12 Jun 2020 07:20:08 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id g18sm9770049wme.17.2020.06.12.07.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 07:20:07 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 29/38] dt-bindings: tegra: pmc: Increase clock limit for power domains
Date:   Fri, 12 Jun 2020 16:18:54 +0200
Message-Id: <20200612141903.2391044-30-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200612141903.2391044-1-thierry.reding@gmail.com>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Power domains (such as the SOR domain) can have more than 8 clocks. Bump
the limit to 10 which is enough as of now.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
index 81534d04094b..881bfc6154e2 100644
--- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
@@ -213,7 +213,7 @@ properties:
         patternProperties:
           clocks:
             minItems: 1
-            maxItems: 8
+            maxItems: 10
             description:
               Must contain an entry for each clock required by the PMC
               for controlling a power-gate.
-- 
2.24.1

