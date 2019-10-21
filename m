Return-Path: <SRS0=tRzh=YO=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85753CA9EAF
	for <linux-devicetree@archiver.kernel.org>; Mon, 21 Oct 2019 11:45:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 57E3420656
	for <linux-devicetree@archiver.kernel.org>; Mon, 21 Oct 2019 11:45:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L2nU+xgC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728258AbfJULpZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 21 Oct 2019 07:45:25 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40593 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728500AbfJULpY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 21 Oct 2019 07:45:24 -0400
Received: by mail-wm1-f68.google.com with SMTP id b24so12432425wmj.5
        for <devicetree@vger.kernel.org>; Mon, 21 Oct 2019 04:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=umMsATXlWgFAfcuZOGKS3dhZXdI24Lzqqx5ELSjQOWM=;
        b=L2nU+xgCbN5LtkAhVSUAyqXKpaIpDb2NbqaWZD/9o/EUs39LUEO2TGEXCZnz/+1GMK
         vmYJLj9mwZ8wqiG/kirdJIyY//VurXZfTQCPxCtOY9IL1skWqhSDbep7FMWDaLf13PQ/
         K/qp+YDO47tUKlxjf4r2zecpRPk3YMUhUEBQLnU3Q0XHC57ZyUaPxmpuZHIIAQIzaN+r
         Y/Xqo9jpEBUc0N9HPFcmvN3EWnuoZGNRmYXpqVEg0baVbVZf+XMCdVLcukyYbTdNbr2J
         T9Lw2o/kyFrxYKTVufYqj0aVqDHuuCSO2Xl0SadOAKJWb8w3occPpbjoyIxp+cJPLyhh
         MHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=umMsATXlWgFAfcuZOGKS3dhZXdI24Lzqqx5ELSjQOWM=;
        b=hn4zTpnq25bc3Dm8njpcL5J+cTvFF8OoDovqLL0HhHa1Pwp9zk5PfgdBKmxk0bRS27
         l1a2IDaQZRX46Mg4FsWN8gvxRbn0X3LguPU7Nk3Wf8BTUN3c7P39H1/Y3ImtYXs4nDHJ
         oV1D0ti8BpBCGrDwcHp2IFj7HX5gur5ETVNPemOyWx9zpAUzyKQoUYbVZ3HfHB7dRnlx
         Db1LKPEFLc//hUI1sVtJ36AZfAEd3iOQG9pX4dLaiBY2KKMVMtm++oX7su2BAcHanLux
         5+lYnammd0LMGhRB4uyMMqXQSi+XR3WZHqWsSg/aMyG1CPfQfBgL5ir0jZ+PwaKG/rZG
         qKHQ==
X-Gm-Message-State: APjAAAVXcH7WbfQzq0kAqvMimfr/y0Q7/w1/WnykJ4Opq+UY3AOe/EjX
        aD2/IvmV4F3YmtbbunzOnF05JQ==
X-Google-Smtp-Source: APXvYqxEr92jhtBT1uFAamq5FfTEOFtNLr64Fwysmfw5liFBfPgdTxylfL+k5nkA5UswqABKpIGI9A==
X-Received: by 2002:a1c:6a07:: with SMTP id f7mr6276449wmc.124.1571658322488;
        Mon, 21 Oct 2019 04:45:22 -0700 (PDT)
Received: from dell ([95.149.164.99])
        by smtp.gmail.com with ESMTPSA id o4sm24943791wre.91.2019.10.21.04.45.21
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 04:45:22 -0700 (PDT)
Date:   Mon, 21 Oct 2019 12:45:20 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     robh@kernel.org, broonie@kernel.org, linus.walleij@linaro.org,
        vinod.koul@linaro.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        spapothi@codeaurora.org, bgoswami@codeaurora.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 02/11] mfd: wcd934x: add support to wcd9340/wcd9341
 codec
Message-ID: <20191021114520.GD4365@dell>
References: <20191018001849.27205-1-srinivas.kandagatla@linaro.org>
 <20191018001849.27205-3-srinivas.kandagatla@linaro.org>
 <20191021104611.GZ4365@dell>
 <1af8a875-8f55-6b7e-4204-ecedc1608889@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1af8a875-8f55-6b7e-4204-ecedc1608889@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 21 Oct 2019, Srinivas Kandagatla wrote:

> Thanks Lee for taking time to review.
> 
> I agree with most of the style related comments, will fix them in next
> version. For others I have replied it inline.

[...]

> > > +static int wcd934x_bring_up(struct wcd934x_data *wcd)
> > > +{
> > > +	struct regmap *rm = wcd->regmap;
> > 
> > It's much more common to use 'regmap' or 'map'.
> 
> Only reason to make it short here is to save some lines!
> If you prefer regmap, I will add that in next version!

I doubt it'd save many (any?) lines.

[...]

> > > +static int wcd934x_slim_status(struct slim_device *sdev,
> > > +			       enum slim_device_status status)
> > > +{
> > > +	struct device *dev = &sdev->dev;
> > > +	struct wcd934x_data *wcd;
> > > +	int ret;
> > 
> > This is semantically odd!  Why are you doing most of the
> > initialisation and bring-up in 'status' and not 'probe'.  Seems
> > broken to me.
> 
> SLIMBus device will not be in a state to communicate before enumeration (at
> probe), so all the device initialization is done in status callback where it
> is ready for communication.

Why do we need the device to be up *before* calling probe?

> This is same with SoundWire Bus as well!

[...]

> > > +	struct device *dev;
> > > +	struct clk *extclk;
> > > +	struct regmap *regmap;
> > > +	struct slim_device *sdev;
> > 
> > You don't need 'sdev' and 'dev'.
> 
> slim_device instance (sdev) is required by audio codec driver to allocate
> stream runtime.

You can extrapolate one from the other.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
