From: Devin Heitmueller <dheitmueller-eb9eJ82Ua7k9XoPSrs7Ehg@public.gmane.org>
Subject: Re: [RFC] [media] imx: assume MEDIA_ENT_F_ATV_DECODER entities output
 video on pad 1
Date: Wed, 5 Apr 2017 13:02:52 -0400
Message-ID: <CAGoCfiyfXc2bcTR72XwL3Vv8ny-dQUjEUk2OUuy_s4nedNJqxA@mail.gmail.com>
References: <1490661656-10318-1-git-send-email-steve_longerbeam@mentor.com>
 <1490661656-10318-20-git-send-email-steve_longerbeam@mentor.com>
 <1490894749.2404.33.camel@pengutronix.de> <20170404231053.GE7909@n2100.armlinux.org.uk>
 <19f0ce92-cad6-8950-8018-e3224e2bf266@gmail.com> <7235285c-f39a-64bc-195a-11cfde9e67c5@gmail.com>
 <20170405082134.GF7909@n2100.armlinux.org.uk> <1491384859.2381.51.camel@pengutronix.de>
 <20170405115336.7135e542@vento.lan> <CAGoCfizXdDV_Eo1NSOAb+-wrC7F47iFQKyP8-wiJMpb-nsYArA@mail.gmail.com>
 <20170405131725.22c13a1d@vento.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170405131725.22c13a1d-ch4gOOMV7nf/PtFMR13I2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mauro Carvalho Chehab <mchehab-JsYNTwtnfakRB7SZvlqPiA@public.gmane.org>
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-m1Uo1GnMJf0b1SvskN2V4Q@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

>> For what it's worth, I doubt most of the em28xx designs have the
>> tvp5150 interrupt request line connected in any way.
>
> True. But, on embedded hardware, such line may be connected into the
> SoC. Actually, from the IGEPv3 expansion diagram:
>
>         https://www.isee.biz/support/downloads/item/igepv2-expansion-rc-schematics
>
> The INT line is connected to CAM_IRQ. That's connected to GPIO_154 pin
> at OMAP3.
>
> So, on a first glance, it seems possible to use it, instead of polling.

To be clear, I wasn't suggesting that the IRQ request line on the
tvp5150 couldn't be supported in general (for example, for those
embedded targets which have it wired up to a host processor).  I'm
just saying you shouldn't expect it to work on most (perhaps all)
em28xx designs which have the tvp5150.  In fact on some em28xx designs
the pin is used as a GPIO output tied to a mux to control input
selection.  Hence blindly enabling the interrupt request line by
default would do all sorts of bad things.

>> You would likely
>> have to poll the FIFO status register via I2C,
>
> Yes, I considered this option when I wrote the driver. It could work,
> although it would likely have some performance drawback, as the driver
> would need to poll it at least 60 times per second.
>
>> or use the feature to
>> embed the sliced data into as VANC data in the 656 output (as
>> described in sec 3.9 of the tvp5150am1 spec).
>
> True, but the bridge driver would need to handle such data.

Correct.

> I remember I looked on this when I wrote the driver, but I was
> unable to find a way for em28xx to parse (or forward) such
> data packets.

I'm pretty sure it's possible, but I haven't looked at the datasheets
in a number of years and don't recall the details.

Hardware VBI splicing is supported by a number of decoders but it's
rarely used on commodity PCs (the Conexant and NXP decoders support it
as well).  That said, I won't argue there might be some value on
really low end platforms.  All I would ask is that if you do introduce
any such functionality into the tvp5150 driver for some embedded
application that you please not break support for devices such as the
em28xx.

Thanks,

Devin

-- 
Devin J. Heitmueller - Kernel Labs
http://www.kernellabs.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
