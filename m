From: Artem Bityutskiy <dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH resend] Add devicetree support to m25p80 driver
Date: Tue, 13 Nov 2012 13:44:26 +0200
Message-ID: <1352807066.2262.53.camel@sauron.fi.intel.com>
References: <5084241A.5050801@vanka.net> <50A2193A.2040100@vanka.net>
Reply-To: dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6290416495140069621=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <50A2193A.2040100-Swe8ldf8qsBeoWH0uzbU5w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Michal Vanka <mv-Swe8ldf8qsBeoWH0uzbU5w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============6290416495140069621==
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-KRDDoswjtskCwRgsbIk8"


--=-KRDDoswjtskCwRgsbIk8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-11-13 at 10:56 +0100, Michal Vanka wrote:
>                 return -ENODEV;
>   #endif
> @@ -825,27 +848,39 @@ static int __devinit m25p_probe(struct
> spi_device
> *spi)
>                         dev_warn(&spi->dev, "unrecognized id %s\n",
> data->type);=20

Still line-wrapped:

$ git apply --check ~/tmp/mvanka.mbox
fatal: corrupt patch at line 122

Please, make sure it applies to the l2-mtd.git tree. Send it to
yourself, save your own e-mail, and verify with 'git apply --check'.

--=20
Best Regards,
Artem Bityutskiy

--=-KRDDoswjtskCwRgsbIk8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQojKaAAoJECmIfjd9wqK0NagP/Rj5fwmqDFdM54y4WHZUEmKh
HE2wfW55001d5T0N4Z+aQS0QJVJ5VRYFPl6Mho3nmZkJDwJqRDksspZh293KujKg
sTubYIZszzT5jZayOI4bu2mto565zdYlZ3BqkPnsmOjkow0rWwKvRW7mZyw35PPA
4sTKRqJWrG2CImzvp2R70hXCwzGzZfbjInn3NvtdhXuLACXW4FDmOU4SFw0+P8+y
hQ+b6e4uQbYXt3Hi+qecDXAL9o2cQlk1r9tvgbXnG6MMRFQij7G2eLAlKHWlYKPq
lFXUs9oazX4jMg5qrvkj3xiz9eyHkMA9t3YuRWWzdP83lGy0OgVvWKL8rWOwmHT0
OgBZXca1wratZncJOxVLidWv1rgF2DQxlBWdyMJzBsQz9LN/X5WLljUhnqnFHfBZ
knHMkN1IryK4438qMmIGVJDyqrJkoSDJJBooyplMJh6ruQ/Eyb7Whs45xP0wZUf/
CDW57hM2XHLqEmkQOsWFsNqEs2kfx2OBKD+KKmafyx8usMvrXUC4CQ1R2kjDLWJj
lyuq3yRHcD+R/pdeWn5KVjB1TKJF9P/yusocFY7Acq77q58vGmSAFbBbdoyaLuMN
LyAatjv7uKpbAZwVS9A48cFcPLgx8W1Gukg9aslHWm/ZptcQ/YLxDmyJWZuZ1KZa
udhc2UTbxkHPwOaaTh9Z
=UzK+
-----END PGP SIGNATURE-----

--=-KRDDoswjtskCwRgsbIk8--


--===============6290416495140069621==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============6290416495140069621==--
