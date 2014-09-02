From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: Formal license ambiguity in arch/arm/boot/dts/sun?i-a*.dts
Date: Tue, 2 Sep 2014 17:18:08 +0200
Message-ID: <20140902151808.GY15297@lukather>
References: <201408031959.27607.arnd@arndb.de>
 <20140804192510.GF3952@lukather>
 <20140804212317.GL30282@n2100.arm.linux.org.uk>
 <20140807132023.GG15297@lukather>
 <20140902102206.GU15297@lukather>
 <20140902104002.GN30401@n2100.arm.linux.org.uk>
 <20140902122716.GV15297@lukather>
 <5405B986.2080407@redhat.com>
 <20140902125116.GW15297@lukather>
 <5405D74B.8090409@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZoVy78VzjVQLn2aH"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5405D74B.8090409-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--ZoVy78VzjVQLn2aH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 02, 2014 at 04:42:19PM +0200, Hans de Goede wrote:
> Hi,
>=20
> On 09/02/2014 02:51 PM, Maxime Ripard wrote:
> > On Tue, Sep 02, 2014 at 02:35:18PM +0200, Hans de Goede wrote:
> >>> So I guess like Chen-Yu suggested that we should change the license of
> >>> the DTSI first, and then the DTS. Otherwise, it wouldn't work very
> >>> well, I guess you can't really relicense a GPL-only file.
> >>
> >> IANAL, but mixing MIT (which I suggest use as the other license) and G=
PL
> >> files in one binary (the generated dtb file) is fine AFAIK, this happe=
ns
> >> all the time. The resulting binary is simple GPL licensed. So it would
> >> make sense to start with dual licensing new boards right away even bef=
ore
> >> the dtsi has been relicensed. It won't make any practical difference
> >> until the dtsi is relicensed, but it means less work later on.
> >=20
> > So you're allowed to licence derivative work of a GPL-licenced file
> > under both the GPL and another licence?
>=20
> Since the board files do not start as copies of the dtsi file, but
> merely include it they are not derivative (IANAL), the resulting
> dtb file however very much is and as such is GPL only.

My understanding was that inclusion does qualify as a derivative
work. Otherwise we wouldn't need either the LGPL or the GCC licence
exception.

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--ZoVy78VzjVQLn2aH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUBd+wAAoJEBx+YmzsjxAgAkgQAIoBIS2BUljaeUrm7xld3/Zx
D9kbuVzYMJMN9Uzq7TIdR20kainmCVDM0jiDtDwuICIjO3iRL+XnF7sidhs8ruPP
fGPR/Ye4c+1tWQlboFAMw3isS5BWu3rEI2QHs7YwVIvAhZP2en5ux1Ltb8ofzvW0
XkrQW9gMmekdx6nLPcYxv04wXA6S/x7Jct0+gwAU+wPixTGe14pp+fmZ1ob7Wevq
sgSw6ccrij6ya4G6RQ9jA9Sz4ExKn34L5SJgd6agcipUqCqjYi2znoURH8J8funY
NK/m05UtJDLcf5ZwQ92eS1VBKEbhaJLnxuVYXnhzUjqA6sf7bk7lAcUhv1sfogRC
vrh6lkwdTWvJjkZWWNn0GvLc0vzY9QLDssTP5d6X513AMHqzxWDtaipSnBCsmpv3
qFVI8ezHXdS5iUxo9J7sH/7+vDI2OhnJoWnlnl85Nur2BiTtlFhmsSBZqnZCUTH9
1BmRg97e1Gom7S05XME5OhznssNrwSkI7gWevBiuY4uWuSPR5RmGPtLdfJK+12MN
u5or8jWUsLWAA0BvjJekWS3dy6FUiOp1AVWj3e0lWTXm5x3sL2sAY4Q5B5oU1ZSp
ksstgM7k8PiUVVQgLrzV3iH4gADVmj5PNgOgWKn9ZX88M5hXU+mv+N1PzcfLwAKl
0TXldwnE+ZwvAUjn1Ey5
=9Ys0
-----END PGP SIGNATURE-----

--ZoVy78VzjVQLn2aH--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
