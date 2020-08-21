Return-Path: <SRS0=+ed7=B7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C7DAC433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Aug 2020 17:14:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B5B520738
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Aug 2020 17:14:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="qCziGrqP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728431AbgHUROu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 21 Aug 2020 13:14:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726990AbgHUROo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 21 Aug 2020 13:14:44 -0400
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com [IPv6:2607:f8b0:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D1A6C061574
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2020 10:14:44 -0700 (PDT)
Received: by mail-il1-x142.google.com with SMTP id r13so2038134iln.0
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2020 10:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RTvsFOhGC05ImvCGxAXHe80DLl0Vnoh8uhjw9uG61SY=;
        b=qCziGrqPDSVtOLmbK1hFmaPBOq+huaVij1yQ263tMaWZonY5TWfaBxMerhZMu5VEP3
         RoPEPwzz/xcjuV+sZCG1Saoia1u3YKqx63vETf1XPu5IrA200TfHKvEGxaOTNHo5W+mG
         tCpVqh73Ai1QJJiviJSfv/he9dZ0cRwKhv0cdp7vo+LbX6FHoujL6bkQB7Qzicv6p2hE
         x4koMTN4PnrpDrX8npHVGmmmPy8pj+MUkr0jW05+KtnOLdeBNgPBu3vwKyD3t1KNEL7u
         BWwPpeGGTD5KgVYO5yUReKtkMR1+S+ZD4oeEDFdPiKx6JydchJQlt24N3BzYvr5uqc7g
         MsXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RTvsFOhGC05ImvCGxAXHe80DLl0Vnoh8uhjw9uG61SY=;
        b=V61maIqeOIe7KjGEe4MTDTDm6r2J9fx5gNsBZ5uEevfdoEWSpGLoPUTyE+nkkVT5Ie
         So9kKf5C8Bz0brRpBMySkg30sz5JChlTkyAPtYmHlNtw64J3jJ4/NENd0wZlWW4wQNIH
         1tSMHJXxXxL166sPssoRN1KkmqxqpbgfECt+YayVgs6hkZEHbNPp/rcnZo5MSYd24JZH
         1qafUJDucA1wIaOw7Ls4FGHtspHWFQMa56jXf7ZivqiGeti6tmmV2cvkdh6epDKV7nn/
         ChvrDAX9oeVjSAiuaw9UbyrTwNlJwAwMXjWS9V2l0y1Rcltr9zqmqJWJy5xLuX1dATjv
         Bm5w==
X-Gm-Message-State: AOAM5329ZOcp9QzH9moWn+jgwHbVovRvIwlef3sysoTIcqBQEekbHYxF
        f+rgH5MxdqTnXer55JDF/h5wUayyJB9U5QBP4kErUg==
X-Google-Smtp-Source: ABdhPJzBtpIobytboUBjp0jMvWUO7qPOEborYgyUfFC+VcbkdjoC05hgYoAhDbvXVVliplquim8DuARZHvyU0DBp/us=
X-Received: by 2002:a92:5209:: with SMTP id g9mr3383963ilb.72.1598030083248;
 Fri, 21 Aug 2020 10:14:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200819221750.2055932-1-robh@kernel.org> <20200821011237.GA4527@lx2k>
 <CAL_JsqLfzDMJXDdqtVBYWrvuB8kBDHECWmNkS5EJStiwSFtp-g@mail.gmail.com>
In-Reply-To: <CAL_JsqLfzDMJXDdqtVBYWrvuB8kBDHECWmNkS5EJStiwSFtp-g@mail.gmail.com>
From:   Olof Johansson <olof@lixom.net>
Date:   Fri, 21 Aug 2020 10:14:31 -0700
Message-ID: <CAOesGMhFGTZddCdusgfcUjfTP847am+F8jTAWrqYXjq1PLXxag@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: Reformat PCI ranges/dma-ranges entries
To:     Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc:     SoC Team <soc@kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        DTML <devicetree@vger.kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
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
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Aug 21, 2020 at 9:14 AM Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Aug 20, 2020 at 8:53 PM Olof Johansson <olof@lixom.net> wrote:
> >
> > On Wed, Aug 19, 2020 at 04:17:50PM -0600, Rob Herring wrote:
> > > While bracketing doesn't matter for a DTB, the DT schema checks rely =
on
> > > bracketing around each distinct entry. Reformat ranges and dma-ranges
> > > entries to fix warnings such as:
> > >
> > > arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml: pcie@=
f8000000: ranges: [[2197815296, 0, 4194304000, 0, 4194304000, 0, 31457280, =
2164260864, 0, 4225761280, 0, 4225761280, 0, 1048576]] is not valid under a=
ny of the given schemas (Possible causes of the failure):
> > >         arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yam=
l: pcie@f8000000: ranges: True was expected
> > >         arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yam=
l: pcie@f8000000: ranges:0: [2197815296, 0, 4194304000, 0, 4194304000, 0, 3=
1457280, 2164260864, 0, 4225761280, 0, 4225761280, 0, 1048576] is too long
> > >         arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yam=
l: pcie@f8000000: ranges:0:0: 2197815296 is not one of [16777216, 33554432,=
 50331648, 1107296256, 1124073472]
> >
> > Seems like a bug in your tool? Why would we bother with this churn?
>
> It's a feature. :)

The feature is better linting of ranges, the new lack of being able to
do that for the way we've always been allowed to write ranges is a
bug.

> In this case, with the entries bracketed, we can check the PCI top
> address cell contents in the common PCI schema and check how many
> ranges entries in the specific bridge schemas if they have some
> constraints. The use of bracketing is useful to defining the number of
> entries not just for ranges, but everywhere. A device binding defines
> how many register regions or interrupts for example. It makes sense to
> delineate entries in some way. While yes, we have #.*-cells, there's
> not really any way to handle that in json-schema. And let's face it,
> #.*-cells is an odd construct.
>
> Currently, the dtc dts->yaml output maintains all this formatting. I
> suppose we could change that such that we parse #.*-cells and define
> the boundaries based on them. But then dtc has to know about every
> case of #.*-cells. That's not impossible to do, but doesn't keep the
> tool and binding data separate.

That's already the case, isn't it? Run that part of the check if you
have a new enough dtc, otherwise warn that it's too old but do all the
other checks.

It's also just a change in one place: the tool, instead of evolving
the language by adding ad-hoc restrictions that the compiler doesn't
even know about, and requiring old code to change.

This way DTC could even warn/recommend bracketing per cell, when you
give it the ability to parse/handle it.

> Looking at it another way, do we really want to just allow anything? A
> device with 3 interrupts could be written as:
>
> interrupts =3D <1>, <2>, <3>;
> interrupts =3D <1 2 3>;
> interrupts =3D <1>, <2 3>;
> interrupts =3D [ 00 00 00 01 00 00 00 02 00 00 00 03 ];
>
> Or can we have some coding standards that are no more onerous or
> pedantic than what we have everywhere else?

We're generally quite careful about applying new restrictions and
expectations on coding standards all across the tree, and when we add
new ones we usually don't require legacy code to change overnight,
only when there are other relevant changes to those files.


-Olof
