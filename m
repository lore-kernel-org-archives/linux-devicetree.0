From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v9 4/5] ARM: sunxi: Add IR controllers on
 A20 to dtsi
Date: Mon, 16 Jun 2014 15:24:19 +0200
Message-ID: <20140616132419.GA9757@lukather>
References: <1402250893-5412-1-git-send-email-bay@hackerdom.ru>
 <1402250893-5412-5-git-send-email-bay@hackerdom.ru>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cNdxnHkX5QqsyA0e"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBL7A7OOAKGQELSCG5AQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1402250893-5412-5-git-send-email-bay-d8LqKIyZzER6k2ZkT/Rh8A@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Alexander Bersenev <bay-d8LqKIyZzER6k2ZkT/Rh8A@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, david-0WFrdVpeebksCylrc8G9yg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sean-hENCXIMQXOg@public.gmane.org, srinivas.kandagatla-qxv4g6HH51o@public.gmane.org, wingrime-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jun 09, 2014 at 12:08:12AM +0600, Alexander Bersenev wrote:
> This patch adds records for two IR controllers on A20
>=20
> Signed-off-by: Alexander Bersenev <bay-d8LqKIyZzER6k2ZkT/Rh8A@public.gmane.org>
> Signed-off-by: Alexsey Shestacov <wingrime-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun7i-a20.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a=
20.dtsi
> index c057c3e..fe1f8ff 100644
> --- a/arch/arm/boot/dts/sun7i-a20.dtsi
> +++ b/arch/arm/boot/dts/sun7i-a20.dtsi
> @@ -763,6 +763,24 @@
>  			interrupts =3D <0 24 4>;
>  		};
> =20
> +		ir0: ir@01c21800 {
> +			compatible =3D "allwinner,sun7i-a20-ir";
> +			clocks =3D <&apb0_gates 6>, <&ir0_clk>;
> +			clock-names =3D "apb", "ir";
> +			interrupts =3D <0 5 4>;
> +			reg =3D <0x01c21800 0x40>;
> +			status =3D "disabled";
> +		};
> +
> +		ir1: ir@01c21c00 {
> +			compatible =3D "allwinner,sun7i-a20-ir";
> +			clocks =3D <&apb0_gates 7>, <&ir1_clk>;
> +			clock-names =3D "apb", "ir";
> +			interrupts =3D <0 6 4>;
> +			reg =3D <0x01c21c00 0x40>;
> +			status =3D "disabled";
> +		};
> +
>  		lradc: lradc@01c22800 {
>  			compatible =3D "allwinner,sun4i-lradc-keys";
>  			reg =3D <0x01c22800 0x100>;

I'm fine with this patch, but it doesn't apply, since the above node
doesn't exist. Please rebase on top of v3.16-rc1 and resend the patch.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--cNdxnHkX5QqsyA0e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTnvADAAoJEBx+YmzsjxAgrvIP/ivUAegnXZuO7abzCG8lZ1gU
FdLXWuoyU8ONZ3RQm2gdPvxECugIySP3n8U3VExhCY/k2zW2IkIEUPUqRfvo80EU
LQvkGvXqJBK7iXUOxxP7zbyPaBnHwZpt7rnzXqw1+0fXLe0ulTkYv89efmnukzkA
yLMIK72qnaKGKEd28Zj7kL+DqvCOi62VMOa0djpx07k20Eepln6gCG4rPsRkymjP
vf4qXHd3UlZUlpZ0Cp8HrCOStajOfCI2rwdV2JnAxHNd76MrddM/G0huWfP5viAz
pfdC6KdsuNzhIjnaP76zqV9kauQuDHr7j9sqNa6wFGod4MjM0MiXh8lyreohpknG
bF3pD9QHHamOy7D596Ti8OnOWRkpBp/w5BzIpB2l0hCBV7yLQiHurkVSMtava60E
HLZB1cuqkmaXYSwa3seUIhixV5g3+jIqJPVas6w81bJv8+PeV/xaNfFEqtHcnPgc
e1NrB/lAr+9/gcqxZZqMCV0NLKobHpjZuR4jLj2NL2n+82c27FBBU/PR94iur82S
Xb3Qe7UDT+dD7j1NS5Yd0DhrSrfIwjA7LpgTq7lDbYpwZ3nCdms/Rwo3+mu/Jq9f
2YYswRz/naYPOAIMvJCEzAfsJzLchbos/u8ndKNwRiQZJErlsGogf61N2FrhK1ci
zRpar6kTkTLKPJUhto3S
=skBL
-----END PGP SIGNATURE-----

--cNdxnHkX5QqsyA0e--
