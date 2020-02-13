Return-Path: <SRS0=Uhz2=4B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CB5DC3B18C
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Feb 2020 19:26:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5992D218AC
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Feb 2020 19:26:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DXO4fw78"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728626AbgBMT0e (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 13 Feb 2020 14:26:34 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:42986 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728137AbgBMT0c (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 13 Feb 2020 14:26:32 -0500
Received: by mail-pf1-f194.google.com with SMTP id 4so3548768pfz.9
        for <devicetree@vger.kernel.org>; Thu, 13 Feb 2020 11:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oH47U6dVilmFVsgLaUcqMonw11ZBismPGb+DPyC9Qjw=;
        b=DXO4fw78ecATFY1qi1857mdha/eTvTl3CNuC5fuI6H2JM+CXb6/ZCOym3sxgVzPdMA
         EI7//m/LWCbvFiQJQh1O7c72nwkOvtg0bGeJvmVF+9uv5ZCyssMjVnR1IWy0fw39/NuK
         1PrexqGGkHRoMJ9kY0B3dQn0EhWWs4ZuxYCXnaNIc3+MkKPHdU+ufVh5X7fCr8BZCSGM
         /we/r2FwhBJFJ64mvlvP4ebliuFrCk2ZRvMZmAwM2b92V4PgMfcFEO5CdXvvH9H/Vbwy
         Y/aFKIYNni0475hVC0EaUbif6N3KO8hbL13rekzoj6DPy7RkOLXuUUVbHYfXUlDdnC1j
         DmKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oH47U6dVilmFVsgLaUcqMonw11ZBismPGb+DPyC9Qjw=;
        b=Knxx2W9g3+7O0u2iumFr6O+D4rzqLBwZNahZS4RXR2zCMKodDTPt2XIk2jyFhb1QZi
         k7LsojfsgOnnTndzyHHv6h05LvV4Sjib4PUte4dj96gDDzaiqP5xRa+GxvXXQ7RK1w/T
         2seNId8FTLVUfz8vCJ1C1hZLKdnwTUIlrHNooTm0VbQThHaxbBdcYBFENAw9zMrh6Jfq
         rItdK8TmNUJwzgjSoN2Cw0vzDnRfCrNhR3DzCNnA0eahsbS+GguRrsrLiXoLvOFWCMqt
         hXRMvwp26+YBhp2YlB9WCWfUWzO7OFznB6dmm/JZzDeJmwX/aizQh7tMb1G8+m2QlNOl
         KhfQ==
X-Gm-Message-State: APjAAAX38YrTsl5LqM7yTOwnF03w/CQjSJnqjQHbIHh+H4SvB3hJP26v
        UDyJb+e2gH50dZG4fiKD9is4KQ==
X-Google-Smtp-Source: APXvYqwOR7c/DNAxOXKiWnEw00nczvKJ/1Zdi0Od8v7HRY7xMcRpoGaa+BxDISCHpCjw8BXko2JvUQ==
X-Received: by 2002:a63:5fcf:: with SMTP id t198mr19442029pgb.383.1581621990306;
        Thu, 13 Feb 2020 11:26:30 -0800 (PST)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id w11sm4015613pgh.5.2020.02.13.11.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 11:26:29 -0800 (PST)
Date:   Thu, 13 Feb 2020 11:26:27 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, vgarodia@codeaurora.org
Subject: Re: [PATCH V4 0/4] Enable video on sc7180
Message-ID: <20200213192627.GA1455@tuxbook-pro>
References: <1579006416-11599-1-git-send-email-dikshita@codeaurora.org>
 <20200203180240.GD3948@builder>
 <20200213185305.GF50449@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200213185305.GF50449@google.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu 13 Feb 10:53 PST 2020, Matthias Kaehlcke wrote:

> Hi Bjorn,
> 
> On Mon, Feb 03, 2020 at 10:02:40AM -0800, Bjorn Andersson wrote:
> > On Tue 14 Jan 04:53 PST 2020, Dikshita Agarwal wrote:
> > 
> > > Hello,
> > > 
> > > Changes since v3:
> > > 
> > >   - addressed DT and DT schema review comments.
> > > 
> > >   - renamed DT schema file.
> > > 
> > > v3 can be found at [1].
> > > These changes depend on patch series [2] - [6].
> > > 
> > > Thanks,
> > > Dikshita
> > > 
> > 
> > Picked up the dts patches for 5.7, with Stan's acks
> 
> I can't seem to find the patches in the QCOM repo, neither in
> 'arm64-for-5.7' nor 'for-next'. Am I looking at the wrong place or
> maybe you forget to push these?
> 

Thanks for the question Matthias, I was looking for this email as I
rebased onto v5.6-rc1 earlier this week, but got distracted.

I pulled them in, but in the rebase I realized that we don't have the
interconnects in place, so in it's current form these patches doesn't
compile.

Seems we're waiting for rather trivial respin of
https://lore.kernel.org/linux-arm-msm/1577782737-32068-1-git-send-email-okukatla@codeaurora.org/
to get this settled.

Regards,
Bjorn
