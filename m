From: Antony Antony <antony-AVhj06Q78b5AfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH] Documentation: dt-binding: net: wireless: add
 bcm43430-fmac
Date: Wed, 30 Aug 2017 14:02:18 +0200
Message-ID: <20170830120218.ms3xuhp4qsibistv@AntonyAntony.local>
References: <20170829214309.34466-1-antony@phenome.org>
 <CAGb2v66=JvS9wHkUNBwd+vHwx4NAQsaWyhx1OyEokSZizo+7-g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v66=JvS9wHkUNBwd+vHwx4NAQsaWyhx1OyEokSZizo+7-g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Antony Antony <antony-AVhj06Q78b5AfugRpC6u6w@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

hi,

On Wed, Aug 30, 2017 at 10:28:20AM +0800, Chen-Yu Tsai wrote:
> On Wed, Aug 30, 2017 at 5:43 AM, Antony Antony <antony-AVhj06Q78b5AfugRpC6u6w@public.gmane.org> wrote:

> > a/Documentation/devicetree/bindings/net/wireless/brcm,bcm43xx-fmac.txt
> > +++ b/Documentation/devicetree/bindings/net/wireless/brcm,bcm43xx-fmac.txt
> > @@ -6,7 +6,9 @@ connects the device to the system.
> >
> >  Required properties:
> >
> > - - compatible : Should be "brcm,bcm4329-fmac".
> > + - compatible : should be one of the following:
> > +       * "brcm,bcm4329-fmac"
> > +       * "brcm,bcm43430-fmac"
> 
> You updated the bindings, but not the driver. So it's not actually
> going to work. More specifically, OOB interrupts won't work.
>

understood, ignore this patch for now. Thanks Chen-Yu.

> IIRC, The compatible string for this particular case, as it was
> originally proposed, only serves as a placeholder for the driver
> to check against. None of the instances in sunxi device trees
> match the actual chip model. Actual model matching is done
> through SDIO, as you've already seen.

yes it seems SDIO driveer code is smarter, once it initialize 
brcm,bcm4329-fmac it ignore the DT info and read the chip details to locate 
firmware file.

I also noticed other boards using bcm4329-fmac in similar situations.
https://patchwork.kernel.org/patch/9739181/

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts?h=v4.13-rc7

I will resend "NanoPi NEO Plus2" dts with "brcm,bcm4329-fmac" and see where 
it goes. 

regards,
-antony
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
