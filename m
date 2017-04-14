From: Dong Aisheng <dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/8] ARM: dts: imx7s: Add node for GPC
Date: Fri, 14 Apr 2017 23:49:36 +0800
Message-ID: <20170414154936.GB1792@b29396-OptiPlex-7040>
References: <20170413133242.5068-1-andrew.smirnov@gmail.com>
 <20170413133242.5068-5-andrew.smirnov@gmail.com>
 <20170414034005.GG14915@dragon>
 <CAHQ1cqGYs2h1ZFBC4WBYbyAMsctURwOzQmQB+B6nz=wmR0fYoQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAHQ1cqGYs2h1ZFBC4WBYbyAMsctURwOzQmQB+B6nz=wmR0fYoQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andrey Yurovsky <yurovsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 14, 2017 at 08:19:44AM -0700, Andrey Smirnov wrote:
...
> >> +                     gpc: gpc@303a0000 {
> >> +                             compatible = "fsl,imx7d-gpc";
> >> +                             reg = <0x303a0000 0x10000>;
> >> +                             interrupt-controller;
> >> +                             interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
> >> +                             #interrupt-cells = <3>;
> >> +                             interrupt-parent = <&intc>;
> >> +                             #power-domain-cells = <1>;
> >> +
> >> +                             pgc {
> >> +                                     #address-cells = <1>;
> >> +                                     #size-cells = <0>;
> >> +
> >> +                                     pgc_pcie_phy: pgc-pcie-phy-domain {
> >
> > The node name should be something generic and has a unit-address when
> > there is a 'reg' property in the node.
> >
> 
> I'll change it to pgc-power-domain@0, let me know if you want
> something different.
> 

I think just power-domain@0 is ok.
And also better replace unit-address by macro.

Regards
Dong Aisheng
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
