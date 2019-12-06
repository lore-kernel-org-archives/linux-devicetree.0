Return-Path: <SRS0=B/fR=Z4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11425C43603
	for <linux-devicetree@archiver.kernel.org>; Fri,  6 Dec 2019 17:09:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E557220706
	for <linux-devicetree@archiver.kernel.org>; Fri,  6 Dec 2019 17:09:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726317AbfLFRJH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 6 Dec 2019 12:09:07 -0500
Received: from gloria.sntech.de ([185.11.138.130]:42646 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726284AbfLFRJH (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 6 Dec 2019 12:09:07 -0500
Received: from p57b772b2.dip0.t-ipconnect.de ([87.183.114.178] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <heiko@sntech.de>)
        id 1idH6F-0003bn-RF; Fri, 06 Dec 2019 18:09:03 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Change RK809 PMIC interrupt polarity
Date:   Fri, 06 Dec 2019 18:09:03 +0100
Message-ID: <22838931.IDdASOIBor@phil>
In-Reply-To: <20191206173453.1b2f7844@xps13>
References: <20191206154247.28057-1-miquel.raynal@bootlin.com> <1601413.9zADmrJRdp@phil> <20191206173453.1b2f7844@xps13>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Miquel,

Am Freitag, 6. Dezember 2019, 17:34:53 CET schrieb Miquel Raynal:
> Heiko Stuebner <heiko@sntech.de> wrote on Fri, 06 Dec 2019 17:01:58
> +0100:
> > Am Freitag, 6. Dezember 2019, 16:52:50 CET schrieb Miquel Raynal:
> > > Heiko Stuebner <heiko@sntech.de> wrote on Fri, 06 Dec 2019 16:48:00
> > > +0100:
> > > > Am Freitag, 6. Dezember 2019, 16:42:47 CET schrieb Miquel Raynal:  
> > > > > PMIC interrupt can be active high or active low depending on BIT(1) of
> > > > > the GPIO_INT_CFG pin. The default is 0x1, which means active
> > > > > high. Change the polarity in the device tree to reflect the default
> > > > > state.
> > > > > 
> > > > > Without this and with the current code base, the interrupt never stops
> > > > > triggering while the MFD driver does not see anything to
> > > > > check/clear/mask so after 100000 spurious IRQs, the kernel simply
> > > > > desactivates the interrupt:
> > > > > 
> > > > >         irq 36: nobody cared (try booting with the "irqpoll" option)
> > > > >         [...]
> > > > >         handlers:
> > > > >         [<(____ptrval____)>] irq_default_primary_handler threaded
> > > > > 	[<(____ptrval____)>] regmap_irq_thread
> > > > >         Disabling IRQ #36
> > > > > 
> > > > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>    
> > > > 
> > > > *coughs slightly*
> > > > 
> > > > mfd: rk808: Set RK817 interrupt polarity to low
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git/commit/drivers/mfd/rk808.c?h=for-mfd-next&id=dbd16ef53487084816a20f662423ab543a75fc83
> > > > 
> > > > Should be in the current merge window already I guess ;-)  
> > > 
> > > This time I swear I checked your tree. But this time we did not ended
> > > with the same fix so I missed this one *again* :)  
> > 
> > No worries ... I guess I should check where I hid additional patches ;-)
> > 
> > So right now px30 stuff is in the trees:
> > - mine
> > - mfd
> > - phy (first round of dsi phy, refinement pending on the list)
> > - nvmem (for the otp controller)
> > - drm (drm/rockchip: vop: add the definition of dclk_pol)
> > - clk
> > 
> > and pending on lists:
> > - drm (dsi support + timings)
> > - phy (refinement as mentioned above)
> > 
> > not submitted yet but planning to get this done this weekend:
> > - panel driver for px30-evb
> > - dsi devicetree stuff
> 
> Thank you very much for the detailed list! I will soon work on the
> PMIC audio support and on secure boot, do not hesitate to ping me if
> you see this kind of work coming on the mailing list!

I think it's only us (you, Paul and me) working on px30 mainline stuff,
right now so it's only us that should probably coordinate :-)

Secureboot also is of interest to my project, so a Cc would be appreciated ;-)


Heiko


