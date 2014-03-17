From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v6 2/3] ARM: sun7i/sun6i: dts: Add NMI
 irqchip support
Date: Mon, 17 Mar 2014 14:30:58 +0100
Message-ID: <20140317133057.GK27873@lukather>
References: <1394890861-18347-1-git-send-email-carlo@caione.org>
 <1394890861-18347-3-git-send-email-carlo@caione.org>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RNRUMt0ZF5Yaq/Aq"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBCHUTOMQKGQEFQXHJBA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1394890861-18347-3-git-send-email-carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--RNRUMt0ZF5Yaq/Aq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 15, 2014 at 02:41:00PM +0100, Carlo Caione wrote:
> This patch adds DTS entries for NMI controller as child of GIC.
>=20
> Signed-off-by: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun6i-a31.dtsi | 9 +++++++++
>  arch/arm/boot/dts/sun7i-a20.dtsi | 9 +++++++++
>  2 files changed, 18 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun6i-a31.dtsi b/arch/arm/boot/dts/sun6i-a=
31.dtsi
> index 5256ad9..4a5050c 100644
> --- a/arch/arm/boot/dts/sun6i-a31.dtsi
> +++ b/arch/arm/boot/dts/sun6i-a31.dtsi
> @@ -190,6 +190,15 @@
>  		#size-cells =3D <1>;
>  		ranges;
> =20
> +		nmi_intc: sc-nmi-intc@01f00c0c {

It should be interrupt-controller@01f00c0c, according to the ePAPR.

> +			compatible =3D "allwinner,sun6i-a31-sc-nmi";

I'm curious, what is the "sc" for?

> +			interrupt-controller;
> +			#interrupt-cells =3D <2>;
> +			reg =3D <0x01f00c0c 0x38>;
> +			interrupt-parent =3D <&gic>;

This is actually the default.

> +			interrupts =3D <0 0 4>;
> +		};
> +

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--RNRUMt0ZF5Yaq/Aq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJTJvkRAAoJEBx+YmzsjxAgOXEP/3DXSA61Vp504CnLz7a36ZEr
WphG47eJugMxvc2k+qX6mkBqbt1bAbLsVTnNKtW8H7Nj6yroeBosfE7evWzsaNT+
SBivEkPU6hK/psJrCCjeoKKBMD6oj3kl5lssk9Wg1SQiL8vOmL7eRtfEmzKGyqj0
R60lj9NQZx81nimGIr7/5bzpmMaWs16+HmkaAhWy73LOjdhtKemKozYZxgSNg4kG
u4qKhZAFzgozQrio4BRYlNLCEYL3H5Q9i/CumpZ0EarZSUbmbu5hXIpW5VZr2vEW
DC2Q9vbxdSH8VSC0p1S+FzRSosvcxlEcj/Hhz8eJkvZlg30FP1746p7CYPIOykvO
O7blO3EZNRpWwI9iDZ6RTh1bIbC68lidmt7RXdB0d9l+mMvcn6llagCNPxVsTP/N
HZfMWAOXOLuGhHlIVIuyUMpsleN/PHXQsNqbITdB9Xkes7OmVxxMKa5Ffl2onhcC
h5reSdVeSMmLu6H76cx0/CvJRaSDWOxe+6gaQdme+NfLKFiAq6lpR55UA0E/cwX5
nsJyCbgpPJyNjL1r/yA4TIr9doYRvI5OXNvWeDU2zHEMsS5nDPwZsfgtk9RN1AtK
rJpJFPHd3TS+X/aTaqLZO6cTHC5m1T/XmTzoXASTnMiGbtZAKqrJlCgbLnM66xTC
gLpi+tYoBdLWi4C23o7x
=ZzvX
-----END PGP SIGNATURE-----

--RNRUMt0ZF5Yaq/Aq--
