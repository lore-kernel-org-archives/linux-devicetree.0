Return-Path: <SRS0=bipS=ZI=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4266C43215
	for <linux-devicetree@archiver.kernel.org>; Sat, 16 Nov 2019 16:08:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8885F206C0
	for <linux-devicetree@archiver.kernel.org>; Sat, 16 Nov 2019 16:08:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="X7Q0sZQk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730437AbfKPQI0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 16 Nov 2019 11:08:26 -0500
Received: from vps0.lunn.ch ([185.16.172.187]:42958 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729508AbfKPQIZ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sat, 16 Nov 2019 11:08:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=7X7mD4/J7GefBlrK83ZfK/rqCK6MSlr+UCc9YsyYMSE=; b=X7Q0sZQktRuz6D+vdwKe2rnySP
        PNy8BgZxbto2F6T/O39sNQrHMLcVGS4V6kjSBfCoD64hu+cxJV5PPEfmrLZpDYBZ3gZjC48VJmC0s
        MNZoFtK5Hu7gScs+hvI4qca14jIPtBbFBtAjl9OgHyzFlAnqhqlc0ma5aHxDrkj1fhn8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.92.2)
        (envelope-from <andrew@lunn.ch>)
        id 1iW0cW-0005si-5M; Sat, 16 Nov 2019 17:08:20 +0100
Date:   Sat, 16 Nov 2019 17:08:20 +0100
From:   Andrew Lunn <andrew@lunn.ch>
To:     Russell King <rmk+kernel@armlinux.org.uk>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v2 1/3] dt-bindings: net: add ethernet
 controller and phy sfp property
Message-ID: <20191116160820.GD5653@lunn.ch>
References: <20191115195339.GR25745@shell.armlinux.org.uk>
 <E1iVhi2-0007au-2S@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1iVhi2-0007au-2S@rmk-PC.armlinux.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Nov 15, 2019 at 07:56:46PM +0000, Russell King wrote:
> Document the missing sfp property for ethernet controllers (which
> has existed for some time) which is being extended to ethernet PHYs.
> 
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
