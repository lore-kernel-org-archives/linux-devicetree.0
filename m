From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [PATCH v3 1/9] fdt: Add fdtdec functions to read byte
	array
Date: Tue, 17 Jan 2012 01:30:46 -0500
Message-ID: <201201170130.48257.vapier@gentoo.org>
References: <1326780682-10260-1-git-send-email-sjg@chromium.org>
	<1326780682-10260-2-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1343217175=="
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <1326780682-10260-2-git-send-email-sjg@chromium.org>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: devicetree-discuss@lists.ozlabs.org
Cc: U-Boot Mailing List <u-boot@lists.denx.de>, Jerry Van Baren <vanbaren@cideas.com>, Tom Warren <twarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

--===============1343217175==
Content-Type: multipart/signed;
  boundary="nextPart3535076.lsCtaQ1Pv3";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart3535076.lsCtaQ1Pv3
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Tuesday 17 January 2012 01:11:14 Simon Glass wrote:
> From: Anton Staff <robotboy@chromium.org>
>=20
> Sometimes we don't need a full cell for each value. This provides
> a simple function to read a byte array, both with and without
> copying it.
>=20
> Signed-off-by: Simon Glass <sjg@chromium.org>

seems like getting s-o-b from Anton should be fairly easy ;)

(there's a few other patches in this series with that problem)
=2Dmike

--nextPart3535076.lsCtaQ1Pv3
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJPFRWYAAoJEEFjO5/oN/WBcoUP/052EFN5TXCLPlwkpyu4ppn4
QsNFoSvsBDkp6KRqHxhRC1ZoFEWHu5zNWZP5IxbcNr5mHv17jq59HBvNovfvCqTH
xJ+f3H1PCV/xArXwoSnxk/6/7SUxVMkmGckyXaFz66xPqdBRRsV7NDFbTHTfCj8H
sGhcr1/SRva4fyvlEVXi7fQFu+dMT3+4gtgOjbiLqMamLQuY58rVV/UlVU3f3MyR
0vMksKVh74K96/Q92cIHj845WwxiAGKAr8IGXXyucl8tn2hwLza0a9lB8JHigWXj
C+vtLqY/dc/fMT7LN9Th0vUAkDPE3GJkTncXdJ3nDi5ZLNNtpPjpu2DPQwDOdm91
qiTG4z7Fh2/bMNjQTQS+FZuUbrmJ6LcqjEfZwDawWHEBDs7sSNw/Hxh1Arsj6SK1
oQORhiUtQ5//2dGJWYbDJ2eTmbfR+C7aS9TYAxyeJH7860ohMJGs+xcYHMpQJsPj
KaxZVZP0IM/3VuQnRbKv8jUyN+yRIhqtGR2JEfrbbMyFRK6N5tzxQn71X5m1675d
AYxopSUAdlW8uCrN9/IkJJbe6U96pxsC927xqh5iSmC6ZB2/0KrOmwKbqN6a/dES
v8A86r26GNQ035SjD6N6dry1OT5vHBYO/zepecqKQHA8D2M1jkGzm3cmaIlOBtnM
uRj4KYXpnekcpkK8GWF8
=+8gu
-----END PGP SIGNATURE-----

--nextPart3535076.lsCtaQ1Pv3--

--===============1343217175==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
U-Boot mailing list
U-Boot@lists.denx.de
http://lists.denx.de/mailman/listinfo/u-boot

--===============1343217175==--
