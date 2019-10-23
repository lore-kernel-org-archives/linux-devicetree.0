Return-Path: <SRS0=bPG9=YQ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42311CA9EBE
	for <linux-devicetree@archiver.kernel.org>; Wed, 23 Oct 2019 20:28:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 17FA2222BE
	for <linux-devicetree@archiver.kernel.org>; Wed, 23 Oct 2019 20:28:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="lON9ljuZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403800AbfJWU2c (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 23 Oct 2019 16:28:32 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:60584 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389290AbfJWU2c (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 23 Oct 2019 16:28:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=I//eq1/vaFb5Y3ZMl2D7kOhYQLf6hJifxlxn0JlbBX4=; b=lON9ljuZWneQh4o9RYMVR/GYuA
        M2JpLff6MvEDRsR6KahdwTfYvV7b8AoLjWowVfhDe0DK+Vi5290EzQZ5PXGbe3t1e31GDFxLhP06E
        OjrQgyB4t60wpS774zpFk5VA8N3LXTTbjboMADpVGOp9uoo7s5vEEOHYb9aTCxmgvrPY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.92.2)
        (envelope-from <andrew@lunn.ch>)
        id 1iNNF5-0008UU-A7; Wed, 23 Oct 2019 22:28:27 +0200
Date:   Wed, 23 Oct 2019 22:28:27 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     fugang.duan@nxp.com, festevam@gmail.com,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        devicetree@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: fec driver: ethernet rx is deaf on variscite imx6ul board
Message-ID: <20191023202827.GA30147@lunn.ch>
References: <20191023201000.GE20321@ripley>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191023201000.GE20321@ripley>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Oct 23, 2019 at 10:10:00PM +0200, Oliver Graute wrote:
> Hello,
> 
> I use the following nodes in my devicetree to get two ethernet ports
> working with fec driver on a Variscite DART-6UL SoM Board (imx6ul).
> 
> But ethernet RX is deaf and not working. Some clue whats is the issue
> here? 

Hi Oliver

Does TX work?

Have you tried other rgmii variants for phy-mode?

     Andrew
