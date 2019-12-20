Return-Path: <SRS0=Tw2w=2K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06665C43603
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Dec 2019 10:09:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D73B12467F
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Dec 2019 10:09:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727129AbfLTKJs (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 20 Dec 2019 05:09:48 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:60231 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbfLTKJs (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 20 Dec 2019 05:09:48 -0500
X-Originating-IP: 90.65.102.129
Received: from kb-xps (lfbn-lyo-1-1670-129.w90-65.abo.wanadoo.fr [90.65.102.129])
        (Authenticated sender: kamel.bouhara@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id B9615C0002;
        Fri, 20 Dec 2019 10:09:45 +0000 (UTC)
Date:   Fri, 20 Dec 2019 11:09:44 +0100
From:   Kamel Bouhara <kamel.bouhara@bootlin.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        linux-arm-kernel@lists.infradead.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: arm: at91: Document Kizboxmini and
 Smartkiz boards binding
Message-ID: <20191220100944.GB2601@kb-xps>
References: <20191209091339.32593-1-kamel.bouhara@bootlin.com>
 <20191218202345.GA22591@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191218202345.GA22591@bogus>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Dec 18, 2019 at 02:23:45PM -0600, Rob Herring wrote:
> On Mon, Dec 09, 2019 at 10:13:38AM +0100, Kamel Bouhara wrote:
> > Document devicetree's bindings for the Overkiz's Kizbox Mini and
> > Smartkiz boards, based on a SAM9G25 Atmel SoC.
> >
> > Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
> > ---
> > Changes in v2
> > =============
> > 	- Added Kizboxmini Base board documentation
> > 	- Merged Smartkiz documentation as it is also a sam9g25 based
> > 	board
> >
> > Changes in v3
> > =============
> > 	- Made a single items list with all the sam9g25 based boards and
> > 	put description into a comment.
> > 	- Fixed duplicated item in enum list and checked with 'make
> > 	dt_binding_check'
> >
> > Changes in v4
> > =============
> > 	- Fix missing "-" before items list
> >
> > Changes in v5
> > =============
> > 	- s/at91-kizboxmini_common.dtsi/at91-kizboxmini-common.dtsi/
> > ---
> >  Documentation/devicetree/bindings/arm/atmel-at91.yaml | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.yaml b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
> > index 6dd8be401673..8d50915330e8 100644
> > --- a/Documentation/devicetree/bindings/arm/atmel-at91.yaml
> > +++ b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
> > @@ -35,6 +35,16 @@ properties:
> >                - atmel,at91sam9x60
> >            - const: atmel,at91sam9
> >
> > +      - items:
> > +          - enum:
> > +                - overkiz,kizboxmini-base # Overkiz kizbox Mini Base Board
> > +                - overkiz,kizboxmini-mb   # Overkiz kizbox Mini Mother Board
> > +                - overkiz,kizboxmini-rd   # Overkiz kizbox Mini RailDIN
> > +                - overkiz,smartkiz        # Overkiz SmartKiz Board
>
> Should be indented 2 fewer spaces. Otherwise,
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Ok, thanks.

Cheers,

>
> > +          - const: atmel,at91sam9g25
> > +          - const: atmel,at91sam9x5
> > +          - const: atmel,at91sam9
> > +
> >        - items:
> >            - enum:
> >                - atmel,at91sam9g15
> > --
> > 2.24.0
> >

--
Kamel Bouhara, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
