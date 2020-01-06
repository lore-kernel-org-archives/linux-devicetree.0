Return-Path: <SRS0=ND8X=23=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87430C33C8C
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 21:57:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5E42F2081E
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 21:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578347847;
	bh=7WDXA5LDetANMBWZDXycsKOa5hyKzpPA5A6X6eYPWGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=PNCSVD3vdwKbiDYfSSHgSW563lc87Vt4U3rUbrOlNWeK6XrS2dPamfiYNnIaq07xD
	 /oAFyO/NrbaRC7qNAFSvFW5AwpLwmAiSBzhorhCmBsbb4eLRJp4plZrQ6havKT+qn4
	 Wh+hjomJoil1vqSUDSkoQuK5EkkH243JvNKNRiw4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727134AbgAFV5Z (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 6 Jan 2020 16:57:25 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:37430 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727080AbgAFV5Y (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 6 Jan 2020 16:57:24 -0500
Received: by mail-ot1-f66.google.com with SMTP id k14so73548467otn.4
        for <devicetree@vger.kernel.org>; Mon, 06 Jan 2020 13:57:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TkT8eaIKGqV3wsrlyewlpi+P3L8o3guOiv9YMvMP6U8=;
        b=B285MiMn6Q/tCOT7j3oYd+CqPtNcmrZzoADF8kSn4cpGKpQfJ9OpKCuyRKpzkOqlI7
         Y/O+hiYiWIGm7oyyn69URM8YOW0nFSy7rs/NULH5efqonA0K4AWRzx5BkGKy12/VjNS+
         2ZAcnPUGMgiTPSvTaSHLUJuGLkoaFEQpwZsZC3XuK4uE6LgfsC1yfIEq3hkOX0xQ6agA
         OHmiu6Edi4bnR5rvz1/eSEmUqwseSGyvOoUViECJeSILQHJ1jvJtr8+d8U8Q/WMNsvDF
         +08du1GCxqd/DiK1OV3X4hs0/Lu1Yz9CUoEN3kYfHgyLbCen5VVQvLhOLfcZo5/SpUgp
         vArg==
X-Gm-Message-State: APjAAAXDJYUHgOzSIoVScYieTbTIxVlL2Pm2dElpudvEie6nrwRWALMc
        PaWSP4LojGr/NpTk3m5pxOXntV0=
X-Google-Smtp-Source: APXvYqyznM3Qbzq568xPaOdyB33g7Xb2dta2WrGarfgnqTClOofdezocHz/IfipRZKFRIQWP9CPsag==
X-Received: by 2002:a05:6830:1116:: with SMTP id w22mr120896326otq.63.1578347843845;
        Mon, 06 Jan 2020 13:57:23 -0800 (PST)
Received: from rob-hp-laptop (ip-70-5-121-225.ftwttx.spcsdns.net. [70.5.121.225])
        by smtp.gmail.com with ESMTPSA id a19sm21998362oto.60.2020.01.06.13.57.22
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 13:57:22 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219d8
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 06 Jan 2020 15:57:21 -0600
Date:   Mon, 6 Jan 2020 15:57:21 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc:     yong.liang@mediatek.com, wim@linux-watchdog.org,
        linux@roeck-us.net, p.zabel@pengutronix.de, matthias.bgg@gmail.com,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        chang-an.chen@mediatek.com, freddy.hsin@mediatek.com,
        yingjoe.chen@mediatek.com, sboyd@kernel.org,
        Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [PATCH v10 1/2] dt-bindings: mediatek: mt8183: Add #reset-cells
Message-ID: <20200106215721.GB31059@bogus>
References: <1578280296-18946-1-git-send-email-jiaxin.yu@mediatek.com>
 <1578280296-18946-2-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578280296-18946-2-git-send-email-jiaxin.yu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 6 Jan 2020 11:11:35 +0800, Jiaxin Yu wrote:
> Add #reset-cells property and update example
> 
> Signed-off-by: yong.liang <yong.liang@mediatek.com>
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> Reviewed-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  .../devicetree/bindings/watchdog/mtk-wdt.txt  | 10 ++++++---
>  .../reset-controller/mt2712-resets.h          | 22 +++++++++++++++++++
>  .../reset-controller/mt8183-resets.h          | 17 ++++++++++++++
>  3 files changed, 46 insertions(+), 3 deletions(-)
>  create mode 100644 include/dt-bindings/reset-controller/mt2712-resets.h
> 

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.
