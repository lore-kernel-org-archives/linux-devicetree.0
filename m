Return-Path: <SRS0=B/fR=Z4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46CBEC43603
	for <linux-devicetree@archiver.kernel.org>; Fri,  6 Dec 2019 16:35:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2161724659
	for <linux-devicetree@archiver.kernel.org>; Fri,  6 Dec 2019 16:35:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726352AbfLFQfB convert rfc822-to-8bit (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 6 Dec 2019 11:35:01 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:44661 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726321AbfLFQfB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 6 Dec 2019 11:35:01 -0500
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 814C6C0009;
        Fri,  6 Dec 2019 16:34:54 +0000 (UTC)
Date:   Fri, 6 Dec 2019 17:34:53 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Change RK809 PMIC interrupt
 polarity
Message-ID: <20191206173453.1b2f7844@xps13>
In-Reply-To: <1601413.9zADmrJRdp@phil>
References: <20191206154247.28057-1-miquel.raynal@bootlin.com>
        <3285991.EbEXlA3CnX@phil>
        <20191206165250.5877dec8@xps13>
        <1601413.9zADmrJRdp@phil>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Heiko,

Heiko Stuebner <heiko@sntech.de> wrote on Fri, 06 Dec 2019 17:01:58
+0100:

> Am Freitag, 6. Dezember 2019, 16:52:50 CET schrieb Miquel Raynal:
> > Hi Heiko,
> > 
> > Heiko Stuebner <heiko@sntech.de> wrote on Fri, 06 Dec 2019 16:48:00
> > +0100:
> >   
> > > Hi Miquel,
> > > 
> > > Am Freitag, 6. Dezember 2019, 16:42:47 CET schrieb Miquel Raynal:  
> > > > PMIC interrupt can be active high or active low depending on BIT(1) of
> > > > the GPIO_INT_CFG pin. The default is 0x1, which means active
> > > > high. Change the polarity in the device tree to reflect the default
> > > > state.
> > > > 
> > > > Without this and with the current code base, the interrupt never stops
> > > > triggering while the MFD driver does not see anything to
> > > > check/clear/mask so after 100000 spurious IRQs, the kernel simply
> > > > desactivates the interrupt:
> > > > 
> > > >         irq 36: nobody cared (try booting with the "irqpoll" option)
> > > >         [...]
> > > >         handlers:
> > > >         [<(____ptrval____)>] irq_default_primary_handler threaded
> > > > 	[<(____ptrval____)>] regmap_irq_thread
> > > >         Disabling IRQ #36
> > > > 
> > > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>    
> > > 
> > > *coughs slightly*
> > > 
> > > mfd: rk808: Set RK817 interrupt polarity to low
> > > https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git/commit/drivers/mfd/rk808.c?h=for-mfd-next&id=dbd16ef53487084816a20f662423ab543a75fc83
> > > 
> > > Should be in the current merge window already I guess ;-)  
> > 
> > This time I swear I checked your tree. But this time we did not ended
> > with the same fix so I missed this one *again* :)  
> 
> No worries ... I guess I should check where I hid additional patches ;-)
> 
> So right now px30 stuff is in the trees:
> - mine
> - mfd
> - phy (first round of dsi phy, refinement pending on the list)
> - nvmem (for the otp controller)
> - drm (drm/rockchip: vop: add the definition of dclk_pol)
> - clk
> 
> and pending on lists:
> - drm (dsi support + timings)
> - phy (refinement as mentioned above)
> 
> not submitted yet but planning to get this done this weekend:
> - panel driver for px30-evb
> - dsi devicetree stuff

Thank you very much for the detailed list! I will soon work on the
PMIC audio support and on secure boot, do not hesitate to ping me if
you see this kind of work coming on the mailing list!

Thanks,
Miquèl
