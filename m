From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 11/11] arm64: allwinner: a64: enable
 Wi-Fi for Pine64
Date: Mon, 17 Apr 2017 09:59:21 +0200
Message-ID: <20170417075921.vrjchymctxidtp7l@lukather>
References: <20170407183441.58750-1-icenowy@aosc.io>
 <20170407183441.58750-12-icenowy@aosc.io>
 <e51897d2-aa9d-1f4b-3fe0-e88246a9e438@suse.de>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eaipdegxr3teyztl"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBZHL2HDQKGQEAOMPVGY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <e51897d2-aa9d-1f4b-3fe0-e88246a9e438-l3A5Bk7waGM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--eaipdegxr3teyztl
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 14, 2017 at 06:56:16PM +0200, Andreas F=C3=A4rber wrote:
> > one provides I/O voltage).
> >=20
> > Add device node for it.
> >=20
> > Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> > ---
> >  arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts | 16 +++++++++++++=
+++
> >  1 file changed, 16 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts b/arch=
/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
> > index 7da074f95065..9d90bb32aa87 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
> > @@ -64,6 +64,11 @@
> >  		regulator-min-microvolt =3D <3300000>;
> >  		regulator-max-microvolt =3D <3300000>;
> >  	};
> > +
> > +	wifi_pwrseq: wifi_pwrseq {
> > +		compatible =3D "mmc-pwrseq-simple";
> > +		reset-gpios =3D <&r_pio 0 2 GPIO_ACTIVE_LOW>; /* PL2 */
> > +	};
> >  };
> > =20
> >  &ehci1 {
> > @@ -91,6 +96,17 @@
> >  	status =3D "okay";
> >  };
> > =20
> > +&mmc1 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&mmc1_pins>;
> > +	vmmc-supply =3D <&reg_dldo4>;
> > +	vqmmc-supply =3D <&reg_eldo1>;
> > +	mmc-pwrseq =3D <&wifi_pwrseq>;
> > +	non-removable;
> > +	bus-width =3D <4>;
> > +	status =3D "okay";
> > +};
>=20
> As you mention above, Wi-Fi is a module, so may be absent. Is it really
> correct to enable this node and hardcode a certain power sequence? In
> theory other modules could be attached.
>=20
> To me that calls for an overlay instead.

Agreed.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--eaipdegxr3teyztl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJY9HXZAAoJEBx+YmzsjxAg5bAQAKtVCxgo1JGU3TN6NtDVJjtA
TNk3An4PonxRiYIrR97C5Xoub8FaaRSBPiApXf5HEU6olyAUhD0jxIFWD+xZPa9h
ElfYH8X7CxyaPVCW8gcsPTqSLF+6KZws0BvNwWvT8GivWi/yg3ygMp0BDJx1FoAZ
beNT5+E26Yd7EZ/Uo0TBe59BGYnTM7LACa07HwX1vtsbdtmBlDJ078Nzy+zTlpQZ
HCRHDh/NiLTmag6ZZICLK+zzHzcf8W+ULUNdIjeXhedppYyRJiVJdyjMMxybAhL2
xJHdyjVmxa7B/b5b//sbgmoCxl9LSuDBhWHGy+hj18HIAvk2js/KDmalWe9PQz5h
qQ0xM87jhSO56D6/JaXkxAVSVdMJe59WZpctgS3RFJvPrhYnWT2UkBCHQzrIQB9p
vP5SOmwR2PkxiW07+t+WcQ+IRQNqhYBiwwBMhHM1hUpFPjHXgOEsnFF2KNTCc317
XAUwVC6Rwst5/Kd35gktL3jip5zu6aUPBKVY9RiI3+Uhbti75YU9Rr9X5i3DFVQx
Wq8ch/PpmRZobJJtHj1KRt3pnxaUuiA794z+VmakpwKXD3ME6bLbl5Y/2pHFNTvC
6bkq4JlRY843nYLIo5Nr3ZtF0tKvmAjfn+i04him9I1UyPWt+uULAGVqdht7hIQw
H8nHdEZ++EJ5tXtVUsd8
=eha1
-----END PGP SIGNATURE-----

--eaipdegxr3teyztl--
