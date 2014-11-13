From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 4/7] ARM: dts: sun6i: Add simplefb node
Date: Thu, 13 Nov 2014 17:46:06 +0100
Message-ID: <20141113164606.GM20972@lukather>
References: <1415871109-28332-1-git-send-email-hdegoede@redhat.com>
 <1415871109-28332-4-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kunpHVz1op/+13PW"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBO6CSORQKGQEUE5K6PA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1415871109-28332-4-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--kunpHVz1op/+13PW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Nov 13, 2014 at 10:31:46AM +0100, Hans de Goede wrote:
> Add a simplefb template node for u-boot to further fill and activate.
>=20
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun6i-a31.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun6i-a31.dtsi b/arch/arm/boot/dts/sun6i-a=
31.dtsi
> index 543f895..438952e 100644
> --- a/arch/arm/boot/dts/sun6i-a31.dtsi
> +++ b/arch/arm/boot/dts/sun6i-a31.dtsi
> @@ -62,6 +62,16 @@
>  		ethernet0 =3D &gmac;
>  	};
> =20
> +	chosen {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		ranges;
> +
> +		framebuffer0 {
> +			compatible =3D "simple-framebuffer";
> +			status =3D "disabled";

Aren't we suppose to have clocks in there too?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--kunpHVz1op/+13PW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUZOBOAAoJEBx+YmzsjxAgGisP/1zIwTPX5lppVG/9tEfsILUm
Dj/1pUEAmTag0mE/4cZy8c2w22fAXnGmeeRTlo6NTgVNlddo6MewAnH0TYEADX/t
EWOUjQXd3kNWxMN8KIq43rj44eEmEezvBm79N/gXM8gMSNLtfuLQhQulTB2Lcjdf
54jfs6fHzsYke7HNKTnyMuIZnHUeF1c8d3SYeIOErnVUz5d/TY21eIC8LS7XxZKP
L4L3OLXkizjCZ5bLSqO6Bpr93+hg69rS1RE32CTL1E6SKNpDXwEfJVD8XV65IgrZ
Dszos/LgkRRr0HurSJ2OjNn7salyhM0UhpdXpedUXEb4aRjlbPbW31WeDFePyWDK
wTTqawmzeagK7j58lIONpqgHMO+GRIRoShAYN4n+4n0e0Eb4FsPXS54LAEsBPegO
lbTY+Ccl4VHJ8tdAQOvPSapNbNRjHexJbUH3oFlbJ8tTsbUQtX2P8q93bA2PP8Sc
ps+MhlncPDY1GPo+5dzvfZhb9lrdoT/I0wuNli3050eXGGwFuYs9vx+27cOMP4Ad
wEqeahAWxXFSJy92w4kd4qElFU9vpKjSmIyEVI2KlkLj1y6nbDEuUpqZdfGMY8NC
qup92fIt/zu4oO38JO4pA1WqCNWtV6EwUY040HvTegWMV46BeCis0DuaNItk4zmq
AbNFlNPMypN+dwASyhqd
=HL1R
-----END PGP SIGNATURE-----

--kunpHVz1op/+13PW--
