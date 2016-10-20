From: Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: berlin2q-marvell-dmp: fix typo in chosen node
Date: Thu, 20 Oct 2016 08:32:34 +0200
Message-ID: <20161020063234.a4q7qquftwn5kvup@kwain>
References: <1476924731-14975-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6xta2xqq3mexnku2"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1476924731-14975-1-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--6xta2xqq3mexnku2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Oct 20, 2016 at 09:52:11AM +0900, Masahiro Yamada wrote:
> Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>

Acked-by: Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Thanks!

Antoine

> ---
>=20
>  arch/arm/boot/dts/berlin2q-marvell-dmp.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/berlin2q-marvell-dmp.dts b/arch/arm/boot/d=
ts/berlin2q-marvell-dmp.dts
> index f485308..d57d675 100644
> --- a/arch/arm/boot/dts/berlin2q-marvell-dmp.dts
> +++ b/arch/arm/boot/dts/berlin2q-marvell-dmp.dts
> @@ -48,7 +48,7 @@
>  		reg =3D <0x00000000 0x80000000>;
>  	};
> =20
> -	choosen {
> +	chosen {
>  		bootargs =3D "earlyprintk";
>  		stdout-path =3D "serial0:115200n8";
>  	};
> --=20
> 1.9.1
>=20

--=20
Antoine T=E9nart, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--6xta2xqq3mexnku2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCgAGBQJYCGTzAAoJEFxNi8it27zYP6IP/jDFCA6zlza1YzdhxskS52KC
akmAEUYQ3OYisWs7bt35Nb6C+YG9HFXM3b7y1T61Bj7p8PuPiqOx8W50FMNLMYrp
/sTX/ey2BkibQ7WRXJ5Nycmsx6GTL+znVkinbTIocIhBttLcPKn/PaKdTmTUfUDQ
sm0cpz9GoF7py/OEnAxqeiXpbZrpP40dqyTlspJg3Hb9B74RsdAmP04QqrHhD6Pl
eBpQdree8A77Ql29TsEXLPk/nzwKgutynq+x7loNzZDv+ugBi+bVRwLeArx8bnvH
22zQnUNRdii/sbY34zuYdqr9lwceiCVbTAuXlHL+SDh0hVaGe/+LUdsil/qsMj5E
k9ba6pD5RmP+MbwNaDT+AGfnsMJpa6Y3ZJv/7p3+19UKojVNptkwf7/k9ITndrgC
rfw2IIrAgO+znnUXDBPzz48laxol9B9TVdJh8gEgLhFZkq79dJSWC/JeZ4XEl1K2
E/eBcZh5+IlumPPFlYHJK3CiUzM0j3oiMrCR2BNiJv6TbhQqEaEFh5sNiD/oPOrd
GSLHgudG2xNew3xGwcY2bleCVls1sYbmAa8j5mbgdyomn4vsO+k4q/Ss5TMTGWZj
yqzfDtYpAnQbl0eVdPOsUdMSxUbrL59WsGVBuIbEOyK5rjQp/GQbH9OtKqdUsGQw
iauTEPZGlcPuT6DCE2Nm
=P1Lq
-----END PGP SIGNATURE-----

--6xta2xqq3mexnku2--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
