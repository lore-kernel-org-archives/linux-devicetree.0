From: Sergey Matyukevich <geomatsi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] ARM: dts: orange-pi-zero: specify wifi interrupts
Date: Thu, 25 May 2017 10:10:55 +0300
Message-ID: <20170525071055.xdd4sbpnzlkg7wa2@speedy.hunter>
References: <20170524212433.14386-1-geomatsi@gmail.com>
 <20170524212433.14386-2-geomatsi@gmail.com>
 <CAGb2v647GTQW9-ZYrkWS7RoeYTu_7oTm8v4PDs0YD1pZ8oUohQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v647GTQW9-ZYrkWS7RoeYTu_7oTm8v4PDs0YD1pZ8oUohQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> > diff --git a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
> > index 9e8b082c134f..e97dfd1775d1 100644
> > --- a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
> > +++ b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
> > @@ -128,6 +128,9 @@
> >          */
> >         xr819: sdio_wifi@1 {
> >                 reg = <1>;
> > +               compatible = "xradio,xr819";
> 
> You should submit device tree bindings first. See:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/net/wireless
> 
> for examples.

Does it make sense for the out-of-tree driver ?

> > +               interrupt-parent = <&pio>;
> > +               interrupts = <6 10 IRQ_TYPE_EDGE_RISING>;
> 
> Are these optional or required properties? AFAIK SDIO supports in-band
> interrupts with a bit of overhead, so they should be optional.

Those properties are optional. Driver works anyway, though it complains about
missing interrupts. IIUC xradio driver falls back to polling mode only if
xr819 interrupt configuraton is not specified.


Regards,
Sergey
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
