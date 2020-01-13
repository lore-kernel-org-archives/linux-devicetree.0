Return-Path: <SRS0=lLbR=3C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C3FEC3F68F
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 10:40:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E797220661
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 10:40:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v3vjyNLs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726127AbgAMKkK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jan 2020 05:40:10 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:39780 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726109AbgAMKkK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Jan 2020 05:40:10 -0500
Received: by mail-wm1-f67.google.com with SMTP id 20so9027324wmj.4
        for <devicetree@vger.kernel.org>; Mon, 13 Jan 2020 02:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=8woBrjBV2pJrpCEHmipp5tCMuainYmDSO6QY88461Bw=;
        b=v3vjyNLsU/ZP+duwAMBIiT/jTK8pe+/ftmLtCCvrnYszggFFYPTlNqj9hvYjDOOUmq
         EpgQZglWUe1m2gz3HugJRucSZwcNiMfPUkj7Eav0XFDbxrEr/ahC36GknblhDRjc7ahH
         zQjHyJwdJJhf+QMpI0IDbA/wNfOcZ2FznT70pmF8lv26V2byaqL3jChP1ohJIt0TXMcH
         Udb7ZfjiUa/aUwIvQJ7yybd9UwrI/FtTqZdU9m8cJaaQQFkFmDImu/OE3+WU9PajHTUo
         4c92RFQuMMUFx5sEkOfW1ctKcz6VghA9q4Ry+EEEAp7p2MtqTeW+fEIsng1iLqdHdWrY
         gs/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=8woBrjBV2pJrpCEHmipp5tCMuainYmDSO6QY88461Bw=;
        b=tyaBgE0rI5FD3dGDHQMfh2LLpLN56kaFxk6AoqPBbbgaYtJSKw/zkv3GNQNVbwA7ix
         xxI8ak94LSwoCc4eR/B1OmCfI7RNNe3/lZp1JJSpqJ9SF8K63r1PTgDawiDI0B+sFjRd
         MrwR+QE/6Z0MI8rAjvtsissA+wMj7kD398I2lOzfXUibX6wcOsHdd37voaOuz3Tcgfro
         DfZnmdFTi9mYKe/dK3AbkwUKphDQ4SzVWUGn+vfVIJqeoWCpc4JIaUfQy+40VmAP2cvL
         ZHBj9a3IZDYZ6KWzq5QkbLB9M1tyaoMuPC7zOEHrEmu5mSGCEb3AbStSszulXvg7UL8s
         MnCg==
X-Gm-Message-State: APjAAAWW2igXvT/5GcEZYD833UmZ2pFOm0oajh0LRMrKBFeGMOqvpKUA
        2r0dX1EUyJPE7N/q+XpHWicaOw==
X-Google-Smtp-Source: APXvYqzahBcdOwjWkOf5gPeQ+ARXeltCNOTaht2mJFVatu9RTi95f0Vd/GWdieYkCfCRg7L1Uj2Cnw==
X-Received: by 2002:a1c:e108:: with SMTP id y8mr18978661wmg.147.1578912008310;
        Mon, 13 Jan 2020 02:40:08 -0800 (PST)
Received: from dell ([95.147.198.95])
        by smtp.gmail.com with ESMTPSA id c5sm14403122wmb.9.2020.01.13.02.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 02:40:07 -0800 (PST)
Date:   Mon, 13 Jan 2020 10:40:28 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     support.opensource@diasemi.com, stwiss.opensource@diasemi.com,
        dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        Adam.Thomson.Opensource@diasemi.com, devicetree@vger.kernel.org,
        kernel@pengutronix.de, linux-input@vger.kernel.org
Subject: Re: [PATCH v2 2/3] input: misc: da9063_onkey: add mode change support
Message-ID: <20200113104028.GB5414@dell>
References: <20191127132304.22924-1-m.felsch@pengutronix.de>
 <20191127132304.22924-3-m.felsch@pengutronix.de>
 <20200108084800.x2doud4v6m3ssz6s@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200108084800.x2doud4v6m3ssz6s@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 08 Jan 2020, Marco Felsch wrote:

> Hi Lee,
> 
> I forgot to add you to review the mfd part, sorry. Please can you have a
> look on it?

[...]

> > --- a/drivers/mfd/da9062-core.c
> > +++ b/drivers/mfd/da9062-core.c
> > @@ -510,6 +510,7 @@ static const struct regmap_range da9062_aa_writeable_ranges[] = {
> >  	regmap_reg_range(DA9062AA_VLDO1_B, DA9062AA_VLDO4_B),
> >  	regmap_reg_range(DA9062AA_BBAT_CONT, DA9062AA_BBAT_CONT),
> >  	regmap_reg_range(DA9062AA_GP_ID_0, DA9062AA_GP_ID_19),
> > +	regmap_reg_range(DA9062AA_CONFIG_I, DA9062AA_CONFIG_I),
> >  };
> >  
> >  static const struct regmap_range da9062_aa_volatile_ranges[] = {

Looks fine.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
