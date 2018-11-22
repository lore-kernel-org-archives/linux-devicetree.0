From: Mesih Kilinc <mesihkilinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v3 01/17] ARM: add CONFIG_ARCH_SUNXI_V7
 for differentiate ARMv5/v7 Allwinner SoCs
Date: Thu, 22 Nov 2018 18:07:51 +0300
Message-ID: <20181122150751.n26pvywmvnuglly5@ThinkPad>
References: <cover.1542824904.git.mesihkilinc@gmail.com>
 <267ffcf3b91930a82f20d93e1fad1fceaf8b9b0e.1542824904.git.mesihkilinc@gmail.com>
 <20181122082635.br5n33owxxpenv62@flea>
Reply-To: mesihkilinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDI4VHO5SYLBBSUM3PPQKGQEJZBQEAQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20181122082635.br5n33owxxpenv62@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 18/11/22 09:26, Maxime Ripard wrote:
> On Wed, Nov 21, 2018 at 09:30:34PM +0300, Mesih Kilinc wrote:
> > Allwinner also has some ARMv5 SoCs.
> >=20
> > In order to add support for them, add a CONFIG_ARCH_SUNXI_V7 bool confi=
g
> > which is selected when a ARMv7 soc is selected, and make CONFIG_ARCH_SU=
NXI
> > a common option which is selected by both V7 and V5 sunxi option.
> >=20
> > Signed-off-by: Mesih Kilinc <mesihkilinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >  arch/arm/mach-sunxi/Kconfig | 23 ++++++++++++++++-------
> >  1 file changed, 16 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
> > index d9c8ecf..7e5f173 100644
> > --- a/arch/arm/mach-sunxi/Kconfig
> > +++ b/arch/arm/mach-sunxi/Kconfig
> > @@ -6,31 +6,38 @@ menuconfig ARCH_SUNXI
> >  	select GENERIC_IRQ_CHIP
> >  	select GPIOLIB
> >  	select PINCTRL
> > -	select PM_OPP
> >  	select SUN4I_TIMER
> >  	select RESET_CONTROLLER
> > +	help
> > +	  Support for Allwinner ARM-based family of processors
> > =20
> >  if ARCH_SUNXI
> > =20
> > +if ARCH_MULTI_V7
> > +
> > +config ARCH_SUNXI_V7
> > +	bool
> > +	select PM_OPP
> > +
>=20
> Actually, thinking more about this, I don't see why the PM_OPP config
> option should be made specific to the ARMv7 sunxi SoCs, you will have
> things cpufreq enabled at some point as well on the armv5 support.
>=20
OK. I was basing this code to the first patch series.=20
So there will be no need for ARCH_SUNXI_VX configs. Should I drop them
and differantiate IC's by only ARCH_MULTI_VX?

> >  config MACH_SUN4I
> >  	bool "Allwinner A10 (sun4i) SoCs support"
> > -	default ARCH_SUNXI
> > +	select ARCH_SUNXI_V7
>=20
> The option is still changed from being on by default to being off by
> default. This breaks all the defconfig, and we really shouldn't change
> that.

OK. I will fix it.

Mesih Veysi K=C4=B1l=C4=B1n=C3=A7

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
