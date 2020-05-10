Return-Path: <SRS0=AC3K=6Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3A48C54E49
	for <linux-devicetree@archiver.kernel.org>; Sun, 10 May 2020 08:33:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9A0202495A
	for <linux-devicetree@archiver.kernel.org>; Sun, 10 May 2020 08:33:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726630AbgEJIdP (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 10 May 2020 04:33:15 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:40737 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726345AbgEJIdO (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 10 May 2020 04:33:14 -0400
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 27700200005;
        Sun, 10 May 2020 08:33:10 +0000 (UTC)
Date:   Sun, 10 May 2020 10:33:09 +0200
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
Message-ID: <20200510103309.4ef5467a@xps13>
In-Reply-To: <20200510085219.2f726178@collabora.com>
References: <20200508171339.8052-1-miquel.raynal@bootlin.com>
        <20200508171339.8052-8-miquel.raynal@bootlin.com>
        <20200510085146.3f5274b2@collabora.com>
        <20200510085219.2f726178@collabora.com>
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
2020 08:52:19 +0200:

> On Sun, 10 May 2020 08:51:46 +0200
> Boris Brezillon <boris.brezillon@collabora.com> wrote:
> 
> > On Fri,  8 May 2020 19:13:38 +0200
> > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >   
> > > +			pktsize = DIV_ROUND_UP(nfc_op->len, nfc_op->steps);
> > > +			nfc_op->pkt_reg |= PKT_SIZE(round_up(pktsize, 4)) |
> > > +					   PKT_STEPS(nfc_op->steps);    
> > 
> > I thought we agreed on reject any mismatch in the size. Any reason for  
> 
> 			 ^rejecting
> 
> > not being strict here?  
> 

I cannot, reading a two bytes ID fails if I don't round it up to 4 ->
no NAND device found!
