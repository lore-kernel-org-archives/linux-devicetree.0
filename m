Return-Path: <SRS0=VTvW=AV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80FF2C433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jul 2020 05:29:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6005E20720
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jul 2020 05:29:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CNGVSJ/w"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727819AbgGJF3O (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 10 Jul 2020 01:29:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726201AbgGJFZS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 10 Jul 2020 01:25:18 -0400
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4A84C08C5DC
        for <devicetree@vger.kernel.org>; Thu,  9 Jul 2020 22:25:17 -0700 (PDT)
Received: by mail-pf1-x44a.google.com with SMTP id v25so2931919pfm.15
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2020 22:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=Y3EnggORWF57ZGrCyAOh8m6NEpj3i0woYDKiuIiNxkM=;
        b=CNGVSJ/w2CjjKVrEYvQCv4OOefV+Hd1i3GxaKDWstjvFqwC2HnTNtl0+7zDdhc/KJm
         OE17u3CuJ5Ezxcznzbr/ocM8CDKE5N/1c/XmO48OP+zGI1YzFe2jKzZYW/TihiOhr/6h
         crnexX0iC8SQ2FS4OWLkf7MlSWjddZDZ31NDz2sGywrqCdAxvoy47S+ztfcpzr//DlOi
         Zv1oUq1obOyVQv0eqUFDa/5Nxd5xGX5h0YClMJ4MlOODK3yGRoVPrdINUb9mgdxnSSfQ
         SUmy8Yc1LWLuKfy0XzJdAlPk7L2VdwXqGx/2Ysrd4w58N+2n/8gyf5aUWAJgEigafIJM
         g7Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=Y3EnggORWF57ZGrCyAOh8m6NEpj3i0woYDKiuIiNxkM=;
        b=DfPFdsii8tQkmT+vQqJWKdAGAz0qR42WiAqmUhR9lXnWVuT5uyNVQ6pCCSkfBSnoDq
         qe6AHrM9mIAolEZ5Vsu4DdCjzxxuRjtZubwzi1I2VCG38zunaJrN/n5GldOQoPw2ERQw
         DgyRyLIGY6rvKyOe1di+b/Ub7Tfn4ALdiTlTE9N5gsBYcQQJABmR5ZuJDKq5QW8jCpws
         VCDe4joMH3QIgRcN/ImK9Qs84J+Bt2prTXuJBeoYt9VdhJj34B/kVshAK9HhwwKN8WA0
         AcO3BwMVF2d4M0RLafdRS0/+tPfNgv1KRlsm9Wh9iUG6hMADCZFrvG8fWtnIbLXzLBvj
         VH8g==
X-Gm-Message-State: AOAM5332c111mkud9DOzg+U/fVCCsL2kgLWz9WCASS/8iCSmsjGZBFso
        I5KWK4SUz+lIKKFGsIQ7Bld/cZMtnaPC
X-Google-Smtp-Source: ABdhPJx7Q4sBEZvytM2P7Fdfv06kQBXfBYR8li9S1VV5buJUiQWhcdM4KNipGKo3SyEuxPkBzRNSi0NV3qOW
X-Received: by 2002:a17:902:b287:: with SMTP id u7mr47682560plr.107.1594358717464;
 Thu, 09 Jul 2020 22:25:17 -0700 (PDT)
Date:   Fri, 10 Jul 2020 13:25:00 +0800
In-Reply-To: <20200710052505.3664118-1-tzungbi@google.com>
Message-Id: <20200710052505.3664118-2-tzungbi@google.com>
Mime-Version: 1.0
References: <20200710052505.3664118-1-tzungbi@google.com>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
Subject: [PATCH 1/6] ASoC: dt-bindings: mt8183: add a property "mediatek,hdmi-codec"
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     broonie@kernel.org, robh+dt@kernel.org
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        tzungbi@google.com, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Adds an optional property "mediatek,hdmi-codec".

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../bindings/sound/mt8183-mt6358-ts3a227-max98357.txt           | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt b/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt
index 5afd3d8dab84..5e455129eb96 100644
--- a/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt
+++ b/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt
@@ -9,6 +9,7 @@ Optional properties:
 - mediatek,headset-codec: the phandles of ts3a227 codecs
 - mediatek,ec-codec: the phandle of EC codecs.
                      See google,cros-ec-codec.txt for more details.
+- mediatek,hdmi-codec: the phandles of HDMI codec
 
 Example:
 
@@ -16,6 +17,7 @@ Example:
 		compatible = "mediatek,mt8183_mt6358_ts3a227_max98357";
 		mediatek,headset-codec = <&ts3a227>;
 		mediatek,ec-codec = <&ec_codec>;
+		mediatek,hdmi-codec = <&it6505dptx>;
 		mediatek,platform = <&afe>;
 	};
 
-- 
2.27.0.383.g050319c2ae-goog

