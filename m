Return-Path: <SRS0=7PY0=2Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19520C00523
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Jan 2020 22:15:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E04BF21835
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Jan 2020 22:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578089729;
	bh=Qf9EolB2jzZXlWCdEQ5eb6BW0rV3QbEjzHuo0ciTChs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=cwVWixKM2rQBG7F/WsWMt4zCxFG5alV8zE6L8wqguFV+cvj6CXeypIjs6mgPurxR7
	 dP6foTa7MTd1hQKIP3aLFW6W3/vNIPEqKQ5h4ax9BvTw68LXupzYLjTghd4cZWKCUm
	 4kW4m5gRV/VpNbMhehuqgL9toLxmpBd8IvVBQfE8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728840AbgACWP2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 3 Jan 2020 17:15:28 -0500
Received: from mail-il1-f196.google.com ([209.85.166.196]:45635 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728698AbgACWP2 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 3 Jan 2020 17:15:28 -0500
Received: by mail-il1-f196.google.com with SMTP id p8so37794376iln.12
        for <devicetree@vger.kernel.org>; Fri, 03 Jan 2020 14:15:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DgfHDc2ugqDl3Ojv+ZQfPSfnGXvjjxOAehbizu1AkF0=;
        b=R4UQq28DxiO/+B2FbW2EjUOY0h39UQLyvZeDNdVwumMkjcnsFaU2XX9vcuN6grrRdB
         ZuxKWZ3T1jf3m7ZB9nBU1p+frT6k5ahhOyTekGkgVVXTW2krZQ8rgrIhwI8WXD/9/+is
         9eWOFrr2CRoVVUVzwM9YRYpzK8il9KQaFVP35da9mAMcYZ69mDOZR8Y8DEURlgBIXl3u
         gLJhjNikZXLNOA6eRDUNU9UdUPc89mY0n3xpxR93IDQt3epZx1lW/O0xN1jTOnApxnNp
         7NAfkXXoyb90Bz6ccUIutbuxu21nUiClxdYkl/zLpRdFv7YoC7NExaVa4MyI9oiqX4Hw
         U9ow==
X-Gm-Message-State: APjAAAU9X+dIX7RWX/g78WnY5ldEVf4669yUOzAPBj6djt6eBgo9KquF
        tu55Rsdcp/PyNrF9Duh/A1pW35Q=
X-Google-Smtp-Source: APXvYqwnzxDu6iTA4TchchZ8mzU64Rfh963KqDB8OOZqRDqbY6CZtC6dHfht4+Z/ikn5Z7dWWck+ZQ==
X-Received: by 2002:a92:d588:: with SMTP id a8mr70994584iln.62.1578089727282;
        Fri, 03 Jan 2020 14:15:27 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id y11sm15042059iot.19.2020.01.03.14.15.26
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 14:15:27 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219a5
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Fri, 03 Jan 2020 15:12:55 -0700
Date:   Fri, 3 Jan 2020 15:12:55 -0700
From:   Rob Herring <robh@kernel.org>
To:     Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc:     yong.liang@mediatek.com, wim@linux-watchdog.org,
        linux@roeck-us.net, p.zabel@pengutronix.de, matthias.bgg@gmail.com,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        chang-an.chen@mediatek.com, freddy.hsin@mediatek.com,
        yingjoe.chen@mediatek.com, sboyd@kernel.org
Subject: Re: [PATCH 1/2] [PATCH v8 1/2] dt-bindings: mediatek: mt8183: Add
 #reset-cells
Message-ID: <20200103221255.GA1427@bogus>
References: <1578044245-26939-1-git-send-email-jiaxin.yu@mediatek.com>
 <1578044245-26939-2-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578044245-26939-2-git-send-email-jiaxin.yu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Jan 03, 2020 at 05:37:24PM +0800, Jiaxin Yu wrote:
> Add #reset-cells property and update example
> 
> Change-Id: If3f4f0170d417819facff1fd0a0e5e3c6cc9944d

Drop this.

> Signed-off-by: yong.liang <yong.liang@mediatek.com>
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> Reviewed-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  .../reset-controller/mt2712-resets.h          | 22 +++++++++++++++++++
>  .../reset-controller/mt8183-resets.h          | 17 ++++++++++++++
>  2 files changed, 39 insertions(+)
>  create mode 100644 include/dt-bindings/reset-controller/mt2712-resets.h

What happened to the binding doc change?

> 
> diff --git a/include/dt-bindings/reset-controller/mt2712-resets.h b/include/dt-bindings/reset-controller/mt2712-resets.h
> new file mode 100644
> index 000000000000..9e7ee762f076
> --- /dev/null
> +++ b/include/dt-bindings/reset-controller/mt2712-resets.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2019 MediaTek Inc.
> + * Author: Yong Liang <yong.liang@mediatek.com>
> + */
> +
> +#ifndef _DT_BINDINGS_RESET_CONTROLLER_MT2712
> +#define _DT_BINDINGS_RESET_CONTROLLER_MT2712
> +
> +#define MT2712_TOPRGU_INFRA_SW_RST				0
> +#define MT2712_TOPRGU_MM_SW_RST					1
> +#define MT2712_TOPRGU_MFG_SW_RST				2
> +#define MT2712_TOPRGU_VENC_SW_RST				3
> +#define MT2712_TOPRGU_VDEC_SW_RST				4
> +#define MT2712_TOPRGU_IMG_SW_RST				5
> +#define MT2712_TOPRGU_INFRA_AO_SW_RST				8
> +#define MT2712_TOPRGU_USB_SW_RST				9
> +#define MT2712_TOPRGU_APMIXED_SW_RST				10
> +
> +#define MT2712_TOPRGU_SW_RST_NUM				11
> +
> +#endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT2712 */
> diff --git a/include/dt-bindings/reset-controller/mt8183-resets.h b/include/dt-bindings/reset-controller/mt8183-resets.h
> index 8804e34ebdd4..a1bbd41e0d12 100644
> --- a/include/dt-bindings/reset-controller/mt8183-resets.h
> +++ b/include/dt-bindings/reset-controller/mt8183-resets.h
> @@ -78,4 +78,21 @@
>  #define MT8183_INFRACFG_AO_I2C7_SW_RST				126
>  #define MT8183_INFRACFG_AO_I2C8_SW_RST				127
>  
> +#define MT8183_INFRACFG_SW_RST_NUM				128
> +
> +#define MT8183_TOPRGU_MM_SW_RST					1
> +#define MT8183_TOPRGU_MFG_SW_RST				2
> +#define MT8183_TOPRGU_VENC_SW_RST				3
> +#define MT8183_TOPRGU_VDEC_SW_RST				4
> +#define MT8183_TOPRGU_IMG_SW_RST				5
> +#define MT8183_TOPRGU_MD_SW_RST					7
> +#define MT8183_TOPRGU_CONN_SW_RST				9
> +#define MT8183_TOPRGU_CONN_MCU_SW_RST				12
> +#define MT8183_TOPRGU_IPU0_SW_RST				14
> +#define MT8183_TOPRGU_IPU1_SW_RST				15
> +#define MT8183_TOPRGU_AUDIO_SW_RST				17
> +#define MT8183_TOPRGU_CAMSYS_SW_RST				18
> +
> +#define MT8183_TOPRGU_SW_RST_NUM				19
> +
>  #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8183 */
> -- 
> 2.18.0
