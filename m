Return-Path: <SRS0=aO3b=7J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74FE2C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 May 2020 08:42:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 559732084C
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 May 2020 08:42:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388182AbgE0Imd (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 27 May 2020 04:42:33 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:39477 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388161AbgE0Imc (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 27 May 2020 04:42:32 -0400
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id CF1B120015;
        Wed, 27 May 2020 08:42:29 +0000 (UTC)
Date:   Wed, 27 May 2020 10:42:28 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <devicetree@vger.kernel.org>
Subject: Re: [RESEND v5 12/21] mtd: rawnand: Deprecate nand-ecc-mode in
 favor of nand-ecc-provider
Message-ID: <20200527104228.6ee6efc0@xps13>
In-Reply-To: <20200527010325.0e7213b2@collabora.com>
References: <20200526195633.11543-1-miquel.raynal@bootlin.com>
        <20200526195633.11543-13-miquel.raynal@bootlin.com>
        <20200527010325.0e7213b2@collabora.com>
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
2020 01:03:25 +0200:

> On Tue, 26 May 2020 21:56:24 +0200
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> 
> > Use nand-ecc-provider as the provider DT property. Fallback to
> > nand-ecc-mode if the property does not exist.
> > 
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > ---
> >  drivers/mtd/nand/raw/nand_base.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> > index 69c1b7ab938e..7d17d52cdd34 100644
> > --- a/drivers/mtd/nand/raw/nand_base.c
> > +++ b/drivers/mtd/nand/raw/nand_base.c
> > @@ -5036,7 +5036,9 @@ of_get_nand_ecc_engine_type(struct device_node *np)
> >  	const char *pm;
> >  	int err;
> >  
> > -	err = of_property_read_string(np, "nand-ecc-mode", &pm);
> > +	err = of_property_read_string(np, "nand-ecc-provider", &pm);  
> 
> 					   "nand-ecc-engine-type"
> 
> And I'd prefer to have a different string table for that one, so we get
> rid of the confusing "hw" type (which is actually "on-controller").

So this means
* keeping a legacy table
* supporting both tables
* with both DT properties
* eventually refuse the legacy entries in spi-nand

Sounds like a lot of burden to me for a minor improvement. If we rename
"hw" into "on-controller" we must also add "off-controller" then, but
again, I find it confusing.

I am a bit lost on what is the "right" direction right now.
