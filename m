Return-Path: <SRS0=g9lS=AL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C517BC433E0
	for <linux-devicetree@archiver.kernel.org>; Tue, 30 Jun 2020 07:15:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9BF9120759
	for <linux-devicetree@archiver.kernel.org>; Tue, 30 Jun 2020 07:15:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730595AbgF3HPi convert rfc822-to-8bit (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 30 Jun 2020 03:15:38 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:56707 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730538AbgF3HPi (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 30 Jun 2020 03:15:38 -0400
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id C091020003;
        Tue, 30 Jun 2020 07:15:32 +0000 (UTC)
Date:   Tue, 30 Jun 2020 09:15:30 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        linux-mtd@lists.infradead.org,
        Boris Brezillon <boris.brezillon@collabora.com>,
        masonccyang@mxic.com.tw, juliensu@mxic.com.tw,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v11 2/2] dt-bindings: mtd: Document boolean NAND ECC
 properties
Message-ID: <20200630091530.34043726@xps13>
In-Reply-To: <20200629230800.GA3136006@bogus>
References: <20200626071357.21421-1-miquel.raynal@bootlin.com>
        <20200626071357.21421-3-miquel.raynal@bootlin.com>
        <20200629230800.GA3136006@bogus>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Rob,

Rob Herring <robh@kernel.org> wrote on Mon, 29 Jun 2020 17:08:00 -0600:

> On Fri, Jun 26, 2020 at 09:13:57AM +0200, Miquel Raynal wrote:
> > Document nand-use-soft-ecc-engine and nand-no-ecc-engine properties.
> > The former is here to force software correction, the latter prevents
> > any correction to happen.
> > 
> > These properties (along with nand-ecc-engine) are supposed to be more
> > accurate than the current nand-ecc-modes wich is very misleading and
> > very often people think it is mandatory while the core should be
> > relied upon to decide which correction to handle.
> > 
> > nand-ecc-mode was already inacurate, but it becomes totally
> > problematic with setups where there are several hardware engines.
> > 
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > ---
> >  Documentation/devicetree/bindings/mtd/nand-controller.yaml | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> > index 0969d2e6720b..a3750978ebb8 100644
> > --- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> > +++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> > @@ -68,6 +68,12 @@ patternProperties:
> >            3/ The ECC engine is external, in this case the phandle should
> >            reference the specific ECC engine node.
> >  
> > +      nand-use-soft-ecc-engine: true
> > +        description: Use a software ECC engine.
> > +
> > +      nand-no-ecc-engine: true
> > +        description: Do not use any ECC correction.
> > +  
> 
> Still the same problem as v10.

I am very sorry for the error, I fixed both commits with a fixup!
commit at the end of my series and forgot to squash them before
sending...

I'll resend the proper patches. Again, sorry for the time lost.

Thanks,
Miquèl
