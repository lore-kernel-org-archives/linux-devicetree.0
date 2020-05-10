Return-Path: <SRS0=AC3K=6Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 719FBC54E49
	for <linux-devicetree@archiver.kernel.org>; Sun, 10 May 2020 08:54:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4F10220731
	for <linux-devicetree@archiver.kernel.org>; Sun, 10 May 2020 08:54:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725994AbgEJIyA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 10 May 2020 04:54:00 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:37963 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725839AbgEJIx7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 10 May 2020 04:53:59 -0400
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 8C273240006;
        Sun, 10 May 2020 08:53:55 +0000 (UTC)
Date:   Sun, 10 May 2020 10:53:54 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <devicetree@vger.kernel.org>, Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        <linux-mtd@lists.infradead.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Michal Simek <monstr@monstr.eu>,
        Naga Sureshkumar Relli <nagasure@xilinx.com>
Subject: Re: [PATCH v4 7/8] mtd: rawnand: arasan: Add new Arasan NAND
 controller
Message-ID: <20200510105354.2a6725a8@xps13>
In-Reply-To: <20200510104145.7d53a58b@collabora.com>
References: <20200508171339.8052-1-miquel.raynal@bootlin.com>
        <20200508171339.8052-8-miquel.raynal@bootlin.com>
        <20200510090230.1ba6f6d7@collabora.com>
        <20200510103547.7399eba3@xps13>
        <20200510104145.7d53a58b@collabora.com>
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

Boris Brezillon <boris.brezillon@collabora.com> wrote on Sun, 10 May
2020 10:41:45 +0200:

> On Sun, 10 May 2020 10:35:47 +0200
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> 
> > Hi Boris,
> > 
> > Boris Brezillon <boris.brezillon@collabora.com> wrote on Sun, 10 May
> > 2020 09:02:30 +0200:
> >   
> > > On Fri,  8 May 2020 19:13:38 +0200
> > > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> > >     
> > > > +static int anfc_len_to_steps(struct nand_chip *chip, unsigned int len)
> > > > +{
> > > > +	unsigned int steps = 1, pktsize = len;
> > > > +
> > > > +	while (pktsize > ANFC_MAX_PKT_SIZE) {
> > > > +		steps *= 2;
> > > > +		pktsize = DIV_ROUND_UP(len, steps);
> > > > +	}      
> > > 
> > > 
> > > Same here, you shouldn't have a round_up() but instead complain if
> > > "len != pkt_size * steps"
> > > 
> > > 	if (len % 4)
> > > 		return -ENOTSUPP;    
> > 
> > This is not possible, we need unaligned accesses for NAND detection.  
> 
> Duh, this really calls for a comment saying how wrong this is and how
> it should be fixed (discussions we had about data size constraints and
> the 'can-issue-more' flag on data_in/out instructions).

Agreed, I'll add a comment there :/

> 
> >   
> > > 
> > > 	if (len < ANFC_MAX_PKT_SIZE)
> > > 		return len;
> > > 
> > > 	for (steps = 2; steps < ANFC_MAX_STEPS; steps *= 2) {
> > > 		pkt_size = len / steps;
> > > 		if (pkt_size <= ANFC_MAX_PKT_SIZE)
> > > 			break;
> > > 	}
> > > 
> > > 	if (pkt_size * steps != len)
> > > 		return -ENOTSUPP;
> > > 
> > > 	return pkt_size;    
> > 
> > The rest looks fine, I will change it and also add these checks in  
> > ->exec_op() check_nonly path.    
> 
