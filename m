Return-Path: <SRS0=8557=ZM=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05B05C432C0
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 Nov 2019 15:51:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C37F420692
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 Nov 2019 15:51:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="DA3GASR2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729591AbfKTPvW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 20 Nov 2019 10:51:22 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:41871 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728442AbfKTPvW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 20 Nov 2019 10:51:22 -0500
Received: by mail-il1-f193.google.com with SMTP id q15so56529ils.8
        for <devicetree@vger.kernel.org>; Wed, 20 Nov 2019 07:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=V9ocHos4mEPx/cXUTF0dJh2q+Dfua495g56A4DiYMvM=;
        b=DA3GASR2Yz29peYkU/JxCycyhe0pntz2I8oB4TnZKHaznQQ/3dZagFl7mz/6uQHJW5
         GrRIPKUtWuu9jAaJ2X5b0MVGuDe5OcswfXx1wbPb8m7uCfMIJmc9IPC5IS0lBPUTGROo
         mDAdsl7e6tN7R+gpDhb9im2LWKYDM4jMwbQzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=V9ocHos4mEPx/cXUTF0dJh2q+Dfua495g56A4DiYMvM=;
        b=K2XfQwKhRUSmM6lp/E6wqI4E92WrnwnJyz92AoG+BiKNvqqFcUifqbJkp/sF/6jEDC
         R9lZDLh7LivhxrF4Ptfr8Mf/hd8+9PYSILbQhCOkZMy7I1CthE5Ve95/A3xeUBAwbrir
         FzKdG7A/7GIzkLlKPIRYYcJuNRz+SL2YVHULhndQUgqURiFCPUDffh1bX3XtIF2cQtvW
         MsdrckgkUMauGELeKQEkNorhqbjNgqKCDWo/wthiX2/JyTGd7fCvtYmZcAVzpqkMdHwW
         ZbKw3B3rYaFXvL6G7fiFJ7Qe6l9MuKEeiqJZZ92iUG04qKqvx/4SDaUfny8QdEgd/tPF
         ohKw==
X-Gm-Message-State: APjAAAXofMsePa7PpjyAAN7xFS9cIBYjedEyTrpjS+vY/3wQOXffUHt9
        ghBhhzrkPcu601u1wD3YEHP2jhg0r3rIUMGWGV7uEwolXz2zpg==
X-Google-Smtp-Source: APXvYqxEiRL48js6ZDjxRjcSKNXQCeEpejajn5en3dkyccGBO7qEMLPuZspPilOntqUDYF2mK0Y10om7k0o+Lm+FniU=
X-Received: by 2002:a92:5d8f:: with SMTP id e15mr4268209ilg.173.1574265079598;
 Wed, 20 Nov 2019 07:51:19 -0800 (PST)
MIME-Version: 1.0
References: <20191120113923.11685-1-jagan@amarulasolutions.com>
 <20191120113923.11685-3-jagan@amarulasolutions.com> <1707486.7nrk6WTBgP@diego>
In-Reply-To: <1707486.7nrk6WTBgP@diego>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Wed, 20 Nov 2019 21:21:08 +0530
Message-ID: <CAMty3ZC2NzTWq8YPbePRyPdixxMO7mrPZrzagwjrTkhGHGRR=g@mail.gmail.com>
Subject: Re: [PATCH 2/5] arm64: dts: rockchip: Add VMARC RK3399Pro SOM initial support
To:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Akash Gajjar <akash@openedev.com>, Tom Cubie <tom@radxa.com>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-amarula <linux-amarula@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Heiko,

On Wed, Nov 20, 2019 at 6:59 PM Heiko St=C3=BCbner <heiko@sntech.de> wrote:
>
> Hi Jagan,
>
> looks good in general, just some small things below:
>
> Am Mittwoch, 20. November 2019, 12:39:20 CET schrieb Jagan Teki:
> > VMARC RK3399Pro SOM is a standard SMARC SOM design with
> > Rockchip RK3399Pro SoC, which is designed by Vamrs.
> >
> > Specification:
> > - Rockchip RK3399Pro
> > - PMIC: RK809-3
> > - SD slot, 16GiB eMMC
> > - 2xUSB-2.0, 1xUSB3.0
> > - USB-C for power supply
> > - Ethernet, PCIe
> > - HDMI, MIPI-DSI/CSI, eDP
> >
> > Add initial support for VMARC RK3399Pro SOM, this would use
> > with associated carrier board.
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> >  .../dts/rockchip/rk3399pro-vmarc-som.dtsi     | 339 ++++++++++++++++++
> >  1 file changed, 339 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dt=
si
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi b/ar=
ch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
> > new file mode 100644
> > index 000000000000..ddf6ebc9fbe3
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
> > @@ -0,0 +1,339 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Copyright (c) 2019 Fuzhou Rockchip Electronics Co., Ltd
> > + * Copyright (c) 2019 Vamrs Limited
> > + * Copyright (c) 2019 Amarula Solutions(India)
> > + */
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/pinctrl/rockchip.h>
> > +#include <dt-bindings/pwm/pwm.h>
> > +
> > +/ {
> > +     compatible =3D "vamrs,rk3399pro-vmarc-som", "rockchip,rk3399pro";
> > +
> > +     clkin_gmac: external-gmac-clock {
> > +             compatible =3D "fixed-clock";
> > +             clock-frequency =3D <125000000>;
> > +             clock-output-names =3D "clkin_gmac";
> > +             #clock-cells =3D <0>;
> > +     };
> > +
> > +     vcc5v0_sys: vcc5v0-sys-regulator {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "vcc5v0_sys";
> > +             regulator-always-on;
> > +             regulator-boot-on;
> > +             regulator-min-microvolt =3D <5000000>;
> > +             regulator-max-microvolt =3D <5000000>;
>
> Is vcc5v0_sys really the topmost regulator getting the outside
> power-supply?

Thanks for pointing this, I forgot to check the vin supply in carrier
board schematics, yes it is VCC12V_DCIN (with 5V to 24V range) like
rock-pi-4. Will update the same.

>
>
> > +     };
> > +
> > +     vcc_lan: vcc3v3-phy-regulator {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "vcc_lan";
>
> vcc_lan / vcc_phy is mostly coming from the vendor bsp in some way
> and will be named differently in schematics ... also it should be connect=
ed
> to the regulator tree.

Infact bsp named this as vcc_phy, I got the vcc_lan from schematics[1]
page 16. Yes it is using VCCIO_3V3_S0 (SWOUT2 from regulator tree), I
will mark this regulator.

>
> [...]
>
> > +&tsadc {
> > +     status =3D "okay";
> > +
> > +     /* tshut mode 0:CRU 1:GPIO */
>
> I think we can live without the additional comments for properties :-)

True, I have reused it from rock-pi-4 thought that it would compatible
with old. will remove.

[1] https://dl.radxa.com/rockpin10/docs/hw/VMARC_RK3399Pro_sch_V1.1_2019061=
9.pdf

Jagan.
