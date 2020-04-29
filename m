Return-Path: <SRS0=VloT=6N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA1A5C83000
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Apr 2020 19:21:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B6B39205C9
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Apr 2020 19:21:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="0il6LUH7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726580AbgD2TVN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 29 Apr 2020 15:21:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726511AbgD2TVM (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 29 Apr 2020 15:21:12 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 465A5C035493
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2020 12:21:11 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id b11so3935483wrs.6
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2020 12:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=UmOfyDnZj12RCgACCCb3qZ3dCbNdN1PCrZ+63qHHHJI=;
        b=0il6LUH7GR2pTesy30O8mHj9VhiUmU/yM6cLt1iUgpQTqNSx/uWLQtYBWVg+KPkUWB
         0VksvPSEun/0vb7ldUpRwJnjau1VKW+ePuhU0ib81xkIRTavC3P5q+bfMiwc3L1PZ1YG
         XYHzP8RWn/OVcJkd7T0efuHqb4RpTs0Z7tL4A7vWMOoCiXkCbY5oj2dzMr8aWyFqx7sl
         ziybq67g1NVaIXu+wdlGHXkFFSas/Tah93JDhtsPya8TXTj5rdttFSDMT6JQ71kuSHvA
         8RLKfLoHNE52Bav/RHm/c0tMPwM/YEZY/9LIv4Nu0Qa516ilYcXGq4Henjw8LS/iqzby
         N+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=UmOfyDnZj12RCgACCCb3qZ3dCbNdN1PCrZ+63qHHHJI=;
        b=sHcUbCXPhTp6Je55Z9COu0UqIERbCFSlxiMjT3M3drt8vE+TaOpFgxSFhdjpgFUGEA
         ebMyp+EjlljdfwsJojIxJl8RIvW7JsQYV37yRasr+ueny7vc/p/roBx97wCk3A/zv1vd
         wjHE82l0E6SeDtqZuGK7NKNNzOyRbB/3wvVJPPluSSPb6VRVGDq0XcJooCMupp7D+Mi+
         TYa8E5RGledQ0qsx8kHuSqz2NrpzzIiFoxlokiTe/wnSJ7gkwJcAncmA/tOv9YAGlQ4T
         C8Zt88VvVEAfx0RtuNq29xChIo2pNlMTTfYuphdUtBKbtP4UkxvtI+McvXnJabr+v6Jp
         Hz8g==
X-Gm-Message-State: AGi0PuagTYdg/Bnj6qBrHnj9ZqvJdkTGtjcszX+hbT5wFkRbcn5848l/
        9MVTAIujcNOTRNaphaQnuudMXF+W+P01YQ==
X-Google-Smtp-Source: APiQypIpj8gSGyyDhN0ZznSMn8SWwFJDrrXakP5DPIWP0f9+wHAv9yZYAjlMS/SEM1kkUsAcTx4rLA==
X-Received: by 2002:a5d:4d50:: with SMTP id a16mr44538017wru.219.1588188069963;
        Wed, 29 Apr 2020 12:21:09 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id k133sm10091947wma.0.2020.04.29.12.21.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Apr 2020 12:21:08 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Jerome Brunet <jbrunet@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: meson: kvim3: move hdmi to tdm a
In-Reply-To: <20200421141814.639480-1-jbrunet@baylibre.com>
References: <20200421141814.639480-1-jbrunet@baylibre.com>
Date:   Wed, 29 Apr 2020 12:21:06 -0700
Message-ID: <7h1ro6ksil.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> The tdmout b is physically routed to the 40 pin header and the tdmout c
> is routed to the m2 connector. It makes these interfaces poor
> candidates to handle the HDMI 8ch i2s link (2ch i2s * 4 lanes) as it would
> force the same link format on the related connectors.
>
> Instead use the TDM A interface. This one is not routed to the outside
> world on the vim3, so it can only be used for HDMI.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Queued for v5.8,

Kevin
