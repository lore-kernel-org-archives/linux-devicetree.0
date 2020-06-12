Return-Path: <SRS0=uNWD=7Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 243EBC433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:20:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 05286206C3
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:20:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GDxRkpdG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbgFLOUN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 12 Jun 2020 10:20:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726523AbgFLOUN (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Jun 2020 10:20:13 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED7AEC03E96F;
        Fri, 12 Jun 2020 07:20:12 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id h5so9941766wrc.7;
        Fri, 12 Jun 2020 07:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ypLjGwiWvtd9+3clCqAju9AHF2v/0LJMoYgXq+yjGNU=;
        b=GDxRkpdGYwzfUlRL9Pp/N36JVvhMvXjzjyVrhnUsNP03/QBykL2QnWUYE4jGIvy1pG
         Vle202pNTDzrv7ffXl57KS3CWLDzOP5YWyHBqKNEMe+OE03EELSpGwT4i9IAix7Xo0Ic
         6+EjOZ47zsCZzLMeamthSTNJrx6vXdGG3tY/Ut6TFmxrcBm85X8haO0nwpwWyliByqTC
         6x2ol1pOtsOGvk9yLk8sAWTicYRlpHM02Tso3f5hFPGbhNuBztzeOgTC6FaY2gd/d2xH
         8DJPwYEXj51lNZHTKvOEpefeYyJz26lhTowhe8aM1NIkozaC816c5nFbu6uE58CRWgtH
         fOmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ypLjGwiWvtd9+3clCqAju9AHF2v/0LJMoYgXq+yjGNU=;
        b=NoLbwOiKIOxZ6Bac7jOZbwkv45sx3vPHpm3w2HbJlIVX5mVKrHsyYurbeaURobDvtu
         feawJ96JOTdX9JIx0GqMD6ggDyynyBmZWsXIwOSruougFtW+9E31R91IAf/aL8im190x
         UNquRgxhfHy6n4IFPE7eE+V8mNT36QBiiHnf7UH/DwyX7g0TVh3kBg8LcwbY8JVC9GVZ
         9W+F3nF43poP8ERAVTMCRugjEs3rR9dDPSXw8mR92p0FAJb1pTr9/iITw/t7JPtwicqS
         Yaf6txdwHciCuRZd6KUjeiKdUGnzbrs0NlWbnmGheXBwTxAt0vzqlVEu9kScSd80/1ad
         tB1Q==
X-Gm-Message-State: AOAM531PiREC1Dq++eVO5jMgV4VwLn4wgI4HVQ5YheojbSe9wLfDvwGe
        2OMoACRWNEZqsDX5mNW+oJY=
X-Google-Smtp-Source: ABdhPJwyQvbHaDRodmywH1ep1wMC0MiJjz9KS9WWrY/61igFpuk/ROYX8LEHQzcpN0dn5hqK9RNGfA==
X-Received: by 2002:a05:6000:1192:: with SMTP id g18mr16001977wrx.326.1591971611739;
        Fri, 12 Jun 2020 07:20:11 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id y37sm11209708wrd.55.2020.06.12.07.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 07:20:11 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 31/38] dt-bindings: panel: simple: Use unevaluatedProperties
Date:   Fri, 12 Jun 2020 16:18:56 +0200
Message-Id: <20200612141903.2391044-32-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200612141903.2391044-1-thierry.reding@gmail.com>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Using "additionalProperties: false" results in rejecting any of the
properties defined in panel-common.yaml, whereas the intent is to
inherit the common properties defined in that file.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 34fe3d42b829..c58bc90ffd43 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -275,7 +275,7 @@ properties:
   port: true
   power-supply: true
 
-additionalProperties: false
+unevaluatedProperties: false
 
 required:
   - compatible
-- 
2.24.1

