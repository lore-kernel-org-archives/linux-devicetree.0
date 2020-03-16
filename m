Return-Path: <SRS0=Nmyu=5B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FE66C0044D
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Mar 2020 10:08:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 39DFD20663
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Mar 2020 10:08:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730517AbgCPKIK convert rfc822-to-8bit (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 16 Mar 2020 06:08:10 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:43161 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730497AbgCPKIK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 16 Mar 2020 06:08:10 -0400
X-Originating-IP: 90.89.41.158
Received: from xps13 (lfbn-tou-1-1473-158.w90-89.abo.wanadoo.fr [90.89.41.158])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id B0FD26002D;
        Mon, 16 Mar 2020 10:06:58 +0000 (UTC)
Date:   Mon, 16 Mar 2020 11:06:58 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     =?UTF-8?B?6LW15Luq5bOw?= <yifeng.zhao@rock-chips.com>
Cc:     richard <richard@nod.at>, vigneshr <vigneshr@ti.com>,
        robh+dt <robh+dt@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-mtd <linux-mtd@lists.infradead.org>,
        =?UTF-8?B?SGVpa29TdMO8Ym5lcg==?= <heiko@sntech.de>,
        linux-rockchip <linux-rockchip@lists.infradead.org>
Subject: Re: [PATCH v3 1/3] mtd: rawnand: rockchip: NFC drivers for RK3308,
 RK3188 and others
Message-ID: <20200316110658.43aea94a@xps13>
In-Reply-To: <2020031617554207432140@rock-chips.com>
References: <20200303094736.7490-1-yifeng.zhao@rock-chips.com>
        <20200303094736.7490-2-yifeng.zhao@rock-chips.com>
        <20200309121645.1fca069d@xps13>
        <2020031617554207432140@rock-chips.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Yifeng,

赵仪峰 <yifeng.zhao@rock-chips.com> wrote on Mon, 16 Mar 2020 17:59:26
+0800:

> Hi miquel，
> 
> 1.
> >A comment here explaining what the next function does and why would be
> >nice.
> >  
> >> +static void rk_nfc_format_page(struct mtd_info *mtd, const u8 *buf)
> >> +{
> >> +	struct nand_chip *chip = mtd_to_nand(mtd);
> >> +	struct rk_nfc *nfc = nand_get_controller_data(chip);
> >> +	u32 i;
> >> +   
> 
> The data layout is different between NFC and nand  driver

you probably mean between the NAND flash controller and whét the NAND
core expects, but ok

> This code is designed with reference to mtk_nand.c
> There is a description of the data layout at the beginning of the file:
>  * NFC Page Data Layout:
>  *	1024 Bytes Data + 4Bytes sys data + 28Bytes~124Bytes ecc +
>  *	1024 Bytes Data + 4Bytes sys data + 28Bytes~124Bytes ecc +
>  *	......
>  * NAND Page Data Layout:
>  *	1024 * n Data + m Bytes oob
>  * Original Bad Block Mask Location:
>  *	first byte of oob(spare)
>  * nand_chip->oob_poi data layout:
>  *	4Bytes sys data + .... + 4Bytes sys data + ecc data
> 
> 2. 
> >> +	dma_reg = DMA_ST | ((!rw) << DMA_WR)  | DMA_EN | (2 << DMA_AHB_SIZE) |
> >> +	     (7 << DMA_BURST_SIZE) | (16 << DMA_INC_NUM);
> >> +
> >> +	fl_reg = (rw << FLCTL_WR) | FLCTL_XFER_EN | FLCTL_ACORRECT |
> >> +	(n_KB << FLCTL_XFER_SECTOR) | FLCTL_TOG_FIX;
> >> +
> >> +	if (nfc->nfc_version == 6) {  
> >
> >I would prefer using switch statements any time you check the version.
> >The version should be an enum.
> >
> >You can also define a platform data structure for the register offsets
> >that have the same name, but not necessarily the same offset. Then you
> >can reference the right value directly.
> >eg.
> >
> >	struct rk_nfc_plat_data {
> >	u32 nfc_bchctl_off;
> >	...
> >	};
> >
> >	struct rk_nfc_plat_data rk_nfc_v6_plat_data = {
> >	nfc_bchctl_off = ...;
> >	...
> >	};
> >
> >	bch_reg = readl(pdata->nfc_bchctl_off);  
> 
> I will modify the code with switch and enum, but it is difficult to use platform data structure, 
> because the bit offset inside the register is also different.

it works the same with bitfields actually, if the bitfields have close
names and behave the same (no matter where they are in registers), you
should probably define them in a platform data structure as well.

> #define	NFC_BCH_ST_V6	(0x20)
> #define	NFC_BCH_ST_V9	(0x150)
> #define	BCH_ST_ERR0_V6	BIT(2)
> #define	BCH_ST_ERR1_V6	BIT(15)
> #define	BCH_ST_ERR0_V9	BIT(2)
> #define	BCH_ST_ERR1_V9	BIT(18)
> #define	ECC_ERR_CNT0_V6(x) (((((x) & (0x1F << 3)) >> 3) \
> | (((x) & (1 << 27)) >> 22)) & 0x3F)
> #define	ECC_ERR_CNT1_V6(x) (((((x) & (0x1F << 16)) >> 16) \
> | (((x) & (1 << 29)) >> 24)) & 0x3F)
> #define	ECC_ERR_CNT0_V9(x) (((x) & (0x7F << 3)) >> 3)
> #define	ECC_ERR_CNT1_V9(x) (((x) & (0x7F << 19)) >> 19)
> 
> 3.
> >> +static int rk_nfc_write_page_raw(struct nand_chip *chip, const u8 *buf,
> >> +	 int oob_on, int page)
> >> +{
> >> +	struct mtd_info *mtd = nand_to_mtd(chip);
> >> +	struct rk_nfc *nfc = nand_get_controller_data(chip);
> >> +
> >> +	rk_nfc_format_page(mtd, buf);
> >> +	return rk_nfc_write_page(mtd, chip, nfc->buffer, page, 1);  
> >
> >I think you should avoid calling ->write_page. You will avoid an
> >indentation level in this function and clarify what write_page_raw do.
> >Same for read, and the _oob alternative. Also, I'm sure write_buf does
> >not need to be exported and you can just move the actual code in this
> >function.  
> 
> The code  is designed with reference to mtk_nand.c.
> The function rk_nfc_format_page will copy data from extern buffer to nfc->buffer.
> I will move the code in the function rk_nfc_format_page to rk_nfc_write_page_raw.
> 
> 4.
> >> +static int rk_nfc_write_page_hwecc(struct nand_chip *chip, const u8 *buf,
> >> +	   int oob_on, int page)
> >> +{
> >> +	return rk_nfc_write_page(nand_to_mtd(chip), chip, buf, page, 0);
> >> +}  
> >
> >What is the purpose of this indirection?
> >  
> 
> The function  rk_nfc_write_page also call by rk_nfc_write_page_raw, a parameter(raw)
> is required to confirm whether ECC is used or not.

Ok.

Thanks,
Miquèl
