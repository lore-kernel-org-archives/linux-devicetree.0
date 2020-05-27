Return-Path: <SRS0=aO3b=7J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 746E5C433E0
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 May 2020 08:34:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 559042078B
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 May 2020 08:34:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388035AbgE0IeW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 27 May 2020 04:34:22 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:55673 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387397AbgE0IeW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 27 May 2020 04:34:22 -0400
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id BA692240008;
        Wed, 27 May 2020 08:33:58 +0000 (UTC)
Date:   Wed, 27 May 2020 10:33:56 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <devicetree@vger.kernel.org>
Subject: Re: [RESEND v5 09/21] mtd: rawnand: Create a new enumeration to
 describe properly ECC types
Message-ID: <20200527103356.56e145a9@xps13>
In-Reply-To: <20200527005928.39c549e2@collabora.com>
References: <20200526195633.11543-1-miquel.raynal@bootlin.com>
        <20200526195633.11543-10-miquel.raynal@bootlin.com>
        <20200527005928.39c549e2@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


Boris Brezillon <boris.brezillon@collabora.com> wrote on Wed, 27 May
2020 00:59:28 +0200:

> On Tue, 26 May 2020 21:56:21 +0200
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> 
> > Now that the misleading mix between ECC engine type and OOB placement
> > has been addressed, add a new enumeration to properly define ECC types
> > (also called provider or mode).
> > 
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> >  drivers/mtd/nand/raw/nand_base.c |  7 +++++++
> >  include/linux/mtd/rawnand.h      | 16 ++++++++++++++++
> >  2 files changed, 23 insertions(+)
> > 
> > diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> > index 515cd4681660..5c6ab5b93270 100644
> > --- a/drivers/mtd/nand/raw/nand_base.c
> > +++ b/drivers/mtd/nand/raw/nand_base.c
> > @@ -5018,6 +5018,13 @@ static const char * const nand_ecc_modes[] = {
> >  	[NAND_ECC_ON_DIE]	= "on-die",
> >  };
> >  
> > +static const char * const nand_ecc_engine_providers[] = {  
> 
> This table is not used here, are you sure it should be introduced now?
> 
> > +	[NAND_ECC_ENGINE_NONE] = "none",
> > +	[NAND_ECC_ENGINE_SOFT] = "soft",
> > +	[NAND_ECC_ENGINE_CONTROLLER] = "hw",  
> 
> 					^ "on-controller" ?

This would break DT backward compatibility, I am afraid I cannot do
that. Honnestly, I find "hw" good enough because "on-controller" is
also too restrictive. What about an external (non-pipelined) engine
like the one I am about to introduce?

> 
> > +	[NAND_ECC_ENGINE_ON_DIE] = "on-die",
> > +};
> > +
> >  static const char * const nand_ecc_placement[] = {
> >  	[NAND_ECC_PLACEMENT_INTERLEAVED] = "interleaved",
> >  };
> > diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> > index dc909fb977c7..a2078c5f3d21 100644
> > --- a/include/linux/mtd/rawnand.h
> > +++ b/include/linux/mtd/rawnand.h
> > @@ -92,6 +92,22 @@ enum nand_ecc_mode {
> >  	NAND_ECC_ON_DIE,
> >  };
> >  
> > +/**
> > + * enum nand_ecc_engine_type - NAND ECC engine type/provider
> > + * @NAND_ECC_ENGINE_INVALID: Invalid value
> > + * @NAND_ECC_ENGINE_NONE: No ECC correction
> > + * @NAND_ECC_ENGINE_SOFT: Software ECC correction
> > + * @NAND_ECC_ENGINE_CONTROLLER: Hardware controller ECC correction
> > + * @NAND_ECC_ENGINE_ON_DIE: On chip hardware ECC correction
> > + */
> > +enum nand_ecc_engine_type {
> > +	NAND_ECC_ENGINE_INVALID,
> > +	NAND_ECC_ENGINE_NONE,
> > +	NAND_ECC_ENGINE_SOFT,
> > +	NAND_ECC_ENGINE_CONTROLLER,
> > +	NAND_ECC_ENGINE_ON_DIE,
> > +};
> > +
> >  /**
> >   * enum nand_ecc_placement - NAND ECC placement
> >   * @NAND_ECC_PLACEMENT_FREE: The driver can decide where to put ECC bytes.  
> 
