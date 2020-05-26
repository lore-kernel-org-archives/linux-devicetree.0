Return-Path: <SRS0=q8LW=7I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18F09C433E0
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 May 2020 22:42:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F2A8A208C3
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 May 2020 22:42:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391223AbgEZWmE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 26 May 2020 18:42:04 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35092 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389755AbgEZWmE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 26 May 2020 18:42:04 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 5904C2A3607;
        Tue, 26 May 2020 23:42:02 +0100 (BST)
Date:   Wed, 27 May 2020 00:41:59 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <devicetree@vger.kernel.org>
Subject: Re: [RESEND v5 05/21] mtd: rawnand: Return an enum from
 of_get_nand_ecc_algo()
Message-ID: <20200527004159.0a8e29a6@collabora.com>
In-Reply-To: <20200526195633.11543-6-miquel.raynal@bootlin.com>
References: <20200526195633.11543-1-miquel.raynal@bootlin.com>
        <20200526195633.11543-6-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 26 May 2020 21:56:17 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> There is an enumeration to list ECC algorithm, let's use it instead of
> returning an int.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/mtd/nand/raw/nand_base.c | 35 +++++++++++++++++---------------
>  1 file changed, 19 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 7176e513a0bb..a756f3193558 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -5048,17 +5048,20 @@ static const char * const nand_ecc_algos[] = {
>  	[NAND_ECC_RS]		= "rs",
>  };
>  
> -static int of_get_nand_ecc_algo(struct device_node *np)
> +static enum nand_ecc_algo of_get_nand_ecc_algo(struct device_node *np)
>  {
> +	enum nand_ecc_algo ecc_algo;
>  	const char *pm;
> -	int err, i;
> +	int err;
>  
>  	err = of_property_read_string(np, "nand-ecc-algo", &pm);
>  	if (!err) {
> -		for (i = NAND_ECC_HAMMING; i < ARRAY_SIZE(nand_ecc_algos); i++)
> -			if (!strcasecmp(pm, nand_ecc_algos[i]))
> -				return i;
> -		return -ENODEV;
> +		for (ecc_algo = NAND_ECC_HAMMING;
> +		     ecc_algo < ARRAY_SIZE(nand_ecc_algos);
> +		     ecc_algo++) {
> +			if (!strcasecmp(pm, nand_ecc_algos[ecc_algo]))
> +				return ecc_algo;
> +		}
>  	}
>  
>  	/*
> @@ -5066,15 +5069,14 @@ static int of_get_nand_ecc_algo(struct device_node *np)
>  	 * for some obsoleted values that were specifying ECC algorithm.
>  	 */
>  	err = of_property_read_string(np, "nand-ecc-mode", &pm);
> -	if (err < 0)
> -		return err;
> +	if (!err) {
> +		if (!strcasecmp(pm, "soft"))
> +			return NAND_ECC_HAMMING;
> +		else if (!strcasecmp(pm, "soft_bch"))
> +			return NAND_ECC_BCH;
> +	}
>  
> -	if (!strcasecmp(pm, "soft"))
> -		return NAND_ECC_HAMMING;
> -	else if (!strcasecmp(pm, "soft_bch"))
> -		return NAND_ECC_BCH;
> -
> -	return -ENODEV;
> +	return NAND_ECC_UNKNOWN;
>  }
>  
>  static int of_get_nand_ecc_step_size(struct device_node *np)
> @@ -5119,7 +5121,8 @@ static bool of_get_nand_on_flash_bbt(struct device_node *np)
>  static int nand_dt_init(struct nand_chip *chip)
>  {
>  	struct device_node *dn = nand_get_flash_node(chip);
> -	int ecc_mode, ecc_algo, ecc_strength, ecc_step;
> +	enum nand_ecc_algo ecc_algo;
> +	int ecc_mode, ecc_strength, ecc_step;
>  
>  	if (!dn)
>  		return 0;
> @@ -5141,7 +5144,7 @@ static int nand_dt_init(struct nand_chip *chip)
>  	if (ecc_mode >= 0)
>  		chip->ecc.mode = ecc_mode;
>  
> -	if (ecc_algo >= 0)
> +	if (ecc_algo != NAND_ECC_UNKNOWN)
>  		chip->ecc.algo = ecc_algo;
>  
>  	if (ecc_strength >= 0)

