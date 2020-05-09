Return-Path: <SRS0=JYCW=6X=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 321B4C28CBC
	for <linux-devicetree@archiver.kernel.org>; Sat,  9 May 2020 16:57:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 075B221582
	for <linux-devicetree@archiver.kernel.org>; Sat,  9 May 2020 16:57:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="l7BurDe+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727940AbgEIQ5p (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 9 May 2020 12:57:45 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:51118 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727863AbgEIQ5p (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sat, 9 May 2020 12:57:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=s4l4ppmaAlOA2KqoNi3aCZGr1qJEGebzLGEBcTTCtFs=; b=l7BurDe+PXvj7dwwBjRqTAPGRQ
        /P/6lckyZp4JIcW0BPGwCnSNcEueD59BZ7WA1KOkLhbCoWKOdtEvvGtXZg5HT+3ispESQg6yBcXXE
        iArjS4dXRRdrYcWf9CYyECveph2IQrkJmzvwRdgxBHimeF7xtEzN2ql569O41mLYzff8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.93)
        (envelope-from <andrew@lunn.ch>)
        id 1jXSnG-001WWX-Bv; Sat, 09 May 2020 18:57:42 +0200
Date:   Sat, 9 May 2020 18:57:42 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     netdev@vger.kernel.org, f.fainelli@gmail.com, davem@davemloft.net,
        kernel@pengutronix.de, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/5] dt-bindings: net: mdio-gpio: add compatible for
 microchip,mdio-smi0
Message-ID: <20200509165742.GD362499@lunn.ch>
References: <20200508154343.6074-1-m.grzeschik@pengutronix.de>
 <20200508154343.6074-3-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200508154343.6074-3-m.grzeschik@pengutronix.de>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, May 08, 2020 at 05:43:40PM +0200, Michael Grzeschik wrote:
> Microchip SMI0 Mode is a special mode, where the MDIO Read/Write
> commands are part of the PHY Address and the OP Code is always 0. We add
> the compatible for this special mode of the bitbanged mdio driver.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
