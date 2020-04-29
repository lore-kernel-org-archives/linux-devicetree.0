Return-Path: <SRS0=VloT=6N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E9FEC83000
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Apr 2020 17:04:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 51E00208FE
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Apr 2020 17:04:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbgD2REf convert rfc822-to-8bit (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 29 Apr 2020 13:04:35 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:39785 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726423AbgD2REe (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 29 Apr 2020 13:04:34 -0400
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 8AA9BFF804;
        Wed, 29 Apr 2020 17:04:30 +0000 (UTC)
Date:   Wed, 29 Apr 2020 19:04:28 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     Yifeng Zhao <yifeng.zhao@rock-chips.com>, richard@nod.at,
        vigneshr@ti.com, robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-mtd@lists.infradead.org, heiko@sntech.de,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 2/7] mtd: rawnand: rockchip: NFC drivers for RK3308,
 RK3188 and others
Message-ID: <20200429190428.33ca0523@xps13>
In-Reply-To: <4dbe907c-a6c2-a163-0cab-234b08336b5c@gmail.com>
References: <20200426100250.14678-1-yifeng.zhao@rock-chips.com>
        <20200426100250.14678-3-yifeng.zhao@rock-chips.com>
        <4dbe907c-a6c2-a163-0cab-234b08336b5c@gmail.com>
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

Johan Jonker <jbx6244@gmail.com> wrote on Wed, 29 Apr 2020 17:55:56
+0200:

> Hi Yifeng,
> 
> A few more comments below for now (part 2).
> 
> On 4/26/20 12:02 PM, Yifeng Zhao wrote:
> 
> [..]
> 
> > +#define	THIS_NAME		"rk-nand"  
> 
> > +static int rk_nfc_nand_chip_init(struct device *dev, struct rk_nfc *nfc,
> > +				 struct device_node *np)
> > +{
> > +	struct rk_nfc_nand_chip *nand;
> > +	struct nand_chip *chip;
> > +	struct mtd_info *mtd;
> > +	int nsels;
> > +	u32 tmp;
> > +	int ret;
> > +	int i;
> > +
> > +	if (!of_get_property(np, "reg", &nsels))
> > +		return -ENODEV;
> > +	nsels /= sizeof(u32);
> > +	if (!nsels || nsels > NFC_MAX_NSELS) {
> > +		dev_err(dev, "invalid reg property size %d\n", nsels);
> > +		return -EINVAL;
> > +	}
> > +
> > +	nand = devm_kzalloc(dev, sizeof(*nand) + nsels * sizeof(u8),
> > +			    GFP_KERNEL);
> > +	if (!nand)
> > +		return -ENOMEM;
> > +
> > +	nand->nsels = nsels;
> > +	for (i = 0; i < nsels; i++) {
> > +		ret = of_property_read_u32_index(np, "reg", i, &tmp);
> > +		if (ret) {
> > +			dev_err(dev, "reg property failure : %d\n", ret);
> > +			return ret;
> > +		}
> > +
> > +		if (tmp >= NFC_MAX_NSELS) {
> > +			dev_err(dev, "invalid CS: %u\n", tmp);
> > +			return -EINVAL;
> > +		}
> > +
> > +		if (test_and_set_bit(tmp, &nfc->assigned_cs)) {
> > +			dev_err(dev, "CS %u already assigned\n", tmp);
> > +			return -EINVAL;
> > +		}
> > +
> > +		nand->sels[i] = tmp;
> > +	}
> > +
> > +	chip = &nand->chip;
> > +	chip->controller = &nfc->controller;
> > +
> > +	nand_set_flash_node(chip, np);
> > +	nand_set_controller_data(chip, nfc);
> > +
> > +	chip->options |= NAND_USE_BOUNCE_BUFFER | NAND_NO_SUBPAGE_WRITE;
> > +	chip->bbt_options = NAND_BBT_USE_FLASH | NAND_BBT_NO_OOB;
> > +
> > +	/* set default mode in case dt entry is missing */
> > +	chip->ecc.mode = NAND_ECC_HW;
> > +
> > +	mtd = nand_to_mtd(chip);
> > +	mtd->owner = THIS_MODULE;
> > +	mtd->dev.parent = dev;  
> 
> > +	mtd->name = THIS_NAME;  
> 
> The 'mtd->name' shows up somewhere in file tree.

Good catch.

> The rk3288 has 2 nfc's. In theory 2 probes and also 2 device names, so I
> think that we shouldn't use a fixed define for 'mtd->name'.
> Maybe use something like this:

Yifeng, please use the NAND chip "label" DT property, which is parsed
by the core automatically and will give you meaningful names for every
chip:

nand_set_flash_node(chip, np);
if (!mtd->name) {
	dev_err(nfc->dev, "NAND label property is mandatory\n");
	return -EINVAL;
}


Thanks,
Miquèl
