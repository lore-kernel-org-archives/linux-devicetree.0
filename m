Return-Path: <SRS0=naVA=7H=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2038FC433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 25 May 2020 13:51:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EDE5C2071A
	for <linux-devicetree@archiver.kernel.org>; Mon, 25 May 2020 13:51:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="DGfIalWT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403925AbgEYNvo (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 25 May 2020 09:51:44 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:48130 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2403912AbgEYNvo (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 25 May 2020 09:51:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=E23TZ6pr5t5lknPN28VB5B+rcZiKW1ElhcWLgCRZrVg=; b=DGfIalWTEvTgJwNYm4eFBb+jXa
        VOZBOVI9a/tL1khn7boMPMzQom64Fot/8XsHQBVgAWQwrzAA8jtuzS1CLh7e3GUCTkTw/5cFc3cnG
        uVSvl2P1ImEpaggmrz30VN2LrBH7b4ZwAIBQWVXLgMiLROtDXMymZXH9OMs2Fg+97oR4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.93)
        (envelope-from <andrew@lunn.ch>)
        id 1jdDW0-003C46-F7; Mon, 25 May 2020 15:51:40 +0200
Date:   Mon, 25 May 2020 15:51:40 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     fugang.duan@nxp.com
Cc:     martin.fuzzey@flowbird.group, davem@davemloft.net,
        netdev@vger.kernel.org, robh+dt@kernel.org, shawnguo@kernel.org,
        devicetree@vger.kernel.org, kuba@kernel.org
Subject: Re: [PATCH net v2 4/4] ARM: dts: imx6qdl-sabresd: enable fec
 wake-on-lan
Message-ID: <20200525135140.GC752669@lunn.ch>
References: <1590390569-4394-1-git-send-email-fugang.duan@nxp.com>
 <1590390569-4394-5-git-send-email-fugang.duan@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1590390569-4394-5-git-send-email-fugang.duan@nxp.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, May 25, 2020 at 03:09:29PM +0800, fugang.duan@nxp.com wrote:
> From: Fugang Duan <fugang.duan@nxp.com>
> 
> Enable ethernet wake-on-lan feature for imx6q/dl/qp sabresd
> boards since the PHY clock is supplied by exteranl osc.

external

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
