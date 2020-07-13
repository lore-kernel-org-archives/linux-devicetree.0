Return-Path: <SRS0=NyTY=AY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C86BDC433ED
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 06:09:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A7D112068F
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 06:09:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GYGiuENf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728950AbgGMGJR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jul 2020 02:09:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729134AbgGMGJQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Jul 2020 02:09:16 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A68FC08C5DD
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2020 23:09:16 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id w17so5046231ply.11
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2020 23:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S9AFTK5sy5b65UBrUgiCWog3nZlxaQr2qNRRBWOcbPY=;
        b=GYGiuENfFP6o43mQKJmCtCaiBzvFIFl8M3X6pt8Y/jF3H6QjVXoheulq75HmYFiVwR
         IUdmXt37vxJj1oj2OcUA4oVLgnvoZijJ2pS/ZanKlz3IvmIM/k7mXzIuzZh3h0oeu8Yz
         ApuZ3CsG8HnsQPFM41Vppah/130o7vKdymElo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S9AFTK5sy5b65UBrUgiCWog3nZlxaQr2qNRRBWOcbPY=;
        b=XcY/9C5kShqY7ZsYm7xscQ+/qku/j3/owFRXa+RUl9IFIEP0ZpCf56XyDc1q8JqeYb
         kpKyYnPz2yW8iDDiMHHQkXsbIJpKjB7F7r84R5T2IXB4/DRvXj9JFeqlH3MjjbK5JyzI
         sAZloGgJOphAnipp7dghEENkHsFYM9Ebxgu2PNyS0xLH5DTXJpFdi0aV2apmJtX9MOD7
         2LFOqB3NAd6h4RIJ2mDzgRo90CwwGb90pYIa4dNJyjeyil97SCemKUmRDHL0uC/5dw5q
         SrTuJPIrx4wr+KFs9aX+7BSFz9u+xAbgB7C57ieoj9T0V5ASx2HVRAR+/nxpdMPnFhJB
         A8yw==
X-Gm-Message-State: AOAM5308zU/UbPNYQ6Hg9bs2uy/WhdQLPFPQ61vjEAgshxAAV50TUPYE
        NZwErWnFmiu/6sI/d+umD2+2KA==
X-Google-Smtp-Source: ABdhPJx3SJkNWmCQs1+GoJ970CROhfFsXeZ9zlBtFpfasuDN/rfouoO4+8wFRudIjRawmBQHkbY/Vg==
X-Received: by 2002:a17:90a:f00d:: with SMTP id bt13mr19057042pjb.109.1594620556067;
        Sun, 12 Jul 2020 23:09:16 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
        by smtp.gmail.com with ESMTPSA id c134sm13134934pfc.115.2020.07.12.23.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2020 23:09:15 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Maoguang Meng <maoguang.meng@mediatek.com>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v3 02/16] dt-bindings: media: mtk-vcodec: document SCP node
Date:   Mon, 13 Jul 2020 15:08:28 +0900
Message-Id: <20200713060842.471356-3-acourbot@chromium.org>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
In-Reply-To: <20200713060842.471356-1-acourbot@chromium.org>
References: <20200713060842.471356-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The mediatek codecs can use either the VPU or the SCP as their interface
to firmware. Reflect this in the DT bindings.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>
---
 Documentation/devicetree/bindings/media/mediatek-vcodec.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
index b6b5dde6abd8..7aef0a4fe207 100644
--- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
@@ -19,7 +19,9 @@ Required properties:
 - iommus : should point to the respective IOMMU block with master port as
   argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
   for details.
-- mediatek,vpu : the node of video processor unit
+One of the two following nodes:
+- mediatek,vpu : the node of the video processor unit, if using VPU.
+- mediatek,scp : the noode of the SCP unit, if using SCP.
 
 
 Example:
-- 
2.27.0.383.g050319c2ae-goog

