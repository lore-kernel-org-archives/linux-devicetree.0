Return-Path: <SRS0=PVp5=7S=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D14B6C433DF
	for <linux-devicetree@archiver.kernel.org>; Fri,  5 Jun 2020 07:18:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B083A206E6
	for <linux-devicetree@archiver.kernel.org>; Fri,  5 Jun 2020 07:18:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725986AbgFEHS2 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 5 Jun 2020 03:18:28 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:60369 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725280AbgFEHS2 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 5 Jun 2020 03:18:28 -0400
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 61F4820014;
        Fri,  5 Jun 2020 07:18:19 +0000 (UTC)
Date:   Fri, 5 Jun 2020 09:18:15 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        linux-mtd@lists.infradead.org,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-arm-kernel@lists.infradead.org,
        Mason Yang <masonccyang@mxic.com.tw>,
        Julien Su <juliensu@mxic.com.tw>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v10 07/20] dt-bindings: mtd: Document boolean NAND ECC
 properties
Message-ID: <20200605091815.714012d9@xps13>
In-Reply-To: <20200604230804.GA13821@bogus>
References: <20200603175759.19948-1-miquel.raynal@bootlin.com>
        <20200603175759.19948-8-miquel.raynal@bootlin.com>
        <20200604230804.GA13821@bogus>
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

Rob Herring <robh@kernel.org> wrote on Thu, 4 Jun 2020 17:08:04 -0600:

> On Wed, Jun 03, 2020 at 07:57:46PM +0200, Miquel Raynal wrote:
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
> 
> Humm, I'm surprised this is valid YAML. nand-use-soft-ecc-engine can't 
> be both a boolean and a map (aka schema, aka dict).
> 
> nand-use-soft-ecc-engine:
>   type: boolean
>   description: ...
> 

Ok, I might have been inspired from this line in example-schema.yaml:

  interrupt-controller: true                                                                                                   
    # The core checks this is a boolean, so just have to list it here to be                                                    
    # valid for this binding.


Thanks for the review, I'll correct it.

Cheers,
Miquèl
