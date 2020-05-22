Return-Path: <SRS0=I+Xt=7E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26724C433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 May 2020 23:50:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EC04E206BE
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 May 2020 23:50:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="UByr7G2a"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731169AbgEVXuV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 22 May 2020 19:50:21 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:45862 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726546AbgEVXuV (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 22 May 2020 19:50:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=s4/kO1tc+rs3zZD/yq07VExqrN+raAP0z0yWDn5NBok=; b=UByr7G2a1CrZ6UhP/hztR7/ZPb
        bUTxLdDE4K4CYGzPU/rfDXY597217PetVdb1N19C8GN559eLFkVOUcXNd9BR7801zJ0SOwZCa0MB3
        bddgEssZI9yysCoE3mbBlVnkX0tsnwhMyu7xN/bZ+JC3+N18UFYzuzp7oDTArvLthijU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.93)
        (envelope-from <andrew@lunn.ch>)
        id 1jcHQe-00329G-DK; Sat, 23 May 2020 01:50:16 +0200
Date:   Sat, 23 May 2020 01:50:16 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     "Fuzzey, Martin" <martin.fuzzey@flowbird.group>
Cc:     Andy Duan <fugang.duan@nxp.com>,
        "David S. Miller" <davem@davemloft.net>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [EXT] Re: [PATCH net 3/4] ARM: dts: imx6: update fec gpr
 property to match new format
Message-ID: <20200522235016.GB722786@lunn.ch>
References: <1589963516-26703-1-git-send-email-fugang.duan@nxp.com>
 <1589963516-26703-4-git-send-email-fugang.duan@nxp.com>
 <20200520170322.GJ652285@lunn.ch>
 <AM6PR0402MB3607541D33B1C61476022D0AFFB70@AM6PR0402MB3607.eurprd04.prod.outlook.com>
 <20200521130700.GC657910@lunn.ch>
 <AM6PR0402MB360728F404F966B9EF404697FFB40@AM6PR0402MB3607.eurprd04.prod.outlook.com>
 <CANh8QzwxfnQ1cACz=6dhYujEVtQoTCw8kTgkHi9BnxESptL=xQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANh8QzwxfnQ1cACz=6dhYujEVtQoTCw8kTgkHi9BnxESptL=xQ@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

> Yes, I don't think anyone is saying otherwise.

Correct.

> 
> The problem is just that there are already .dtsi files for i.MX chips
> having multiple ethernet interfaces
> in the mainline kernel (at least imx6ui.dtsi, imx6sx.dts, imx7d.dtsi)

Vybrid is one i use a lot with two FECs.

> but that this patch series does not
> modify those files to use the new DT format.
> 
> It currently only modifies the dts files that are already supported by
> hardcoded values in the driver.

Exactly. This patch set itself adds nothing we don't already support.
So the patch set as is, is pointless.

> As to not knowing which instance it shouldn't matter.
> The base dtsi can declare both/all ethernet interfaces with the
> appropriate GPR bits.

I fully agree. All it needs for this patchset to be merged is another
patch which adds GPR properties to all SoC .dtsi files where
appropriate, and optionally to a couple of reference designs which
support WoL on their ports.

	Andrew
