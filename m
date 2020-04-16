Return-Path: <SRS0=e4CZ=6A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEAB0C2BB85
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 08:30:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9551E20787
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 08:30:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="o5lXupT2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2501947AbgDPIaA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Apr 2020 04:30:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2440995AbgDPIO4 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 16 Apr 2020 04:14:56 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 728EFC061A0C
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2020 01:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=NjYUdscMr8BaeoNcnHcYpQBshGUG0JgGuU3QPR1001w=; b=o5lXupT2LUZ5OIFK4GBNu2G6f
        /EI8EyVDRS6NaOjhrnWfDJ0xpp+LwunxE5ZBYwKhTpOQZJAhTOM96Cveo66Ltlq+Nfz1SdRQ4/upx
        o1cie7KTQRyztj6raLPJFc7BVaYkOU2Fgh1A8Y1yQ3HKKPG4vAD+eAUoF4qLfS2k+NlOqzn5JyG/b
        se88rxXKYSfC5BucBApRUMCOqVZsCj+aykVqsOO3w/grc/VdV9TyqFVWQfc/HPg3wLwfc/VEZTjRD
        H0Io9G88lwrglVnhRp9GBEDZpO1rjN5rTnrzaYOkGscU78ReF3GhZRNhYyU//Zzmh6L3v7MPeX/OY
        Xxnk3I9gg==;
Received: from shell.armlinux.org.uk ([2002:4e20:1eda:1:5054:ff:fe00:4ec]:46634)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1jOzfN-0002yS-LH; Thu, 16 Apr 2020 09:14:33 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1jOzf2-0001kT-Qs; Thu, 16 Apr 2020 09:14:12 +0100
Date:   Thu, 16 Apr 2020 09:14:12 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>,
        Jason Cooper <jason@lakedaemon.net>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Gregory Clement <gregory.clement@bootlin.com>,
        linux-pwm@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH RFC 0/6] PWM fan support on Clearfog gt8k
Message-ID: <20200416081412.GG25745@shell.armlinux.org.uk>
References: <20200329104549.GX25745@shell.armlinux.org.uk>
 <CACRpkdaL4-Z36aKOVW4o2MtCG9fbqm4gxZN3QjejVRPBZrzxxA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdaL4-Z36aKOVW4o2MtCG9fbqm4gxZN3QjejVRPBZrzxxA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Apr 16, 2020 at 09:51:37AM +0200, Linus Walleij wrote:
> On Sun, Mar 29, 2020 at 12:46 PM Russell King - ARM Linux admin
> <linux@armlinux.org.uk> wrote:
> 
> > This series adds support for the fan PWM output on the Clearfog GT8K
> > platform, and can potentially be extended to the Macchiatobin.
> 
> The gpio changes all look fine to me +/- fixes for review comments.

I think Uwe is incorrect for his GPIO comments; the clock is only
optional on A8040.  We know this because A8040 has worked fine
without PWM support without the clock, whereas for Armada 370,
the driver has hard-failed if the clock is not present.

So, on Armada 370, I preserve this behaviour.  I also preserve the
behaviour that on Armada 8040, we don't fail the driver if the
clock is not present so that booting a newer kernel with older DT
still works (which is a requirement.)  In that case, the driver
today still tries to get the clock but never checks the result of
getting the clock (which doesn't exist in current DT files.)

So no, I'm not going to fix Uwe's comments and potentially introduce
regressions into this GPIO driver; I gave up trying to argue the
point with Uwe, and I'm at the point of not giving a damn about this
patch set if I'm to intentionally introduce regressions based on
review comments.

About the only change I would make is to move the check introduced
in patch 2 into patch 3 instead, inside the MVEBU_PWM_SOC_VARIANT_A8K
case, so that deferring for the clock works (which is necessary for
the PWM driver to be useful.)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 10.2Mbps down 587kbps up
