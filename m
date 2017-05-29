From: Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: dts: sun7i-a20: Rename bananapi as
 bananapi m1
Date: Mon, 29 May 2017 23:45:51 +0200
Message-ID: <20170529214551.GA1990@excalibur.cnev.de>
References: <1496086228-2806-1-git-send-email-jagan@openedev.com>
Reply-To: merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDP2XNNJ7IFBBINNWLEQKGQEENBZB5Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <1496086228-2806-1-git-send-email-jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jagan Teki <jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 29, 2017 at 07:30:26PM +0000, Jagan Teki wrote:
> From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
>=20
> from BPI(BIPAI KEJI LIMITED) products the Bananapi board
> is named as 'Bananapi M1' and this is the starting
> bananapi board from M1 series.
>=20
> So rename dts and suffix 'M1' on model for the same,
> so-that next sequence on bananapi starts like M1 Plus, M2 and so..on
>=20
> Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> ---
> Note: Bananapi BPI product site
> http://www.banana-pi.org/product.html
>=20
>  arch/arm/boot/dts/Makefile                  |   2 +-
>  arch/arm/boot/dts/sun7i-a20-bananapi-m1.dts | 286 ++++++++++++++++++++++=
++++++
>  arch/arm/boot/dts/sun7i-a20-bananapi.dts    | 286 ----------------------=
------
>  3 files changed, 287 insertions(+), 287 deletions(-)
>  create mode 100644 arch/arm/boot/dts/sun7i-a20-bananapi-m1.dts
>  delete mode 100644 arch/arm/boot/dts/sun7i-a20-bananapi.dts
>=20
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 45c6e65..1b086f0 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -851,7 +851,7 @@ dtb-$(CONFIG_MACH_SUN6I) +=3D \
>  	sun6i-a31s-sinovoip-bpi-m2.dtb \
>  	sun6i-a31s-yones-toptech-bs1078-v2.dtb
>  dtb-$(CONFIG_MACH_SUN7I) +=3D \
> -	sun7i-a20-bananapi.dtb \
> +	sun7i-a20-bananapi-m1.dtb \
>  	sun7i-a20-bananapi-m1-plus.dtb \
>  	sun7i-a20-bananapro.dtb \
>  	sun7i-a20-cubieboard2.dtb \
> diff --git a/arch/arm/boot/dts/sun7i-a20-bananapi-m1.dts b/arch/arm/boot/=
dts/sun7i-a20-bananapi-m1.dts
> new file mode 100644
> index 0000000..8b97b89
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun7i-a20-bananapi-m1.dts
> @@ -0,0 +1,286 @@
> +/*
> + * Copyright 2014 Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> + *
> + * Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
[...]
> +/dts-v1/;
> +#include "sun7i-a20.dtsi"
> +#include "sunxi-common-regulators.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/ {
> +	model =3D "LeMaker Banana Pi M1";
> +	compatible =3D "lemaker,bananapi", "allwinner,sun7i-a20";
[...]
> diff --git a/arch/arm/boot/dts/sun7i-a20-bananapi.dts b/arch/arm/boot/dts=
/sun7i-a20-bananapi.dts
> deleted file mode 100644
> index ed2f35a..0000000
> --- a/arch/arm/boot/dts/sun7i-a20-bananapi.dts
> +++ /dev/null

NACK!

Please neither rename the dts nor change the model string. Such a
change would make newer kernels unusable on many existing
installations without manual fixups by the end user.  Linux
distributions use databases with model-specific setup information
(such as the dtb file name, the platform-specific bootscript to
use, usable kernel flavours (lpae or non-lpae), etc.) on kernel
installations and kernel upgrades, and those use the model string
as their key for finding the relevant information.  If you change
either the dts file name or the model string inside the dts,
you'll effectively break the proper installation of newer kernel
versions on existing end user systems.

For an example of such a database, please cf.
https://anonscm.debian.org/cgit/d-i/flash-kernel.git/tree/db/all.db#n731

Regards,
Karsten
--=20
Gem. Par. 28 Abs. 4 Bundesdatenschutzgesetz widerspreche ich der Nutzung
sowie der Weitergabe meiner personenbezogenen Daten f=C3=BCr Zwecke der
Werbung sowie der Markt- oder Meinungsforschung.

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
