Return-Path: <SRS0=K2IH=ZA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAF02FA372C
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 16:54:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 870532178F
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 16:54:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ALZBV9VN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727700AbfKHQyg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 8 Nov 2019 11:54:36 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:40766 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727615AbfKHQyg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 8 Nov 2019 11:54:36 -0500
Received: by mail-io1-f67.google.com with SMTP id p6so7066459iod.7
        for <devicetree@vger.kernel.org>; Fri, 08 Nov 2019 08:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oBlGL2ZT1qM/spp+v8OfQqLKwCRJpPtsexANJmTmPvA=;
        b=ALZBV9VNqthwC4XaKQWF9/+cuQdPrE6+x2xVO/S3DSHILymh5OMdjE/m5FYD0JbKBz
         LaIwUR3CoqB2Y3Fi88ga13AtQqlagoQ3HwKEVys0MRaPbWQM7/sOIzf/oBWHpxrmJki7
         tjICYxKk/dsSORynQSmur0R/VsviWcGrbwP5E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oBlGL2ZT1qM/spp+v8OfQqLKwCRJpPtsexANJmTmPvA=;
        b=KyQ7tjKhN+HJVAQVNnpmq4sDmy4An+0T0rlXk+60Rvc7L2JnFz/lFZChq5Xa5B9U/n
         X/cNPa5eyXe/Z0GYZcUk+edwexn/0Sdfp0wvPEu+Xx2m81dzJ7UGYscxv/e/84ZbB4W7
         E0Bce9yfJrGH6WqfTu8bah0uiFJADbNIGs52/fetmuVKOHfghVNVDx/5mTT09tcVbo+0
         hDZ7w+6DQsXO9E2V4fC7Pf3GS6je5Ip8ld3zYzNFenfrcUFMrFCP1o1t6Tl+p8F9WCe3
         88gUT8ImmMGWlJtc1VMQdosktxhvugLjoEAZFazOcuspSDRG4CZSCZdDL0tcE6dJRs4g
         hsDg==
X-Gm-Message-State: APjAAAWbfhiOswd9ydNXOCI6dWCYB3US+nJTC2lXnjOoHjdTVqcQxRfQ
        YwJfZkzOIbO06LDA/r+OBHHsz71m2ttlXLgrVbaPfg==
X-Google-Smtp-Source: APXvYqzXa+oPVVw/kRTaaucIi7gsQEB5szy8ycBHJmwimpROUevaESodbo17CscTvYcassIqn0vAPyGE9drKaSMDMb4=
X-Received: by 2002:a6b:ee07:: with SMTP id i7mr11442996ioh.26.1573232074022;
 Fri, 08 Nov 2019 08:54:34 -0800 (PST)
MIME-Version: 1.0
References: <20191014102308.27441-1-tdas@codeaurora.org> <20191014102308.27441-6-tdas@codeaurora.org>
 <20191029175941.GA27773@google.com> <fa17b97d-bfc4-4e9c-78b5-c225e5b38946@codeaurora.org>
 <20191031174149.GD27773@google.com> <20191107210606.E536F21D79@mail.kernel.org>
 <CAJs_Fx60uEdGFjJXAjvVy5LLBXXmergRi8diWxhgGqde1wiXXQ@mail.gmail.com> <20191108063543.0262921882@mail.kernel.org>
