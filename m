Return-Path: <SRS0=+ed7=B7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6092CC433E1
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Aug 2020 05:20:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3C0582184D
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Aug 2020 05:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1597987212;
	bh=4gfYIWi6sW03nsFwJ/3ZG4YAaY2BUfTA8WrCwf2NovE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=AbY47ASzGLoa7m3yU9y+5ERHINymJXgZSz1jQHzCPZyFVb02wTLFsHnCE6026CHz0
	 6H8mqwXvNaPFWpX+R4//8jmOJklYU1nIM6kRVQ1oCHifr8aI4i6uu1hMbK6E3Onhuz
	 bVQ6a527C6bO4SwErXmSLYjVKIOlWxp63YEt1c+s=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726243AbgHUFUL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 21 Aug 2020 01:20:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:52624 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726138AbgHUFUK (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 21 Aug 2020 01:20:10 -0400
Received: from localhost (unknown [122.171.38.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 38F9321744;
        Fri, 21 Aug 2020 05:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597987210;
        bh=4gfYIWi6sW03nsFwJ/3ZG4YAaY2BUfTA8WrCwf2NovE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qSJQ6YOfhCxCw7L0Tl2f4AJ4V8itLrELnjPgTmvcqkphfJQEzNfXQquW/m30ExQ7y
         6hPxAQJ/WHbEnDfXpD5dkIUqGI3+lWwA34qpB+Ia6x7yNkxrp8G/dcJQ3p8O5HfMVZ
         dJEXGObOvybaPdBWbJHyfVwcRPPLHt7efZU/lMGw=
Date:   Fri, 21 Aug 2020 10:50:06 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Jun Li <jun.li@nxp.com>
Cc:     "kishon@ti.com" <kishon@ti.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Peter Chen <peter.chen@nxp.com>
Subject: Re: [PATCH 2/2] phy: freescale: imx8mq-usb: add support for imx8mp
 usb phy
Message-ID: <20200821052006.GN2639@vkoul-mobl>
References: <1591621893-22363-1-git-send-email-jun.li@nxp.com>
 <1591621893-22363-2-git-send-email-jun.li@nxp.com>
 <VE1PR04MB6528E11B7728E167A7A4A878895E0@VE1PR04MB6528.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VE1PR04MB6528E11B7728E167A7A4A878895E0@VE1PR04MB6528.eurprd04.prod.outlook.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 16-08-20, 03:26, Jun Li wrote:
> +Vinod

> > -static const struct of_device_id imx8mq_usb_phy_of_match[] = {
> > -	{.compatible = "fsl,imx8mq-usb-phy",},
> > -	{ },
> > -};
> > -MODULE_DEVICE_TABLE(of, imx8mq_usb_phy_of_match);
> > -
> >  static struct platform_driver imx8mq_usb_phy_driver = {
> >  	.probe	= imx8mq_usb_phy_probe,
> >  	.driver = {
> > --
> > 2.7.4
> 
> A gentle ping...

Sorry I dont have this in my inbox, can you please rebase and resend

-- 
~Vinod
