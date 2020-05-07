Return-Path: <SRS0=rqTW=6V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD596C38A24
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 11:50:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9B8F920735
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 11:50:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725948AbgEGLuE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 May 2020 07:50:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725809AbgEGLuE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 May 2020 07:50:04 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2A3CC05BD43
        for <devicetree@vger.kernel.org>; Thu,  7 May 2020 04:50:03 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 8139C2A01F7;
        Thu,  7 May 2020 12:50:02 +0100 (BST)
Date:   Thu, 7 May 2020 13:49:59 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <devicetree@vger.kernel.org>, Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        <linux-mtd@lists.infradead.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Michal Simek <monstr@monstr.eu>,
        Naga Sureshkumar Relli <nagasure@xilinx.com>
Subject: Re: [PATCH v3 4/8] mtd: rawnand: Add nand_extract_bits()
Message-ID: <20200507134959.38bbcdc4@collabora.com>
In-Reply-To: <20200507110034.14736-5-miquel.raynal@bootlin.com>
References: <20200507110034.14736-1-miquel.raynal@bootlin.com>
        <20200507110034.14736-5-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu,  7 May 2020 13:00:30 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> There are cases where ECC bytes are not byte-aligned. Indeed, BCH
> implies using a number of ECC bits, which are not always a multiple of
> 8. We then need a helper like nand_extract_bits() to extract these
> syndromes from a buffer.

Do you plan to send a patch to make the GPMI driver use this helper?

> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/nand_base.c | 31 +++++++++++++++++++++++++++++++
>  include/linux/mtd/rawnand.h      |  4 ++++
>  2 files changed, 35 insertions(+)
> 
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 25d298938aa9..b236e1bdddaf 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -224,6 +224,37 @@ static int check_offs_len(struct nand_chip *chip, loff_t ofs, uint64_t len)
>  	return ret;
>  }
>  
> +/* Copy unaligned bits from one buffer to another one (no overlap) */
> +void nand_extract_bits(u8 *dst, const u8 *src, unsigned int src_off,
> +		       unsigned int nbits)
> +{
> +	unsigned int dst_off = 0, tmp, n;
> +
> +	src += src_off / 8;
> +	src_off %= 8;
> +
> +	while (nbits) {
> +		n = min3(8 - dst_off, 8 - src_off, nbits);
> +
> +		tmp = (*src >> src_off) & GENMASK(n - 1, 0);
> +		*dst |= tmp << dst_off;
> +
> +		dst_off += n;
> +		if (dst_off >= 8) {
> +			dst++;
> +			dst_off -= 8;
> +		}
> +
> +		src_off += n;
> +		if (src_off >= 8) {
> +			src++;
> +			src_off -= 8;
> +		}
> +
> +		nbits -= n;
> +	}
> +}
> +
>  /**
>   * nand_select_target() - Select a NAND target (A.K.A. die)
>   * @chip: NAND chip object
> diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> index 406e9ff0f45c..734564232545 100644
> --- a/include/linux/mtd/rawnand.h
> +++ b/include/linux/mtd/rawnand.h
> @@ -1404,6 +1404,10 @@ int nand_gpio_waitrdy(struct nand_chip *chip, struct gpio_desc *gpiod,
>  void nand_select_target(struct nand_chip *chip, unsigned int cs);
>  void nand_deselect_target(struct nand_chip *chip);
>  
> +/* Bitops */
> +void nand_extract_bits(u8 *dst, const u8 *src, unsigned int src_off,
> +		       unsigned int nbits);
> +
>  /**
>   * nand_get_data_buf() - Get the internal page buffer
>   * @chip: NAND chip object

