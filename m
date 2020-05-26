Return-Path: <SRS0=q8LW=7I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8AEBC433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 May 2020 23:12:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 84A6D207D3
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 May 2020 23:12:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390617AbgEZXM1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 26 May 2020 19:12:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389427AbgEZXM0 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 26 May 2020 19:12:26 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABF3FC061A0F
        for <devicetree@vger.kernel.org>; Tue, 26 May 2020 16:12:26 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C11952A0FD0;
        Wed, 27 May 2020 00:12:21 +0100 (BST)
Date:   Wed, 27 May 2020 01:12:18 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <devicetree@vger.kernel.org>
Subject: Re: [RESEND v5 16/21] dt-bindings: mtd: Deprecate the nand-ecc-mode
 property
Message-ID: <20200527011218.3e7a6269@collabora.com>
In-Reply-To: <20200526195633.11543-17-miquel.raynal@bootlin.com>
References: <20200526195633.11543-1-miquel.raynal@bootlin.com>
        <20200526195633.11543-17-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 26 May 2020 21:56:28 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> This property does not describe very well its purpose: it describes
> the ECC engine type, also called provider. Deprecate it in favor of
> nand-ecc-provider. In the mean time, update a bit the description of
> the property to make it more accurate.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../devicetree/bindings/mtd/nand-controller.yaml  | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> index a35ff8227427..256080ba50bd 100644
> --- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> +++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> @@ -46,16 +46,17 @@ patternProperties:
>          description:
>            Contains the native Ready/Busy IDs.
>  
> -      nand-ecc-mode:
> +      nand-ecc-provider:
>          allOf:
>            - $ref: /schemas/types.yaml#/definitions/string
>            - enum: [ none, soft, hw, on-die ]

				   ^"on-controller" ?

>          description:
> -          Desired ECC engine, either hardware (most of the time
> -          embedded in the NAND controller) or software correction
> -          (Linux will handle the calculations). soft_bch is deprecated
> -          and should be replaced by soft and nand-ecc-algo.
> -	  hw_syndrome is deprecated and should be
> +          Desired ECC engine provider, either hardware (most of the time

	     ^Preferred ECC engine type, ... 

> +          embedded in the NAND controller, but can also be external) or
> +          software correction (the OS will handle the calculations).
> +          The nand-ecc-mode property is deprecated in favor of this one.
> +          soft_bch is deprecated and should be replaced by soft and
> +          nand-ecc-algo. hw_syndrome is deprecated and should be
>            replaced by hw and nand-ecc-placement.

Which you do here, so patch 15 is not needed.

>  
>        nand-ecc-placement:
> @@ -148,7 +149,7 @@ examples:
>  
>        nand@0 {
>          reg = <0>;
> -        nand-ecc-mode = "soft";
> +        nand-ecc-provider = "soft";
>          nand-ecc-algo = "bch";
>  
>          /* controller specific properties */

