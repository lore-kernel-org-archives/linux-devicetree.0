From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [PATCH v3 1/9] fdt: Add fdtdec functions to read byte
	array
Date: Tue, 17 Jan 2012 10:52:10 -0500
Message-ID: <201201171052.12019.vapier@gentoo.org>
References: <1326780682-10260-1-git-send-email-sjg@chromium.org>
	<201201170130.48257.vapier@gentoo.org>
	<CAPnjgZ1L0wqwxoM0__+kxPazAF+xco5Vg99X22VByijNGTxF2w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0984595474=="
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <CAPnjgZ1L0wqwxoM0__+kxPazAF+xco5Vg99X22VByijNGTxF2w@mail.gmail.com>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Simon Glass <sjg@chromium.org>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>, devicetree-discuss@lists.ozlabs.org, Jerry Van Baren <vanbaren@cideas.com>, Tom Warren <twarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

--===============0984595474==
Content-Type: multipart/signed;
  boundary="nextPart2257003.ybLARdRGKc";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2257003.ybLARdRGKc
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Tuesday 17 January 2012 02:11:58 Simon Glass wrote:
> On Mon, Jan 16, 2012 at 10:30 PM, Mike Frysinger wrote:
> > On Tuesday 17 January 2012 01:11:14 Simon Glass wrote:
> >> From: Anton Staff <robotboy@chromium.org>
> >>=20
> >> Sometimes we don't need a full cell for each value. This provides
> >> a simple function to read a byte array, both with and without
> >> copying it.
> >>=20
> >> Signed-off-by: Simon Glass <sjg@chromium.org>
> >=20
> > seems like getting s-o-b from Anton should be fairly easy ;)
>=20
> I have the jellybeans ready. I will make a list of those I need - it
> is a pretty long list now. Does patchwork pick it up automatically if
> they reply to the list?

i believe it does if they reply to the patch in question.  at least, it sho=
uld=20
be easy to check (have him reply and then d/l it via patchwork).
=2Dmike

--nextPart2257003.ybLARdRGKc
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJPFZkrAAoJEEFjO5/oN/WB5qQQAJm4MQ/SjyeXKM3SPWN8J6/K
lfP05fikV7lXTc+PoD5HGH3r1aFeBNXcsgf/gQTbxjDK/VS+2W/arFSFCk8xwCdm
2nSzJh+bW9J7xJKB/3zC6w5ErEvbvxKBJ4idU5drFMwxlj3uVfbKQOuqvOWYMJ8s
3LBO8evtOirOIixBKMbzP4D0v6RJJh1BscbjcLv44xoBUAQVZCglfbHuEidQ8Mwq
THoj8/JtZ3QE6rvmKBg/tNXL+arewCCoUYwPh6mFpp+uBv1eKfzjJrlCv940UqCx
lOcEtd5yoyHdzGfhQ2FA5KN51HE4PBxyah0Y2/h+NV8Im8sJT13TlnICwbsrzYLj
px6hz9HKCXtVBHje5xFjl2J2TRxpr8fXZH5y8GodxbUwEbD22IXswf2jo/L0zhRj
TuWFr7dsPFr5EIYulEECpZb9GSuoifuHpQKJShx8K2iqsfsPjVbahQ8UVwTxRWjz
1uOml4WAXsLFrki7TwwZnU1d6aRoWKevOaedEyfNlcz5IBuuHPZHGUSHYTC0wQ31
AP6/3of0pYeoHA7nSlBB7m7aosJDNsdSa5Tv+7J1eegAQk1xxGt2oBFCsx07pHqL
WdPQKRLUhsOiSJuONUtPblUIfezpYerwpTku3mG5/KZWONSFZrZk83pjCtwH6bdB
vihOZs6nlgsnQ0asZh53
=CaBH
-----END PGP SIGNATURE-----

--nextPart2257003.ybLARdRGKc--

--===============0984595474==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
U-Boot mailing list
U-Boot@lists.denx.de
http://lists.denx.de/mailman/listinfo/u-boot

--===============0984595474==--
