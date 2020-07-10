Return-Path: <SRS0=VTvW=AV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40114C433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jul 2020 09:46:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1958520786
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jul 2020 09:46:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="hNwMpIXv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727948AbgGJJqI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 10 Jul 2020 05:46:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727919AbgGJJqH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 10 Jul 2020 05:46:07 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3A87C08C5CE
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2020 02:46:07 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id q17so2310159pfu.8
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2020 02:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=465i1Kpt2NwRNNufvgmbMABNJDV00YJPfsBsNetS4Nk=;
        b=hNwMpIXvhY22VD98T2/lMSywPXActXG8UtJOg+8jGv22E8zhPZFAu8RHnd4DYvZIEW
         Fbg+i0PCQFmB+Aa33eKPtPaxAKczqr9zc4t1G7SLDoxAm38maqXVsz9rN8RIMNjmexFs
         B1+Q09GQ+8YHjlo0+1mE9opkiFXuLacU5xNgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=465i1Kpt2NwRNNufvgmbMABNJDV00YJPfsBsNetS4Nk=;
        b=lMcKnLDrm/scwPvbPqSOG7mMUm5JBV/5y4hBfLeAOZp3ZrBrOWdl4PhCH/aMz/fMxG
         SRD/iiSzq1lsePaw3/yDtmw302Fo/7Nd7zBTJ2DPKkxAqwq1Erq8Di4KO+cqRuHfGB/f
         XNGGpS9K5KiFjPECP/2mXUyCCK3CxkWzQAvU9nGCTXMgGeZ5dv0p2s0pAM6lFEUoCFXK
         a0YbjRCngvy3iQFvp9Tp8RbiuHw4/HbtnSkg2MqB3vrJNzdBUqWRZcDtkfrPfL+86KyN
         1EYJCONQB9e1WwvROkxAEmGt7Ym5eiNNs7iWFE7WYVIypCDfL9VgnSSib73O5vKRaOxV
         SgLw==
X-Gm-Message-State: AOAM531uAklXcHL49WW7naTxki9fH4bIUK6gEfAC+kwD/NqM8DCrtUIY
        G7e/07G/qKlKDYXxJonOnQxi2w==
X-Google-Smtp-Source: ABdhPJzI5EHroNUdQ0RsCnphwbtefcNmfRpbW2/HjZod+pXWJ1APjnXEQ9aD8SOauzjBmMoQ1H/xRg==
X-Received: by 2002:a65:6707:: with SMTP id u7mr57718791pgf.233.1594374367292;
        Fri, 10 Jul 2020 02:46:07 -0700 (PDT)
Received: from shiro.work ([2400:4162:2428:2f01:7285:c2ff:fe8e:66d7])
        by smtp.googlemail.com with ESMTPSA id z9sm5133213pgh.94.2020.07.10.02.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 02:46:06 -0700 (PDT)
From:   Daniel Palmer <daniel@0x0f.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, linux@armlinux.org.uk, arnd@arndb.de,
        afaerber@suse.de, maz@kernel.org, w@1wt.eu,
        Daniel Palmer <daniel@0x0f.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH v5 02/12] dt-bindings: vendor-prefixes: Add sstar vendor prefix
Date:   Fri, 10 Jul 2020 18:45:34 +0900
Message-Id: <20200710094544.430258-3-daniel@0x0f.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200710094544.430258-1-daniel@0x0f.com>
References: <20200710094544.430258-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add prefix for Xiamen Xingchen Technology Co., Ltd

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index b09b6c9911c3..ba5bd3b0ed9a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -986,6 +986,8 @@ patternProperties:
     description: Spreadtrum Communications Inc.
   "^sst,.*":
     description: Silicon Storage Technology, Inc.
+  "^sstar,.*":
+    description: Xiamen Xingchen(SigmaStar) Technology Co., Ltd. (formerly part of MStar Semiconductor, Inc.)
   "^st,.*":
     description: STMicroelectronics
   "^starry,.*":
-- 
2.27.0

