From: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2] ARM: vexpress: Add unified-cache Device Tree property
Date: Thu, 30 Apr 2015 12:08:53 +0100
Message-ID: <20150430110853.GN7440@e106497-lin.cambridge.arm.com>
References: <5509437E.6060806@arm.com>
 <1426671298-2012-1-git-send-email-r.schwebel@pengutronix.de>
 <20150429191228.GO15254@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150429191228.GO15254-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Schwebel <r.schwebel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Sudeep Holla <Sudeep.Holla-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 29, 2015 at 08:12:28PM +0100, Robert Schwebel wrote:
> Hi Liviu,
>=20
> On Wed, Mar 18, 2015 at 10:34:58AM +0100, Robert Schwebel wrote:
> > Without this property, we get this boot warning:
> >=20
> > "L2C: device tree omits to specify unified cache"
> >=20
> > Signed-off-by: Robert Schwebel <r.schwebel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > Acked-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/vexpress-v2p-ca9.dts | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > Changes since v1:
> >  * fix typo in patch description
> >=20
> > diff --git a/arch/arm/boot/dts/vexpress-v2p-ca9.dts b/arch/arm/boot=
/dts/vexpress-v2p-ca9.dts
> > index 23662b5..a411274 100644
> > --- a/arch/arm/boot/dts/vexpress-v2p-ca9.dts
> > +++ b/arch/arm/boot/dts/vexpress-v2p-ca9.dts
> > @@ -170,6 +170,7 @@
> >  		compatible =3D "arm,pl310-cache";
> >  		reg =3D <0x1e00a000 0x1000>;
> >  		interrupts =3D <0 43 4>;
> > +		cache-unified;
> >  		cache-level =3D <2>;
> >  		arm,data-latency =3D <1 1 1>;
> >  		arm,tag-latency =3D <1 1 1>;
> > --=20
> > 2.1.4
>=20
> Gentle ping, this patch didn't make it into 4.1-rc1.

Sorry Robert, this fell through the cracks. VExpress gets very few
patches in general and we're new to this :(

Arnd/Olof, can we add this and Sudeep's patch for Juno into one of the
later 4.1-rc pull requests?

Best regards,
Liviu

>=20
> rsc
> --=20
> Pengutronix e.K.                           |                         =
    |
> Industrial Linux Solutions                 | http://www.pengutronix.d=
e/  |
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0=
    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5=
555 |
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
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
