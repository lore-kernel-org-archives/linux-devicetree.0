Return-Path: <SRS0=2ZKK=7K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC306C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 23:55:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B48482075F
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 23:55:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437899AbgE1Xz3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 May 2020 19:55:29 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:53475 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437891AbgE1Xz1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 28 May 2020 19:55:27 -0400
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id ED71F20003;
        Thu, 28 May 2020 23:55:20 +0000 (UTC)
Date:   Fri, 29 May 2020 01:55:19 +0200
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
Subject: Re: [PATCH v6 18/18] mtd: rawnand: Move generic bits to the ECC
 framework
Message-ID: <20200529015519.14ee29be@xps13>
In-Reply-To: <20200528175656.0a32dd7c@collabora.com>
References: <20200528113113.9166-1-miquel.raynal@bootlin.com>
        <20200528113113.9166-19-miquel.raynal@bootlin.com>
        <20200528175656.0a32dd7c@collabora.com>
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
2020 17:56:56 +0200:

> On Thu, 28 May 2020 13:31:13 +0200
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> 
> > +/**
> > + * nanddev_get_flash_node() - Get the device node attached to a NAND device
> > + * @nand: NAND device
> > + *
> > + * Return: the device node linked to @nand.
> > + */
> > +static inline struct device_node *nanddev_get_flash_node(struct nand_device *nand)
> > +{
> > +	return mtd_get_of_node(nanddev_to_mtd(nand));
> > +}
> > +  
> 
> Can we name that one nanddev_get_of_node(). We'll probably want to
> expose fwnode at some point, and get_flash_node() is a bit too generic
> IMO.

I just spot that there is a nanddev_get_of_node() function already,
which does exactly the same as nanddev_get_flash_node(), so I just
dropped it.
