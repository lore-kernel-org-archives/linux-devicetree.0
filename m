Return-Path: <SRS0=PhKm=A6=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C2CEC433E3
	for <linux-devicetree@archiver.kernel.org>; Sun, 19 Jul 2020 15:27:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 34C1E20738
	for <linux-devicetree@archiver.kernel.org>; Sun, 19 Jul 2020 15:27:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726109AbgGSP1d (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 19 Jul 2020 11:27:33 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:43540 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726038AbgGSP1d (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 19 Jul 2020 11:27:33 -0400
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
        (envelope-from <andrew@lunn.ch>)
        id 1jxBDn-005szR-Ol; Sun, 19 Jul 2020 17:27:23 +0200
Date:   Sun, 19 Jul 2020 17:27:23 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Russell King <rmk+kernel@armlinux.org.uk>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Martin Rowe <martin.p.rowe@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        devicetree@vger.kernel.org,
        Gregory Clement <gregory.clement@bootlin.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Vivien Didelot <vivien.didelot@gmail.com>
Subject: Re: [PATCH net] arm64: dts: clearfog-gt-8k: fix switch link
 configuration
Message-ID: <20200719152723.GG1383417@lunn.ch>
References: <E1jx73g-0006mp-UI@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1jx73g-0006mp-UI@rmk-PC.armlinux.org.uk>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, Jul 19, 2020 at 12:00:40PM +0100, Russell King wrote:
> The commit below caused a regression for clearfog-gt-8k, where the link
> between the switch and the host does not come up.
> 
> Investigation revealed two issues:
> - MV88E6xxx DSA no longer allows an in-band link to come up as the link
>   is programmed to be forced down. Commit "net: dsa: mv88e6xxx: fix
>   in-band AN link establishment" addresses this.
> 
> - The dts configured dissimilar link modes at each end of the host to
>   switch link; the host was configured using a fixed link (so has no
>   in-band status) and the switch was configured to expect in-band
>   status.
> 
> With both issues fixed, the regression is resolved.
> 
> Fixes: 34b5e6a33c1a ("net: dsa: mv88e6xxx: Configure MAC when using fixed link")
> Reported-by: Martin Rowe <martin.p.rowe@gmail.com>
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
