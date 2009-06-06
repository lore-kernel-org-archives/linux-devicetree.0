From: Albrecht =?iso-8859-1?b?RHJl3w==?= <albrecht.dress-KvP5wT2u2U0@public.gmane.org>
Subject: Re: [PATCH V2 2/2] mtd/maps/mtd-ram: add an of-platform driver
Date: Sat, 06 Jun 2009 18:16:06 +0200
Message-ID: <1244304966.6356.1@antares>
References: <1244203514-12516-1-git-send-email-w.sang@pengutronix.de>
	<1244203514-12516-3-git-send-email-w.sang@pengutronix.de>
	<fa686aa40906060905y1d39dce1j87d993ceb94273be@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0104129247=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <fa686aa40906060905y1d39dce1j87d993ceb94273be-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
	(from grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org on Sat Jun  6 18:05:41 2009)
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

--===============0104129247==
Content-Type: multipart/signed; micalg=PGP-SHA1;
	protocol="application/pgp-signature"; boundary="=-QxzQ4Qam/pys6+fWyUaj"

--=-QxzQ4Qam/pys6+fWyUaj
Content-Type: text/plain; charset=us-ascii; DelSp=Yes; Format=Flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 06.06.09 18:05 schrieb(en) Grant Likely:
> > + - bank-width : Width (in bytes) of the RAM bank.
>=20
> Question: why is bank-width even relevant for a RAM device?

At least if the RAM is attached to the 5200's Local Plus Bus in 16-bit =20
mode, no byte write accesses are allowed (byte /reads/ work, though).  =20
I have a tweak (which I will post next week) to address this case, =20
which depends upon this setting.  No idea if the same happens on other =20
chips and/or on 5200 in 32-bit (muxed) mode, but I guess similar =20
effects will pop up there, too.

Cheers, Albrecht.

--=-QxzQ4Qam/pys6+fWyUaj
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)

iD8DBQBKKpZGn/9unNAn/9ERAqQuAJ9kKc52W8PvIqI0f/yQu/7uioICEgCeKTA9
L8skza7amytWvqUF8YmMMGY=
=5UdO
-----END PGP SIGNATURE-----

--=-QxzQ4Qam/pys6+fWyUaj--

--===============0104129247==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
https://ozlabs.org/mailman/listinfo/devicetree-discuss

--===============0104129247==--