In-Reply-To: <20191108063543.0262921882@mail.kernel.org>
From:   Rob Clark <robdclark@chromium.org>
Date:   Fri, 8 Nov 2019 08:54:23 -0800
Message-ID: <CAJs_Fx5trp2B7uOMTFZNUsYoKrO1-MWsNECKp-hz+1qCOCeU8A@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] clk: qcom: Add Global Clock controller (GCC)
 driver for SC7180
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Taniya Das <tdas@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, Rob Herring <robh+dt@kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Nov 7, 2019 at 10:35 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Rob Clark (2019-11-07 18:06:19)
> > On Thu, Nov 7, 2019 at 1:06 PM Stephen Boyd <sboyd@kernel.org> wrote:
> > >
> > > Quoting Matthias Kaehlcke (2019-10-31 10:41:49)
> > > > Hi Taniya,
> > > >
> > > > On Thu, Oct 31, 2019 at 04:59:26PM +0530, Taniya Das wrote:
> > > > > Hi Matthias,
> > > > >
> > > > > Thanks for your comments.
> > > > >
> > > > > On 10/29/2019 11:29 PM, Matthias Kaehlcke wrote:
> > > > > > Hi Taniya,
> > > > > >
> > > > > > On Mon, Oct 14, 2019 at 03:53:08PM +0530, Taniya Das wrote:
> > > > > > > Add support for the global clock controller found on SC7180
> > > > > > > based devices. This should allow most non-multimedia device
> > > > > > > drivers to probe and control their clocks.
> > > > > > >
> > > > > > > Signed-off-by: Taniya Das <tdas@codeaurora.org>
> > > > >
> > > > > >
> > > > > > v3 also had
> > > > > >
> > > > > > +   [GCC_DISP_AHB_CLK] = &gcc_disp_ahb_clk.clkr,
> > > > > >
> > > > > > Removing it makes the dpu_mdss driver unhappy:
> > > > > >
> > > > > > [    2.999855] dpu_mdss_enable+0x2c/0x58->msm_dss_enable_clk: 'iface' is not available
> > > > > >
> > > > > > because:
> > > > > >
> > > > > >          mdss: mdss@ae00000 {
> > > > > >                     ...
> > > > > >
> > > > > >   =>             clocks = <&gcc GCC_DISP_AHB_CLK>,
> > > > > >                           <&gcc GCC_DISP_HF_AXI_CLK>,
> > > > > >                           <&dispcc DISP_CC_MDSS_MDP_CLK>;
> > > > > >                  clock-names = "iface", "gcc_bus", "core";
> > > > > >     };
> > > > > >
> > > > >
> > > > > The basic idea as you mentioned below was to move the CRITICAL clocks to
> > > > > probe. The clock provider to return NULL in case the clocks are not
> > > > > registered.
> > > > > This was discussed with Stephen on v3. Thus I submitted the below patch.
> > > > > clk: qcom: common: Return NULL from clk_hw OF provider.
> > > >
> > > > I see. My assumption was that the entire clock hierarchy should be registered,
> > > > but Stephen almost certainly knows better :)
> > > >
> > > > > Yes it would throw these warnings, but no functional issue is observed from
> > > > > display. I have tested it on the cheza board.
> > > >
> > > > The driver considers it an error (uses DEV_ERR to log the message) and doesn't
> > > > handle other clocks when one is found missing. I'm not really famililar with
> > > > the dpu_mdss driver, but I imagine this can have some side effects. Added some
> > > > of the authors/contributors to cc.
> > >
> > > NULL is a valid clk pointer returned by clk_get(). What is the display
> > > driver doing that makes it consider NULL an error?
> > >
> >
> > do we not have an iface clk?  I think the driver assumes we should
> > have one, rather than it being an optional thing.. we could ofc change
> > that
>
> I think some sort of AHB clk is always enabled so the plan is to just
> hand back NULL to the caller when they call clk_get() on it and nobody
> should be the wiser when calling clk APIs with a NULL iface clk. The
> common clk APIs typically just return 0 and move along. Of course, we'll
> also turn the clk on in the clk driver so that hardware can function
> properly, but we don't need to expose it as a clk object and all that
> stuff if we're literally just slamming a bit somewhere and never looking
> back.
>
> But it sounds like we can't return NULL for this clk for some reason? I
> haven't tried to track it down yet but I think Matthias has found it
> causes some sort of problem in the display driver.
>

ok, I guess we can change the dpu code to allow NULL..  but what would
the return be, for example on a different SoC where we do have an
iface clk, but the clk driver isn't enabled?  Would that also return
NULL?  I guess it would be nice to differentiate between those cases..

BR,
-R
