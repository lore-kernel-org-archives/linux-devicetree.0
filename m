Return-Path: <SRS0=ud5f=ZH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D9F7C432C3
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 Nov 2019 09:08:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4164A20733
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 Nov 2019 09:08:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726365AbfKOJIA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 15 Nov 2019 04:08:00 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:41925 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbfKOJIA (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 15 Nov 2019 04:08:00 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1iVXaB-0007HB-0I; Fri, 15 Nov 2019 10:07:59 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1iVXa9-0003ZK-Vm; Fri, 15 Nov 2019 10:07:58 +0100
Date:   Fri, 15 Nov 2019 10:07:57 +0100
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Peter Chen <peter.chen@nxp.com>,
        "felipe.balbi@linux.intel.com" <felipe.balbi@linux.intel.com>,
        Marco Felsch <m.felsch@pengutronix.de>
Cc:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] ARM: imx25: provide a fixed regulator for usb phys
Message-ID: <20191115090757.usc753lq7uujtqyy@pengutronix.de>
References: <20190625100412.11815-1-u.kleine-koenig@pengutronix.de>
 <VI1PR04MB5327E09DB0DFEB7E868DB59D8BE20@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <20190626055409.jjiwptyths6p6jty@pengutronix.de>
 <VI1PR04MB53270E979BA9817D47A7AFC88BFD0@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <20190724130939.43t66umrasbe4wwf@pengutronix.de>
 <20190923102825.zemkconnvdibke5h@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190923102825.zemkconnvdibke5h@pengutronix.de>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hello,

On Mon, Sep 23, 2019 at 12:28:25PM +0200, Uwe Kleine-König wrote:
> On Wed, Jul 24, 2019 at 03:09:39PM +0200, Uwe Kleine-König wrote:
> > On Thu, Jun 27, 2019 at 03:15:10AM +0000, Peter Chen wrote:
> > >  
> > > > On 19-06-26 02:40, Peter Chen wrote:
> > > > >
> > > > > > Subject: [PATCH] ARM: imx25: provide a fixed regulator for usb phys
> > > > > >
> > > > > > The usb phys are internal to the SoC and so it their 5V supply. With
> > > > > > this regulator added explicitly the following (harmless) boot messages go away:
> > > > > >
> > > > > > 	usb_phy_generic usbphy:usb-phy@0: usbphy:usb-phy@0 supply vcc not found, using dummy regulator
> > > > > > 	usb_phy_generic usbphy:usb-phy@1: usbphy:usb-phy@1 supply vcc not found, using dummy regulator
> > > > > >
> > > > >
> > > > > To eliminate the warning message, I suggest doing below changes, as
> > > > > vcc supply is not mandatory.
> > > > >
> > > > > diff --git a/drivers/usb/phy/phy-generic.c
> > > > > b/drivers/usb/phy/phy-generic.c index a53b89be5324..01a5ff1a0515
> > > > > 100644
> > > > > --- a/drivers/usb/phy/phy-generic.c
> > > > > +++ b/drivers/usb/phy/phy-generic.c
> > > > > @@ -275,7 +275,7 @@ int usb_phy_gen_create_phy(struct device *dev, struct usb_phy_generic *nop,
> > > > >                 }
> > > > >         }
> > > > >
> > > > > -       nop->vcc = devm_regulator_get(dev, "vcc");
> > > > > +       nop->vcc = devm_regulator_get_optional(dev, "vcc");
> > > > 
> > > > Is the regulator optional? IMHO this shouldn't be the fix. I think the right fix is Uwe's
> > > > approach.
> > > > 
> > > 
> > > Add Felipe.
> > > 
> > > Some USB PHY's power are from the core system's power (eg, DDR), and some are
> > > fixed at the board and no switch for it. So, it is transparent for software at some cases.
> > 
> > It's not clear to me how to proceed. There are two opposing opinions and
> > I don't know enough about USB on mx25 to judge myself.
> > 
> > Felipe?
> 
> This thread is still open in my inbox. Felipe, how can I lure you into
> giving your opinion?
> 
> My original suggestion can be seen at
> https://lore.kernel.org/linux-usb/20190625100412.11815-1-u.kleine-koenig@pengutronix.de/,
> Peter's alternative is still in the quotes above. Which is the
> right/better one?

The stuff said above is still true. I'd like to put this issue on file
with "fixed in mainline", but currently this seems to be a stalemate.
because nobody cares enough :-|

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |
