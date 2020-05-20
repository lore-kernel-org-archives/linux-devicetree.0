Return-Path: <SRS0=Re5X=7C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C1C5C433E0
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 May 2020 00:25:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC86520674
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 May 2020 00:25:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="ruGAnAg3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728012AbgETAZY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 19 May 2020 20:25:24 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:41958 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727998AbgETAZY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 19 May 2020 20:25:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1589934322; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=I7AwvCtB1QUal3/NGWrqtWi3IGaVg+1bWt/HFkMKu/E=;
        b=ruGAnAg3O7kRyBRXucEQgxm2vw3f7nstuQn1Dx6Q63V6jqQ3A8orguyJz+I61tAQI4DTB6
        cp8ITtjx2l1yFQ6qX4fOb92vzgu+NV3XmYHLLWWh1FRP1xgG0ZS5Nl6Ee875RDW8wy68WB
        8DWma5botrwtX4Yc/KC+36gSN6aieI4=
Date:   Wed, 20 May 2020 02:25:12 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 1/4] dt-bindings: mtd: rawnand: ingenic: Clarify the
 active state of the RB pin
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Harvey Hunt <harveyhuntnexus@gmail.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <tudor.ambarus@microchip.com>
Message-Id: <06TLAQ.BLU7G36K5D91@crapouillou.net>
In-Reply-To: <20200519232454.374081-1-boris.brezillon@collabora.com>
References: <20200519232454.374081-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Boris,

This .txt file is going away, so there's no need to apply this one=20
patch.

I Cc'd you on the V2 of the patchset that drops this file.

-Paul


Le mer. 20 mai 2020 =E0 1:24, Boris Brezillon=20
<boris.brezillon@collabora.com> a =E9crit :
> Let's make things consistent with other bindings and clarify the
> expected active state.
>=20
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
> Changes in v2:
> * New patch
> ---
>  Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git=20
> a/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt=20
> b/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
> index c02259353327..4cbe13f94564 100644
> --- a/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
> @@ -30,7 +30,8 @@ Optional children node properties:
>  - nand-ecc-strength: ECC strength (max number of correctable bits).
>  - nand-ecc-mode: String, operation mode of the NAND ecc mode. "hw"=20
> by default
>  - nand-on-flash-bbt: boolean to enable on flash bbt option, if not=20
> present false
> -- rb-gpios: GPIO specifier for the busy pin.
> +- rb-gpios: GPIO specifier for the ready/busy pin. The active state=20
> (ready)
> +            should be high unless the signal is inverted.
>  - wp-gpios: GPIO specifier for the write protect pin.
>=20
>  Optional child node of NAND chip nodes:
> --
> 2.25.4
>=20


