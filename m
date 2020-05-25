Return-Path: <SRS0=naVA=7H=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3162FC433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 25 May 2020 13:54:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0DC952071A
	for <linux-devicetree@archiver.kernel.org>; Mon, 25 May 2020 13:54:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="YO17SMTG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403864AbgEYNyg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 25 May 2020 09:54:36 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:48142 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2403812AbgEYNyg (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 25 May 2020 09:54:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=eBuTIFyaFgFw3eoUoL4lxjjk5+tAPsZpR1m1ZPTHoJw=; b=YO17SMTGFSaxh9zO7YLssdZh7q
        sFohAmf/SMD181IFRcxZ7/438CQSeIbVkbUq+S4V6L1As8fXjw0+GPmqj6AtN4R7+pjPntLiZHnA4
        sfOacAWKmJy0BuWZTU3fK6i/BP39gg863FTk8fB1MakE2g7bHU+h0fG6YgtrFxDcKqhA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.93)
        (envelope-from <andrew@lunn.ch>)
        id 1jdDYn-003C4s-PP; Mon, 25 May 2020 15:54:33 +0200
Date:   Mon, 25 May 2020 15:54:33 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     fugang.duan@nxp.com
Cc:     martin.fuzzey@flowbird.group, davem@davemloft.net,
        netdev@vger.kernel.org, robh+dt@kernel.org, shawnguo@kernel.org,
        devicetree@vger.kernel.org, kuba@kernel.org
Subject: Re: [PATCH net v2 0/4] net: ethernet: fec: move GPR reigster offset
 and bit into DT
Message-ID: <20200525135433.GD752669@lunn.ch>
References: <1590390569-4394-1-git-send-email-fugang.duan@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1590390569-4394-1-git-send-email-fugang.duan@nxp.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, May 25, 2020 at 03:09:25PM +0800, fugang.duan@nxp.com wrote:
> From: Fugang Duan <fugang.duan@nxp.com>
> 
> The commit da722186f654 (net: fec: set GPR bit on suspend by DT configuration) set the GPR reigster offset and bit in driver for wol feature.

The cover letter gets committed as the merge commit message. So please
wrap long longs.

> It bring trouble to enable wol feature on imx6sx/imx6ul/imx7d
> platforms that have multiple ethernet instances with different GPR
> bit for stop mode control. So the patch set is to move GPR reigster

register

> offset and bit define into DT, and enable
> imx6q/imx6dl/imx6sx/imx6ul/imx7d stop mode support.


> 
> Currently, below NXP i.MX boards support wol:
> - imx6q/imx6dl sabresd
> - imx6sx sabreauto
> - imx7d sdb
> 
> imx6q/imx6dl sarebsd board dts file miss the property "fsl,magic-packet;", so patch#4 is to add the property for stop mode support.

sabresd?

	Andrew
