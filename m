Return-Path: <SRS0=e4CZ=6A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47C79C2BB55
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 14:42:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1046B21D7E
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 14:42:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="q8dZ9Zlw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394519AbgDPOmj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Apr 2020 10:42:39 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:41836 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2394496AbgDPOmi (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 16 Apr 2020 10:42:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=C7kfTyYkwsLnHp/E8P08Aix24d2ntiyV2E7RaHpJ+rE=; b=q8dZ9Zlw8dUKlEAdhL9bCiQXi1
        fv2zR0EkSNsnsc+vE8rYzTwDeQCxJxVVIIKW//SEZxH3cY4+Y7I71Bul9FA1zOXdGZawqpHqve9IL
        k2v208wJKay0cfMHxRt5sdZ9QTt27Ze1bdX5oKBt4qX2RH8FDoL7g/of8qXm2wp1ahkY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.93)
        (envelope-from <andrew@lunn.ch>)
        id 1jP5ip-0035Un-NP; Thu, 16 Apr 2020 16:42:31 +0200
Date:   Thu, 16 Apr 2020 16:42:31 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        linux-pwm@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH RFC 0/6] PWM fan support on Clearfog gt8k
Message-ID: <20200416144231.GP657811@lunn.ch>
References: <20200329104549.GX25745@shell.armlinux.org.uk>
 <CACRpkdaL4-Z36aKOVW4o2MtCG9fbqm4gxZN3QjejVRPBZrzxxA@mail.gmail.com>
 <20200416135039.GL657811@lunn.ch>
 <5c7cb0ff-bf49-640a-3c4a-ef71495af7b7@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c7cb0ff-bf49-640a-3c4a-ef71495af7b7@arm.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Apr 16, 2020 at 03:37:40PM +0100, Robin Murphy wrote:
> On 2020-04-16 2:50 pm, Andrew Lunn wrote:
> [...]
> > Clocking with Marvell devices has always been interesting. Core IP
> > like this gets reused between different generations of SoCs. The
> > original Orion5x had no clock control at all. Latter SoCs have had
> > more and more complex clock trees. So care has to be taken to not
> > change old behaviour when adding support for new clocks.
> 
> FWIW, that sounds like a good argument for encoding the clock requirements
> of each variant in the of_match_data, so the driver doesn't have to simply
> trust the DT and hope.

Hi Robin

It is not really hope. It is very obvious when it is wrong, the whole
machine stops dead when you are missing a clock. Very simple to test.

	Andrew
