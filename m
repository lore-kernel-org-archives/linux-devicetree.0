From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] mtd: brcmnand: fix check for Hamming algorithm
Date: Fri, 1 Apr 2016 09:07:56 -0700
Message-ID: <20160401160756.GD117117@google.com>
References: <1455300685-27009-1-git-send-email-zajec5@gmail.com>
 <1455300685-27009-3-git-send-email-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1455300685-27009-3-git-send-email-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Kamal Dasu <kdasu.kdev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Feb 12, 2016 at 07:11:25PM +0100, Rafa=C5=82 Mi=C5=82ecki wrote=
:
> So far we were treating ECC strength 1 as Hamming algorithm. It didn'=
t
> supporting some less common devices with BCH-1 (e.g. D-Link DIR-885L)=
=2E
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/mtd/nand/brcmnand/brcmnand.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/=
brcmnand/brcmnand.c
> index 844fc07..b8055da 100644
> --- a/drivers/mtd/nand/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
> @@ -1842,7 +1842,7 @@ static int brcmnand_setup_dev(struct brcmnand_h=
ost *host)
> =20
>  	switch (chip->ecc.size) {
>  	case 512:
> -		if (chip->ecc.strength =3D=3D 1) /* Hamming */
> +		if (chip->ecc.algo =3D=3D NAND_ECC_HAMMING)

It's probably best we do a little more than this. Right now, this allow=
s
someone to specify:

	nand-ecc-strength =3D <20>;
	nand-ecc-stepsize =3D <512>;
	nand-ecc-algo =3D "hamming";
	nand-ecc-mode =3D "hw";

And they'll end up with 1-bit hamming ECC, except nand_base will still
think we have 20-bit correction. I think we need to add a check in this
driver to be sure we haven't selected >1-bit correction with hamming
ECC.

Brian

>  			cfg->ecc_level =3D 15;
>  		else
>  			cfg->ecc_level =3D chip->ecc.strength;
> --=20
> 1.8.4.5
>=20
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
