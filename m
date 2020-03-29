Return-Path: <SRS0=L4zF=5O=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B126C2D0EE
	for <linux-devicetree@archiver.kernel.org>; Sun, 29 Mar 2020 17:44:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E64602076E
	for <linux-devicetree@archiver.kernel.org>; Sun, 29 Mar 2020 17:44:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Bq06fe9A"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727942AbgC2RoU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 29 Mar 2020 13:44:20 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:45695 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727933AbgC2RoU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 29 Mar 2020 13:44:20 -0400
Received: by mail-pf1-f195.google.com with SMTP id r14so4938069pfl.12
        for <devicetree@vger.kernel.org>; Sun, 29 Mar 2020 10:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kmRMCVebQwKolZ1owfxZgEJ3Z36wIWAyCqEaSASHlvY=;
        b=Bq06fe9AJChcuooMu7thhI4C1GMIK7gBxwAa5A71KCW1ABGzEVfx/U97uOufooY5Hk
         fb73LsjUD0AuOAFgeEoeyRLu9vHh2p1QuQoIz1x0YmdQuURcftUjh1s3aNTqabzM1tKA
         glBN7VgzxkikA71e2C0Mm1VFJ8syJGrqmRMFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kmRMCVebQwKolZ1owfxZgEJ3Z36wIWAyCqEaSASHlvY=;
        b=I51cyMu6scCEboW7mL9db1jlZIZUsEQOYaxBwK5N5M/cVND60KRVM7C17WMF7/Gyyl
         3nhS+qB6tiuXC8eQQ3RopYV8G2W7WA5/W9DWc/DiINgEVHtkudjU5ocM6vdJ/P8UBGVD
         n4+vPOeuRK8e/0SMl8Y8hBvBG08iOBkoqh3vJ0RU1eQ6dPW3ZMAJVD/7wqjMsqc9F5au
         XimYU0dC9vwjte7OUQr+hFtnlAm3eP7i3bKTgRhdV+wiUT8rW4zNVkF8/mdpAyVF0Tu2
         M3zFCQsjUNjzTuo4Rw9XJ2hsf9bcX6cIongdqSog13EICEryEGWSqQ2V39mrEwbvgmFW
         XuFw==
X-Gm-Message-State: ANhLgQ0BJQV9tYQz9g8AroHMPOEWqLe7Afwu9YDBthYahqjoOEUXz0cC
        +cIod0Z7x4Vwy7LImfvSEUmxEQ==
X-Google-Smtp-Source: ADFU+vs0uMGtGWmK6rFkOfdAMPSqn9eO9elktCgbjLQA+xwo3JFqty5Dy0EluvHOkdf0DrnOXdwAWg==
X-Received: by 2002:a62:7950:: with SMTP id u77mr9691072pfc.34.1585503858884;
        Sun, 29 Mar 2020 10:44:18 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id o14sm8393537pfh.147.2020.03.29.10.44.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2020 10:44:18 -0700 (PDT)
Date:   Sun, 29 Mar 2020 10:44:17 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Harigovindan P <harigovi@codeaurora.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        sean@poorly.run, seanpaul@chromium.org
Subject: Re: [PATCH v10 0/2] Add support for rm69299 Visionox panel driver
 and add devicetree bindings for visionox panel
Message-ID: <20200329174417.GB199755@google.com>
References: <20200327073636.13823-1-harigovi@codeaurora.org>
 <20200328204047.GG32230@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200328204047.GG32230@ravnborg.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Sam,

On Sat, Mar 28, 2020 at 09:40:47PM +0100, Sam Ravnborg wrote:
> Hi Harigovindan
> 
> On Fri, Mar 27, 2020 at 01:06:34PM +0530, Harigovindan P wrote:
> > Adding support for visionox rm69299 panel driver and adding bindings for the same panel.
> > 
> > Harigovindan P (2):
> >   dt-bindings: display: add visionox rm69299 panel variant
> >   drm/panel: add support for rm69299 visionox panel driver
> 
> I have only the first patch, which is now applied.
> Please resend second patch as it is lost somewhere.

Yes, it seems for v8, v9 and v10 only the bindings were sent, even
though the cover letter and subject say it's a series of two patches.

To my knowledge the latest version of the driver patch is this:

https://patchwork.kernel.org/patch/11439689/
