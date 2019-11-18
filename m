Return-Path: <SRS0=UR7X=ZK=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 644D5C432C0
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 Nov 2019 11:44:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2F8CD20855
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 Nov 2019 11:44:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="KqQXJdXK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726579AbfKRLoi (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 18 Nov 2019 06:44:38 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:46480 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726506AbfKRLoi (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 18 Nov 2019 06:44:38 -0500
Received: by mail-io1-f67.google.com with SMTP id i11so7396255iol.13
        for <devicetree@vger.kernel.org>; Mon, 18 Nov 2019 03:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=00YS9wU/qJok85ES8iPJQuzhcEYI33tD11SH51bcxeg=;
        b=KqQXJdXKRFMYWqjFg5qcQO4ctc/d2TpRdOani/P/No4Od0b4bINQYzmCWYNvQcVf+d
         PZCRLbvgh+K7M5+r7BLX6CDCfO53HqiTbr8GhHJPRWJevLW08f+fVQbv4oTqVQ76two9
         IR4JUlMVuZ0VcPD+JdbLzg1bhYakmoVlf2iHE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=00YS9wU/qJok85ES8iPJQuzhcEYI33tD11SH51bcxeg=;
        b=qNKf5YfpAipwHIMN5tNd7of3y1JGr6u/mUdNCus6zWz9kaqzD4di6w0T1zGzEvlBTm
         0G0ybvCP7K32o/UGQZI7zn4Sr0LPzfEOLgItqfyPFc8ttX0n2d3sSei+DRgAdHjMmoxY
         yToNePJd79ZDYB26rHSac5HBLu9ZfS54a4v4bxUYB07Y28moewcHw1hC8vcL+nxAV8VN
         +gGKH4DFGpIETChrT3ZH6PjGYW4uBqT2LQnFX5v35/UHvUlayT8EXFZsTNc8WJ5oi9vo
         2YxH5QXlDulcgH8eBKJK9Ho3HQ2xDIV/FhPBP6pDcZ9hCNoCeFYr+1CTV4KaL9VF7ySo
         lk+A==
X-Gm-Message-State: APjAAAX92QlbJtx4QzXWeH8f/JMKtcAWgv6jZ0ZXsIIAcknSVwUjY33q
        hzwkEO+4Ir/Tm9BmXtJgg9zWFY644VTlMTqPKaCfHA==
X-Google-Smtp-Source: APXvYqwzw/vwFbWlrZpD891jS+rPQgb5mUumAL70Wti+rBqMpjUTt1Ef42AIFjAULrwLH2d8+nyqPYfVmyfJ9QEszhU=
X-Received: by 2002:a02:634d:: with SMTP id j74mr13203246jac.79.1574077477457;
 Mon, 18 Nov 2019 03:44:37 -0800 (PST)
MIME-Version: 1.0
References: <075b3fa6-dab7-5fec-df68-b53f32bf061b@fivetechno.de> <2226540.xovL9aYQn6@diego>
In-Reply-To: <2226540.xovL9aYQn6@diego>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Mon, 18 Nov 2019 17:14:26 +0530
Message-ID: <CAMty3ZDwjv4ShpbAyQPWk9ewboFOK3nZO0s_QNty_m0hJKR76w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Split rk3399-roc-pc for with and
 without mezzanine board.
To:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc:     Markus Reichl <m.reichl@fivetechno.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Nov 4, 2019 at 5:42 PM Heiko St=C3=BCbner <heiko@sntech.de> wrote:
>
> Hi Markus,
>
> Am Freitag, 1. November 2019, 17:54:23 CET schrieb Markus Reichl:
> > For rk3399-roc-pc is a mezzanine board available that carries M.2 and
> > POE interfaces. Use it with a separate dts.
> >
> > Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
> > ---
> >  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
> >  .../boot/dts/rockchip/rk3399-roc-pc-mezz.dts  |  52 ++
> >  .../arm64/boot/dts/rockchip/rk3399-roc-pc.dts | 757 +----------------
> >  .../boot/dts/rockchip/rk3399-roc-pc.dtsi      | 767 ++++++++++++++++++
> >  4 files changed, 821 insertions(+), 756 deletions(-)
> >  create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezz.dts
> >  create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dt=
s/rockchip/Makefile
> > index a959434ad46e..80ee9f1fc5f5 100644
> > --- a/arch/arm64/boot/dts/rockchip/Makefile
> > +++ b/arch/arm64/boot/dts/rockchip/Makefile
> > @@ -28,6 +28,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3399-nanopi-neo4.d=
tb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3399-orangepi.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3399-puma-haikou.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3399-roc-pc.dtb
> > +dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3399-roc-pc-mezz.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3399-rock-pi-4.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3399-rock960.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3399-rockpro64.dtb
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezz.dts b/arch=
/arm64/boot/dts/rockchip/rk3399-roc-pc-mezz.dts
> > new file mode 100644
> > index 000000000000..ee77677d2cf2
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezz.dts
> > @@ -0,0 +1,52 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Copyright (c) 2017 T-Chip Intelligent Technology Co., Ltd
> > + * Copyright (c) 2019 Markus Reichl <m.reichl@fivetechno.de>
> > + */
> > +
> > +/dts-v1/;
> > +#include "rk3399-roc-pc.dtsi"
> > +
> > +/ {
> > +     model =3D "Firefly ROC-RK3399-PC Mezzanine Board";
> > +     compatible =3D "firefly,roc-rk3399-pc", "rockchip,rk3399";
>
> different board with same compatible isn't possible, so
> you'll need a new compatible for it and add a new line to
> the roc-pc entry in
>         Documentation/devicetree/bindings/arm/rockchip.yaml
>
> Either you see it as
> - a board + hat, using dt overlay and same compatible
> - a completely separate board, which needs a separate
>   compatible as well
>
> And as discussed in the previous thread
> http://lists.infradead.org/pipermail/linux-rockchip/2019-November/027592.=
html
> but also in Jagan's response that really is somehow a grey area
> for something relatively static as the M.2 extension.

Sorry for late response on this. I still think that the "overlay would
be a better suite" than having separate dts, since it is HAT which is
optional to insert and have possibility of having another HAT if it
really fit into it.

Comments?
