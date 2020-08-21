Return-Path: <SRS0=+ed7=B7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60CD9C433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Aug 2020 02:53:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 414632177B
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Aug 2020 02:53:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="DGxvlbCv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726973AbgHUCxZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 20 Aug 2020 22:53:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726974AbgHUCxZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 20 Aug 2020 22:53:25 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A34EC061386
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2020 19:53:24 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id b30so195991lfj.12
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2020 19:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Wzatctpc+FvYoJ99XNB10sH67rwujcIhjY3BuCzGmho=;
        b=DGxvlbCvoNaXKOL43sWgecH+O/rJOe8W4VqpjFTJYxFzJBroPwv6ZW7nKDSZ9cXAE3
         XNV/WYUct8UNPtotuM5AqBb/psyW1ucP/6ChfXPdOyK67XVSz9pLhfkrViLGuRH+6jOs
         G/tFEYlVdK66gecWM6blGG07JniIdL56mxlmkXr2ODHNHAi11yDYQFZI3vuGgc2IFQns
         S/PMahcl3DrE60IYZGBc60MD14C5gbRplDkxJW7B7oS5cjBEshx669zny+WUpzTEe0HX
         1DM0Ib5EXEWOKDWYWaLTSSDjXtV+8r4kaLoQB3MCwPLTeDbdL9IftChcG57HMlOnWTjT
         IezA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Wzatctpc+FvYoJ99XNB10sH67rwujcIhjY3BuCzGmho=;
        b=cHtIn4vsZKiQcdc9WrJDLENFFhgQMjV4pcplBvLhvoHxNGlYj0KMJUOsA4m2SU9cDp
         cyFDgD5S4jp2+mfzkRBy0qH/115eTZROvosjgobg/TR7s4ujeWH2zOqgqFS0D+FNd8tS
         /OnaiwCDYvv1haB6CFKOub0xx31PG8WahR/6FopVxUQiEgx0JzKb9swGPA3PkidBCJX7
         wI8iwToRQIxmx/58u6uw5stegMqeeeKBI6EQDZlHia4MwphyAd5wq+/ngA4wWsd9ZbZY
         4Qz/pYX2U0VwO5mKWm6n9WZ8yhBqrdjRCEzt8X7tYdHZLrym/PUq/Gjq8K62w+HkPuyg
         6Uug==
X-Gm-Message-State: AOAM532Wtqx3xVuaevDf6HgALw7CT7BDNIITa9qyu33+jOICM4AF1u1u
        tCqcrHn+1YQELZ+pUM+jKWzmtA==
X-Google-Smtp-Source: ABdhPJx5BACHGdQcQmOu4crig7h0bACuVOhuDxlrNBnorAknrztXwhtNeu8pBf3h5iwfb1sTggzNHA==
X-Received: by 2002:a05:6512:3444:: with SMTP id j4mr350206lfr.161.1597978402213;
        Thu, 20 Aug 2020 19:53:22 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id a12sm89140lfi.83.2020.08.20.19.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2020 19:53:20 -0700 (PDT)
Date:   Thu, 20 Aug 2020 18:12:37 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc:     soc@kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Khuong Dinh <khuong@os.amperecomputing.com>,
        Robert Richter <rrichter@marvell.com>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Wei Xu <xuwei5@hisilicon.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: Reformat PCI ranges/dma-ranges entries
Message-ID: <20200821011237.GA4527@lx2k>
References: <20200819221750.2055932-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200819221750.2055932-1-robh@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Aug 19, 2020 at 04:17:50PM -0600, Rob Herring wrote:
> While bracketing doesn't matter for a DTB, the DT schema checks rely on
> bracketing around each distinct entry. Reformat ranges and dma-ranges
> entries to fix warnings such as:
> 
> arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml: pcie@f8000000: ranges: [[2197815296, 0, 4194304000, 0, 4194304000, 0, 31457280, 2164260864, 0, 4225761280, 0, 4225761280, 0, 1048576]] is not valid under any of the given schemas (Possible causes of the failure):
>         arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml: pcie@f8000000: ranges: True was expected
>         arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml: pcie@f8000000: ranges:0: [2197815296, 0, 4194304000, 0, 4194304000, 0, 31457280, 2164260864, 0, 4225761280, 0, 4225761280, 0, 1048576] is too long
>         arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml: pcie@f8000000: ranges:0:0: 2197815296 is not one of [16777216, 33554432, 50331648, 1107296256, 1124073472]

Seems like a bug in your tool? Why would we bother with this churn?


-Olof
