Return-Path: <SRS0=OVGR=BU=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 787E3C433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Aug 2020 22:18:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 569C0206E9
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Aug 2020 22:18:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="adOmvN9N"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726851AbgHJWSJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 10 Aug 2020 18:18:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726816AbgHJWSE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 10 Aug 2020 18:18:04 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73AA2C06174A
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2020 15:18:04 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id k18so6499092pfp.7
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2020 15:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9g8qtC2V4GxzmzZnkUZiLYQpHL1EZPwlKyzwefOemH0=;
        b=adOmvN9Nh5Suu6Rr0ep559QiIFKSh6WVwTDWFA3E5IPQ8JTo6c6V1S2hhqTL5YhKq6
         Fe1vLM4FdGV5u9+AJCiOEAJD/CSxl6aCXYP8Eee04JbdVZDFEIMPq3ax4n8SC8ngwA8S
         QfyOD8iUtD9AEPfY7GNfGTzbl8JmSHfWdaJmrtHbNoVuGd2A8GoyuZNM2kc/FcoUv2Tv
         ou2axvuOdArvKWxvENZ7Yhsad2M0LnkJ8/D0XMgxdoWsZAUJG6akoHYp37UZdovcSLAR
         BUU8LfAgcvd6j748HEVdAQriBB4tGKw2Ols9mMChzbTx0tBAoYt3E37Xvrivt9G+Dbbr
         RK0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9g8qtC2V4GxzmzZnkUZiLYQpHL1EZPwlKyzwefOemH0=;
        b=cAC0OScmfQ8iyAJ9H/fTWagQ0xdkEOUcwFJ46zgOjgqqiG4qA+dYG2297gBxYDCbSC
         ElJuxg+AHfE/lfSPjNd4mKqdnBIw27V8MrflM8FLvXB7L4ue4JE7QFS+dRH/WmQyJNzL
         VQ7IsnJjS0Refhb7T8qjiPMqT5MV6HV6/kQI+EaHb3GNRN+bCTH6DMLr3D+7KsBRO2Hh
         S6ngnFtZ7gXH0NInxtHdvGkDfjIlflfdRaUydGpWxu9jnAh/iZTK+3M5Z4bbcixP5AXG
         DV5Oj9L3SHOcMV18ckAG9um1hhihryE+SP+JpxQWSdkwelFgAq02Xk19P9a8oN52Vesg
         tSxA==
X-Gm-Message-State: AOAM531p4PnVZxjBzPiGdkhmBwJCFz5GcreUILA4baU/e0VPvGNMcfZZ
        8azjuKSRXvUexy2VwXQgP6QTsQ==
X-Google-Smtp-Source: ABdhPJx9lnuS7+qH12wiV7U1ngctEYmUJ4OoiBcArJNsL5iYq+ebYnx24jafb/3FYN+x5XD96Z5mXA==
X-Received: by 2002:a62:768e:: with SMTP id r136mr3295501pfc.187.1597097884004;
        Mon, 10 Aug 2020 15:18:04 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id r134sm23791051pfc.1.2020.08.10.15.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2020 15:18:03 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Jerome Brunet <jbrunet@baylibre.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: meson: vim3: make sound card common to all variants
Date:   Mon, 10 Aug 2020 15:18:00 -0700
Message-Id: <159709786936.10576.5338765095406106083.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200803142158.173402-1-jbrunet@baylibre.com>
References: <20200803142158.173402-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 3 Aug 2020 16:21:58 +0200, Jerome Brunet wrote:
> The vim3 sound card definition should be same all the vim3 variants
> Move the definition to the appropriate device tree file.

Applied, thanks!

[1/1] arm64: dts: meson: vim3: make sound card common to all variants
      (no commit info)

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>
