Return-Path: <SRS0=cZLa=YL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54E2DCA9EA1
	for <linux-devicetree@archiver.kernel.org>; Fri, 18 Oct 2019 07:30:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2960021897
	for <linux-devicetree@archiver.kernel.org>; Fri, 18 Oct 2019 07:30:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PEcl77CM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504582AbfJRHaD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 18 Oct 2019 03:30:03 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:38701 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2504556AbfJRHaD (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 18 Oct 2019 03:30:03 -0400
Received: by mail-wm1-f65.google.com with SMTP id 3so5014534wmi.3
        for <devicetree@vger.kernel.org>; Fri, 18 Oct 2019 00:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=XO0aDA2Ig7nXQ7trg7XIMNQrboNjI4B3YYFu+GZeyUo=;
        b=PEcl77CMUIaOMpd0Wj9cfCF4GusoJYTWWqEdDQBS3E//D3p0hPkVbKL0p6J5KH0HAR
         JqI3hoj8VZmc57MAeyJNXNqLpPZs2SGDpKsG+Gfk/nztbMsS0kSyeckyWA8Y4b5p2gp6
         It3M+LSsr4YbiHlbpvuX9qIMsKXyQCzRRqHZRibISaQY2LSMzWMb+CGVuABq0XV93Cgl
         U/jIhv39CwiGnd8qWEWCz7OHaSvZStqPCHrjnzZs7weVEZiug2Lm500AiSwl9v7vumyd
         0y1nTOHlvb5jVBmMggVU312+R4fpUIOhRA5RSF3lxppqS26MeItjBXdOIoBYB3V0QPbv
         aGpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=XO0aDA2Ig7nXQ7trg7XIMNQrboNjI4B3YYFu+GZeyUo=;
        b=X2B8LFcR+YdTy4gc/hR8h+lglrSVWXHrDUgOQyvQj954qFa5DrWOMjXTZ3skJGa/pQ
         1dg0NK7l8jzTICOb+V8GpJgTkZCL4nfSrLilqBcj9zhLOcIs25zj8fSf4adhXxy4j0MK
         E7Q6GIz4QcExKePq8T0TbuKxKpj+1WpBLpJcwEuodjeAuCdDn14wE1y01U6LYbwK+anu
         qhcM+L5w3hF8TvuYomptpeZ9OGkLPfKH7DVpv3CtPOPOdtaaeWCgnpEOoo0QUS67uKO4
         aUkqXR0KUy5ImpVCRlh0rtjRySngTcEueBf+YS+kXp3aSem7TniyxW1oQgsukNswWgCu
         n/Ow==
X-Gm-Message-State: APjAAAUc48iCm1B3akgiFD5XNZ4EJWht43XP4j9VBmNNAF0tZyKLtayo
        x9+KAaxdRYKwt3XtKCmW3e+mMA==
X-Google-Smtp-Source: APXvYqzWuWAO1ypZDZAJQiT5QIy/i6PgjRs1a9t1No5klnvD00fqeH4VSKHPI+7XM4P3sUJ8s10xKA==
X-Received: by 2002:a1c:99cd:: with SMTP id b196mr6319605wme.105.1571383801239;
        Fri, 18 Oct 2019 00:30:01 -0700 (PDT)
Received: from dell ([95.149.164.47])
        by smtp.gmail.com with ESMTPSA id p5sm4816772wmi.4.2019.10.18.00.30.00
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 00:30:00 -0700 (PDT)
Date:   Fri, 18 Oct 2019 08:29:59 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     Rob Herring <robh@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-iio@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Mboumba Cedric Madianga <cedric.madianga@gmail.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 5/7 v4] mfd: ab8500: augment DT bindings
Message-ID: <20191018072959.GS4365@dell>
References: <20191011071805.5554-1-linus.walleij@linaro.org>
 <20191011071805.5554-6-linus.walleij@linaro.org>
 <20191011134449.GA12969@bogus>
 <20191017222238.673cd60b@archlinux>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191017222238.673cd60b@archlinux>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, 17 Oct 2019, Jonathan Cameron wrote:

> On Fri, 11 Oct 2019 08:44:49 -0500
> Rob Herring <robh@kernel.org> wrote:
> 
> > On Fri, Oct 11, 2019 at 09:18:03AM +0200, Linus Walleij wrote:
> > > As we migrate the AB8500 GPADC driver to use IIO, we need to augment
> > > the bindings to account for defining the ADC channels in the device
> > > tree.
> > > 
> > > Cc: devicetree@vger.kernel.org
> > > Acked-by: Lee Jones <lee.jones@linaro.org>
> > > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > > ---
> > > ChangeLog v3->v4:
> > > - Fix the nodenames from "foo_node" to "foo-node"  
> > 
> > You forgot to update the example. With that fixed,
> Given the number of these, I'm not that comfortable just
> fixing this up.  Linus could you do me a follow up patch tiding
> up this detail.
> 
> I don't want to delay the immutable branch any longer and
> would hope the bindings are stable enough that no one will
> need this little update in their tree as well as mfd 
> (or IIO if Lee doesn't pick up the immutable)

Can you change the subject line to start with an uppercase char.

Else my OCD sense will go into overdrive! ;)

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
