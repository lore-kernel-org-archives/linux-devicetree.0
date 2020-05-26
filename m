Return-Path: <SRS0=q8LW=7I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A9DCC433E0
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 May 2020 23:08:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1E77A2078C
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 May 2020 23:08:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392299AbgEZXIS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 26 May 2020 19:08:18 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35382 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389565AbgEZXIS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 26 May 2020 19:08:18 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 36AA42A2D77;
        Wed, 27 May 2020 00:08:16 +0100 (BST)
Date:   Wed, 27 May 2020 01:08:11 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <devicetree@vger.kernel.org>
Subject: Re: [RESEND v5 14/21] dt-bindings: mtd: Add the nand-ecc-placement
 property
Message-ID: <20200527010811.5c080310@collabora.com>
In-Reply-To: <20200526195633.11543-15-miquel.raynal@bootlin.com>
References: <20200526195633.11543-1-miquel.raynal@bootlin.com>
        <20200526195633.11543-15-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 26 May 2020 21:56:26 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Placement is where the ECC bytes are expected.
> No value means the controller can do whatever it desires (default is
> to put ECC bytes at the end of the OOB area). Alternative placement is
> "interleaved" (also sometimes referred as "syndrome") where data and
> OOB are mixed.

Hm, unless you can figure out what all controllers use, I'd suggest to
have the default mean "undefined", as in "controller put the ECC bytes
somewhere, but we don't where that is". Then let the explicit values be
"oob" or "interleaved".

> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../devicetree/bindings/mtd/nand-controller.yaml       | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> index d529f8587ba6..35512f2c66fa 100644
> --- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> +++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> @@ -56,6 +56,16 @@ patternProperties:
>            (Linux will handle the calculations). soft_bch is deprecated
>            and should be replaced by soft and nand-ecc-algo.
>  
> +      nand-ecc-placement:
> +        allOf:
> +          - $ref: /schemas/types.yaml#/definitions/string
> +          - enum: [ free, interleaved ]
> +        description:
> +          Location for the ECC bytes. Free is the default and means the
> +	  controller in charge is free to put them where it wants.
> +	  Default state is to put ECC bytes at the end of the OOB area.
> +	  Otherwise, ECC bytes may be interleaved with data.
> +
>        nand-ecc-algo:
>          allOf:
>            - $ref: /schemas/types.yaml#/definitions/string

