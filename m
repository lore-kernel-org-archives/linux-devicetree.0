From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH] arm64: dts: allwinner: a64: Re-add "syscon" compatible
Date: Fri, 21 Sep 2018 17:16:25 +0200
Message-ID: <20180921151625.wkaypyueyi2pguur@flea>
References: <20180917152857.162662-1-andre.przywara@arm.com>
 <CAGb2v643=V_3DbLeEyXEavSQJsW2KdknpZZLfw4QwCjhfdmVsA@mail.gmail.com>
 <20180921153522.0413c280@donnerap.Emea.Arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6176884405080605230=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180921153522.0413c280@donnerap.Emea.Arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andre Przywara <andre.przywara@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <rob.herring@linaro.org>, devicetree <devicetree@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.xyz>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Corentin Labbe <clabbe@baylibre.com>
List-Id: devicetree@vger.kernel.org


--===============6176884405080605230==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="662wibcsa7gtpfvu"
Content-Disposition: inline


--662wibcsa7gtpfvu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 21, 2018 at 03:35:22PM +0100, Andre Przywara wrote:
> The problem is: we broke compatibility with older kernels.

The problem is that we never said we wouldn't.

We've had this discussion a number of times. You forced the backward
compatibility onto us without any warning, and now we have to support
it. And it's already a pain. Maybe ARM can fix that problem by just
assigning more engineers to that, but that's not something we can do.

The fundamental difference is that we're mostly just a bunch of spare
time programmers working on this platform, with a partial
documentation for the controllers, at best.

You forced me to ask these developpers to work on their weekends and
evenings on some crazy corner cases to maintain the backward
compatibility. And honestly, both from a technical and human
standpoint, I definitely understand if some of them are just leaving
and don't want to work on it anymore. I would probably do the same in
their position.

And having to ask that for companies like ARM or SUSE just makes it
more frustrating to be honest. So there's simply no way you have
forward compatibility while I'm there. Or you manage to convince all
the ARM maintainers and enforce that compatibility for all the
platforms.

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--662wibcsa7gtpfvu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlulC0gACgkQ0rTAlCFN
r3S89A/+KQXiLhk0SV5jWwSf2tzDZcCCEyA0rHvmFvyrRRPzh/kKdNAZUG16ccPi
nTxAkwStKQ5uGHaxD5y4xrJRkx0EvGc2CrHWXljh/9WZkb5p9A+Pgr1zd4bPLrjr
XbPkiNoY24o8sJf/CaVTBZOR+MUKcdYRGyjQ6S6ZJ+SUWf7ztv4KJm7f5K6zELS2
PWESzn7izDG+FnpU9CX7G05xacwM7TYrvldGfnL6EHx2bFbNLu3ft25pisQRwCf1
ovC9MC71LAJDtdohCv+7lmyCo8CpHGslqXYgXjGwijBR18rJ1Up8wK3zfz3nvlwA
pCgX7hgE4MrT+Et9WvtiL70z39T+camUvPdpgS1/sYjkfYEzzwoX1BCcvlcqoicv
nG5CVwNoWjkGRgACpBh/Ge1hW6LbcUrvWPxNLzrUu5obcjndLTceC8pkkU/jdjjV
uQ9qIO7eVnBXLO2g/DRqdqnnKzDzKsjZsFU9QIDf6kMijAy+LiWdY0YxWgLqOMY9
1CzTrtJkoOTwGtf31kDCZ2PjNiT0g/ttvtuL9OqJ0+2HgGGIMvbLh+lMTNnKcbzw
LzwhJgnbcfZNhEcq4YFzh9oDyFJL6mPEh+eFeXstLfcKFaBuTJSkVsiMYvDAHoLp
71XFP1sZrCPATEC29dNqAbO+bDUuPelrBaPdHdF+po3AbB22V+8=
=DToA
-----END PGP SIGNATURE-----

--662wibcsa7gtpfvu--


--===============6176884405080605230==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6176884405080605230==--
