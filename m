Return-Path: <SRS0=9w3Z=YZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4D08CA9ED0
	for <linux-devicetree@archiver.kernel.org>; Fri,  1 Nov 2019 14:13:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 91EC121835
	for <linux-devicetree@archiver.kernel.org>; Fri,  1 Nov 2019 14:13:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="DY+6pMGs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726951AbfKAONI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 1 Nov 2019 10:13:08 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:38119 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726927AbfKAONI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 1 Nov 2019 10:13:08 -0400
Received: by mail-io1-f65.google.com with SMTP id u8so11041852iom.5
        for <devicetree@vger.kernel.org>; Fri, 01 Nov 2019 07:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TlYI6UI9fS5d9yjIzRHk5DK4kYPW9gPr3Mb6SrPAxFE=;
        b=DY+6pMGsOyfGXGpiBchev1A8MThpoGrRVDP4c2kL1T2x4iLT/1Oqzt0RbI2ugp6JUB
         jckKQDRHFHVY5qfJ+Q4esI6fnzcsXhgeDDJSWIDSEmHIwj3RqKsHUvNZWM1tGAt7NrsV
         znRnibutxTKLGXs71MnmqdNJnPvXmveeL+O9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TlYI6UI9fS5d9yjIzRHk5DK4kYPW9gPr3Mb6SrPAxFE=;
        b=Ld1EpLgFvpWgpJ88mRDD+t2BdHpgVjo+Dq9CsTrYffJTA9njYca/1u2MgT5jrWZm4a
         j83sxQkXOQsgTibViePZTMP1u5rtLyDDqyiecQcOVaCdYTOkdD/1aB+1ewmqCdOLMFix
         0RcW/MTtjdweKucTUNsKT17iyolDgdTmq2sCRP9WCySIrva5+/iJRvcqD7eEsl1y+lws
         UWSmCcjmhqtyImgwf0GiHYf5JCxEOJm/ODpDrOuMqvZI7dg+kj+yFdWEv3sUZBeufqp/
         aFAUb0f5Hg4kCKPxFq+eh990iU+a9g5GwvdQwT+C47dOQ/OUUIZjMSA8HT3wrNgxH7V5
         m8Gw==
X-Gm-Message-State: APjAAAWdTwBAxZF9YBGb6g9p/t1V2U8sCTtnjrbgRMBeLLgUs2CNZ6X3
        b7Fm+RXG2bNqdy2rhYqyjENnFXyQZ1eEmnbjyFuGUw==
X-Google-Smtp-Source: APXvYqyMLNtzaVw0BMP+EGUQO4Zl/cXY4bdNL2Xb19JBMdareqJEAqq7IY7jnvNWY72KqdWH+k6HJ4EIjuJgdGAsAFQ=
X-Received: by 2002:a5e:d917:: with SMTP id n23mr1074088iop.28.1572617587422;
 Fri, 01 Nov 2019 07:13:07 -0700 (PDT)
MIME-Version: 1.0
References: <20191025175625.8011-1-jagan@amarulasolutions.com>
 <20191025175625.8011-5-jagan@amarulasolutions.com> <20191028153427.pc3tnoz2d23filhx@hendrix>
 <CAMty3ZCisTrFGjzHyqSofqFAsKSLV1n2xP5Li3Lonhdi0WUZVA@mail.gmail.com> <20191029085401.gvqpwmmpyml75vis@hendrix>
In-Reply-To: <20191029085401.gvqpwmmpyml75vis@hendrix>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Fri, 1 Nov 2019 19:42:55 +0530
Message-ID: <CAMty3ZAWPZSHtAZDf_0Dpx588YGGv3pJX1cXMfkZus3+WF94cA@mail.gmail.com>
Subject: Re: [PATCH v11 4/7] drm/sun4i: dsi: Handle bus clock explicitly
To:     Maxime Ripard <mripard@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        devicetree <devicetree@vger.kernel.org>,
        David Airlie <airlied@linux.ie>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Maxime,

On Tue, Oct 29, 2019 at 2:24 PM Maxime Ripard <mripard@kernel.org> wrote:
>
> On Tue, Oct 29, 2019 at 04:03:56AM +0530, Jagan Teki wrote:
> > > > explicit handling of common clock would require since the A64
> > > > doesn't need to mention the clock-names explicitly in dts since it
> > > > support only one bus clock.
> > > >
> > > > Also pass clk_id NULL instead "bus" to regmap clock init function
> > > > since the single clock variants no need to mention clock-names
> > > > explicitly.
> > >
> > > You don't need explicit clock handling. Passing NULL as the argument
> > > in regmap_init_mmio_clk will make it use the first clock, which is the
> > > bus clock.
> >
> > Indeed I tried that, since NULL clk_id wouldn't enable the bus clock
> > during regmap_mmio_gen_context code, passing NULL triggering vblank
> > timeout.
>
> There's a bunch of users of NULL in tree, so finding out why NULL
> doesn't work is the way forward.

I'd have looked the some of the users before checking the code as
well. As I said passing NULL clk_id to devm_regmap_init_mmio_clk =>
__devm_regmap_init_mmio_clk would return before processing the clock.

Here is the code snippet on the tree just to make sure I'm on the same
page or not.

static struct regmap_mmio_context *regmap_mmio_gen_context(struct device *dev,
                                        const char *clk_id,
                                        void __iomem *regs,
                                        const struct regmap_config *config)
{
        -----------------------
        --------------
        if (clk_id == NULL)
                return ctx;

        ctx->clk = clk_get(dev, clk_id);
        if (IS_ERR(ctx->clk)) {
                ret = PTR_ERR(ctx->clk);
                goto err_free;
        }

        ret = clk_prepare(ctx->clk);
        if (ret < 0) {
                clk_put(ctx->clk);
                goto err_free;
        }
        -------------
        ---------------
}

Yes, I did check on the driver in the tree before committing explicit
clock handle, which make similar requirements like us in [1]. this
imx2 wdt driver is handling the explicit clock as well. I'm sure this
driver is updated as I have seen few changes related to this driver in
ML.

Let me know if I still miss any key change or note here, I will dig
further on this for sure.

[1] https://elixir.bootlin.com/linux/v5.4-rc4/source/drivers/watchdog/imx2_wdt.c#L264

thanks,
Jagan.
