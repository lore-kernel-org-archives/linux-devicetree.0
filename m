Return-Path: <SRS0=AC3K=6Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F219AC54E49
	for <linux-devicetree@archiver.kernel.org>; Sun, 10 May 2020 08:41:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CB71B208E4
	for <linux-devicetree@archiver.kernel.org>; Sun, 10 May 2020 08:41:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725994AbgEJIlu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 10 May 2020 04:41:50 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:36952 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725839AbgEJIlu (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 10 May 2020 04:41:50 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 5F8AC2A139F;
        Sun, 10 May 2020 09:41:48 +0100 (BST)
Date:   Sun, 10 May 2020 10:41:45 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
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
Message-ID: <20200510104145.7d53a58b@collabora.com>
In-Reply-To: <20200510103547.7399eba3@xps13>
References: <20200508171339.8052-1-miquel.raynal@bootlin.com>
        <20200508171339.8052-8-miquel.raynal@bootlin.com>
        <20200510090230.1ba6f6d7@collabora.com>
        <20200510103547.7399eba3@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, 10 May 2020 10:35:47 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Boris,
> 
> Boris Brezillon <boris.brezillon@collabora.com> wrote on Sun, 10 May
> 2020 09:02:30 +0200:
> 
> > On Fri,  8 May 2020 19:13:38 +0200
> > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >   
> > > +static int anfc_len_to_steps(struct nand_chip *chip, unsigned int len)
> > > +{
> > > +	unsigned int steps = 1, pktsize = len;
> > > +
> > > +	while (pktsize > ANFC_MAX_PKT_SIZE) {
> > > +		steps *= 2;
> > > +		pktsize = DIV_ROUND_UP(len, steps);
> > > +	}    
> > 
> > 
> > Same here, you shouldn't have a round_up() but instead complain if
> > "len != pkt_size * steps"
> > 
> > 	if (len % 4)
> > 		return -ENOTSUPP;  
> 
> This is not possible, we need unaligned accesses for NAND detection.

Duh, this really calls for a comment saying how wrong this is and how
it should be fixed (discussions we had about data size constraints and
the 'can-issue-more' flag on data_in/out instructions).

> 
> > 
> > 	if (len < ANFC_MAX_PKT_SIZE)
> > 		return len;
> > 
> > 	for (steps = 2; steps < ANFC_MAX_STEPS; steps *= 2) {
> > 		pkt_size = len / steps;
> > 		if (pkt_size <= ANFC_MAX_PKT_SIZE)
> > 			break;
> > 	}
> > 
> > 	if (pkt_size * steps != len)
> > 		return -ENOTSUPP;
> > 
> > 	return pkt_size;  
> 
> The rest looks fine, I will change it and also add these checks in
> ->exec_op() check_nonly path.  

