Return-Path: <SRS0=q8LW=7I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4306AC433E0
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 May 2020 22:42:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2373B208C3
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 May 2020 22:42:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390674AbgEZWmh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 26 May 2020 18:42:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389755AbgEZWmh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 26 May 2020 18:42:37 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A453C061A0F
        for <devicetree@vger.kernel.org>; Tue, 26 May 2020 15:42:37 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id F1A092A3607;
        Tue, 26 May 2020 23:42:35 +0100 (BST)
Date:   Wed, 27 May 2020 00:42:33 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <devicetree@vger.kernel.org>
Subject: Re: [RESEND v5 04/21] dt-bindings: mtd: Deprecate OOB_FIRST mode
Message-ID: <20200527004233.61a78abc@collabora.com>
In-Reply-To: <20200526195633.11543-5-miquel.raynal@bootlin.com>
References: <20200526195633.11543-1-miquel.raynal@bootlin.com>
        <20200526195633.11543-5-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 26 May 2020 21:56:16 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> This mode has never actually been used, it was introduced for a single
> driver and even this driver did not use it in the DT but only in the
> code. Now that this mode has been removed, let's trim the bindings
> definition to avoid carrying useless properties.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  Documentation/devicetree/bindings/mtd/atmel-nand.txt       | 3 +--
>  Documentation/devicetree/bindings/mtd/nand-controller.yaml | 2 +-
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.txt b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> index 3aa297c97ab6..ead1826d0d51 100644
> --- a/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> @@ -143,8 +143,7 @@ Required properties:
>  Optional properties:
>  - atmel,nand-has-dma : boolean to support dma transfer for nand read/write.
>  - nand-ecc-mode : String, operation mode of the NAND ecc mode, soft by default.
> -  Supported values are: "none", "soft", "hw", "hw_syndrome", "hw_oob_first",
> -  "soft_bch".
> +  Supported values are: "none", "soft", "hw", "hw_syndrome", "soft_bch".
>  - atmel,has-pmecc : boolean to enable Programmable Multibit ECC hardware,
>    capable of BCH encoding and decoding, on devices where it is present.
>  - atmel,pmecc-cap : error correct capability for Programmable Multibit ECC
> diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> index d261b7096c69..d529f8587ba6 100644
> --- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> +++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> @@ -49,7 +49,7 @@ patternProperties:
>        nand-ecc-mode:
>          allOf:
>            - $ref: /schemas/types.yaml#/definitions/string
> -          - enum: [ none, soft, hw, hw_syndrome, hw_oob_first, on-die ]
> +          - enum: [ none, soft, hw, hw_syndrome, on-die ]
>          description:
>            Desired ECC engine, either hardware (most of the time
>            embedded in the NAND controller) or software correction

