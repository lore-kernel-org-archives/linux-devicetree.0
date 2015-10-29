From: Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: rockchip: Setup ethernet0 alias for u-boot
Date: Thu, 29 Oct 2015 22:39:24 +0100
Message-ID: <1446154764.4092.273.camel@collabora.co.uk>
References: <1446151497-29833-1-git-send-email-sjoerd.simons@collabora.co.uk>
	 <1895461.b5NitQ7UFH@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1895461.b5NitQ7UFH@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2015-10-29 at 21:52 +0100, Heiko Stuebner wrote:
> Hi Sjoerd,
>=20
> Am Donnerstag, 29. Oktober 2015, 21:44:57 schrieb Sjoerd Simons:
> > Add an ethernet0 alias for the wired network card and an all 0
> > default
> > mac address so that u-boot can find the device-node and fill in the
> > mac address.
> >=20
> > Signed-off-by: Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
> > ---
> >=20
> > =C2=A0arch/arm/boot/dts/rk3288-rock2-square.dts | 6 ++++++
> > =C2=A01 file changed, 6 insertions(+)
> >=20
> > diff --git a/arch/arm/boot/dts/rk3288-rock2-square.dts
> > b/arch/arm/boot/dts/rk3288-rock2-square.dts
> > index 0ef065d..a029ebf 100644
> > --- a/arch/arm/boot/dts/rk3288-rock2-square.dts
> > +++ b/arch/arm/boot/dts/rk3288-rock2-square.dts
> > @@ -45,6 +45,10 @@
> > =C2=A0	model =3D "Radxa Rock 2 Square";
> > =C2=A0	compatible =3D "radxa,rock2-square", "rockchip,rk3288";
> > =C2=A0
> > +	aliases {
> > +		ethernet0 =3D &gmac;
> > +	};
> > +
>=20
> wouldn't it make more sense to have this in the rk3288.dtsi, so to
> keep
> every board from having to add this alias?

Hmm, that would work. Thought it would add an alias point to a disabled
node for boards that don't have a wired interface. If that isn't an
issue it can indeed be moved there.
>=20
> > =C2=A0	chosen {
> > =C2=A0		stdout-path =3D "serial2:115200n8";
> > =C2=A0	};
> > @@ -130,6 +134,8 @@
> > =C2=A0};
> > =C2=A0
> > =C2=A0&gmac {
> > +	/* To be filled in by U-Boot */
> > +	mac-address =3D [00 00 00 00 00 00];
> > =C2=A0	status =3D "ok";
> > =C2=A0};
>=20
> I guess the same applies for the mac placeholder.

In any case they should be in the same dts{i}.

--=C2=A0
Sjoerd Simons
Collabora Ltd.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
