From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] Documentation: dt: mtd: drop "soft_bch" from example
Date: Fri, 27 May 2016 15:31:53 +0200
Message-ID: <20160527153153.420c86e7@bbrezillon>
References: <a206ce4cabf9ba8d376241fc23e9973f6db2443b.1464147910.git.baruch@tkos.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a206ce4cabf9ba8d376241fc23e9973f6db2443b.1464147910.git.baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?B?UmFm?= =?UTF-8?B?YcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Brian,

On Wed, 25 May 2016 06:45:10 +0300
Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org> wrote:

> Commit 32698aafc9f0 (Documentation: devicetree: deprecate "soft_bch"
> nand-ecc-mode value, 2016-04-22) deprecated "soft_bch". Update the ex=
ample to
> match.
>=20
> Cc: Rafa=C5=82 Mi=C5=82ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>

I don't know if we should consider this as a bugfix. If that's the
case, can you take it directly in your tree with my

Acked-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Thanks,

Boris

> ---
>  Documentation/devicetree/bindings/mtd/nand.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mtd/nand.txt b/Documen=
tation/devicetree/bindings/mtd/nand.txt
> index 68342eac2383..3733300de8dd 100644
> --- a/Documentation/devicetree/bindings/mtd/nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/nand.txt
> @@ -53,7 +53,8 @@ Example:
> =20
>  		nand@0 {
>  			reg =3D <0>;
> -			nand-ecc-mode =3D "soft_bch";
> +			nand-ecc-mode =3D "soft";
> +			nand-ecc-algo =3D "bch";
> =20
>  			/* controller specific properties */
>  		};



--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
