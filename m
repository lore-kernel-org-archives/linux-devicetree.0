From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] [V2] ARM: dts: sun7i: Add dts file for
 Bananapi M1 Plus board
Date: Thu, 2 Jun 2016 10:16:38 +0200
Message-ID: <20160602081638.GG4908@lukather>
References: <20160602023623.5761-1-luoyi.ly@gmail.com>
 <CAGRGNgUiGaxoVxtq=k8NG5mCqEXS9fd-ry1vvVJfzb+R2ATMTA@mail.gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="K3Y3NTg/qyuIFs24"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRB4OWX65AKGQE2IFSA5A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CAGRGNgUiGaxoVxtq=k8NG5mCqEXS9fd-ry1vvVJfzb+R2ATMTA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: luoyi.ly-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Mailing List, Arm" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--K3Y3NTg/qyuIFs24
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Thu, Jun 02, 2016 at 12:55:23PM +1000, Julian Calaby wrote:
> Hi Luo yi,
> 
> On Thu, Jun 2, 2016 at 12:36 PM,  <luoyi.ly-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > From: Luo Yi <luoyi.ly-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >
> > Add support for the Bananapi M1 Plus A20 development board from
> > sinovoip.com.cn . This board is nearly a clone of the Lemaker's
> > Bananapro, but differ with the wlan chipset connection and i2s pinout.
> > And I also enable the integrated audio codec on default.
> 
> No signed-off-by.
> 
> > ---
> >  arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts | 72 ++++++++++++++++++++++++
> >  1 file changed, 72 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts
> >
> > diff --git a/arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts b/arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts
> > new file mode 100644
> > index 0000000..6fd55d7
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts
> > @@ -0,0 +1,72 @@
> > +/*
> > + * Copyright 2016 Luo Yi <luoyi.ly-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > + *
> > + * This file is dual-licensed: you can use it either under the terms
> > + * of the GPL or the X11 license, at your option. Note that this dual
> > + * licensing only applies to this file, and not this project as a
> > + * whole.
> > + *
> > + *  a) This file is free software; you can redistribute it and/or
> > + *     modify it under the terms of the GNU General Public License as
> > + *     published by the Free Software Foundation; either version 2 of the
> > + *     License, or (at your option) any later version.
> > + *
> > + *     This file is distributed in the hope that it will be useful,
> > + *     but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + *     GNU General Public License for more details.
> > + *
> > + * Or, alternatively,
> > + *
> > + *  b) Permission is hereby granted, free of charge, to any person
> > + *     obtaining a copy of this software and associated documentation
> > + *     files (the "Software"), to deal in the Software without
> > + *     restriction, including without limitation the rights to use,
> > + *     copy, modify, merge, publish, distribute, sublicense, and/or
> > + *     sell copies of the Software, and to permit persons to whom the
> > + *     Software is furnished to do so, subject to the following
> > + *     conditions:
> > + *
> > + *     The above copyright notice and this permission notice shall be
> > + *     included in all copies or substantial portions of the Software.
> > + *
> > + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> > + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> > + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> > + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> > + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
> > + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> > + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> > + *     OTHER DEALINGS IN THE SOFTWARE.
> > + */
> > +
> > +#include "sun7i-a20-bananapro.dts"
> > +
> > +/ {
> > +       model = "Banana Pi BPI-M1-Plus";
> > +       compatible = "sinovoip,bpi-m1-plus", "allwinner,sun7i-a20";
> > +};
> > +
> > +
> 
> Extra line.
> 
> > +&codec {
> > +       status = "okay";
> > +};
> 
> Does anyone know if this should be enabled on the bananapro too?

Yes, everything that is shared with the banana-pro (which, judging
from Bernhard, is pretty much everything but a GPIO) should be merged
in the banapro DT.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--K3Y3NTg/qyuIFs24--
