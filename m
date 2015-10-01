From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH RESEND] ARM: dts: Fix Makefile target for
 sun4i-a10-itead-iteaduino-plus
Date: Thu, 1 Oct 2015 12:11:56 +0200
Message-ID: <20151001101156.GE7104@lukather>
References: <20150904124934.GD464@hansolo.redhat.com>
 <20150906112046.GK31584@lukather>
 <CA+5PVA5ceg94PrUdUpb5X7ZsbEuK4_u1V-ZDesR7h_MZ8rGUtg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Y4/B1uKDHmWlpzsz"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CA+5PVA5ceg94PrUdUpb5X7ZsbEuK4_u1V-ZDesR7h_MZ8rGUtg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Josh Boyer <jwboyer-rxtnV0ftBwyoClj4AeEUq9i2O/JbrIOy@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Josef Gajdusek <atx-MwjtXicnQwU@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--Y4/B1uKDHmWlpzsz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Sep 29, 2015 at 10:32:59AM -0400, Josh Boyer wrote:
> On Sun, Sep 6, 2015 at 7:20 AM, Maxime Ripard
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > On Fri, Sep 04, 2015 at 08:49:34AM -0400, Josh Boyer wrote:
> >> Commit 79ae3e66f8d (ARM: dts: sun4i: Add Iteaduino Plus A10) added a n=
ew
> >> make target for the sun4i-a10-itead-iteaduino-plus dts file, but mista=
kenly
> >> used .dts instead of the correct .dtb suffix.  This resulted in a buil=
d error
> >> like:
> >>
> >>         scripts/Makefile.dtbinst:42: target 'sun4i-a10-itead-iteaduino=
-plus.dts' doesn't match the target pattern
> >>
> >> when doing a make dtbs_install.
> >>
> >> Fix it to use the proper file name.
> >>
> >> Signed-off-by: Josh Boyer <jwboyer-rxtnV0ftBwyoClj4AeEUq9i2O/JbrIOy@public.gmane.org>
> >
> > Queued, thanks!
>=20
> Are you going to push this to Olof or Linus for the 4.3 release?  I
> don't see it in Linus' tree and this is still broken there.

I was planning on sending the pull request for 4.3 sometime this week.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--Y4/B1uKDHmWlpzsz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWDQbsAAoJEBx+YmzsjxAgvxsP/2J3O2+j9oeb9EeL5I8RcMk1
1qItBC2Dt9Kmnky+Tgpp/eXPuUGeP5gnIDOnzXMjsVzyBRxM40Z4G0CVY62qmrd0
3LTbw3D9W8btGsCdStRHzAZSg7tfaiEtETbs9THl2RNtmAkmTpb3oDimjxi8Pbl1
axL9p4BIBy6zCzat9TmH+NqcNvACWQlm+tGbYF6KPSGzB4Mf3Gq3cRqMno58MSmB
BfDkYwhRuyPhO3CJPwPJRnRsuKB4Hxs+HhJpV5xswi70wuqI0pPyJ9Q23Q0cy7Ss
0yZ2UYhek901jqWFL9E2NOR6wylPCn3D/79/psktYQ4Ydf6S1LghediktA986jwO
gYtP/mJ4kgKoCeKO8uwwTJnGV7R6YcnYIdixt9ZFxBRFHNvwE8V2UlIW1dl09U6X
cL/q5yG8xCfIWUnj/WrRefyLvW+fCkPCv4O6ZcsklF71BBTT97z7Thow/SMqRruS
ee1b/wRQxoS/vdguijrLcu5RFkr5AuXHcF+irX3qwUKkLPVhjbWqaREBAiZjPwdM
pBW+2lidV/os+vWE6Fo4e4Ob9dsN3eUcy2RX77RAOh/hDD9ukkMlQ5/qGNaeaUTL
oUvGHPa3kpBOfUiOwmYzOybvf5Ygi2lkQpjp5BehrxVQJvHuhMLaJ3SuANAOqGey
aAtVmbHr72FMIiyKkk7p
=EaCW
-----END PGP SIGNATURE-----

--Y4/B1uKDHmWlpzsz--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
