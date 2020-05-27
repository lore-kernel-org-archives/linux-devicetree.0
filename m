Return-Path: <SRS0=aO3b=7J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E51EC433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 May 2020 08:00:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6503320EDD
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 May 2020 08:00:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729378AbgE0IA7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 27 May 2020 04:00:59 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:59933 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729402AbgE0IA6 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 27 May 2020 04:00:58 -0400
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 26CED200013;
        Wed, 27 May 2020 08:00:52 +0000 (UTC)
Date:   Wed, 27 May 2020 10:00:50 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <devicetree@vger.kernel.org>
Subject: Re: [RESEND v5 07/21] mtd: rawnand: Create a new enumeration to
 describe OOB placement
Message-ID: <20200527100050.7e54713a@xps13>
In-Reply-To: <20200527003904.362e59e4@collabora.com>
References: <20200526195633.11543-1-miquel.raynal@bootlin.com>
        <20200526195633.11543-8-miquel.raynal@bootlin.com>
        <20200527003904.362e59e4@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Boris,

Boris Brezillon <boris.brezillon@collabora.com> wrote on Wed, 27 May
2020 00:39:04 +0200:

> On Tue, 26 May 2020 21:56:19 +0200
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> 
> > There is currently a confusion between the ECC type/mode/provider
> > (eg. hardware, software, on-die or none) and the ECC bytes placement.
> > 
> > Create a new enumeration to describe this placement.
> > 
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> >  drivers/mtd/nand/raw/nand_base.c |  4 ++++
> >  include/linux/mtd/rawnand.h      | 12 ++++++++++++
> >  2 files changed, 16 insertions(+)
> > 
> > diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> > index ef70ca0828c3..a4470a19c805 100644
> > --- a/drivers/mtd/nand/raw/nand_base.c
> > +++ b/drivers/mtd/nand/raw/nand_base.c
> > @@ -5018,6 +5018,10 @@ static const char * const nand_ecc_modes[] = {
> >  	[NAND_ECC_ON_DIE]	= "on-die",
> >  };
> >  
> > +static const char * const nand_ecc_placement[] = {
> > +	[NAND_ECC_PLACEMENT_INTERLEAVED] = "interleaved",
> > +};
> > +
> >  static int of_get_nand_ecc_mode(struct device_node *np)
> >  {
> >  	const char *pm;
> > diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> > index 8187056dd3a0..6eb4d91b07eb 100644
> > --- a/include/linux/mtd/rawnand.h
> > +++ b/include/linux/mtd/rawnand.h
> > @@ -92,6 +92,18 @@ enum nand_ecc_mode {
> >  	NAND_ECC_ON_DIE,
> >  };
> >  
> > +/**
> > + * enum nand_ecc_placement - NAND ECC placement
> > + * @NAND_ECC_PLACEMENT_FREE: The driver can decide where to put ECC bytes.  
> 
> Can we name that one UNDEFINED instead of FREE, and it's not really the
> driver that decides (unless you have a choice or use SW ECC), more the ECC
> engine itself.

Ack.

> 
> > + *                           Default behavior is to put them at the end of the
> > + *                           OOB area.  
> 
> I wouldn't even define a default behavior here, but instead add a value for
> OOB/TAIL placement.

This is for legacy reasons, maybe I should not say it is a default, but
rather a common location (or say nothing).

> 
> > + * @NAND_ECC_PLACEMENT_INTERLEAVED: Syndrome layout: interleave data and OOB.  
> 
> 
> 									     ^ECC bytes
> 
> > + */
> > +enum nand_ecc_placement {
> > +	NAND_ECC_PLACEMENT_FREE,
> > +	NAND_ECC_PLACEMENT_INTERLEAVED,
> > +};
> > +
> >  enum nand_ecc_algo {
> >  	NAND_ECC_UNKNOWN,
> >  	NAND_ECC_HAMMING,  
> 
