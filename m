Return-Path: <SRS0=2ZKK=7K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E219FC433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 15:04:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C77072075F
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 15:04:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404000AbgE1PEZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 May 2020 11:04:25 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:52143 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403980AbgE1PEZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 28 May 2020 11:04:25 -0400
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id A9D7A240003;
        Thu, 28 May 2020 15:04:20 +0000 (UTC)
Date:   Thu, 28 May 2020 17:04:19 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Chuanhong Guo <gch981213@gmail.com>,
        Weijie Gao <weijie.gao@mediatek.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Mason Yang <masonccyang@mxic.com.tw>,
        Julien Su <juliensu@mxic.com.tw>
Subject: Re: [PATCH v6 16/18] mtd: nand: Convert generic NAND bits to use
 the ECC framework
Message-ID: <20200528170419.0c2ba99a@xps13>
In-Reply-To: <20200528165217.6582f9aa@collabora.com>
References: <20200528113113.9166-1-miquel.raynal@bootlin.com>
        <20200528113113.9166-17-miquel.raynal@bootlin.com>
        <20200528163907.6539e2a1@collabora.com>
        <20200528164926.3b99f848@xps13>
        <20200528165217.6582f9aa@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


Boris Brezillon <boris.brezillon@collabora.com> wrote on Thu, 28 May
2020 16:52:17 +0200:

> On Thu, 28 May 2020 16:49:26 +0200
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> 
> > Boris Brezillon <boris.brezillon@collabora.com> wrote on Thu, 28 May
> > 2020 16:39:07 +0200:
> >   
> > > On Thu, 28 May 2020 13:31:11 +0200
> > > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> > >     
> > > > Embed a generic NAND ECC high-level object in the nand_device
> > > > structure to carry all the ECC engine configuration/data. Adapt the
> > > > raw NAND and SPI-NAND cores to fit the change.
> > > > 
> > > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > > > ---
> > > >  drivers/mtd/nand/Kconfig                     |  1 +
> > > >  drivers/mtd/nand/raw/atmel/nand-controller.c |  9 +++--
> > > >  drivers/mtd/nand/raw/brcmnand/brcmnand.c     |  7 ++--
> > > >  drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c   | 12 +++---
> > > >  drivers/mtd/nand/raw/marvell_nand.c          |  7 ++--
> > > >  drivers/mtd/nand/raw/mtk_nand.c              |  4 +-
> > > >  drivers/mtd/nand/raw/nand_base.c             | 25 ++++++------
> > > >  drivers/mtd/nand/raw/nand_esmt.c             | 11 +++---
> > > >  drivers/mtd/nand/raw/nand_hynix.c            | 41 ++++++++++----------
> > > >  drivers/mtd/nand/raw/nand_jedec.c            |  4 +-
> > > >  drivers/mtd/nand/raw/nand_micron.c           | 14 ++++---
> > > >  drivers/mtd/nand/raw/nand_onfi.c             |  8 ++--
> > > >  drivers/mtd/nand/raw/nand_samsung.c          | 19 ++++-----
> > > >  drivers/mtd/nand/raw/nand_toshiba.c          | 11 +++---
> > > >  drivers/mtd/nand/raw/sunxi_nand.c            |  5 ++-
> > > >  drivers/mtd/nand/raw/tegra_nand.c            |  9 +++--
> > > >  drivers/mtd/nand/spi/core.c                  |  8 ++--
> > > >  drivers/mtd/nand/spi/macronix.c              |  6 +--
> > > >  drivers/mtd/nand/spi/toshiba.c               |  6 +--
> > > >  include/linux/mtd/nand.h                     |  8 ++--
> > > >  20 files changed, 115 insertions(+), 100 deletions(-)
> > > > 
> > > > diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> > > > index a4478ffa279d..3327d8539a73 100644
> > > > --- a/drivers/mtd/nand/Kconfig
> > > > +++ b/drivers/mtd/nand/Kconfig
> > > > @@ -13,6 +13,7 @@ menu "ECC engine support"
> > > >  
> > > >  config MTD_NAND_ECC
> > > >  	bool
> > > > +	select MTD_NAND_CORE      
> > > 
> > > This select looks suspicious. Shouldn't it be a depends on, and more
> > > importantly, I think it should be part of patch 15.    
> > 
> > Wouldn't we break a lot of users by using depends on?
> > 
> > Or maybe we can turn it on by default?  
> 
> It's a sub-functionality of the NAND core, so it should be a depends on
> in my opinion. Why would that break users. Aren't you selecting
> MTD_NAND_CORE in MTD_RAWNAND now? Those options should really remain
> hidden, and be selected at the SPI/raw NAND framework level.

I remembered we discussed that point already, yes the generic core is
selected by the SPI/raw NAND layers, so it should be fine. I'll move
this as a depends on in the previous patch.
