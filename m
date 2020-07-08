Return-Path: <SRS0=Vyee=AT=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2035C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jul 2020 11:32:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B4D4120772
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jul 2020 11:32:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tPhU/g97"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728706AbgGHLcq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jul 2020 07:32:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728410AbgGHLcq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Jul 2020 07:32:46 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E498DC08C5DC
        for <devicetree@vger.kernel.org>; Wed,  8 Jul 2020 04:32:45 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id s7so50885408ybg.10
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2020 04:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=YgBvzWR/6mpx68PUV0u/0UmSPzbBc/aq4zhlyxD89Lg=;
        b=tPhU/g97C2Z9SoM8ukg3lyY+3LzQapj8WUc18iKxxIvFIPIBVYsImiZZTksfXNn0Rp
         /u6MVD8RMLKN4oTgFKBWgkrPq2rchoAerhtQugqBXsWQ1mk88GWSFlEw3PRwCm7UnLHk
         hPtY06QOpF0a/mfdYHGH9u+h3e+3EcKLjrZauYyYRCLWHbZmmK4mgWNCiCGk8RO6S9Li
         sYog2Ghm34YtGC1ehfzdKSHJ7zi31GisiZyyiaLy8JSBuIlBJcyo95nU7jRU3m3n5ddt
         oMSc4gO25rUxH0TolfImhu386WOMWG61g0d5Vt9eIVrw5mbgX+4UkJ2Wq46c3kyC1kjE
         DGVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=YgBvzWR/6mpx68PUV0u/0UmSPzbBc/aq4zhlyxD89Lg=;
        b=Gc56ciZ749SYYGSR0KTRtS1PyeT7z6lvEXbsPzx0mGUokN3gDbiiZTX4tM20jQdcVo
         aDheVwmqBJIEIFWneThgiPHsUDl04OR8sGNnvfPovlbw31vUwEtFmU7NDCTNtInQ+vOz
         CkwHEA5l+M/L8NQBq0T5YOUejXNgg8sdft3TPN2wKcP2b1AslbJqckpcDIbB6eg1or78
         uwerGRshxp0z6n+YDFagTOr3+isUFhlAzhk6NgEcvuHqXEKnD8K+htHMlg9nAHt289rQ
         0gbyeng038LYls6aRPawROeCMgWTxcKTSE8U1ytsAFi9QkBb0Ff4xpVGamIXD6gGrTvD
         L/jg==
X-Gm-Message-State: AOAM531Im0iCY+MK5GKw17pz/FgDJMpNOeGGxyeBmGq74a5ntaLHhgji
        DQWUl4qDJCFenHST/q2V98DMJ2xmARlA
X-Google-Smtp-Source: ABdhPJwU4spJyyoGNxb4Jb/Nayvl3kBlAxo/YfV/UKlWZ45gyrvKZTUsEkc+OeRI3n3s+NQ3+Y/0sJm9ITXu
X-Received: by 2002:a25:2e43:: with SMTP id b3mr95187736ybn.190.1594207965184;
 Wed, 08 Jul 2020 04:32:45 -0700 (PDT)
Date:   Wed,  8 Jul 2020 19:32:30 +0800
Message-Id: <20200708113233.3994206-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
Subject: [PATCH 0/3] ASoC: mediatek: mt8183: support machine driver for rt1015
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     broonie@kernel.org, robh+dt@kernel.org
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        tzungbi@google.com
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This series tries to reuse mt8183-mt6358-ts3a227-max98357.c for supporting
machine driver with rt1015 speaker amplifier.

The 1st patch is straightforward: re-order the header inclusions.

The 2nd patch adds document for the new proposed compatible string.

The 3rd patch changes the machine driver to support either "MAX98357A" or
"RT1015" codecs.

Tzung-Bi Shih (3):
  ASoC: mediatek: mt8183: sort header inclusions in alphabetical
  dt-bindings: mt8183: add compatible string for using rt1015
  ASoC: mediatek: mt8183: support machine driver with rt1015

 .../sound/mt8183-mt6358-ts3a227-max98357.txt  |   5 +-
 sound/soc/mediatek/Kconfig                    |   5 +-
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c   | 171 +++++++++++++++---
 3 files changed, 153 insertions(+), 28 deletions(-)

-- 
2.27.0.383.g050319c2ae-goog

