Return-Path: <SRS0=+eHa=B3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D81DC433E1
	for <linux-devicetree@archiver.kernel.org>; Mon, 17 Aug 2020 19:27:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3FF34204EC
	for <linux-devicetree@archiver.kernel.org>; Mon, 17 Aug 2020 19:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1597692479;
	bh=a8lgxrLDh7umN2n93WqCKz3gbEhIYdnZ7uW6BDMdotg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=VAw4VI4UyPadsA7T9Rw5axstJ8Un42OqhPwFWZrGbPa8mWR2gnXVV9G2yfs6hDmpl
	 2r9y5l5G/tCsSGEPPR1Zz1v4UjGIK4cHjDO37RUcjM2dP7l4By0LVHPhhgYB78SsNT
	 yo8FH7arufQOk4KMy4zAKhqKFYiERJzsvUSYQx94=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731977AbgHQT16 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 17 Aug 2020 15:27:58 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:35005 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731973AbgHQT1y (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 17 Aug 2020 15:27:54 -0400
Received: by mail-io1-f65.google.com with SMTP id s189so18832765iod.2
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2020 12:27:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=H7GXHyDeVIh5lEncSQMJjs8Q/7+ajAT7eoqNf5xLW4Y=;
        b=SrBB73JZTxu4vttcxUp4p4QQ4iIMlr+ZNGpU/MoolwjqAXlUzIZgleoAzIb0sofzpg
         KtarPeQ0bTMAoToRkTB4dQbTdIez6Fvr7n9+0gWsBstwDrSbJ0oUUopl5NmCtwIwEQTM
         nL+Kzy+Nqgcv7fg1yM/bHG+f381+ppM1QfQHyFwwej5igwIIN3Wo+6PtduauztLk9UiH
         qFgFpN+2oNGxDKR2AB5NjXhQ1baYqULu4UjHaUF6sVmkWEogbLgMdKYQmkh/l3yRY1TA
         NDivc+2/DO9pgo+c5jY98DetMLKZ4f0f99lxBFlc26OXOOWTU3Df3WK1IinAPzBAQbDo
         j0cg==
X-Gm-Message-State: AOAM533IBYLKNmEHuCN9B64zjpsuYlJ48XWOmigNnI1qqcELCC6hHAQl
        Yvh7Ju8LxdYbn0aOuDTWZQ==
X-Google-Smtp-Source: ABdhPJzrfNS/B9pPPi2ZWeHn90wB7Wyt+7r/wY07Qz6B8BIm2GueyDVMe0o8H0uBgt630m6k+Q4WMQ==
X-Received: by 2002:a02:cf26:: with SMTP id s6mr16003073jar.44.1597692473359;
        Mon, 17 Aug 2020 12:27:53 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id c88sm6039755ilg.5.2020.08.17.12.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 12:27:52 -0700 (PDT)
Received: (nullmailer pid 1399062 invoked by uid 1000);
        Mon, 17 Aug 2020 19:27:51 -0000
Date:   Mon, 17 Aug 2020 13:27:51 -0600
From:   Rob Herring <robh@kernel.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH] ARM: dts: imx25-pinfunc: Fix GPT function names
Message-ID: <20200817192751.GA1398927@bogus>
References: <20200813202410.5670-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200813202410.5670-1-u.kleine-koenig@pengutronix.de>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, 13 Aug 2020 22:24:10 +0200, Uwe Kleine-König wrote:
> According to the reference manual of the i.MX25 the function name for
> the GPT capture input is called CAPIN1. So fix the names to follow the
> same naming scheme as used for the other pads and functions. Also add
> one missing pad function.
> 
> There are no mainline users that needs adaption.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  arch/arm/boot/dts/imx25-pinfunc.h | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
