Return-Path: <SRS0=jMr8=BA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACDE9C433E3
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jul 2020 03:24:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8E6EC207DD
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jul 2020 03:24:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LQHyZUWB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728467AbgGUDY4 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Jul 2020 23:24:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726089AbgGUDYz (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 20 Jul 2020 23:24:55 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 731ABC0619D5
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2020 20:24:55 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id s189so11276407pgc.13
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2020 20:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xEKJp/jVsPRX4UpWt8HfxSdWbSchkUleBYjVnsTaofA=;
        b=LQHyZUWBvXVCW395DzCgA0Dhe5iVnTk00XHZfa9Y30Fi6a7xuBBwh8d/I2OiyxQi8O
         +LA8HvHeYdFDOzs4BqC3u3SV8ITPjtTbJFB8rSBrsk5B9SfjlOOghCWPQ2HCeWTEw5It
         R7Yq+EdLhhwajEl5phhZ0NpX/S8XoLKNpSthc2i5xLCERwf8ohqeWqd93eJzunZtDWpC
         wxlBW46cFDuL3s+EbbViTlFSPFuZ/CxjYL7oDjdoKeSHoZVhk1lgTqI9fwmdg2LZ0woA
         yl/MBm9Qb8WXF8FkLvcb1DUI6Owzq7zAgMNx9EDlZwu4lJ033QNTwmrXOozbT5lNJcRS
         71aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xEKJp/jVsPRX4UpWt8HfxSdWbSchkUleBYjVnsTaofA=;
        b=LxkZZomDLCoW9pO+7ipp7cbIwkf5ccagKe3lGB7scBRRF9sCoS7vy+zwajQlDYC/oy
         9uxRgC9A9XJkAdBP14R+AtmQbTa+j2ysWKgKL9sYubhBM4OFhCw6+gMg2X5OhjU/XSIn
         +ZdCdACU2vvsiA3ZeLH4mw9QQfX7qamOd5Y0deueyqDJB40fp/ps5OB6oh0JVABwjxHZ
         IzpOaZcO5l+89YD1DJ1QHogh7hN2XeNJ+wygf3Kxn7+4QA8SnRDCP8UixXm2fq3kY3eL
         kOv9BBj0rcj5dEColoXXI4AC+NBAsmE2YdQIPPq/XzCPb2iCg+11bB2Y3DbCj5rf+kbH
         FxuQ==
X-Gm-Message-State: AOAM533XqoKLW1o/SHev2Xpsc8HS2c4CknFbz1plEF3f983PY27ijnqe
        MnCSUIderwHXqoi26BVeWBEkHQ==
X-Google-Smtp-Source: ABdhPJzzJUvTTt3zYg8Ad9nFkak4Z6dshzvJaAVPO+PpmMtkXDtOIXzZcz5rd02eSZR/emH7oCtbLw==
X-Received: by 2002:a65:4bc8:: with SMTP id p8mr20871536pgr.418.1595301895018;
        Mon, 20 Jul 2020 20:24:55 -0700 (PDT)
Received: from localhost ([223.179.133.67])
        by smtp.gmail.com with ESMTPSA id e18sm18353912pff.37.2020.07.20.20.24.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jul 2020 20:24:53 -0700 (PDT)
Date:   Tue, 21 Jul 2020 08:54:42 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Akhil P Oommen <akhilpo@codeaurora.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        dri-devel@freedesktop.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Matthias Kaehlcke <mka@chromium.org>,
        saravanak@google.com, Sibi Sankar <sibis@codeaurora.org>,
        Jonathan <jonathan@marek.ca>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v5 0/6] Add support for GPU DDR BW scaling
Message-ID: <20200721032442.hv7l4q6633vnmnfe@vireshk-mac-ubuntu>
References: <1594644106-22449-1-git-send-email-akhilpo@codeaurora.org>
 <CAF6AEGtAEwZbWxLb4MxaWNswvtrFbLK+N0Fez2XYr7odKZffWA@mail.gmail.com>
 <20200720100131.6ux4zumbwqpa42ye@vireshk-mac-ubuntu>
 <CAF6AEGurrsd3nrbB=ktZjWfKTNbKwPHYwTFiZdD-NOW1T7gePQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGurrsd3nrbB=ktZjWfKTNbKwPHYwTFiZdD-NOW1T7gePQ@mail.gmail.com>
User-Agent: NeoMutt/20170609 (1.8.3)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 20-07-20, 08:03, Rob Clark wrote:
> On Mon, Jul 20, 2020 at 3:01 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > On 15-07-20, 08:36, Rob Clark wrote:
> > > I can take the first two into msm-next, the 3rd will need to wait
> > > until dev_pm_opp_set_bw() lands
> >
> > You can base that on a8351c12c6c7 in linux-next, I will make sure not to rebase
> > it anymore.

This was 5.8-rc1 + 2 patches for OPP. That's all.

> >
> 
> I can't really base on something newer than drm-next

But you need the OPP dependency, isn't it ?

-- 
viresh
