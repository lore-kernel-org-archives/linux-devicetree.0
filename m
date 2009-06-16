From: Albrecht =?iso-8859-1?b?RHJl3w==?= <albrecht.dress-KvP5wT2u2U0@public.gmane.org>
Subject: Re: [PATCH V2 2/2] mtd/maps/mtd-ram: add an of-platform driver
Date: Tue, 16 Jun 2009 19:19:06 +0200
Message-ID: <1245172753.3400.0@antares>
References: <fa686aa40906160553m2f0e7cc4n644c3893573845f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0649232822=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <fa686aa40906160553m2f0e7cc4n644c3893573845f-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
	(from grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org on Tue Jun 16 14:53:17 2009)
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Mime-version: 1.0
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--===============0649232822==
Content-Type: multipart/signed; micalg=PGP-SHA1;
	protocol="application/pgp-signature"; boundary="=-3vEv1y6AYteInxT4S5bC"

--=-3vEv1y6AYteInxT4S5bC
Content-Type: text/plain; charset=us-ascii; DelSp=Yes; Format=Flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 16.06.09 14:53 schrieb(en) Grant Likely:
> I'm not happy about the use case though.  It probably shouldn't =20
> appear in this binding, or if it does it should be tagged as an =20
> optional property.

I agree with you that the naming is really misleading - other devices =20
which are not mtd's may suffer from the same problem of the lpb (in my =20
case, I have an extra memory-mapped Ethernet chip which I didn't try to =20
access yet...).

As it is actually a chip select property, what about defining an =20
optional property like "cs-width =3D (8|16|32)" which defaults to 8 and =20
may be added to each 5200 lpb child?

> It is only in the 5200 localplus case that bank-width is needed to =20
> figure out how to apply the workaround.

Just out of curiosity: what about the "localbus" of other Freescale =20
chips (82xx? 83xx? Maybe others?)?

Thanks, Albrecht.

--=-3vEv1y6AYteInxT4S5bC
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)

iD8DBQBKN9QRn/9unNAn/9ERAgcZAKCDBRHS+2sgGwIwB2vjxbbyuycbjwCfQBnb
016afTZRn4vmVMeRgCX/P/Y=
=RUF4
-----END PGP SIGNATURE-----

--=-3vEv1y6AYteInxT4S5bC--

--===============0649232822==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
https://ozlabs.org/mailman/listinfo/devicetree-discuss

--===============0649232822==--
