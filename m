Return-Path: <SRS0=Lhmw=77=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 160DCC433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 18 Jun 2020 18:05:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E8A91208DB
	for <linux-devicetree@archiver.kernel.org>; Thu, 18 Jun 2020 18:05:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20150623.gappssmtp.com header.i=@beagleboard-org.20150623.gappssmtp.com header.b="OYeM9Z28"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727776AbgFRSFB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 18 Jun 2020 14:05:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726984AbgFRSFA (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 18 Jun 2020 14:05:00 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14897C06174E
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2020 11:05:00 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id k8so5594117edq.4
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2020 11:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qsN49f4hirUtdZmYoS95c5NGD88R+Y70UvHP8YntzlI=;
        b=OYeM9Z28ushTDNsydouA7yjX+3/+GDzVKigOwo86UF1VY3TrAFG+/GFi7Ai/dW6Maa
         nIklrhk/iNEJnbtakdCuWMju6omiuJkmOOywCP/eg52D98SkQ6klkBcV23zhjsj8uQth
         ZflAUZJFpcdMBUpV4P9WSsWlLGRItxpyxwngLlfnZGYG9f3IzbwLBqGBk4b6QU0APhfC
         Fekb6MfCzZOhcCVlJYXs4eRp+ZXgd+8ct78fnsFesoJhAogKShnZEYhrMFltZ0B08fRx
         huH4IvOX94ERPAcwL+8ltIN72DPrgfp+1GQNDwItB/hc5Y9MoJV2Df9nlg2FrLm9UAfb
         bS8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qsN49f4hirUtdZmYoS95c5NGD88R+Y70UvHP8YntzlI=;
        b=VkwLnVl07WUad6urjx61D2MvCSSay9l3lvnCihpZxAcwI1AtSu9wzmj9koJ1ttYy6o
         BCgOPcE8lJjmnC8+Pe0drcqx6ZykJIF7I0n3r6OtDcy5r2JKKfiJX5ADjF5PXCGBhGun
         6fMIVTqNsmhxiNPO6L6eUbS7pbTTiUztEppetjN2hK7NuOBytzYjqK/YdA+qyJqCZ5kE
         8Sw0vS97tzXK0A70lNEeekXAhEnDXeCXnzxk/we/P7R+Z6NuVsDs8Fv6lyeevpaadcRN
         cZKEEJl7VEuziZ4Z3l2/MSl2Xi7+EooKCF6MkOgN0znVUByhp3DH1EH3OH3GJUIAZpc8
         1qYw==
X-Gm-Message-State: AOAM530E3FdYcF7P8wyy9HgepPRGnepdnP/6MONZxkfD6yO8WArNmr82
        9eGy+hgH+9teMwP4Qwx+unHIHA==
X-Google-Smtp-Source: ABdhPJwQl77DM21JWoNWOj0+8epK/6Y/CwEYYomQcTvPKHlc7pG4NTpS4ocpujLs1ENnB+e8RQHV6w==
X-Received: by 2002:a50:f106:: with SMTP id w6mr5314129edl.131.1592503498760;
        Thu, 18 Jun 2020 11:04:58 -0700 (PDT)
Received: from x1 (i59F66838.versanet.de. [89.246.104.56])
        by smtp.gmail.com with ESMTPSA id r6sm2718734edx.83.2020.06.18.11.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 11:04:57 -0700 (PDT)
Date:   Thu, 18 Jun 2020 20:04:54 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Subject: Re: [PATCH] arm: dts: am335x-pocketbeagle: add gpio-line-names
Message-ID: <20200618180454.GA58092@x1>
References: <20200609142504.GA2955236@x1>
 <20200617170915.GA4185472@x1>
 <20200618170345.GI37466@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200618170345.GI37466@atomide.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Jun 18, 2020 at 10:03:45AM -0700, Tony Lindgren wrote:
> * Drew Fustini <drew@beagleboard.org> [200617 17:10]:
> > Tony - does this look ok for 5.9?
> 
> Yes looks OK to me.
> 
> Just wondering, are the line with "NA" not used internally either?
> If the "NA" lines are used internally, we should probably use
> "Reserved" or "Internal" or something like that to avoid later
> on having to patch them with internal device names..

There are many more 'no connects' as the PocketBeagle is much simpler.

There are 12 SYSBOOT pins which just go to fixed pull-up and pull-down
resistors.  I'll change those from "[NC]" to "[SYSBOOT]".

Also, after going through all the enteries again, I noticed 4 lines that
I mislabeled.

I will post a v2.

> 
> > If so, I might start making other variants like BeagleBone Blue and
> > BeagleBone {Green,Black} Wireless and submit those when ready.
> 
> OK yeah makes sense.
> 

thanks,
drew
