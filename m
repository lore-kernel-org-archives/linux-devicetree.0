From: Artem Bityutskiy <artem.bityutskiy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH] mtd: physmap_of: fix cmdline partition method w/o
 linux,mtd-name
Date: Mon, 28 Jan 2013 18:12:41 +0200
Message-ID: <1359389561.7570.18.camel@sauron.fi.intel.com>
References: <df9da712b775781366ae23aac28ed20849b4e4d3.1356260943.git.baruch@tkos.co.il>
 <20130124090547.GB7697@sapphire.tkos.co.il>
Reply-To: artem.bityutskiy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4415554440171480918=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130124090547.GB7697-MwjkAAnuF3khR1HGirfZ1z4kX+cae0hd@public.gmane.org>
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
To: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============4415554440171480918==
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-IlvbmqD85IcuV6+DH3Fk"


--=-IlvbmqD85IcuV6+DH3Fk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2013-01-24 at 11:05 +0200, Baruch Siach wrote:
> Hi linux-mtd, Artem, David,
>=20
> Ping?
>=20
> It's been a month, and this is a simple uninitialized pointer dereference=
 bug=20
> fix.

It is in linux-mtd now.

--=20
Best Regards,
Artem Bityutskiy

--=-IlvbmqD85IcuV6+DH3Fk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)

iQIcBAABAgAGBQJRBqN5AAoJECmIfjd9wqK0oM0P/irHLG9gziQXzDhilDIpCdYg
cPPSOvcC2WBtiXTlXSiKfdUvSPYoU76LzWdv4ygdBPHuKs5M7FYZ3PaQOYUaJu89
7CNKEqTFJxxQLZn/lcaqEkSFWuA1zSKt+hRIt4FoiQy0TqJNbJvzWPUKUstd+geH
/wWAs84KKqRBHbYRc5kfZ9XSlho6PpPEuxjR/cuz/RWASkJ6zVyJC1SfHuLpGPM4
aOafss3nEx1oPUS6anXInixsWInKxGnsI+GsRxGXYMsuGzZxiK/W3WFB0qxYlEhU
16/uQDjb8YuqqV4x8Y6e780L+6BeTbiVJvQKbSHN7FiXZYmfVYSFATrAmWsvhru3
pOqJ+nG4zyYfjDjcprjPShPxIekuk94G1bl2LOWxlIbQQ6I+b+6RAJAcHyHZ6mqh
siiUw/zCJX8Bsr773/Q5omZy4PiGFJWzDwgyAPFeCYOy73Y8VowZMYaPAzr0Ojvs
YLXKW3oDl6Su5uDU8NJab3q/iw0/W533NGspc8MlATS0Z0plvR5g5o9uLTIMT9mO
Km88ZRds3pS63QtEWTE/O347TIrpPJDjPbd2d9H7wXk6LfN+R6iAXRGSnXlTFdnE
g392zt+IgeAn8KAHwC5zP3s9HjGOVeZeWBiNwM1XREQH+7kRZlea+eycFDrjUh+T
kp7BT4/JEtrKmELmodFL
=Ksn+
-----END PGP SIGNATURE-----

--=-IlvbmqD85IcuV6+DH3Fk--


--===============4415554440171480918==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============4415554440171480918==--
