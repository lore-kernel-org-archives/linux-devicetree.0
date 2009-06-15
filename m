From: Albrecht =?iso-8859-1?b?RHJl3w==?= <albrecht.dress-KvP5wT2u2U0@public.gmane.org>
Subject: Re: [PATCH V2 2/2] mtd/maps/mtd-ram: add an of-platform driver
Date: Mon, 15 Jun 2009 19:43:20 +0200
Message-ID: <1245087807.3185.0@antares>
References: <1244203514-12516-3-git-send-email-w.sang@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0002156895=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <1244203514-12516-3-git-send-email-w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> (from
	w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org on Fri Jun  5 14:05:14 2009)
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
To: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--===============0002156895==
Content-Type: multipart/signed; micalg=PGP-SHA1;
	protocol="application/pgp-signature"; boundary="=-HGg7XGzhpDPjZ7JQ1k94"

--=-HGg7XGzhpDPjZ7JQ1k94
Content-Type: text/plain; charset=us-ascii; DelSp=Yes; Format=Flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 05.06.09 14:05 schrieb(en) Wolfram Sang:
> Create an of-aware driver using the now exported generic functions =20
> from plat-ram.c. Also add the documentation for the binding. =20
> Partitions are not yet supported. Tested on a phyCORE-MPC5200B-IO.

Dumb question: what is the current status of this patch?  I ask because =20
I re-wrote my '5200 16-bit Local Plus Bus patch' according to Grant's =20
suggestions, and I believe of_ram_probe() of your patch is the right =20
place to check if it's attached to "fsl,mpc5200-lpb", and to change the =20
write cb if the bankwidth equals 2.

Thanks, Albrecht.

--=-HGg7XGzhpDPjZ7JQ1k94
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)

iD8DBQBKNog/n/9unNAn/9ERAmCHAJ9Mgz/9s1GXCFbyRDPOpAWBuCLvTgCgmJX2
y4964cya7xLRQUCs5otf3CQ=
=mXMd
-----END PGP SIGNATURE-----

--=-HGg7XGzhpDPjZ7JQ1k94--

--===============0002156895==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
https://ozlabs.org/mailman/listinfo/devicetree-discuss

--===============0002156895==--
