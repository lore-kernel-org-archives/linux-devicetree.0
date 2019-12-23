Return-Path: <SRS0=v2WM=2N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D678C2D0C0
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Dec 2019 13:46:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CFC8F2073A
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Dec 2019 13:46:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="2tsuAGxa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726777AbfLWNqm (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 23 Dec 2019 08:46:42 -0500
Received: from vps0.lunn.ch ([185.16.172.187]:38272 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726733AbfLWNqm (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 23 Dec 2019 08:46:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=bSCU9ggM4t8oYLfb+CzYIiVu00cmp7t1fROUDLoekzE=; b=2tsuAGxawTw2fBco5baqmQJVpM
        nOQJLdcuz2XNiyDD3fpPvnEEGZFLx9qaqVdD7dBDCIcfykby4zAFw0JBdIy2Ra+QZotVV4VOrpotT
        PMviJ8+2GRU3sv9QlCJfnQSWspUk6aqkrbgSWhL2xvjfbOYkg3YTWKpIar+TjWyeefs0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.93)
        (envelope-from <andrew@lunn.ch>)
        id 1ijO2c-00044V-Df; Mon, 23 Dec 2019 14:46:34 +0100
Date:   Mon, 23 Dec 2019 14:46:34 +0100
From:   Andrew Lunn <andrew@lunn.ch>
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Madalin Bucur <madalin.bucur@nxp.com>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
        "hkallweit1@gmail.com" <hkallweit1@gmail.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 1/6] net: phy: add interface modes for XFI, SFI
Message-ID: <20191223134634.GL32356@lunn.ch>
References: <1576768881-24971-1-git-send-email-madalin.bucur@oss.nxp.com>
 <1576768881-24971-2-git-send-email-madalin.bucur@oss.nxp.com>
 <20191219172834.GC25745@shell.armlinux.org.uk>
 <VI1PR04MB5567FA3170CF45F877870E8CEC520@VI1PR04MB5567.eurprd04.prod.outlook.com>
 <20191223120730.GO25745@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191223120730.GO25745@shell.armlinux.org.uk>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

> Given that meeting these electrical characteristics involves the
> effects of the board, and it is impractical for a board to switch
> between different electrical characteristics at runtime (routing serdes
> lanes to both a SFP+ and XFP cage is impractical due to reflections on
> unterminated paths) I really don't see any reason why we need two
> different phy_interface_t definitions for these.  As mentioned, the
> difference between XFI and SFI is electrical, and involves the board
> layout, which is a platform specific issue.

Hi Russell

So we make phy_interface_t define the protocol. We should clearly
document that.

Are we going to need another well defined DT property for the
electrical interface? What is where we have XFI and SFI, etc?

	   Andrew
