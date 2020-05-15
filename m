Return-Path: <SRS0=lCsO=65=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34985C433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 May 2020 00:58:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 10D672074D
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 May 2020 00:58:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="im5Kif4h"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728508AbgEOA6V (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 14 May 2020 20:58:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727991AbgEOA6T (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 14 May 2020 20:58:19 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3704C061A0C
        for <devicetree@vger.kernel.org>; Thu, 14 May 2020 17:58:19 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id u22so234757plq.12
        for <devicetree@vger.kernel.org>; Thu, 14 May 2020 17:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PYudng5R/wrTc6vNtO9kYwTzA6rGU6HzaC8pWT1Yijs=;
        b=im5Kif4hQbjYjGoKpn59HdHsewBmXMA5l9xRvjBaBG8IMXIe228lODRusVefCZp+wB
         lMMb74JQf1vcjIYjoRXUJ9onY/hyUMpdJ0LaVDqcXRyhyQyiVyU5lzHm1RH8l3/gpQCX
         FAoLbHI0FEMXWhjTR5xznZStgNuNZ0Hc5G628=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PYudng5R/wrTc6vNtO9kYwTzA6rGU6HzaC8pWT1Yijs=;
        b=pV0yB3hCHS+r0siDzrWsU7HIYnM1Vtv66r6RkS1MZE58tm4sh3+gWt5VLDYTDhW0SL
         GYUdfQkZr1DVrDxAvIgyzD8+N9l0LThH8fSXHPM2dj5+XwY8fDkv0UXAkaZ2R4eJ8cyo
         Pzhjt9GvjZK1FAcoxEc8uYZ73Bop6UGyCc1RtztYrZQpLXU4gYu4RQKITqNKYC9IasPU
         ZzXTJGFzmyrIS78u5Xw4dC2R9mqtMBfdyRx8qQwXO5Fm9CrKNoKvCsooBTQP9Kqh9fpu
         /EBzGuCrN7VHs6fSZi8hTe4d3GQBx2Rj9nUXi+4fCJ3PXG0hJHiAbIuATCh9SrxuOMA9
         82Tw==
X-Gm-Message-State: AOAM531Vm/krfXhl5dPQNpYkYdy0eSF0pslhN2fcokGR9WEU/2Ug5wz3
        340fhFy3h60clkiqykXIKmhmyQ==
X-Google-Smtp-Source: ABdhPJxye5U4MtIWKA8XEV+Ile2cxBdIwWMj2P7B8bI+uQVmvGBl5gA50D6rwtjuL+/STdr3NPYmXw==
X-Received: by 2002:a17:90a:22d0:: with SMTP id s74mr701194pjc.200.1589504299208;
        Thu, 14 May 2020 17:58:19 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id m188sm363345pfd.67.2020.05.14.17.58.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2020 17:58:18 -0700 (PDT)
Date:   Thu, 14 May 2020 17:58:17 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sharat Masetty <smasetty@codeaurora.org>
Cc:     freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, jcrouse@codeaurora.org,
        georgi.djakov@linaro.org
Subject: Re: [PATCH 4/6] drm: msm: a6xx: send opp instead of a frequency
Message-ID: <20200515005817.GW4525@google.com>
References: <1589453659-27581-1-git-send-email-smasetty@codeaurora.org>
 <1589453659-27581-5-git-send-email-smasetty@codeaurora.org>
 <20200515003957.GV4525@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200515003957.GV4525@google.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, May 14, 2020 at 05:39:57PM -0700, Matthias Kaehlcke wrote:
> On Thu, May 14, 2020 at 04:24:17PM +0530, Sharat Masetty wrote:
> > This patch changes the plumbing to send the devfreq recommended opp rather
> > than the frequency. Also consolidate and rearrange the code in a6xx to set
> > the GPU frequency and the icc vote in preparation for the upcoming
> > changes for GPU->DDR scaling votes.
> 
> Could this be relatively easily split in two patches, one passing the OPP
> instead of the frequency, and another doing the consolidation? It typically
> makes reviewing easier when logically unrelated changes are done in separate
> patches.

After looking at the "upcoming changes for GPU->DDR scaling votes", which is
essentially one line I'm doubting if the splitting would actually make sense.
I'm now rather inclined to see "drm: msm: a6xx: use dev_pm_opp_set_bw to set
DDR bandwidth" squashed into this patch.
