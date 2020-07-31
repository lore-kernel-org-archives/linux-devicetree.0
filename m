Return-Path: <SRS0=uLJJ=BK=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1E84C433E1
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jul 2020 21:28:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B110B22BEA
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jul 2020 21:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1596230901;
	bh=t2TnxjwX3qoq8jarFCBg8PPXBcrNIpb0WFslp6nHU3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=aGsWrL+zcsOl8ZgqTYYq43H0e1TntjvkM75nEiggJJS/Mf3CvwYNVrlgMgUx0pCT/
	 okxNiLYZMiuBiESPzJiFmyiqpmuO9U2CeGEf19+dzPvO+Y0JfXv/kHb2evoB5fXusZ
	 zCqiax0fYuzo+l4HK3D9qaAmCapIHxB5G2oT5k40=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727888AbgGaV2V (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 31 Jul 2020 17:28:21 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:38269 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727077AbgGaV2U (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 31 Jul 2020 17:28:20 -0400
Received: by mail-io1-f67.google.com with SMTP id l1so33021027ioh.5;
        Fri, 31 Jul 2020 14:28:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sVnBiF5i1es6XtH44ZtTDOKObrgpwZ2en0Vy3+DputQ=;
        b=EuYo/vnZ45XJJy+sGBjIKVqj+pcEiSMmCAhAHphINKuYVRJNgrB4UqGwYF9MKURp6r
         ogyzansceEzBYyTCrkv1BhJHTbtZUGBeSLQpwgL1I6d3B+Nh+iQB+6p/x8deB8UdqoQN
         DlrXPlbePNwavTN4Kl6+LLFubciflzGfmHOUSJF8+xQHFljAHhK8eukfBG/PYjo+AWQ7
         dbmQ/TvI2VZchpoQJTcZWfh7xpp93DGbKlKQAgw3cIREO0uI1DGmgPDt5LosxwmV0m6l
         JcfIuzVF0go3Xw8N9u+xV7FEG8oT30cvNcjWabX0mapT4kL/eAjnoOtDgoTxVdDbQk8C
         llzw==
X-Gm-Message-State: AOAM532R3QWwY/WhIvx+r8eYghawTO/At2rQMP5XYkJEOWUrvc/qHhFm
        H+pYzrjn07EjTJ1RB8kREw==
X-Google-Smtp-Source: ABdhPJwur50y+86swFURuMIPAxgNj7veyK1aygfJ2RBiIH75TGON/Gjzru4QNpnZ11hrSwzisTrTrg==
X-Received: by 2002:a05:6602:2c08:: with SMTP id w8mr5584224iov.129.1596230899991;
        Fri, 31 Jul 2020 14:28:19 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id j5sm5453486ilq.30.2020.07.31.14.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2020 14:28:19 -0700 (PDT)
Received: (nullmailer pid 824420 invoked by uid 1000);
        Fri, 31 Jul 2020 21:28:16 -0000
Date:   Fri, 31 Jul 2020 15:28:16 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dong Aisheng <aisheng.dong@nxp.com>
Cc:     linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
        kernel@pengutronix.de, fabio.estevam@nxp.com, sboyd@kernel.org,
        mturquette@baylibre.com, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, shawnguo@kernel.org
Subject: Re: [PATCH v7 02/11] dt-bindings: clock: imx-lpcg: add support to
 parse clocks from device tree
Message-ID: <20200731212816.GA824333@bogus>
References: <1596009618-25516-1-git-send-email-aisheng.dong@nxp.com>
 <1596009618-25516-3-git-send-email-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1596009618-25516-3-git-send-email-aisheng.dong@nxp.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 29 Jul 2020 16:00:09 +0800, Dong Aisheng wrote:
> MX8QM and MX8QXP LPCG Clocks are mostly the same except they may reside
> in different subsystems across CPUs and also vary a bit on the availability.
> 
> Same as SCU clock, we want to move the clock definition into device tree
> which can fully decouple the dependency of Clock ID definition from device
> tree and make us be able to write a fully generic lpcg clock driver.
> 
> And we can also use the existence of clock nodes in device tree to address
> the device and clock availability differences across different SoCs.
> 
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: devicetree@vger.kernel.org
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
> ChangeLog:
> v6->v7:
>  * No other changes except converting to json schema based on the former reviewed
>    patches due to the lagecy binding file was removed in latests kernel.
>    Because the format is different now, i removed the former R-b
>    and A-b tags and request a new review.
>    See original patch here:
>    https://patchwork.kernel.org/patch/11439079/
> v4->v6:
>  * no changes
> v3->v4:
>  * change bit-offset property to clock-indices
>  * use constant macro to define clock indinces
>  * drop hw-autogate property which is still not used by drivers
> v2->v3:
>  * no changes
> v1->v2:
>  * Update example
>  * Add power domain property
> ---
>  .../bindings/clock/imx8qxp-lpcg.yaml          | 79 ++++++++++++++-----
>  include/dt-bindings/clock/imx8-lpcg.h         | 14 ++++
>  2 files changed, 74 insertions(+), 19 deletions(-)
>  create mode 100644 include/dt-bindings/clock/imx8-lpcg.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
