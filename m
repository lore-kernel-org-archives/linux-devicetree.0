Return-Path: <SRS0=2ZKK=7K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BB1EC433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 15:55:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5366E2053B
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 15:55:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404669AbgE1Pzf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 May 2020 11:55:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404666AbgE1Pzd (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 28 May 2020 11:55:33 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCB79C08C5C6
        for <devicetree@vger.kernel.org>; Thu, 28 May 2020 08:55:33 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 791982A4023;
        Thu, 28 May 2020 16:55:31 +0100 (BST)
Date:   Thu, 28 May 2020 17:55:27 +0200
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
Subject: Re: [PATCH v6 18/18] mtd: rawnand: Move generic bits to the ECC
 framework
Message-ID: <20200528175527.7be7af00@collabora.com>
In-Reply-To: <20200528113113.9166-19-miquel.raynal@bootlin.com>
References: <20200528113113.9166-1-miquel.raynal@bootlin.com>
        <20200528113113.9166-19-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, 28 May 2020 13:31:13 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Many OOB layouts and helpers are generic to all NAND chips, they
> should not be restricted to be only used by raw NAND controller
> drivers. They might later be used by generic ECC engines and SPI-NAND
> devices as well so move them into a more generic place.
> 
> To avoid moving all the raw NAND core "history" into the generic NAND
> layer, we already moved certain bits into legacy helpers in the raw
> NAND core to ensure backward compatibility.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/Kconfig                      |  11 +
>  drivers/mtd/nand/Makefile                     |   1 +
>  .../mtd/nand/{raw/nand_bch.c => ecc-sw-bch.c} |   2 +-
>  drivers/mtd/nand/ecc.c                        | 299 +++++++++++++++++
>  drivers/mtd/nand/raw/Kconfig                  |  11 +-
>  drivers/mtd/nand/raw/Makefile                 |   1 -
>  drivers/mtd/nand/raw/atmel/nand-controller.c  |   3 +-
>  drivers/mtd/nand/raw/denali.c                 |   3 +
>  drivers/mtd/nand/raw/nand_base.c              | 313 +-----------------
>  drivers/mtd/nand/raw/nand_toshiba.c           |   2 +
>  drivers/mtd/nand/raw/nandsim.c                |   2 +-
>  drivers/mtd/nand/raw/omap2.c                  |   2 +-
>  drivers/mtd/nand/raw/sunxi_nand.c             |   3 +-
>  drivers/mtd/nand/raw/tegra_nand.c             |   3 +-
>  .../mtd/{nand_bch.h => nand-ecc-sw-bch.h}     |   6 +-
>  include/linux/mtd/nand.h                      |  20 ++
>  include/linux/mtd/rawnand.h                   |  17 +-
>  17 files changed, 364 insertions(+), 335 deletions(-)
>  rename drivers/mtd/nand/{raw/nand_bch.c => ecc-sw-bch.c} (99%)
>  rename include/linux/mtd/{nand_bch.h => nand-ecc-sw-bch.h} (92%)

I feel like this patch could be split a little.
