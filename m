Return-Path: <SRS0=2ZKK=7K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD877C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 14:53:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 951AD2075F
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 14:53:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391349AbgE1Ox0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 May 2020 10:53:26 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:56893 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391244AbgE1OxZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 28 May 2020 10:53:25 -0400
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id C190F20000C;
        Thu, 28 May 2020 14:53:17 +0000 (UTC)
Date:   Thu, 28 May 2020 16:53:16 +0200
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
Subject: Re: [PATCH v6 17/18] mtd: rawnand: Write a compatibility layer
Message-ID: <20200528165316.647f9cb0@xps13>
In-Reply-To: <20200528164217.4eec33ae@collabora.com>
References: <20200528113113.9166-1-miquel.raynal@bootlin.com>
        <20200528113113.9166-18-miquel.raynal@bootlin.com>
        <20200528164217.4eec33ae@collabora.com>
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
2020 16:42:17 +0200:

> On Thu, 28 May 2020 13:31:12 +0200
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> 
> > +static enum nand_ecc_engine_type
> > +of_get_rawnand_ecc_engine_type_legacy(struct device_node *np)
> > +{
> > +	enum nand_ecc_legacy_mode {
> > +		NAND_ECC_INVALID,
> > +		NAND_ECC_NONE,
> > +		NAND_ECC_SOFT,
> > +		NAND_ECC_SOFT_BCH,
> > +		NAND_ECC_HW,
> > +		NAND_ECC_HW_SYNDROME,
> > +		NAND_ECC_ON_DIE,
> > +	};  
> 
> You're redefining an enum, but I don't see the old enum/defines being
> removed, is that expected?

Oh yeah, my desire was to get rid of this public enumeration and mov it
to the single legacy function using it, but indeed I am removing it in
the next patch as part of the global move to nand/core.c. I will do it
in this patch.
