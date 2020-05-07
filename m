Return-Path: <SRS0=rqTW=6V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD7A3C38A24
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 15:53:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9DD7A20659
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 15:53:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbgEGPxI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 May 2020 11:53:08 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:46389 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726531AbgEGPxH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 May 2020 11:53:07 -0400
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 48DF8240007;
        Thu,  7 May 2020 15:53:03 +0000 (UTC)
Date:   Thu, 7 May 2020 17:53:01 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Vignesh Raghavendra <vigneshr@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        Richard Weinberger <richard@nod.at>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        <linux-mtd@lists.infradead.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Michal Simek <monstr@monstr.eu>,
        Naga Sureshkumar Relli <nagasure@xilinx.com>
Subject: Re: [PATCH v3 7/8] mtd: rawnand: arasan: Add new Arasan NAND
 controller
Message-ID: <20200507175301.7affb8f7@xps13>
In-Reply-To: <20200507172453.15a03574@collabora.com>
References: <20200507110034.14736-1-miquel.raynal@bootlin.com>
        <20200507110034.14736-8-miquel.raynal@bootlin.com>
        <20200507141103.0c241877@collabora.com>
        <20200507171311.7669d0db@xps13>
        <20200507172453.15a03574@collabora.com>
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

Boris Brezillon <boris.brezillon@collabora.com> wrote on Thu, 7 May
2020 17:24:53 +0200:

> On Thu, 7 May 2020 17:13:11 +0200
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> 
> > Hi Boris,
> > 
> > Boris Brezillon <boris.brezillon@collabora.com> wrote on Thu, 7 May
> > 2020 14:11:03 +0200:
> >   
> > > On Thu,  7 May 2020 13:00:33 +0200
> > > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> > > 
> > >     
> > > > +
> > > > +static void anfc_chips_cleanup(struct arasan_nfc *nfc)
> > > > +{
> > > > +	struct anand *anand, *tmp;
> > > > +
> > > > +	list_for_each_entry_safe(anand, tmp, &nfc->chips, node) {
> > > > +		nand_release(&anand->chip);      
> > > 
> > > 		ret = mtd_device_unregister(nand_to_mtd(&anand->chip));
> > > 		WARN_ON(ret);
> > > 		nand_cleanup(&anand->chip);
> > > 
> > > Or maybe add this WARN_ON() to nand_release() so we don't have to ask
> > > people to use mtd_device_unregister() + nand_cleanup().    
> > 
> > I don't get your point here? I'm not against adding a warn_on between
> > both functions but it's not related to this driver?  
> 
> We've asked people to not call nand_release() but instead call
> mtd_device_unregister()+nand_cleanup(), which is not done here. My
> point is, if even us can't get it right, maybe it's a sign we should
> instead patch nand_release() to do the right thing.

It's in my todo-list, yes. What about just dropping nand_release
entirely? So that nand_scan_tail as its nand cleanup and
mtd_device_register as its mtd_device_unregister and everything will be
much clearer?

