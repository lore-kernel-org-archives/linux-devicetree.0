Return-Path: <SRS0=VloT=6N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8516EC83000
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Apr 2020 15:56:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5009120775
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Apr 2020 15:56:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NcCceDfs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbgD2P4B (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 29 Apr 2020 11:56:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726519AbgD2P4B (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 29 Apr 2020 11:56:01 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B6ACC03C1AD
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2020 08:56:01 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id k13so3166919wrw.7
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2020 08:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6SbdIQ59kmcGdHm6ojgp2EzHoqCR0BLaadGaF/oBCog=;
        b=NcCceDfsh6sgDHZl6ErrCGTPbtJPu1JvJRXxiNVGG8LDez75AzT38KKF1LCgL9aM+f
         HgkSxvwiWX973V8d3628Muidr+dsvtKcsiJ4aTUdWW0g/R4ORU8Vuz9AbrvJkoVWUr8u
         jQL8l8XpBeuFWi1m5hq83MDgyLiEf7k1TkKHLMxTsCTOXqnctEDpDUYYGpgu5hTB112L
         frji5sfqUQUx/rJfHOKtlb8oZ0YHTZoN0IkbAq1CNJji0n3ew8EhTaRV54jEC83YnwoW
         dcMySUL2J71K0ZlOD3nSQtLDZU3gcspJv5iHXO4W02ItvsWZs4Rp8/t2S1+2EmQgaH/U
         t9sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6SbdIQ59kmcGdHm6ojgp2EzHoqCR0BLaadGaF/oBCog=;
        b=Dpht3yYB+Tm5en2eo8Bsg43tG2o06KMi89dEh1ajsoqApE71TNvbXKB091M47nlOtI
         uj1vor87Sy/+6E8Iw7aEgmcUg2OmOkDbuYfk5zfzoZyDiyjjELrmozAVN0uDAjafTvSs
         BMTUjim3JGh70U0C3l5dPrimKqL6MpesUzA5uAMIAVblSCo171NWN/3Myxj29p9TOUCC
         Zgo+3yPl8+P/WtPFgs7rJ5+MEP5IovOiYflu6sTXKnJnzcYpu+be+Br0Mca+Kh7enOU3
         BoRdH9XSCzb7+yLXQH7B5mFyz3babZ5p97ouyE4skSz5hCOTWHTrcb/dpmb/iTfdvqgP
         g7QQ==
X-Gm-Message-State: AGi0PuYEqwJEIwahwYYeR6ITHCUYbT/IaZg2LPkT7akbtlta11nip0i3
        rOaXfImweHxh2owhsI35kmU=
X-Google-Smtp-Source: APiQypIeTQJgeOACveLBv3JF4+7B9bbhTyJzFntbOd4yG43dHQDhNkjcBoFSOugsyQu7gsz6pwucBg==
X-Received: by 2002:a5d:4748:: with SMTP id o8mr39187903wrs.422.1588175759874;
        Wed, 29 Apr 2020 08:55:59 -0700 (PDT)
Received: from [192.168.2.1] (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id i6sm33180448wrc.82.2020.04.29.08.55.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2020 08:55:59 -0700 (PDT)
Subject: Re: [PATCH v5 2/7] mtd: rawnand: rockchip: NFC drivers for RK3308,
 RK3188 and others
To:     Yifeng Zhao <yifeng.zhao@rock-chips.com>,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        robh+dt@kernel.org
Cc:     devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
        heiko@sntech.de, linux-rockchip@lists.infradead.org
References: <20200426100250.14678-1-yifeng.zhao@rock-chips.com>
 <20200426100250.14678-3-yifeng.zhao@rock-chips.com>
From:   Johan Jonker <jbx6244@gmail.com>
Message-ID: <4dbe907c-a6c2-a163-0cab-234b08336b5c@gmail.com>
Date:   Wed, 29 Apr 2020 17:55:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200426100250.14678-3-yifeng.zhao@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Yifeng,

A few more comments below for now (part 2).

On 4/26/20 12:02 PM, Yifeng Zhao wrote:

[..]

> +#define	THIS_NAME		"rk-nand"

> +static int rk_nfc_nand_chip_init(struct device *dev, struct rk_nfc *nfc,
> +				 struct device_node *np)
> +{
> +	struct rk_nfc_nand_chip *nand;
> +	struct nand_chip *chip;
> +	struct mtd_info *mtd;
> +	int nsels;
> +	u32 tmp;
> +	int ret;
> +	int i;
> +
> +	if (!of_get_property(np, "reg", &nsels))
> +		return -ENODEV;
> +	nsels /= sizeof(u32);
> +	if (!nsels || nsels > NFC_MAX_NSELS) {
> +		dev_err(dev, "invalid reg property size %d\n", nsels);
> +		return -EINVAL;
> +	}
> +
> +	nand = devm_kzalloc(dev, sizeof(*nand) + nsels * sizeof(u8),
> +			    GFP_KERNEL);
> +	if (!nand)
> +		return -ENOMEM;
> +
> +	nand->nsels = nsels;
> +	for (i = 0; i < nsels; i++) {
> +		ret = of_property_read_u32_index(np, "reg", i, &tmp);
> +		if (ret) {
> +			dev_err(dev, "reg property failure : %d\n", ret);
> +			return ret;
> +		}
> +
> +		if (tmp >= NFC_MAX_NSELS) {
> +			dev_err(dev, "invalid CS: %u\n", tmp);
> +			return -EINVAL;
> +		}
> +
> +		if (test_and_set_bit(tmp, &nfc->assigned_cs)) {
> +			dev_err(dev, "CS %u already assigned\n", tmp);
> +			return -EINVAL;
> +		}
> +
> +		nand->sels[i] = tmp;
> +	}
> +
> +	chip = &nand->chip;
> +	chip->controller = &nfc->controller;
> +
> +	nand_set_flash_node(chip, np);
> +	nand_set_controller_data(chip, nfc);
> +
> +	chip->options |= NAND_USE_BOUNCE_BUFFER | NAND_NO_SUBPAGE_WRITE;
> +	chip->bbt_options = NAND_BBT_USE_FLASH | NAND_BBT_NO_OOB;
> +
> +	/* set default mode in case dt entry is missing */
> +	chip->ecc.mode = NAND_ECC_HW;
> +
> +	mtd = nand_to_mtd(chip);
> +	mtd->owner = THIS_MODULE;
> +	mtd->dev.parent = dev;

> +	mtd->name = THIS_NAME;

The 'mtd->name' shows up somewhere in file tree.
The rk3288 has 2 nfc's. In theory 2 probes and also 2 device names, so I
think that we shouldn't use a fixed define for 'mtd->name'.
Maybe use something like this:

	mtd->name = devm_kasprintf(ctrl->dev, GFP_KERNEL, "%s",
				   dev_name(ctrl->dev));

> +	mtd_set_ooblayout(mtd, &rk_nfc_ooblayout_ops);
> +	rk_nfc_hw_init(nfc);
> +	ret = nand_scan(chip, nsels);
> +	if (ret)
> +		return ret;
> +
> +	if (chip->options & NAND_IS_BOOT_MEDIUM) {
> +		ret = of_property_read_u32(np, "rockchip-boot-blks", &tmp);
> +		nand->boot_blks = ret ? 0 : tmp;
> +
> +		ret = of_property_read_u32(np, "rockchip-boot-ecc-strength",
> +					   &tmp);
> +		nand->boot_ecc = ret ? chip->ecc.strength : tmp;
> +	}
> +
> +	ret = mtd_device_register(mtd, NULL, 0);
> +	if (ret) {
> +		dev_err(dev, "mtd parse partition error\n");
> +		nand_release(chip);
> +		return ret;
> +	}
> +
> +	list_add_tail(&nand->node, &nfc->chips);
> +
> +	return 0;
> +}

[..]

> +static struct platform_driver rk_nfc_driver = {
> +	.probe  = rk_nfc_probe,
> +	.remove = rk_nfc_remove,
> +	.driver = {

> +		.name  = THIS_NAME,

		.name  = "rockchip-nfc",
		.name  = "rockchip-nand-controller",

The driver name shows up in the kernel log and is used in combination
with 'greb'.
This name should stay in line with all other rockchip drivers.

rockchip-drm
rockchip-rk3066-hdmi
rockchip-pm-domain
rockchip-u3phy
rockchip-thermal

> +		.of_match_table = rk_nfc_id_table,
> +		.pm = &rk_nfc_pm_ops,
> +	},
> +};


