Return-Path: <SRS0=2ZKK=7K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45F93C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 14:26:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 270FD207D3
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 14:26:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390999AbgE1O0G (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 May 2020 10:26:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390932AbgE1O0G (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 28 May 2020 10:26:06 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD432C05BD1E
        for <devicetree@vger.kernel.org>; Thu, 28 May 2020 07:26:05 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 12D392A18CB;
        Thu, 28 May 2020 15:26:04 +0100 (BST)
Date:   Thu, 28 May 2020 16:26:01 +0200
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
Subject: Re: [PATCH v6 05/18] mtd: rawnand: Add a kernel doc to the ECC
 algorithm enumeration
Message-ID: <20200528162601.78e87d5b@collabora.com>
In-Reply-To: <20200528113113.9166-6-miquel.raynal@bootlin.com>
References: <20200528113113.9166-1-miquel.raynal@bootlin.com>
        <20200528113113.9166-6-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, 28 May 2020 13:31:00 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Before moving it to the generic raw NAND core, ensure the enumeration
> is properly described.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  include/linux/mtd/rawnand.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> index f6ffd174abb7..6699ec7f4d40 100644
> --- a/include/linux/mtd/rawnand.h
> +++ b/include/linux/mtd/rawnand.h
> @@ -106,6 +106,13 @@ enum nand_ecc_placement {
>  	NAND_ECC_PLACEMENT_INTERLEAVED,
>  };
>  
> +/**
> + * enum nand_ecc_algo - NAND ECC algorithm
> + * @NAND_ECC_UNKNOWN: Unknown algorithm
> + * @NAND_ECC_HAMMING: Hamming algorithm
> + * @NAND_ECC_BCH: Bose-Chaudhuri-Hocquenghem algorithm
> + * @NAND_ECC_RS: Reed-Solomon algorithm
> + */
>  enum nand_ecc_algo {
>  	NAND_ECC_UNKNOWN,
>  	NAND_ECC_HAMMING,

