Return-Path: <SRS0=sT6Z=YP=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D9A8CA9EA0
	for <linux-devicetree@archiver.kernel.org>; Tue, 22 Oct 2019 11:47:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E553A21783
	for <linux-devicetree@archiver.kernel.org>; Tue, 22 Oct 2019 11:47:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rWB904Gc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388821AbfJVLrB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 22 Oct 2019 07:47:01 -0400
Received: from mail-qt1-f201.google.com ([209.85.160.201]:35161 "EHLO
        mail-qt1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387977AbfJVLrB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 22 Oct 2019 07:47:01 -0400
Received: by mail-qt1-f201.google.com with SMTP id d6so17344451qtn.2
        for <devicetree@vger.kernel.org>; Tue, 22 Oct 2019 04:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=ZsrVaR6vc/qnzUA4wVz/77TV1vtgZkJHUiseGtW32fE=;
        b=rWB904Gcs2qVJZUdeAyoeepfzKedgnQjJZ4jfO3wA6WjqYb2giKU5Pzx6ySfLtL2A0
         C6G6kK2HU9Bq/aW8NNHtf4gVgn+a7FpdApE4JmhpKiKxDBdyJd5ELjOwCOUHnqAEC6ju
         p9UzXTH32R+O8Ob6C2dZTmDtGa3SCOUtc35f7m5G7APRhN3dqXcFTbK7RaQizelauCeW
         iMcqQAFx9SxO10nufCXxuspyLOK8zXPgo1FF7o2TKgZuNIcuq0cEjSqoZFlV/sw3o0ES
         qitFE0wo1hMeoSthzVhddP3lGNji2i8tKc+iG/apvGVcxGXfpqXwlRRIQTE4qIxwHAd6
         DFEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=ZsrVaR6vc/qnzUA4wVz/77TV1vtgZkJHUiseGtW32fE=;
        b=qbpojtwSe5nSyJ+1y1G2msOvkIWNV4XJa5Dj2HOP+yUhuD9qRoSqHbpP6rusEg9TqM
         b9zby2jpImXeZkrpjMdv5AJyKjMICOhCVlqDMD+Q4zFOz1+CnJN2Tapyw0T2XOsQWG9B
         tPwEZZIX+63nhUjjiWQI61DjXgJylZycZHt9Si0q1BLL9SUrLs7wzbvOFE6hPwJZuOIf
         QwYeuvr7BxPvBEXVfKuFSG4iJBPXILThSunIlD768lBcmFHW+OGAc7bCetWohcS7OQMc
         VqKEm8OK9gVP/xMq5A8qzKQdYaTXVS8EYa9lc4fuI/HfU0bTtc6LQtYnG6EX101OLIhT
         66Rg==
X-Gm-Message-State: APjAAAXZMHlaPfN8nRy54Cw+JPrtGDeBOHnM6TCasyhn2Uj2yB8ocZqs
        pBNUkpbOtZZMbiox8NUcnc3dr1sm/sog
X-Google-Smtp-Source: APXvYqwP2XO0+wPKaNKqstjcgNhdUynq5gHMc5aDViFMW7a988Y2xcf+1D8ZFjFrBT2cjoj1ZcA528RiWWjN
X-Received: by 2002:a37:8dc6:: with SMTP id p189mr2474821qkd.132.1571744819983;
 Tue, 22 Oct 2019 04:46:59 -0700 (PDT)
Date:   Tue, 22 Oct 2019 19:45:02 +0800
In-Reply-To: <20191022114505.196852-1-tzungbi@google.com>
Message-Id: <20191022193301.3.I37696eb1321a21846f9e5a9eb14dfac7dbe10663@changeid>
Mime-Version: 1.0
References: <20191022114505.196852-1-tzungbi@google.com>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
Subject: [PATCH 3/6] ASoC: dt-bindings: mt8183: add a property "mediatek,hdmi-codec"
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     broonie@kernel.org, robh+dt@kernel.org, narmstrong@baylibre.com
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com,
        jonas@kwiboo.se, jernej.skrabec@siol.net,
        dri-devel@lists.freedesktop.org, allen.chen@ite.com.tw,
        cychiang@google.com, dgreid@google.com, tzungbi@google.com
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add an optional property "mediatek,hdmi-codec".

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../bindings/sound/mt8183-mt6358-ts3a227-max98357.txt           | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt b/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt
index decaa013a07e..cc2845287e61 100644
--- a/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt
+++ b/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt
@@ -8,6 +8,7 @@ Optional properties:
 - mediatek,headset-codec: the phandles of ts3a227 codecs
 - mediatek,ec-codec: the phandle of EC codecs.
                      See google,cros-ec-codec.txt for more details.
+- mediatek,hdmi-codec: the phandles of HDMI codec
 
 Example:
 
@@ -15,6 +16,7 @@ Example:
 		compatible = "mediatek,mt8183_mt6358_ts3a227_max98357";
 		mediatek,headset-codec = <&ts3a227>;
 		mediatek,ec-codec = <&ec_codec>;
+		mediatek,hdmi-codec = <&it6505dptx>;
 		mediatek,platform = <&afe>;
 	};
 
-- 
2.23.0.866.gb869b98d4c-goog

