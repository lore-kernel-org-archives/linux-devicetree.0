Return-Path: <SRS0=mbMJ=64=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88E30C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 23:56:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5387A2065D
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 23:56:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hzggQepQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728052AbgENX4S (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 14 May 2020 19:56:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726216AbgENX4S (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 14 May 2020 19:56:18 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06324C05BD43
        for <devicetree@vger.kernel.org>; Thu, 14 May 2020 16:56:17 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id u10so188226pls.8
        for <devicetree@vger.kernel.org>; Thu, 14 May 2020 16:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=V7AO4OblGlSBwQug8IWxWej/AMRXHDQKDH+1XWLNVew=;
        b=hzggQepQrsKGGnBsKsAANMRY17+1T0uMxt3OSRHq07nFJRt3KU5oRuA+Eo5PsWfqs+
         PFCm8AqB0mGEx18uOYHt+Lq7Ec3Xank+8pNhj4oDSf+u4lUtGp76aHY4RkH+YZphAaRt
         R/ShiS2/ZyKNvNg3n6iPwASRzJF7ENniMAaps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=V7AO4OblGlSBwQug8IWxWej/AMRXHDQKDH+1XWLNVew=;
        b=qkFsz+/ALwYtopBdw0iL0OR5VKiW/AZpbO3jVgy+xCdT2skRx1Moto4V1qV84exyyO
         ytR2b9XGYPjK1RgykQ78w8a35zUelpBAyojza3ozBE8CKC+M3Od8hZIRE+a1WWU4XHkO
         QmPYFu0fcQXpnKTKHPeo2MBkqK6rLvOBxe/B2MYtqzg8jwrO+llEEpyrIgSlHCd/dzkD
         J6zLuAaSMJPNgWaYIOe96flAy3J6Srki2DrzxuHdgBcm0ZKycnohamT1aaZct8KeHlK6
         8nFJ8xNv1V+GpdTeipRAwidnegYibq7xRvWAGo4I5kieP6trrsrifK7GC4GGbKS3o9Ps
         uQEw==
X-Gm-Message-State: AOAM530F7EU8Wdppk9tivj1RMcKLpo3i4uu+CKmd/ifrWqY1vkz9emMh
        k0xshdrhnBiPIY2lQTTGZ7WdCpUPGj8=
X-Google-Smtp-Source: ABdhPJyi+LzUx1kJiRE6ItqiavOmXdW/8OwRjVGekQrbAMGtyQUoyeqnUTlfgO4bMCWn2eddMBgRCQ==
X-Received: by 2002:a17:902:c487:: with SMTP id n7mr979410plx.316.1589500577438;
        Thu, 14 May 2020 16:56:17 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id w14sm260208pgo.75.2020.05.14.16.56.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2020 16:56:16 -0700 (PDT)
Date:   Thu, 14 May 2020 16:56:15 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sharat Masetty <smasetty@codeaurora.org>
Cc:     freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, jcrouse@codeaurora.org,
        georgi.djakov@linaro.org
Subject: Re: [PATCH 0/6] Add support for GPU DDR BW scaling
Message-ID: <20200514235615.GT4525@google.com>
References: <1589453659-27581-1-git-send-email-smasetty@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1589453659-27581-1-git-send-email-smasetty@codeaurora.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, May 14, 2020 at 04:24:13PM +0530, Sharat Masetty wrote:

> Subject: [PATCH 0/6] Add support for GPU DDR BW scaling

For anything but the first version the subject (for all patches) should
include the version (i.e. [v2, 0/6], etc for this series).

> This is a rework of my previous series [1], but this time based on the bindings
> from Georgi [2] + a few fixes which look to be fixed in v8 of Georgi's series
> [3]. The work is based on the chromeOS tip.

Chrome OS is irrelevant here, the series should be based on Linus' or
one of the relevant maintainer trees (+ the patches it depends on).
If it is actually based on the Chrome OS kernel tree (v5.4 I imagine)
there will likely be conflicts which will make maintainers unhappy.
