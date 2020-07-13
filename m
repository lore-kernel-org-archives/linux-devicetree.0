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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F6C8C433E3
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 06:10:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0B63920791
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 06:10:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="e9eJSJSi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729260AbgGMGJg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jul 2020 02:09:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729254AbgGMGJf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Jul 2020 02:09:35 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9677C061794
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2020 23:09:35 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id gc9so5704315pjb.2
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2020 23:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B5SJRhGUMLnGQMUFDntsl5BWZJUWM/0k6ncUijg6biA=;
        b=e9eJSJSiGF6WMtv/BO8xgn4y9lS+3engHpcoQj4ttFSeWSlM7pKNQxEcW/PeneO269
         PHRBri/i+spv6QDrGPYwZgYqJXg9yVXafWGAv+QOUxZzmB3iw39KZ4wiGdPewdO+wSte
         z/gW5kkn0iQxcQGOIGluwcOdvFOcANOep/3TU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B5SJRhGUMLnGQMUFDntsl5BWZJUWM/0k6ncUijg6biA=;
        b=dEEGDRQgn9lVoiaxYH+zZONLvenELhwhRWrRhiA23TVA0wbDAP5bYu4v/223emBtgb
         Z6RXTpU4jXltW0t9DDIrkfGYwduX2SUfI57NFOcA52Kmzgzg8O3h8gltVJNAsThItsgP
         Nq9JCgAorPXaexWF7Op8I8HWjf61w+4UqYyP/8rNlh0SEDaDlXGJNBmMxPh0ZYEr6ulj
         9MZNwGkNVPL0S9G0K/gQqLrj7WwUq6bSuVZOe1XPjrgVAZZrOqmmVt4N508pQHhJdK03
         bndjajmTGGcT8HOs72zjl8+BwsYSjFeya0P530TPKvPdTOV97ey48sHik84Ru1u1T7Hv
         Anvw==
X-Gm-Message-State: AOAM532ijyVPpvmZm41FBuD3d42fEUDpt3nlzGtm5N26KRrLirl988Dn
        aY5CVPfmDEzo3phfegKPET0Jsg==
X-Google-Smtp-Source: ABdhPJyfrsgnEB025G3HB/bdasCZtlOPEKmabswNGrrw3Z/BVQ8GGnY3KH9KNkNIzG22M+kR6d/lyg==
X-Received: by 2002:a17:90a:e60b:: with SMTP id j11mr18907748pjy.189.1594620575272;
        Sun, 12 Jul 2020 23:09:35 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
        by smtp.gmail.com with ESMTPSA id c134sm13134934pfc.115.2020.07.12.23.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2020 23:09:34 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Maoguang Meng <maoguang.meng@mediatek.com>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v3 08/16] dt-bindings: media: document mediatek,mt8183-vcodec-enc
Date:   Mon, 13 Jul 2020 15:08:34 +0900
Message-Id: <20200713060842.471356-9-acourbot@chromium.org>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
In-Reply-To: <20200713060842.471356-1-acourbot@chromium.org>
References: <20200713060842.471356-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

MT8183's encoder is similar to MT8173's.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 Documentation/devicetree/bindings/media/mediatek-vcodec.txt | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
index 7aef0a4fe207..8093335afecb 100644
--- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
@@ -4,8 +4,9 @@ Mediatek Video Codec is the video codec hw present in Mediatek SoCs which
 supports high resolution encoding and decoding functionalities.
 
 Required properties:
-- compatible : "mediatek,mt8173-vcodec-enc" for encoder
-  "mediatek,mt8173-vcodec-dec" for decoder.
+- compatible : "mediatek,mt8173-vcodec-enc" for MT8173 encoder
+  "mediatek,mt8183-vcodec-enc" for MT8183 encoder.
+  "mediatek,mt8173-vcodec-dec" for MT8173 decoder.
 - reg : Physical base address of the video codec registers and length of
   memory mapped region.
 - interrupts : interrupt number to the cpu.
-- 
2.27.0.383.g050319c2ae-goog

