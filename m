Return-Path: <SRS0=jZdE=7L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81ED6C433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 May 2020 09:25:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 67F732072D
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 May 2020 09:25:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725821AbgE2JZX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 29 May 2020 05:25:23 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:53333 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbgE2JZW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 29 May 2020 05:25:22 -0400
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id A274C240005;
        Fri, 29 May 2020 09:25:16 +0000 (UTC)
Date:   Fri, 29 May 2020 11:25:14 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <devicetree@vger.kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Chuanhong Guo <gch981213@gmail.com>,
        Weijie Gao <weijie.gao@mediatek.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Mason Yang <masonccyang@mxic.com.tw>,
        Julien Su <juliensu@mxic.com.tw>
Subject: Re: [PATCH v7 16/20] mtd: nand: Convert generic NAND bits to use
 the ECC framework
Message-ID: <20200529112514.0453904c@xps13>
In-Reply-To: <20200529103222.18c5b89b@collabora.com>
References: <20200529002517.3546-1-miquel.raynal@bootlin.com>
        <20200529002517.3546-17-miquel.raynal@bootlin.com>
        <20200529103222.18c5b89b@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


Boris Brezillon <boris.brezillon@collabora.com> wrote on Fri, 29 May
2020 10:32:22 +0200:

> On Fri, 29 May 2020 02:25:13 +0200
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> 
> > Embed a generic NAND ECC high-level object in the nand_device
> > structure to carry all the ECC engine configuration/data. Adapt the
> > raw NAND and SPI-NAND cores to fit the change.  
> 
> In order to split that one, and make future re-organizations less
> painful (hope we won't have to do that again, but who knows), I would
> recommend doing things in this order:
> 
> 1/ create a nanddev_get_ecc_requirements() helper that returns a
>    const struct nand_ecc_props *
> 2/ patch spinand to use this helper
> 3/ introduce nand_ecc
> 4/ patch rawnand to use the new ecc layer

Sounds like a lot of efforts for a mechanical change to me. Not
mentioning that the diff is pretty small now. But ok, I'll try.


> > 
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > ---
> >  drivers/mtd/nand/raw/atmel/nand-controller.c |  9 +++--
> >  drivers/mtd/nand/raw/brcmnand/brcmnand.c     |  7 ++--
> >  drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c   | 12 +++---
> >  drivers/mtd/nand/raw/marvell_nand.c          |  7 ++--
> >  drivers/mtd/nand/raw/mtk_nand.c              |  4 +-
> >  drivers/mtd/nand/raw/nand_base.c             | 25 ++++++------
> >  drivers/mtd/nand/raw/nand_esmt.c             | 11 +++---
> >  drivers/mtd/nand/raw/nand_hynix.c            | 41 ++++++++++----------
> >  drivers/mtd/nand/raw/nand_jedec.c            |  4 +-
> >  drivers/mtd/nand/raw/nand_micron.c           | 14 ++++---
> >  drivers/mtd/nand/raw/nand_onfi.c             |  8 ++--
> >  drivers/mtd/nand/raw/nand_samsung.c          | 19 ++++-----
> >  drivers/mtd/nand/raw/nand_toshiba.c          | 11 +++---
> >  drivers/mtd/nand/raw/sunxi_nand.c            |  5 ++-
> >  drivers/mtd/nand/raw/tegra_nand.c            |  9 +++--
> >  drivers/mtd/nand/spi/core.c                  |  8 ++--
> >  drivers/mtd/nand/spi/macronix.c              |  6 +--
> >  drivers/mtd/nand/spi/toshiba.c               |  6 +--
> >  include/linux/mtd/nand.h                     |  8 ++--
> >  19 files changed, 114 insertions(+), 100 deletions(-)
> > 

