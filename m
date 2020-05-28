Return-Path: <SRS0=2ZKK=7K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A69F3C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 14:22:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 927C520888
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 14:22:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391106AbgE1OWu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 May 2020 10:22:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391035AbgE1OWt (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 28 May 2020 10:22:49 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AC6FC05BD1E
        for <devicetree@vger.kernel.org>; Thu, 28 May 2020 07:22:49 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id BC36F2A3DAD;
        Thu, 28 May 2020 15:22:47 +0100 (BST)
Date:   Thu, 28 May 2020 16:22:44 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <devicetree@vger.kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Chuanhong Guo <gch981213@gmail.com>,
        Weijie Gao <weijie.gao@mediatek.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Mason Yang <masonccyang@mxic.com.tw>,
        Julien Su <juliensu@mxic.com.tw>
Subject: Re: [PATCH v6 04/18] mtd: rawnand: Create a helper to retrieve the
 ECC placement
Message-ID: <20200528162244.7f1c6c50@collabora.com>
In-Reply-To: <20200528113113.9166-5-miquel.raynal@bootlin.com>
References: <20200528113113.9166-1-miquel.raynal@bootlin.com>
        <20200528113113.9166-5-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, 28 May 2020 13:30:59 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Use it from nand_dt_init() to initialize the ECC structure.
> 
> This allows the deprecation of the hw_syndrome ECC mode.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/mtd/nand/raw/nand_base.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 9fbd2a474b62..fd0bfe9bf7ae 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -5047,6 +5047,34 @@ static int of_get_nand_ecc_mode(struct device_node *np)
>  	return -ENODEV;
>  }
>  
> +enum nand_ecc_placement of_get_nand_ecc_placement(struct device_node *np)
> +{
> +	enum nand_ecc_placement placement;
> +	const char *pm;
> +	int err;
> +
> +	err = of_property_read_string(np, "nand-ecc-placement", &pm);
> +	if (!err) {
> +		for (placement = NAND_ECC_PLACEMENT_INTERLEAVED;
> +		     placement < ARRAY_SIZE(nand_ecc_placement); placement++) {
> +			if (!strcasecmp(pm, nand_ecc_placement[placement]))
> +				return placement;
> +		}
> +	}
> +
> +	/*
> +	 * For backward compatibility we support few obsoleted values that don't
> +	 * have their mappings into the nand_ecc_placement enum anymore.
> +	 */
> +	err = of_property_read_string(np, "nand-ecc-mode", &pm);
> +	if (!err) {
> +		if (!strcasecmp(pm, "hw_syndrome"))
> +			return NAND_ECC_PLACEMENT_INTERLEAVED;
> +	}
> +
> +	return NAND_ECC_PLACEMENT_UNKNOWN;
> +}
> +
>  static const char * const nand_ecc_algos[] = {
>  	[NAND_ECC_HAMMING]	= "hamming",
>  	[NAND_ECC_BCH]		= "bch",
> @@ -5143,6 +5171,7 @@ static int nand_dt_init(struct nand_chip *chip)
>  
>  	ecc_mode = of_get_nand_ecc_mode(dn);
>  	ecc_algo = of_get_nand_ecc_algo(dn);
> +	chip->ecc.placement = of_get_nand_ecc_placement(dn);
>  	ecc_strength = of_get_nand_ecc_strength(dn);
>  	ecc_step = of_get_nand_ecc_step_size(dn);
>  

