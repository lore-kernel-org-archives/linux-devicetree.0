Return-Path: <SRS0=ZTIy=4Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1CC4C3F2C6
	for <linux-devicetree@archiver.kernel.org>; Sun,  8 Mar 2020 11:50:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7919820663
	for <linux-devicetree@archiver.kernel.org>; Sun,  8 Mar 2020 11:50:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PK6an+Pv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726397AbgCHLuc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 8 Mar 2020 07:50:32 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:44208 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726259AbgCHLuc (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 8 Mar 2020 07:50:32 -0400
Received: by mail-lj1-f195.google.com with SMTP id a10so6965095ljp.11
        for <devicetree@vger.kernel.org>; Sun, 08 Mar 2020 04:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AshgBR+MNWPZr69cg7ExJ3jWOPxd+MrMBUeiIC3Ic2I=;
        b=PK6an+PvHILt1iKzlYwWRFsPanyhDLYN54MTzbZqqzI8kZs15kYFb+wvgb0Okxo/7T
         29onyL5aRWiMBZGwyfyVyCiBKZ0dBI3yFedFkCG3qwLF5veRJx8QUq5Wd6dkNZ+bC4VU
         zxQG2Q5XwkXMLCdci8EGX7x2vej3aZrR2frQCuMJH1W4lyNC0ZivWev6yJXSe0rs/D8/
         CgFpAOi1yaE/ncdi+zlO7XHqpkKhCR/uWq3NMM1PamYDaHGDL9QpK+7aFhprq6I++HHc
         eC1AyoEF4Am79O4f59F8LuXQbc9IAy5VHVxNjy95NSkZgBgUxudATkpVjpBtR3LFmQxK
         MzVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=AshgBR+MNWPZr69cg7ExJ3jWOPxd+MrMBUeiIC3Ic2I=;
        b=o9AkzI5fmBZp/EUN73ah3cnNU9wNzg2f+Piekwl4sfY9kKNN8I3Lm7HGyi5iue5SuU
         LD4/utO7gRrC83Z44VD5dJrv1p8ZJEwCGPi6m2OPiaiuiwqdcHCn/uXW99NZk/G42YfD
         d8/qNB2Aqe7eaStJuinCzgljNVa2vYhoEAgdFhHUjtETwzxRFgR20MtglzNDfKqsiUAG
         NETU1wg0onad+nuZmJGgKHs7PZWl6QtV789q1wHr/2SaSx2J8NKT/CCQcplWGj1RxkWi
         muiU6/ZhC5IRd7mlwo0geeJvHzIskl6WC/doEbjB38sET/1XONv60Nsxff1zrYUIdXmZ
         GgOQ==
X-Gm-Message-State: ANhLgQ2wZ1RY9DlAIssKM02+kbqnSaoGdTXdJgK13qwDU88XyeBk+e40
        V2uoyEU5oy2Br4SBza51p4m7kzzi
X-Google-Smtp-Source: ADFU+vtqO/9fQA8QV3nrZp9fnmzE88QnN1xvqj1h89hr+K/XaXgxAjp3YEzdVwWAbaOfHMsTHYuKCw==
X-Received: by 2002:a2e:9243:: with SMTP id v3mr6780274ljg.159.1583668228335;
        Sun, 08 Mar 2020 04:50:28 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id u5sm8557572ljl.75.2020.03.08.04.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2020 04:50:27 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
        Maxime Ripard <mripard@kernel.org>,
        Benjamin Gaignard <benjamin.gaignard@st.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v1 0/1]: dt-bindings: display: fix panel warnings
Date:   Sun,  8 Mar 2020 12:50:16 +0100
Message-Id: <20200308115017.18563-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

While experiemnting with latest kbuild changes for DT Schema
support there was a couple a new warnings - in may use-case where
I only check one binding file.

Fix the warnings in display/panel/
There are plenty more to go after in other directories, which I
have left for others to have fun with.

Patch is on top of drm-misc-next, where it will be applied once acked/reviewed.

	Sam

Sam Ravnborg (1):
      dt-bindings: display: fix panel warnings

 Documentation/devicetree/bindings/display/panel/elida,kd35t133.yaml   | 2 +-
 .../devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml       | 2 +-
 Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml  | 4 ++--
 .../devicetree/bindings/display/panel/orisetech,otm8009a.yaml         | 2 +-
 Documentation/devicetree/bindings/display/panel/panel-dpi.yaml        | 2 +-
 Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml | 2 +-
 Documentation/devicetree/bindings/display/panel/raydium,rm68200.yaml  | 2 +-
 .../devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml         | 2 +-
 8 files changed, 9 insertions(+), 9 deletions(-)


