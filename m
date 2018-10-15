From: "A.s. Dong" <aisheng.dong@nxp.com>
Subject: RE: [PATCH V2 2/4] arm64: dts: imx: add imx8qxp support
Date: Mon, 15 Oct 2018 07:57:07 +0000
Message-ID: <AM0PR04MB4211ECC04FD48918E9DFBAB880FD0@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1539527419-23613-1-git-send-email-aisheng.dong@nxp.com>
 <1539527419-23613-3-git-send-email-aisheng.dong@nxp.com>
 <CAOMZO5BEwNQy0HA80qOzm_w-c63tFK1eL+cOHNCxKYq9PHGsqw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAOMZO5BEwNQy0HA80qOzm_w-c63tFK1eL+cOHNCxKYq9PHGsqw@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open
 list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Dong Aisheng <dongas86@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Rob Herring <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

> -----Original Message-----
> From: Fabio Estevam [mailto:festevam@gmail.com]
> Sent: Monday, October 15, 2018 7:14 AM
> To: A.s. Dong <aisheng.dong@nxp.com>
> Cc: moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE
> <linux-arm-kernel@lists.infradead.org>; Dong Aisheng <dongas86@gmail.com>;
> Sascha Hauer <kernel@pengutronix.de>; Shawn Guo <shawnguo@kernel.org>;
> Fabio Estevam <fabio.estevam@nxp.com>; Rob Herring <robh+dt@kernel.org>;
> Catalin Marinas <catalin.marinas@arm.com>; Will Deacon
> <will.deacon@arm.com>; dl-linux-imx <linux-imx@nxp.com>; Mark Rutland
> <mark.rutland@arm.com>; open list:OPEN FIRMWARE AND FLATTENED
> DEVICE TREE BINDINGS <devicetree@vger.kernel.org>
> Subject: Re: [PATCH V2 2/4] arm64: dts: imx: add imx8qxp support
> 
> Hi Dong,
> 
> On Sun, Oct 14, 2018 at 11:35 AM A.s. Dong <aisheng.dong@nxp.com> wrote:
> >
> > Add imx8qxp support
> 
> You could probably expand the commit log by explaining a bit of what im8qxp
> means.
> 

Got it, thanks for the suggestion.

> > diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> > b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> > new file mode 100644
> > index 0000000..e1d2578
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> > @@ -0,0 +1,861 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Copyright (C) 2016 Freescale Semiconductor, Inc.
> > + * Copyright 2017~2018 NXP
> 
> I guess you meant "-" instead of "~".
> 
> > +       memory@80000000 {
> > +               device_type = "memory";
> > +               reg = <0x00000000 0x80000000 0 0x40000000>;
> > +       };
> 
> This should go to the board dts file instead as the memory size may vary from
> board to board.
> 

That's right. Will change it.

> > +               imx8qx-pm {
> > +                       compatible = "fsl,scu-pd";
> > +                       #address-cells = <1>;
> > +                       #size-cells = <0>;
> > +
> > +                       pd_lsio: lsio-power-domain {
> > +                               #power-domain-cells = <0>;
> > +                               #address-cells = <1>;
> > +                               #size-cells = <0>;
> > +
> > +                               pd_lsio_pwm0: lsio-pwm0@191 {
> > +                                       reg = <191>;
> 
> The number after @ is in hex, so the reg property should be 0x191.

Thanks for the reminder.
The PD ID is defined in DEC. So I will change them all into HEX later manually.

BTW, this seems like error prone and checkpatch can't report it.
And I notice many similar users in kernel with the same issue:
arch/arm/boot/dts/tps65910.dtsi
arch/arm/boot/dts/tegra124-nyan.dtsi
arch/arm/boot/dts/rk3288.dtsi
...

Regards
Dong Aisheng
