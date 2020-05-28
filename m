Return-Path: <SRS0=2ZKK=7K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49E2EC433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 14:45:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 20D5A20888
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 14:45:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725922AbgE1Opo (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 May 2020 10:45:44 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:50833 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728510AbgE1Opn (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 28 May 2020 10:45:43 -0400
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 4C0F4C0009;
        Thu, 28 May 2020 14:45:37 +0000 (UTC)
Date:   Thu, 28 May 2020 16:45:35 +0200
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
Subject: Re: [PATCH v6 08/18] mtd: rawnand: Use the new ECC engine type
 enumeration
Message-ID: <20200528164535.3655ffcb@xps13>
In-Reply-To: <20200528163150.6ad71fcc@collabora.com>
References: <20200528113113.9166-1-miquel.raynal@bootlin.com>
        <20200528113113.9166-9-miquel.raynal@bootlin.com>
        <20200528163150.6ad71fcc@collabora.com>
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
2020 16:31:50 +0200:

> On Thu, 28 May 2020 13:31:03 +0200
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> 
> > Mechanical switch from the legacy "mode" enumeration to the new
> > "engine type" enumeration in drivers and board files.
> > 
> > The device tree parsing is also updated to return the new enumeration
> > from the old strings.
> > 
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>  
> 
> I didn't check all the changes, but I'm fine with the approach
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> 
> > diff --git a/include/linux/platform_data/mtd-davinci.h b/include/linux/platform_data/mtd-davinci.h
> > index 3383101c233b..dd474dd44848 100644
> > --- a/include/linux/platform_data/mtd-davinci.h
> > +++ b/include/linux/platform_data/mtd-davinci.h
> > @@ -60,16 +60,16 @@ struct davinci_nand_pdata {		/* platform_data */
> >  	struct mtd_partition	*parts;
> >  	unsigned		nr_parts;
> >  
> > -	/* none  == NAND_ECC_NONE (strongly *not* advised!!)
> > -	 * soft  == NAND_ECC_SOFT
> > -	 * else  == NAND_ECC_HW, according to ecc_bits
> > +	/* none  == NAND_ECC_ENGINE_TYPE_NONE (strongly *not* advised!!)
> > +	 * soft  == NAND_ECC_ENGINE_TYPE_SOFT
> > +	 * else  == NAND_ECC_ENGINE_TYPE_ON_HOST, according to ecc_bits
> >  	 *
> >  	 * All DaVinci-family chips support 1-bit hardware ECC.
> >  	 * Newer ones also support 4-bit ECC, but are awkward
> >  	 * using it with large page chips.
> >  	 */
> > -	enum nand_ecc_mode	ecc_mode;
> > -	enum nand_ecc_placement	ecc_placement;
> > +	enum nand_ecc_engine_type engine_type;
> > +	enum nand_ecc_placement ecc_placement;  
> 
> Nitpick: if you want to use a space instead of tab, it should be done in
> patch 3.

Right, fixed!
