From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH RFC] arm64: dts: allwinner: a64: teres-i: Enable audio
Date: Tue, 12 Feb 2019 09:38:50 +0100
Message-ID: <20190212083850.7genwc6ipnxtl7eo@flea>
References: <20190211111245.GA18147@lst.de>
 <E1gtBlV-0000Wl-Cv@stardust.g4.wien.funkfeuer.at>
 <20190211153945.e34fpwkuk67l7lc6@flea>
 <E1gtHJj-0000iY-G8@stardust.g4.wien.funkfeuer.at>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7772432879733703169=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <E1gtHJj-0000iY-G8@stardust.g4.wien.funkfeuer.at>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Harald Geyer <harald@ccbib.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, info@olimex.com, Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, ibu@radempa.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============7772432879733703169==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mbfotkrj5qb4aubt"
Content-Disposition: inline


--mbfotkrj5qb4aubt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 11, 2019 at 08:32:35PM +0100, Harald Geyer wrote:
> > We want to model this properly. I guess using a pinctrl driver
> > controlled through GPIO (similar to what regulator-gpio is) would be a
> > good first step.
>=20
> I considered this too, but didn't like it:
>=20
> 1) Seems like a bit of overkill.
>
> 2) The HW at hand is a rather different kind of multiplexer than
> what pinctrl assumes. We don't want two mutually exclusive devices,
> (Ie don't make the kernel unbind /dev/console for the sake of audio.)
> but we want switch the jack between two devices, that might both be
> active at the same time. This looks more like the channel multiplexers
> used with many ADCs and such. I guess, I could start a new subsystem
> around this. Seems like even more overkill.

I'm not quite sure about how that's different from what pinctrl
assumes. pinctrl assumes to handle devices that have multiple signals
as input, and one as output. Isn't that exactly what you have?

And pinctrl can be used dynamically as well if you need to

> Instead I just got the original patch working, by implementing
> "output-high" DT property in sunxi-pinctrl. I'll send a patch for
> review soon.

What do you want to do with output-high exactly?

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--mbfotkrj5qb4aubt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXGKGGgAKCRDj7w1vZxhR
xYuZAQCp23Sdst8xXZYRMCqrva1rMoo7KVAz/EnclmklBSRcBwEAlMhswxQCB6Dp
RricCHumMDXZn3wRD/p4F0DLvdczYA4=
=+Dq1
-----END PGP SIGNATURE-----

--mbfotkrj5qb4aubt--


--===============7772432879733703169==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7772432879733703169==--
