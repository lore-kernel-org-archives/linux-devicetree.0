Return-Path: <SRS0=L07u=CG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08E75C433E6
	for <linux-devicetree@archiver.kernel.org>; Fri, 28 Aug 2020 15:49:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D0A0C20872
	for <linux-devicetree@archiver.kernel.org>; Fri, 28 Aug 2020 15:49:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nzknUlPz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728222AbgH1PtT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 28 Aug 2020 11:49:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728190AbgH1PtQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 28 Aug 2020 11:49:16 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF632C06121B
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2020 08:49:15 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id m22so1838727ljj.5
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2020 08:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DATJ7eGMNLZCyNQeCZmAD8QoZWEBPYduaVIGDRd+5bc=;
        b=nzknUlPzMEIXFNOmpAbizHT3DoDelUgK0gNjKN4NA28tF+mhCDf/obNn2844u6eUGX
         aNot7EshiEXSmo5UIm6ANs5Mh9g4rDHT6KoDEtILrgIGcRrZrhPsFD1v+jIpvWbzwjlK
         G4QakOu0thp0ddFdr+8CIXpkSqq3vYMvhqTTZLIKHm8sefuqUo9Na31PN2VilvVS/z2c
         PalifO5pdSm9IEnmr440qwaNW/A4hRIX1zpJqBF8culOIruNvswChUt7qD6DuL+hZZNr
         jxSkus74eluryEUOW6H2F5hrVi8xx0gJyrnKoImGkTJ64CwlWlQ5mnue74BSoqkeRVAc
         /DEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DATJ7eGMNLZCyNQeCZmAD8QoZWEBPYduaVIGDRd+5bc=;
        b=VC1My1pRVS9I5LUJ4iuTnLsnGmXwKSw0o80QqRbcSHMSOUqB7/SzMTCsvbZNPS26ib
         o1FDSEqiecxdDPw8cka2nbYSUdETu/sXCPxscjPc+0F4nHnPNNo8BF5eO7IlIn97RZmR
         ForRlIe8Y0B4vZZAYXFJqh4UBgP4zrCZ2VWGR0qa0SV99G6TY6r8lJc3lDAzxP+FJTNk
         gUjNU323OorAORxlv59FJNc1gsRLiwz3POqZDmcBVCLpl48yGTqy2QkAgxiDNaCtoIgG
         wwKucFaGekFONflv8z9j7wKieeqgSj77DDGv3DACuU4XOgW0S8pgSTiIV+otJZ7i5NLa
         aqcg==
X-Gm-Message-State: AOAM533WWYoRnkvAWXN2z5Rrokf1W/Y0hUdtKocW2JvMF4WstTxpdZoj
        2x6c1okB5VAopthcmEfqG8LjKJ0IjU/DIg==
X-Google-Smtp-Source: ABdhPJziUwmaraoePdxpXH3+GScZIfhka4CTJabY988lQZeK6M/194Z8ps7rwFVxsT6VoII+kzN8kA==
X-Received: by 2002:a2e:9c96:: with SMTP id x22mr1228969lji.337.1598629753199;
        Fri, 28 Aug 2020 08:49:13 -0700 (PDT)
Received: from eriador.lan ([188.162.64.62])
        by smtp.gmail.com with ESMTPSA id r16sm270215ljd.71.2020.08.28.08.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2020 08:49:12 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Vinod Koul <vkoul@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 2/3] Add LT9611UXC DSI to HDMI bridge support
Date:   Fri, 28 Aug 2020 18:49:03 +0300
Message-Id: <20200828154906.1662611-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

This series adds support for Lontium LT9611UXC bridge chip which takes
MIPI DSI as input and provides HDMI signal as output.

The chip can be found in Qualcomm RB5 platform [1], [2].

[1] https://www.qualcomm.com/products/qualcomm-robotics-rb5-platform
[2] https://www.thundercomm.com/app_en/product/1590131656070623

Changes since v1:
 - Fix whitespaces/indentation
 - Support working without DRM_BRIDGE_ATTACH_NO_CONNECTOR



