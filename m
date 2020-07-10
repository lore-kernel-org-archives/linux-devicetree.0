Return-Path: <SRS0=VTvW=AV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D95AEC433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jul 2020 05:27:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AE88B20720
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jul 2020 05:27:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gp2t+uxT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726872AbgGJF0M (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 10 Jul 2020 01:26:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726288AbgGJFZO (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 10 Jul 2020 01:25:14 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 460B5C08C5CE
        for <devicetree@vger.kernel.org>; Thu,  9 Jul 2020 22:25:14 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id u64so5685015ybf.13
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2020 22:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=XAbjQkqFJHu/4T3iFsKodU4MZAQHWDS32dunmGjM4vA=;
        b=gp2t+uxTBmcyf3aoRt9iU1+ytBbeBlQJ4p02owquF6+K5VlJDTSW8ZT2e8pMK8z2k9
         iZPtkTBbTbqQdRQpt43Y5KWV/e123ul8Rvhv+nLppSUusntJegO4uUhnfoEjFDt6L9s1
         s56460M+apoZPOEPFK38ThhCiEt2vDHyBMVz8UxL5CgCNPTYwta7R8Pcj42wsoDuZl1g
         raxLovfS9u28TfBkb0vk/FQjFHnaD+48LziJtbLtzYQ1CxZQnR2DnHJNdEkENoWjluGw
         Lzkr30g/ShJH4Jq8JQ3/3XViktDy6gEyqIdUX1nj6O6RUdybBtdcXarUIF8Q84JWb344
         lUcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=XAbjQkqFJHu/4T3iFsKodU4MZAQHWDS32dunmGjM4vA=;
        b=EsMb2uaBtKH6u4Jwaro31ay6i7LbEHWo7uECcteDxB5TTkFjMKwwuVvcLwzdyg/V6w
         9spsHd9oLOBXOOyCC/fo5V6dz39BpiSUo6ONW7mBeiBAH91Jjgps9ciri9Pca9lEtps5
         W0D3mvXQ/EFmRd0daGeDbmKsfz7k5LeTylNmeRd2hrmigyR0FofZvIwbYl6OaB7KDR8z
         ZyOjGdlBgCHNZPmICi52Zz4VrrUeKTgvZ42dgGrWLmdlPoDlgicR5SCUtV8A3H49hNy1
         QETXoWlWC2BzAVVrMeI/hVwpP19k9mTd08uUawZO332VgUaRnMDqdw5umjhNhK0OxMNA
         PhJA==
X-Gm-Message-State: AOAM531JEOK/dVAQpYaJJZG9a7D39gWQZTirdkqp8HWmoRDovQvGm2WB
        q4fX+hD6G/QIm4q3ZNM+rdhupJRslXXz
X-Google-Smtp-Source: ABdhPJyu14MmPThhBCrePZPw5xrF424Jw8O4wEbivNq60fQi2mJXFLpGbPC9WzA1L3RF0hKzfV6sXlMF487E
X-Received: by 2002:a25:50c2:: with SMTP id e185mr15499758ybb.204.1594358713525;
 Thu, 09 Jul 2020 22:25:13 -0700 (PDT)
Date:   Fri, 10 Jul 2020 13:24:59 +0800
Message-Id: <20200710052505.3664118-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
Subject: [PATCH 0/6] ASoC: mediatek: mt8183: support DP audio
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     broonie@kernel.org, robh+dt@kernel.org
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        tzungbi@google.com
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This series is a follow up for a long time ago series
(https://patchwork.kernel.org/cover/11204303/).

The old series bound too much on the patches of DRM bridge and ASoC
machine driver.  And unluckily, the dependencies
(https://lore.kernel.org/patchwork/patch/1126819/) have not applied.

Revewing the ASoC patches in the old series, I found that they could be
decoupled from the DRM bridge patches.  And they are harmless as it is
an optional attribute ("hdmi-codec") in DTS.

This series arranges and rebases the harmless ASoC patches for
mt8183-mt6358-ts3a227-max98357 and mt8183-da7219-max98357.

The 1st and 4th patch add an optional DT property.  The 1st patch was
acked long time ago (https://patchwork.kernel.org/patch/11204321/).

The 2nd and 5th patch add DAI link for using hdmi-codec.

The 3rd and 6th patch support the HDMI jack reporting.

Tzung-Bi Shih (6):
  ASoC: dt-bindings: mt8183: add a property "mediatek,hdmi-codec"
  ASoC: mediatek: mt8183: use hdmi-codec
  ASoC: mediatek: mt8183: support HDMI jack reporting
  ASoC: dt-bindings: mt8183-da7219: add a property "mediatek,hdmi-codec"
  ASoC: mediatek: mt8183-da7219: use hdmi-codec
  ASoC: mediatek: mt8183-da7219: support HDMI jack reporting

 .../bindings/sound/mt8183-da7219-max98357.txt |  4 +++
 .../sound/mt8183-mt6358-ts3a227-max98357.txt  |  2 ++
 sound/soc/mediatek/Kconfig                    |  2 ++
 .../mediatek/mt8183/mt8183-da7219-max98357.c  | 29 +++++++++++++++++--
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c   | 29 +++++++++++++++++--
 5 files changed, 60 insertions(+), 6 deletions(-)

-- 
2.27.0.383.g050319c2ae-goog

