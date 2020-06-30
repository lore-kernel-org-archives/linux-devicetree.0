Return-Path: <SRS0=g9lS=AL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72B27C433E0
	for <linux-devicetree@archiver.kernel.org>; Tue, 30 Jun 2020 17:07:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4CBED20772
	for <linux-devicetree@archiver.kernel.org>; Tue, 30 Jun 2020 17:07:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="krnaQcrW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390022AbgF3RHu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 30 Jun 2020 13:07:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390021AbgF3RHu (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 30 Jun 2020 13:07:50 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09D22C03E979
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2020 10:07:50 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id j18so19525962wmi.3
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2020 10:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eo3ES9sUCig8aLu5NZZkJQXvABEslHkuO9SXxTeXs7A=;
        b=krnaQcrWpA9PjZpBjE+pBBdEaARw/s+oHt5/YFoFvJphTS/aiTcVUYQvXi8rYFehln
         Nfsb2EgxZD8PIG4hq8NhzdV40PvmoApJZXgYKSUdgQ6ZfIRZOcvoDAiF/gR/7702rhfM
         0OLGZAHNZ1+N5mBncwANibrTdVA7yBuMl3lhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eo3ES9sUCig8aLu5NZZkJQXvABEslHkuO9SXxTeXs7A=;
        b=l0+eM3eVPocfzLPjq0/ygfd3HrGBvP5xvFiGfcZkAu2mX/WXlP+tag5g+XC2PUO5TV
         lByUi9oWhhBGWoT1bVW4DZcS2o4mfoO79neesE8R7jZi69uljEeWJXQNwsqF1//1k+bL
         aCDDTkdhF4WsGTnj6ifUhCOteqt8N3VQCHcge64tWEd0jjzaVQOiJhfWnmmoJSqAUtNT
         3eMhetLTlcVDUakL2fhJIHuBAeGWtk2YfX3sOuTIr85LbNu4wMW2sfyp0orlJssGqwQJ
         UW3+O5M+4QAWXktPwobuL2yWlNuLcIMIywa3NcrEqZogI0I9tP2X3UP7Q3aLzEUo9cc9
         wqnA==
X-Gm-Message-State: AOAM532ZCQYzEOLQJvDyMlXcBZQyIkpKt9goJp0Nn6mSBKqWb2nnvBLt
        Mre085CSi+c24prvBmwelRNo8g==
X-Google-Smtp-Source: ABdhPJwlgaLryaWZGTbiuR1St0l7UpAMy7IhlnmJgccwBKqfDnX8dswNiXEgaVH7QqQgdM/4TqRpEA==
X-Received: by 2002:a1c:2e0e:: with SMTP id u14mr22242245wmu.55.1593536868603;
        Tue, 30 Jun 2020 10:07:48 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id h14sm4457200wrt.36.2020.06.30.10.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 10:07:48 -0700 (PDT)
Date:   Tue, 30 Jun 2020 17:07:46 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        mchehab@kernel.org, andriy.shevchenko@linux.intel.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        sakari.ailus@linux.intel.com, drinkcat@chromium.org,
        matthias.bgg@gmail.com, bingbu.cao@intel.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [PATCH V11 2/2] media: i2c: ov02a10: Add OV02A10 image sensor
 driver
Message-ID: <20200630170746.GD1212092@chromium.org>
References: <20200630024942.20891-1-dongchun.zhu@mediatek.com>
 <20200630024942.20891-3-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200630024942.20891-3-dongchun.zhu@mediatek.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Dongchun,

On Tue, Jun 30, 2020 at 10:49:42AM +0800, Dongchun Zhu wrote:
> Add a V4L2 sub-device driver for OV02A10 image sensor.
> 
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> ---
>  MAINTAINERS                 |    1 +
>  drivers/media/i2c/Kconfig   |   13 +
>  drivers/media/i2c/Makefile  |    1 +
>  drivers/media/i2c/ov02a10.c | 1052 +++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 1067 insertions(+)
>  create mode 100644 drivers/media/i2c/ov02a10.c

Thank you for the patch. Please see my comments inline.

[snip]
> +static int ov02a10_entity_init_cfg(struct v4l2_subdev *sd,
> +				   struct v4l2_subdev_pad_config *cfg)
> +{
> +	struct v4l2_subdev_format fmt = {
> +		.which = cfg ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE,

As we discussed before, this function is never called with cfg == NULL.
Perhaps what we need here is to call ov02a10_set_fmt() twice, once for
V4L2_SUBDEV_FORMAT_ACTIVE and then for V4L2_SUBDEV_FORMAT_TRY?

Sakari, would that be a proper implementation of this function?

> +		.format = {
> +			.width = 1600,
> +			.height = 1200,
> +		}
> +	};
> +
> +	ov02a10_set_fmt(sd, cfg, &fmt);
> +
> +	return 0;
[snip]

With this and Sakari's comment about the initial state of the reset pin
fixed, feel free to add my

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
