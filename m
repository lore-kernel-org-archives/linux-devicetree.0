Return-Path: <SRS0=pmuo=6W=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EA4EC47254
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 May 2020 22:59:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3DB8A206B9
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 May 2020 22:59:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="n9+oTteo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728289AbgEHW7Z (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 8 May 2020 18:59:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728280AbgEHW7Y (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 8 May 2020 18:59:24 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08C75C05BD09
        for <devicetree@vger.kernel.org>; Fri,  8 May 2020 15:59:24 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id r10so1056029pgv.8
        for <devicetree@vger.kernel.org>; Fri, 08 May 2020 15:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vsTJfgywY7Yh1c9SFAQgkpGdzTCsAoe2msx951M+8gg=;
        b=n9+oTteokcsg2gGmnR4zRXRtCjsq5CrG2/r4VvKp5PLRS6msCbvUx5BSWg8VI7PfNH
         fzOsZRW3n3BzVqfaRQEfeYZ0ExlYzMI38EGyARXFt1+uLUQiP9Ay33UhJpvbrHKTotIb
         LxOQG9/Gg5iz7YwU/lMlQXNVEpWwfcZUhnxWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vsTJfgywY7Yh1c9SFAQgkpGdzTCsAoe2msx951M+8gg=;
        b=kboAQIYKgo4vDfR5VQAmMVtRIv4whk6YdseN5MURbo7vhf/YUZNq6qg6DiS9R6Johh
         Mq0mltkFeEbH9y3mWNGzAznnTs50JrTy8ItCbgC9ZnLybQvlE6M71CN31mOLpd9UZERy
         Rp9LxBHPGIzWcOu1C/eukkD3Gmc/vGFoMbcw4AEd6G3Pk0Ds6Yhb/X+LVNVIk7+pnQRH
         MJKIy1ID7VbQbzBVI3uEBmjmo5HPodJ1Ww5G/737BvDKVydHnGXeGmjnBAZCv2iht23x
         AHIXPbsgiauLDQE6nWeI4asjR0i/eC92Y9OVmeSRgUvOnAvcAwCkyVqG1FrUurHQXoIc
         qLOw==
X-Gm-Message-State: AGi0Pubg2RJ/DNCEANKMwZLNfv/4/JrYE4YaDEXzSg7EZ6e801itC6Ds
        1uYq4vlcn289stcRyFCeTaCB5g==
X-Google-Smtp-Source: APiQypLZztC92CaipNrfEO6dJof+q2mxxAWh+ZlB67X3GIWQuimnyFCwmWlKu1p11C9clTK29MCtRg==
X-Received: by 2002:a62:780b:: with SMTP id t11mr5202971pfc.196.1588978763500;
        Fri, 08 May 2020 15:59:23 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id i72sm3062874pfe.104.2020.05.08.15.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2020 15:59:23 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     robdclark@chromium.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: display: simple: Add BOE NV133FHM-N62
Date:   Fri,  8 May 2020 15:59:01 -0700
Message-Id: <20200508155859.2.I37c879ef4ec6d4028a3d45728bc3a58060bba175@changeid>
X-Mailer: git-send-email 2.26.2.645.ge9eca65c58-goog
In-Reply-To: <20200508155859.1.I4d29651c0837b4095fb4951253f44036a371732f@changeid>
References: <20200508155859.1.I4d29651c0837b4095fb4951253f44036a371732f@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This panel appears to be the same or nearly the same as the BOE
NV133FHM-N61, but since (in the very least) it identifies itself as a
different model in the EDID we should add a new compatible string for
it.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index fdd74d07f645..d6cca1479633 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -75,6 +75,8 @@ properties:
       - boe,nv101wxmn51
         # BOE NV133FHM-N61 13.3" FHD (1920x1080) TFT LCD Panel
       - boe,nv133fhm-n61
+        # BOE NV133FHM-N62 13.3" FHD (1920x1080) TFT LCD Panel
+      - boe,nv133fhm-n62
         # BOE NV140FHM-N49 14.0" FHD a-Si FT panel
       - boe,nv140fhmn49
         # CDTech(H.K.) Electronics Limited 4.3" 480x272 color TFT-LCD panel
-- 
2.26.2.645.ge9eca65c58-goog

