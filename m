Return-Path: <SRS0=Vyee=AT=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06405C433E0
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jul 2020 11:32:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D5D4C204EC
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jul 2020 11:32:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ajIHCSrd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728767AbgGHLcx (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jul 2020 07:32:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728730AbgGHLcx (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Jul 2020 07:32:53 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFD67C08C5DC
        for <devicetree@vger.kernel.org>; Wed,  8 Jul 2020 04:32:52 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id y3so51503169ybf.4
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2020 04:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=SXjS5MYE+OES8bqE7NYkGTk+6V5mx4sL9yP7xTJC9ec=;
        b=ajIHCSrd25kOA3bVHzUUWwIvUdeudcLWsMeItBZJAoqgHigZ4drMNILWBp0KTpetku
         hjBOSR3pwYzlc1mayhM1uBm79xFixi6c/PXMPJ8mqjEYDh77TE5HFnaSTTA7xZKgkrwx
         i6Xkxwl2ZMj/PUwCqVX23NxgB5F9P7qh/RalAC2oupjM/jyw3btHGfFRUKPa5TAAPkBx
         NJBXmgF6B7XBb0SFmOhFHUXROV5wCvoqn7IvZMUJ5cuJ4hTnUx4BYmJPlU4FjKgtQxw2
         WVtxGxWXRhr7HOoOtsdEsWPprlIFKfD2aQ2+gSQDikctb45GkAQPF4eE865Sh/ENM5Bo
         reBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=SXjS5MYE+OES8bqE7NYkGTk+6V5mx4sL9yP7xTJC9ec=;
        b=g+NW533cDbeG5MvsprFU4Pe5mZkw0LEgqKxoLCefcF+mJSN6/yCcRh8Wrv8wkgtfW/
         +nVT+Fe992QSguYTQ4lOQ5z89UcemOT9cICaVDs8puBEyQefydGDh8k7Utx1zur1pdS8
         gcaPWdIKZV/bW4xfvyqY0DLObBRW0abSV+lGbaV2di5n57fF9WTFbGqm1+CUXyoIQHqp
         /bVh+bceGsym7YkMkR5wEeSZvl960JafnoZPH6laRINN0FJQQuv/GWgBo2+Wy/xOX/tt
         eKC3OCeE7H5UYIeD1+1bVWPanU20v6zstIE0oyBBE5qV/VaQoZj6DzaDZesB10B5K605
         oogw==
X-Gm-Message-State: AOAM532tmw+4+Hpt8lU72+dlS/RVw1C9aW2va/hYCEHWo01suE8J1GI0
        gFkabSoSt4Ebe/+moekV/JhsEmhWXrYK
X-Google-Smtp-Source: ABdhPJzfEQPqdsUH+w7M5HxIbKMttNmVUXAlFyBkxTQRJfzPeKnudu2L2Gi8mEZZz1+QbxrrAnwD9N6F/+HS
X-Received: by 2002:a25:f509:: with SMTP id a9mr100220280ybe.227.1594207972178;
 Wed, 08 Jul 2020 04:32:52 -0700 (PDT)
Date:   Wed,  8 Jul 2020 19:32:32 +0800
In-Reply-To: <20200708113233.3994206-1-tzungbi@google.com>
Message-Id: <20200708113233.3994206-3-tzungbi@google.com>
Mime-Version: 1.0
References: <20200708113233.3994206-1-tzungbi@google.com>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
Subject: [PATCH 2/3] dt-bindings: mt8183: add compatible string for using rt1015
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     broonie@kernel.org, robh+dt@kernel.org
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        tzungbi@google.com
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Machines with rt1015 should use the compatible string
"mt8183-mt6358-ts3a227-rt1015".

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../bindings/sound/mt8183-mt6358-ts3a227-max98357.txt        | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt b/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt
index decaa013a07e..5afd3d8dab84 100644
--- a/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt
+++ b/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt
@@ -1,7 +1,8 @@
-MT8183 with MT6358, TS3A227 and MAX98357 CODECS
+MT8183 with MT6358, TS3A227, MAX98357, and RT1015 CODECS
 
 Required properties:
-- compatible : "mediatek,mt8183_mt6358_ts3a227_max98357"
+- compatible : "mediatek,mt8183_mt6358_ts3a227_max98357" for MAX98357A codec
+               "mediatek,mt8183_mt6358_ts3a227_rt1015" for RT1015 codec
 - mediatek,platform: the phandle of MT8183 ASoC platform
 
 Optional properties:
-- 
2.27.0.383.g050319c2ae-goog

