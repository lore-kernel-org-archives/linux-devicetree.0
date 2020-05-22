Return-Path: <SRS0=I+Xt=7E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17BCBC433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 May 2020 18:03:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E689120663
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 May 2020 18:03:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=flowbird.group header.i=@flowbird.group header.b="utZG2z7Q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730856AbgEVSDC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 22 May 2020 14:03:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730750AbgEVSDC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 22 May 2020 14:03:02 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4F2BC05BD43
        for <devicetree@vger.kernel.org>; Fri, 22 May 2020 11:03:01 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id v16so13743000ljc.8
        for <devicetree@vger.kernel.org>; Fri, 22 May 2020 11:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flowbird.group; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ml7THgxorDYQib7DNZk9FOL557ltFBJZwgBDu/FX7ek=;
        b=utZG2z7QWctXEl2uBsqebsPA3zfffsfGw4WhJkgCfkJRUu4WysBlQsd6TntjTNBHx3
         RK+Zo29s0/c/ZnqtVGJmqNrHdhn5QXlsUYSOgATtrw3P2A66BjaIC+EweLSi7Qf5OCdJ
         GX8CThuo8VGKZoQ/S8llIsLBcbjEKIsCgS6FyXI6J0vWlGQhppYjrZB43nktZeDTbVz+
         /cBkJZMpRhQqvN/MMVYP0tUSHik5oh/twKJuMwFF3g8/XgBtVJmm53yVGqLhMUari5La
         ai3jkm32UuKZl7k2x6PS7wxJVctBUAZtXtFQuKDBlBvU7NRBH3dGFG9H7s0NtFQlqBzI
         J3gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ml7THgxorDYQib7DNZk9FOL557ltFBJZwgBDu/FX7ek=;
        b=YgoGUZr0y1tl8W+t0a3NFrm5zT8m2sxxI+cq5qaQ8BrdwImUlMtpVljkimx9jYxztp
         WpO7d3HN8eYyH55nHQG6o1e2X30azXkp0h3Y9Nnliu2apy7q6PwysRz/oXTjTo9vhumg
         mo2hcJPtLs1edMUl4Yrni95QgG+DfKVqVTdOS2LL3Ky5rKJcB+8xcMt/nGDuGYNt76Nm
         Jo2ANSiwzrpQEUxdjFj9U02BRmY/IrB2OeSS6lz6HPDdbLmkCgXllqe6eZb3MI764lC4
         /IJxcx37uQZJ4VexHu7gpdTT4iqri/sWkEb+A8tIX4/RJFBpxqjWgl3Q8dpaOn5E471T
         dlNQ==
X-Gm-Message-State: AOAM530hsROdcoaBMT5aIHvImZkWlCKxLdc65PPlm+KgqoK0+eZAnkKI
        tPn4DJxduQvLwmSxCArHFuVeB4XYIyA2onIddpYG3w==
X-Google-Smtp-Source: ABdhPJzs5UnC3g+qyhn2Pqztia3rsTY7EBXN83mCWsVde6vm6uyh7VAkm66rYkFtvsi6TWc5cLnEDYqxX/6C5QKjPdg=
X-Received: by 2002:a2e:1f02:: with SMTP id f2mr7760495ljf.156.1590170579919;
 Fri, 22 May 2020 11:02:59 -0700 (PDT)
MIME-Version: 1.0
References: <1589963516-26703-1-git-send-email-fugang.duan@nxp.com>
 <1589963516-26703-4-git-send-email-fugang.duan@nxp.com> <20200520170322.GJ652285@lunn.ch>
 <AM6PR0402MB3607541D33B1C61476022D0AFFB70@AM6PR0402MB3607.eurprd04.prod.outlook.com>
 <20200521130700.GC657910@lunn.ch> <AM6PR0402MB360728F404F966B9EF404697FFB40@AM6PR0402MB3607.eurprd04.prod.outlook.com>
In-Reply-To: <AM6PR0402MB360728F404F966B9EF404697FFB40@AM6PR0402MB3607.eurprd04.prod.outlook.com>
From:   "Fuzzey, Martin" <martin.fuzzey@flowbird.group>
Date:   Fri, 22 May 2020 20:02:49 +0200
Message-ID: <CANh8QzwxfnQ1cACz=6dhYujEVtQoTCw8kTgkHi9BnxESptL=xQ@mail.gmail.com>
Subject: Re: [EXT] Re: [PATCH net 3/4] ARM: dts: imx6: update fec gpr property
 to match new format
To:     Andy Duan <fugang.duan@nxp.com>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Andy,

On Fri, 22 May 2020, 03:01 Andy Duan, <fugang.duan@nxp.com> wrote:
>
> Andrew, many customers require the wol feature, NXP NPI release always support
> the wol feature to match customers requirement.
>
> And some customers' board only design one ethernet instance based on imx6sx/imx7d/
> Imx8 serial, but which instance we never know, maybe enet1, maybe enet2. So we should
> supply different values for gpr.
>
> So, it is very necessary to support wol feature for multiple instances.
>

Yes, I don't think anyone is saying otherwise.

The problem is just that there are already .dtsi files for i.MX chips
having multiple ethernet interfaces
in the mainline kernel (at least imx6ui.dtsi, imx6sx.dts, imx7d.dtsi)
but that this patch series does not
modify those files to use the new DT format.

It currently only modifies the dts files that are already supported by
hardcoded values in the driver.

As to not knowing which instance it shouldn't matter.
The base dtsi can declare both/all ethernet interfaces with the
appropriate GPR bits.
Both set to status = "disabled".

Then the board specific dts file sets status="okay" and activates wol
by adding "
"fsl,magic-packet" if the hardaware supports it
(because that depends on things beyond the SoC, like how the ethernet
PHY is clocked and powered.)

Martin
