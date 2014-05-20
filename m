From: "Shevchenko, Andriy" <andriy.shevchenko-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v7] DMA: sun6i: Add driver for the Allwinner
 A31 DMA controller
Date: Tue, 20 May 2014 12:52:34 +0000
Message-ID: <1400590354.28000.14.camel@smile.fi.intel.com>
References: <1398349364-10726-1-git-send-email-maxime.ripard@free-electrons.com>
	 <1398349364-10726-2-git-send-email-maxime.ripard@free-electrons.com>
	 <537B4D55.5040804@elopez.com.ar>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDLYD555WYHBBGVA5WNQKGQEV2VX6XI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <537B4D55.5040804-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Language: en-US
Content-ID: <6952EE4279C1E44D9E09E91732966148-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
To: "emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org" <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>
Cc: "Koul, Vinod" <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org" <shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "kevin.z.m.zh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <kevin.z.m.zh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Williams, Dan J" <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "sunny-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org" <sunny-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, "maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "zhuzhenhua-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org" <zhuzhenhua-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2014-05-20 at 09:40 -0300, Emilio L=C3=B3pez wrote:
> El 24/04/14 11:22, Maxime Ripard escribi=C3=B3:
> > The Allwinner A31 has a 16 channels DMA controller that it shares with =
the
> > newer A23. Although sharing some similarities with the DMA controller o=
f the
> > older Allwinner SoCs, it's significantly different, I don't expect it t=
o be
> > possible to share the driver for these two.
> >
> > The A31 Controller is able to memory-to-memory or memory-to-device tran=
sfers on
> > the 16 channels in parallel.

...

> > diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
> > index 5c5863842de9..360a10c71388 100644
> > --- a/drivers/dma/Kconfig
> > +++ b/drivers/dma/Kconfig
> > @@ -361,6 +361,14 @@ config FSL_EDMA
> >   	  multiplexing capability for DMA request sources(slot).
> >   	  This module can be found on Freescale Vybrid and LS-1 SoCs.
> >
> > +config DMA_SUN6I
> > +	tristate "Allwinner A31 SoCs DMA support"
> > +	depends on ARCH_SUNXI
> > +	select DMA_ENGINE
> > +	select DMA_VIRTUAL_CHANNELS
>=20
> I think you also need to select DMA_OF here as you are using=20
> of_dma_controller_register

of_dma_controller_register should have a stub (which it does).
No need to have such a dependency.

--=20
Andy Shevchenko <andriy.shevchenko-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Intel Finland Oy
---------------------------------------------------------------------
Intel Finland Oy
Registered Address: PL 281, 00181 Helsinki=20
Business Identity Code: 0357606 - 4=20
Domiciled in Helsinki=20

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
