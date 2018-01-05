From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>
Subject: Re: [PATCH 1/2] arm64: dts: r8a7795: update register size for thermal
Date: Fri, 5 Jan 2018 13:24:50 +0100
Message-ID: <20180105122450.GG22490@bigcity.dyn.berto.se>
References: <20180104213108.24080-1-niklas.soderlund+renesas@ragnatech.se>
 <20180104213108.24080-2-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdU97udtf4+vo_SaGyYaEk1eV4QEmeqWiGF4iVp045w=6A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdU97udtf4+vo_SaGyYaEk1eV4QEmeqWiGF4iVp045w=6A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Geert,

Thanks for your comments.

On 2018-01-05 09:47:11 +0100, Geert Uytterhoeven wrote:
> On Thu, Jan 4, 2018 at 10:31 PM, Niklas Söderlund
> <niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org> wrote:
> > To be able to read fused calibration values from hardware the size of
> > the register resource of TSC1 needs to be incremented to cover one more
> > register which holds the information if the calibration values have been
> > fused or not.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
> 
> > --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> > @@ -2385,7 +2385,7 @@
> >
> >                 tsc: thermal@e6198000 {
> >                         compatible = "renesas,r8a7795-thermal";
> > -                       reg = <0 0xe6198000 0 0x68>,
> > +                       reg = <0 0xe6198000 0 0x6c>,
> 
> Perhaps we should just make it 0x100?
> I'd be very surprised if that would be smaller than the granularity of the
> address decoder circuitry.

I have no problem with making it 0x100, looking at r8a7795.dtsi it seems 
we are mixing what we do today. For example the i2c nodes are defined 
with a precise size less then 0x100 while the USB-DMAC nodes uses a size 
of 0x100 while the size in the documentation is less then 0x100. Maybe 
we should define how we should handle cases like this and update the 
existing DT files?

Do you think I should make all thermal registers 0x100 and not just TSC1 
and resend?

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Regards,
Niklas Söderlund
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
