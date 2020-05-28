Return-Path: <SRS0=2ZKK=7K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90BECC433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 15:02:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 729B32075F
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 15:02:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403789AbgE1PCl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 May 2020 11:02:41 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:58465 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403800AbgE1PCl (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 28 May 2020 11:02:41 -0400
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 22B84240017;
        Thu, 28 May 2020 15:02:34 +0000 (UTC)
Date:   Thu, 28 May 2020 17:02:33 +0200
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
        <linux-arm-kernel@lists.infradead.org>,
        Mason Yang <masonccyang@mxic.com.tw>,
        Julien Su <juliensu@mxic.com.tw>
Subject: Re: [PATCH v6 14/18] mtd: nand: Add more parameters to the
 nand_ecc_props structure
Message-ID: <20200528170233.0b91986b@xps13>
In-Reply-To: <20200528170022.5cd5b46c@collabora.com>
References: <20200528113113.9166-1-miquel.raynal@bootlin.com>
        <20200528113113.9166-15-miquel.raynal@bootlin.com>
        <20200528163424.6677597c@collabora.com>
        <20200528165754.35985b62@xps13>
        <20200528170022.5cd5b46c@collabora.com>
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
2020 17:00:22 +0200:

> On Thu, 28 May 2020 16:57:54 +0200
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> 
> > Boris Brezillon <boris.brezillon@collabora.com> wrote on Thu, 28 May
> > 2020 16:34:24 +0200:
> >   
> > > On Thu, 28 May 2020 13:31:09 +0200
> > > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> > >     
> > > > Prepare the migration to the generic ECC framework by adding more
> > > > fields to the nand_ecc_props structure which will be used widely to
> > > > describe different kind of ECC properties.
> > > > 
> > > > Doing this imposes to move the engine type, ECC placement and
> > > > algorithm enumerations in a shared place: nand.h.
> > > > 
> > > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > > > ---
> > > >  include/linux/mtd/nand.h    | 52 +++++++++++++++++++++++++++++++++++++
> > > >  include/linux/mtd/rawnand.h | 44 -------------------------------
> > > >  2 files changed, 52 insertions(+), 44 deletions(-)
> > > > 
> > > > diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> > > > index 6add464fd18b..2e9af24936cd 100644
> > > > --- a/include/linux/mtd/nand.h
> > > > +++ b/include/linux/mtd/nand.h
> > > > @@ -127,14 +127,66 @@ struct nand_page_io_req {
> > > >  	int mode;
> > > >  };
> > > >  
> > > > +/**
> > > > + * enum nand_ecc_engine_type - NAND ECC engine type
> > > > + * @NAND_ECC_ENGINE_TYPE_INVALID: Invalid value
> > > > + * @NAND_ECC_ENGINE_TYPE_NONE: No ECC correction
> > > > + * @NAND_ECC_ENGINE_TYPE_SOFT: Software ECC correction
> > > > + * @NAND_ECC_ENGINE_TYPE_ON_HOST: On host hardware ECC correction
> > > > + * @NAND_ECC_ENGINE_TYPE_ON_DIE: On chip hardware ECC correction
> > > > + */
> > > > +enum nand_ecc_engine_type {
> > > > +	NAND_ECC_ENGINE_TYPE_INVALID,
> > > > +	NAND_ECC_ENGINE_TYPE_NONE,
> > > > +	NAND_ECC_ENGINE_TYPE_SOFT,
> > > > +	NAND_ECC_ENGINE_TYPE_ON_HOST,
> > > > +	NAND_ECC_ENGINE_TYPE_ON_DIE,
> > > > +};
> > > > +
> > > > +/**
> > > > + * enum nand_ecc_placement - NAND ECC bytes placement
> > > > + * @NAND_ECC_PLACEMENT_UNKNOWN: The actual position of the ECC bytes is unknown
> > > > + * @NAND_ECC_PLACEMENT_OOB: The ECC bytes are located in the OOB area
> > > > + * @NAND_ECC_PLACEMENT_INTERLEAVED: Syndrome layout, there are ECC bytes
> > > > + *                                  interleaved with regular data in the main
> > > > + *                                  area
> > > > + */
> > > > +enum nand_ecc_placement {
> > > > +	NAND_ECC_PLACEMENT_UNKNOWN,
> > > > +	NAND_ECC_PLACEMENT_OOB,
> > > > +	NAND_ECC_PLACEMENT_INTERLEAVED,
> > > > +};
> > > > +
> > > > +/**
> > > > + * enum nand_ecc_algo - NAND ECC algorithm
> > > > + * @NAND_ECC_ALGO_UNKNOWN: Unknown algorithm
> > > > + * @NAND_ECC_ALGO_HAMMING: Hamming algorithm
> > > > + * @NAND_ECC_ALGO_BCH: Bose-Chaudhuri-Hocquenghem algorithm
> > > > + * @NAND_ECC_ALGO_RS: Reed-Solomon algorithm
> > > > + */
> > > > +enum nand_ecc_algo {
> > > > +	NAND_ECC_ALGO_UNKNOWN,
> > > > +	NAND_ECC_ALGO_HAMMING,
> > > > +	NAND_ECC_ALGO_BCH,
> > > > +	NAND_ECC_ALGO_RS,
> > > > +};
> > > > +
> > > >  /**
> > > >   * struct nand_ecc_props - NAND ECC properties
> > > > + * @engine_type: ECC engine type
> > > > + * @placement: OOB placement (if relevant)
> > > > + * @algo: ECC algorithm (if relevant)
> > > >   * @strength: ECC strength
> > > >   * @step_size: Number of bytes per step
> > > > + * @flags: Misc properties      
> > > 
> > > I'd like to hear more about that one. What is this about? I'd rather
> > > not add a field if it's not needed.
> > >     
> > 
> > It is used in patch 18/18 to store the NAND_ECC_MAXIMIZE flag. And I
> > expect others to come later...  
> 
> Then I think it should be introduced in this patch, not here.

I'm fine with that.
