From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: Formal license ambiguity in arch/arm/boot/dts/sun?i-a*.dts
Date: Tue, 2 Sep 2014 14:27:16 +0200
Message-ID: <20140902122716.GV15297@lukather>
References: <20140731192016.GA6869@excalibur.cnev.de>
 <20140803130430.GY3952@lukather>
 <201408031959.27607.arnd@arndb.de>
 <20140804192510.GF3952@lukather>
 <20140804212317.GL30282@n2100.arm.linux.org.uk>
 <20140807132023.GG15297@lukather>
 <20140902102206.GU15297@lukather>
 <20140902104002.GN30401@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Lioif/rgIS+iIQ0s"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140902104002.GN30401-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--Lioif/rgIS+iIQ0s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 02, 2014 at 11:40:02AM +0100, Russell King - ARM Linux wrote:
> On Tue, Sep 02, 2014 at 12:22:06PM +0200, Maxime Ripard wrote:
> > On Thu, Aug 07, 2014 at 03:20:23PM +0200, Maxime Ripard wrote:
> > > Hi Russell,
> > >=20
> > > On Mon, Aug 04, 2014 at 10:23:17PM +0100, Russell King - ARM Linux wr=
ote:
> > > > On Mon, Aug 04, 2014 at 09:25:10PM +0200, Maxime Ripard wrote:
> > > > > On Sun, Aug 03, 2014 at 07:59:27PM +0200, Arnd Bergmann wrote:
> > > > > > I would actually prefer if we could migrate a lot of these file=
s to BSD license,
> > > > > > provided the original authors agree. We want the dtb blobs to b=
e embeddable into
> > > > > > boot loaders of any license.
> > > > >=20
> > > > > Even though I'd be open to having my contributions to DTBs under =
the
> > > > > BSD, is this really a thing?
> > > > >=20
> > > > > I mean, for all I know, an OS/Bootloader would just parse a docum=
ented
> > > > > binary file, and I don't see any derivative work there.
> > > >=20
> > > > How does the OS/Bootloader end up with that binary file?
> > > >=20
> > > > For the sake of argument, let's say that the BSDs want to move to D=
T on
> > > > ARM.  Great, they convert over to parsing our DT blobs.
> > > >=20
> > > > However, they can't distribute the binary DT blobs to their users w=
ithout
> > > > coming up against the problems of the GPL wrt binary distribution.
> > > >=20
> > > > They could distribute the source files, but remember that many of t=
hose
> > > > are currently GPL licensed, so they'd probably end up having to pac=
kage
> > > > them entirely separately, if they're willing to do that at all.
> > > >=20
> > > > Or they could decide to ignore us altogether, and do their own DT s=
tuff,
> > > > maybe partially implementing our properties, or maybe coming up with
> > > > different and/or incompatible properties - which would be bad becau=
se
> > > > we now end up with two ways to describe the same hardware in active=
 use.
> > > >=20
> > > > I suspect the final option is the one they'd choose, and it's in our
> > > > interest that _that_ doesn't happen.
> > >=20
> > > Ah, yes, it's not really about a fear of a GPL-spread, but rather a
> > > concern about the source distribution. Makes sense.
> > >=20
> > > How should we deal with such relicensing?
> >=20
> > Ping?
> >=20
> > Are we doing this on a per platform basis? Should we enforce this dual
> > licensing for the future DTS patches? If so, starting from when?
>=20
> I have no answers to your questions - I put the question a number of
> times to Grant directly, and have been totally ignored.
>=20
> So, I think we just do whatever we think is the correct approach.
>=20
> Remember, when you change the licensing on something which has had
> multiple contributors, you need to seek the permission from everyone
> how contributed to it - so it will have to be done on a per platform
> and per-SoC basis.

Ack.

> I would also strongly suggest that future DTS files should be dual
> licensed from the start, and that we require contributions for the
> DTS files to be under both licenses.

So I guess like Chen-Yu suggested that we should change the license of
the DTSI first, and then the DTS. Otherwise, it wouldn't work very
well, I guess you can't really relicense a GPL-only file.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--Lioif/rgIS+iIQ0s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUBbekAAoJEBx+YmzsjxAgnKUP/3YcA/at0KcrAwmeKsDkAxsM
IekyFkIOK86RgQ4wxJNPmVlpsbaf2cHSoe0Nginw9sS/99aVQ/LihbRVPJoWerQp
ql2CesMQi6RSb9g1sxCfXJ5CEZw2xEZYlH8XptOmMqOUrdCEA2MGTUmzqOg3h0pg
tiIuWzyG6+TehAsBQB/ZMcxj+rsQ+NQtnNasMeltrCOZc2jrUcABelouSiVFjsRT
Og+/N35eu+UV8IqIT5gaDVGWZW1bi173Htn3Vrnb94Or2Sb6OlcFme4QXthG2sgq
XoJFuvijXDBCpzTtNd74a/SKK8aDlH+ejP1REHYuW4hQK60BbPPRdtViL+ZQCj/D
oBWUNZ0xdW/R9Igjoh+8w1FQrDODgFsn7SE1oLMkbKFqRRHMSwY3+VTX9NHoZyXD
CVWHgmt/deL/BSjmTTO8Vdwp1ajNUAHgTwqW3lqRdqqcs7uLdDbBHlpEEFRGOocq
D1fvCgsRTO4SGHuE6m2EilZ6iW9nTfLOFL+AYPmxUJNykcjVnTJk7ODgREXFZh13
Tl0F6etfLqrE2x5dSWjuVdVTyMJlmLEESIJI/bay3oUyOq8QFNrNJIsbvWKcJpuG
+cHYwq41eHsXMjazFkM/z7ZSAqD9pLiztfvHhgqQi7wuXCg47oi7Suy35KiWj5QN
iGzzcOR5ypDHqnJrVBBx
=WhX9
-----END PGP SIGNATURE-----

--Lioif/rgIS+iIQ0s--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
