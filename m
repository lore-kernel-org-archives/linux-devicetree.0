Return-Path: <SRS0=HudI=AZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5FF7C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jul 2020 17:10:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C313522574
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jul 2020 17:10:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YcUpdW8s"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728209AbgGNRKj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Jul 2020 13:10:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726169AbgGNRKi (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Jul 2020 13:10:38 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6C00C061755
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2020 10:10:38 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id 72so7296365ple.0
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2020 10:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9Pi0r+taXC55e2CabsrtsPMzJOxhTQ5VmZxPESoJ2R0=;
        b=YcUpdW8ssFvg31o7FKf1VxZt+87ICTP6BSy10MKwemlGlPTgoZywHlO0FpXTOwd/RU
         w/bmCXL2iKjRaYWDvnTjtwzPvUKBib7XWkuxrC/k8O0L3uhEvg0mByeAVTHLIuI+oYJi
         UYI69blXL++kD2Z9kDNOsL0ynAVx1mU7fpvMs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9Pi0r+taXC55e2CabsrtsPMzJOxhTQ5VmZxPESoJ2R0=;
        b=pn7Vzz66qDSsDEZK8TxDILDKn6/7x1TUjZ5+VThHWdQ4or++Ttoc+f4LF40KjrS4W6
         F4KAewJIGcRlhulJ48FCM3jmg8YKTchmXTeAwcoC+z1cpjo4s5Oy4EeKyjTQd+/BADzf
         ZBIb39yoyZMEf+q/BEWuOn+jBmE9TRE+HDhs4WAZRuKf8OjrkcsMhH67lfInE7pEDA57
         R0k224rABblrJXVaLxJ8OuBpJjfcoTMoXvtlE1dUXYbUA4Mh+dpBNInwmvRwLhpkR+Ce
         5FlCjBA4MjThwcOI7STj6m87nj7RPsQh9xpK7ZVE91S941bvWTHFB4LE3k9Q39DFxim7
         mXWA==
X-Gm-Message-State: AOAM530WXWTgXOk/wlhumHZ0dhpXYjaguJi89Ot0qJ/ri3nfFtn5l91Y
        GAxr0qyV/h7nYYVfROhHDzi+lg==
X-Google-Smtp-Source: ABdhPJwDHng07+7Jqf3f0zfUAjKLkymgxwE7dDtjLH3NoOVCed41ZFg0oAaAvDN6Z5TOUJLbYrwhEg==
X-Received: by 2002:a17:90b:8d0:: with SMTP id ds16mr5960924pjb.2.1594746638227;
        Tue, 14 Jul 2020 10:10:38 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id a3sm16338620pgd.73.2020.07.14.10.10.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2020 10:10:37 -0700 (PDT)
Date:   Tue, 14 Jul 2020 10:10:36 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Akhil P Oommen <akhilpo@codeaurora.org>
Cc:     freedreno@lists.freedesktop.org, dri-devel@freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jcrouse@codeaurora.org, devicetree@vger.kernel.org,
        jonathan@marek.ca, robdclark@gmail.com, rnayak@codeaurora.org
Subject: Re: [PATCH] drm: msm: a6xx: fix gpu failure after system resume
Message-ID: <20200714171036.GS3191083@google.com>
References: <1594733130-398-1-git-send-email-akhilpo@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1594733130-398-1-git-send-email-akhilpo@codeaurora.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Jul 14, 2020 at 06:55:30PM +0530, Akhil P Oommen wrote:
> On targets where GMU is available, GMU takes over the ownership of GX GDSC
> during its initialization. So, take a refcount on the GX PD on behalf of
> GMU before we initialize it. This makes sure that nobody can collapse the
> GX GDSC once GMU owns the GX GDSC. This patch fixes some weird failures
> during GPU wake up during system resume.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>

I went through a few dozen suspend/resume cycles on SC7180 and didn't run
into the kernel panic that typically occurs after a few iterations without
this patch.

Reported-by: Matthias Kaehlcke <mka@chromium.org>
Tested-by: Matthias Kaehlcke <mka@chromium.org>

On which tree is this patch based on? I had to apply it manually because
'git am' is unhappy when I try to apply it:

  error: sha1 information is lacking or useless (drivers/gpu/drm/msm/adreno/a6xx_gmu.c).
  error: could not build fake ancestor

Both upstream and drm-msm are in my remotes and synced, so I suspect it's
some private tree. Please make sure to base patches on the corresponding
maintainer tree or upstream, whichs makes life easier for maintainers,
testers and reviewers.
