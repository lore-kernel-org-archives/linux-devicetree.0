From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM:dts:sunxi: Add Olimex
 A20-SOM-EVB-eMMC board
Date: Fri, 18 May 2018 10:02:08 +0200
Message-ID: <20180518080208.mr7jit2pajgalti3@flea>
References: <1526470689-6275-1-git-send-email-stefan@olimex.com>
 <96201051.35560.1526541952287@email.1und1.de>
 <7ad11904-be61-a459-f2be-ff37fcd02402@olimex.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="765wp2q25h6ttz4g"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBC4R7LLQKGQE5AFOK7A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <7ad11904-be61-a459-f2be-ff37fcd02402-kyXcfZUBQGPQT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Stefan Mavrodiev <stefan-kyXcfZUBQGPQT0dZR+AlfA@public.gmane.org>
Cc: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--765wp2q25h6ttz4g
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Thu, May 17, 2018 at 10:34:06AM +0300, Stefan Mavrodiev wrote:
> On 05/17/2018 10:25 AM, Stefan Wahren wrote:
> > Hi Stefan,
> > 
> > > Stefan Mavrodiev <stefan-kyXcfZUBQGPQT0dZR+AlfA@public.gmane.org> hat am 16. Mai 2018 um 13:38 geschrieben:
> > > 
> > > 
> > > With the new rev.E of A20-SOM-EVB, there is option for 16GB eMMC.
> > > Currently used card is KLMAG2GEND, wired to MMC2 slot.
> > > 
> > > Signed-off-by: Stefan Mavrodiev <stefan-kyXcfZUBQGPQT0dZR+AlfA@public.gmane.org>
> > > ---
> > >   arch/arm/boot/dts/Makefile                         |  1 +
> > >   .../arm/boot/dts/sun7i-a20-olimex-som-evb-emmc.dts | 37 ++++++++++++++++++++++
> > >   2 files changed, 38 insertions(+)
> > >   create mode 100644 arch/arm/boot/dts/sun7i-a20-olimex-som-evb-emmc.dts
> > > 
> > > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> > > index 1db91ec..7f1ee65 100644
> > > --- a/arch/arm/boot/dts/Makefile
> > > +++ b/arch/arm/boot/dts/Makefile
> > > @@ -959,6 +959,7 @@ dtb-$(CONFIG_MACH_SUN7I) += \
> > >   	sun7i-a20-m3.dtb \
> > >   	sun7i-a20-mk808c.dtb \
> > >   	sun7i-a20-olimex-som-evb.dtb \
> > > +	sun7i-a20-olimex-som-evb-emmc.dtb \
> > >   	sun7i-a20-olimex-som204-evb.dtb \
> > >   	sun7i-a20-olimex-som204-evb-emmc.dtb \
> > >   	sun7i-a20-olinuxino-lime.dtb \
> > > diff --git a/arch/arm/boot/dts/sun7i-a20-olimex-som-evb-emmc.dts b/arch/arm/boot/dts/sun7i-a20-olimex-som-evb-emmc.dts
> > > new file mode 100644
> > > index 0000000..81ebc97
> > > --- /dev/null
> > > +++ b/arch/arm/boot/dts/sun7i-a20-olimex-som-evb-emmc.dts
> > > @@ -0,0 +1,37 @@
> > > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > +/*
> > > + * Device Tree Source for A20-Olimex-SOM-EVB-eMMC Board
> > > + *
> > > + * Copyright (C) 2018 Olimex Ltd.
> > > + *   Author: Stefan Mavrodiev <stefan-kyXcfZUBQGPQT0dZR+AlfA@public.gmane.org>
> > > + */
> > > +
> > > +/dts-v1/;
> > > +#include "sun7i-a20-olimex-som-evb.dts"
> > > +
> > > +/ {
> > > +
> > > +	model = "Olimex A20-Olimex-SOM-EVB-eMMC";
> > > +	compatible = "olimex,a20-olimex-som-evb-emmc", "allwinner,sun7i-a20";
> > the file Documentation/devicetree/bindings/arm/olimex.txt seems to be out of date. I cannot find any recent board compatible.
> > 
> > Didn't checkpatch complain about it?
>
> Yes it did. I didn't get is seriously because neither Olimex A20 based board
> is documented in the binding.

I guess we should fix that as well, but that can come in a subsequent
patch.

Maxime

-- 
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
--765wp2q25h6ttz4g--
