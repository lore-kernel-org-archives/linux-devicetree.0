From: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 2/2] arm64: Add Juno SoC device tree.
Date: Mon, 10 Nov 2014 20:00:05 +0000
Message-ID: <20141110200005.GA10247@e106497-lin.cambridge.arm.com>
References: <1415618875-8469-1-git-send-email-Liviu.Dudau@arm.com>
 <1415618875-8469-3-git-send-email-Liviu.Dudau@arm.com>
 <54610C86.9090002@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54610C86.9090002-l3A5Bk7waGM@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, device tree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 10, 2014 at 07:05:42PM +0000, Andreas F=C3=A4rber wrote:
> Hi,
>=20
> Am 10.11.2014 um 12:27 schrieb Liviu Dudau:
> > diff --git a/arch/arm64/boot/dts/juno.dts b/arch/arm64/boot/dts/jun=
o.dts
> > new file mode 100644
> > index 0000000..7f998de
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/juno.dts
> > @@ -0,0 +1,374 @@
> > +/*
> > + * ARM Ltd. Juno Plaform
>=20
> "Platform"
>=20
> > + *
>=20
> Shouldn't this mention a license, ideally dual-licensed?

Hi Andreas,

TBH I wasn't sure a license was needed. Most (all?) of ARM's DT
files don't seem to carry a license, but I will add the appropriate
license. And yes, it is dual-licensed (GPLv2 or BSD)

>=20
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +/ {
> > +	model =3D "Juno";
> > +	compatible =3D "arm,juno", "arm,vexpress";
> > +	interrupt-parent =3D <&gic>;
> > +	#address-cells =3D <2>;
> > +	#size-cells =3D <2>;
> > +
> > +	aliases {
> > +		serial0 =3D &soc_uart0;
> > +	};
> > +
> > +	cpus {
> > +		#address-cells =3D <2>;
> > +		#size-cells =3D <0>;
> > +
> > +		A53_0:cpu@100 {
> [snip]
>=20
> Can you please add a space after colon, like you did for non-CPU node=
s?

Sure, will do.

Best regards,
Liviu

>=20
> Regards,
> Andreas
>=20
> --=20
> SUSE LINUX GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 21284 AG N=
=C3=BCrnberg
>=20

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    =C2=AF\_(=E3=83=84)_/=C2=AF

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
