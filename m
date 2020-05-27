Return-Path: <SRS0=aO3b=7J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE7D1C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 May 2020 08:44:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C6C602084C
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 May 2020 08:44:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388216AbgE0Ioj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 27 May 2020 04:44:39 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:40046 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388206AbgE0Iog (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 27 May 2020 04:44:36 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 773482A3703;
        Wed, 27 May 2020 09:44:33 +0100 (BST)
Date:   Wed, 27 May 2020 10:44:30 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <devicetree@vger.kernel.org>
Subject: Re: [RESEND v5 09/21] mtd: rawnand: Create a new enumeration to
 describe properly ECC types
Message-ID: <20200527104430.187e5feb@collabora.com>
In-Reply-To: <20200527103356.56e145a9@xps13>
References: <20200526195633.11543-1-miquel.raynal@bootlin.com>
        <20200526195633.11543-10-miquel.raynal@bootlin.com>
        <20200527005928.39c549e2@collabora.com>
        <20200527103356.56e145a9@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 27 May 2020 10:33:56 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Boris Brezillon <boris.brezillon@collabora.com> wrote on Wed, 27 May
> 2020 00:59:28 +0200:
> 
> > On Tue, 26 May 2020 21:56:21 +0200
> > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >   
> > > Now that the misleading mix between ECC engine type and OOB placement
> > > has been addressed, add a new enumeration to properly define ECC types
> > > (also called provider or mode).
> > > 
> > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > > Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > ---
> > >  drivers/mtd/nand/raw/nand_base.c |  7 +++++++
> > >  include/linux/mtd/rawnand.h      | 16 ++++++++++++++++
> > >  2 files changed, 23 insertions(+)
> > > 
> > > diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> > > index 515cd4681660..5c6ab5b93270 100644
> > > --- a/drivers/mtd/nand/raw/nand_base.c
> > > +++ b/drivers/mtd/nand/raw/nand_base.c
> > > @@ -5018,6 +5018,13 @@ static const char * const nand_ecc_modes[] = {
> > >  	[NAND_ECC_ON_DIE]	= "on-die",
> > >  };
> > >  
> > > +static const char * const nand_ecc_engine_providers[] = {    
> > 
> > This table is not used here, are you sure it should be introduced now?
> >   
> > > +	[NAND_ECC_ENGINE_NONE] = "none",
> > > +	[NAND_ECC_ENGINE_SOFT] = "soft",
> > > +	[NAND_ECC_ENGINE_CONTROLLER] = "hw",    
> > 
> > 					^ "on-controller" ?  
> 
> This would break DT backward compatibility, I am afraid I cannot do
> that.

You can always keep a translation table for the old prop
(nand-ecc-mode) and have a new one for the new prop
(nand-ecc-engine-type). But maybe you're not introducing a new property
in this series, in which case the translation table here is just fine.

> Honnestly, I find "hw" good enough because "on-controller" is
> also too restrictive.

How about "on-host", it doesn't say anything about where the engine is
on the host (can be embedded in the controller, or an external block),
yet clearly describe the fact that it's not on-die ECC.

> What about an external (non-pipelined) engine
> like the one I am about to introduce?
> 
> >   
> > > +	[NAND_ECC_ENGINE_ON_DIE] = "on-die",

Well, this one is also a HW engine, and that's the problem I have with
the "hw" string.

> > > +};
> > > +
> > >  static const char * const nand_ecc_placement[] = {
> > >  	[NAND_ECC_PLACEMENT_INTERLEAVED] = "interleaved",
> > >  };
> > > diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> > > index dc909fb977c7..a2078c5f3d21 100644
> > > --- a/include/linux/mtd/rawnand.h
> > > +++ b/include/linux/mtd/rawnand.h
> > > @@ -92,6 +92,22 @@ enum nand_ecc_mode {
> > >  	NAND_ECC_ON_DIE,
> > >  };
> > >  
> > > +/**
> > > + * enum nand_ecc_engine_type - NAND ECC engine type/provider
> > > + * @NAND_ECC_ENGINE_INVALID: Invalid value
> > > + * @NAND_ECC_ENGINE_NONE: No ECC correction
> > > + * @NAND_ECC_ENGINE_SOFT: Software ECC correction
> > > + * @NAND_ECC_ENGINE_CONTROLLER: Hardware controller ECC correction
> > > + * @NAND_ECC_ENGINE_ON_DIE: On chip hardware ECC correction
> > > + */
> > > +enum nand_ecc_engine_type {
> > > +	NAND_ECC_ENGINE_INVALID,
> > > +	NAND_ECC_ENGINE_NONE,
> > > +	NAND_ECC_ENGINE_SOFT,
> > > +	NAND_ECC_ENGINE_CONTROLLER,
> > > +	NAND_ECC_ENGINE_ON_DIE,
> > > +};
> > > +
> > >  /**
> > >   * enum nand_ecc_placement - NAND ECC placement
> > >   * @NAND_ECC_PLACEMENT_FREE: The driver can decide where to put ECC bytes.    
> >   

