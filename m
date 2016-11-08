From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 4/6] ARM: dts: add basic support for Rockchip RK1108 SOC
Date: Tue, 08 Nov 2016 14:20:17 +0100
Message-ID: <2018991.LuBz7Cl7BQ@diego>
References: <1478175975-11779-1-git-send-email-andy.yan@rock-chips.com> <1788707.rfxhNfegGu@phil> <0516ad0b-bfbe-ec80-fdb6-e118dab3e758@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <0516ad0b-bfbe-ec80-fdb6-e118dab3e758-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: elaine.zhang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Dienstag, 8. November 2016, 20:31:55 schrieb Andy Yan:
> Hi Heiko:
> 
> On 2016年11月04日 16:00, Heiko Stuebner wrote:
> > Am Donnerstag, 3. November 2016, 20:40:48 CET schrieb Andy Yan:

> >> +	gic: interrupt-controller@32010000 {
> >> +		compatible = "arm,cortex-a15-gic";
> > 
> > compatible = "arm,gic-400"; ?
> > 
> >> +		interrupt-controller;
> >> +		#interrupt-cells = <3>;
> >> +		#address-cells = <0>;
> >> +
> >> +		reg = <0x32011000 0x1000>,
> >> +		      <0x32012000 0x1000>;
> > 
> > please provide all 4 register areas and also the interrupt (
> 
>      I only found 2 register areas in our rockchip linux 3.10 source
> code. And haven't found the interrupt. From the arm,gic bindings, the
> interrupt property is optional. So am not sure if we
> really need it here.

Devicetree is a hardware description, so it's not a factor if we "need" it but 
only if it is present in the hardware. And we really want this information to 
be complete, as these additional areas are necessary if someone wants to use 
the virtualization extensions the cortext-A7 does contain.

The gic is a very standard component and the gic400 used here should definitly 
have those two additional areas as well as the interrupt.

I think the memory areas are pretty standard and should be for the rk1108:
reg = <0x32011000 0x1000>,
      <0x32012000 0x1000>,
      <0x32014000 0x2000>,
      <0x32016000 0x2000>;

The TRM talks about 128 SPI and 3 PPI interrupts but the irq-list does not 
contain them, so this seems to be an error in the TRM, as the gic interrupt 
should be one of those PPI interrupts.


Heiko

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
