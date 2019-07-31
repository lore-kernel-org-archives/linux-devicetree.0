From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77995: draak: Fix backlight
 regulator name
Date: Wed, 31 Jul 2019 16:09:09 +0100
Message-ID: <20190731150909.GD4369@sirena.org.uk>
References: <20190731073744.13963-1-geert+renesas@glider.be>
 <20190731074801.5706-1-geert+renesas@glider.be>
 <20190731081209.GA5080@pendragon.ideasonboard.com>
 <CAMuHMdV9MEYP97_6RFhmbGGB8uY-Pi8S9q+m+XMmHzKHcibJwQ@mail.gmail.com>
 <CAL_JsqJWJ+o6t2Wb162h7Xz98L=WPSi4une-EC0HfoRiWLmKWA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4506328383128135741=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL_JsqJWJ+o6t2Wb162h7Xz98L=WPSi4une-EC0HfoRiWLmKWA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Johan Hovold <johan@kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert@linux-m68k.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Marek Vasut <marek.vasut+renesas@gmail.com>
List-Id: devicetree@vger.kernel.org


--===============4506328383128135741==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eqp4TxRxnD4KrmFZ"
Content-Disposition: inline


--eqp4TxRxnD4KrmFZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 31, 2019 at 08:47:38AM -0600, Rob Herring wrote:

> As long as we have a consistent base name that we can match schema
> with, then I'm happy. But for regulators, we have a lot of node names
> like 'buck1', 'LDO2', etc.

Those are all types of regulator (LDOs and DCDCs are the main types of
voltage regulator, and buck is another term for DCDC).

I'm still not clear what meaningful effect any of this node name stuff
has :(

--eqp4TxRxnD4KrmFZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1BrxUACgkQJNaLcl1U
h9AL3Af/aUeFtao+e3RZByp0wSj7o2Wf/AP0GdZxNpNL9iEZiwzVlcZd9MsJbVHk
1DP61c59GBTfKy8SkLx9HlcIo7MO2V8WDFeX7Sl3ojtW72ubXNBYtPf5KW6Yfdll
s+16xROordrMpe1Z8P0m7DHBQeAuuipy9nYlXbFpyoBdjNykpxFbmfhTPrAIlql0
I4Q8mXVpT927dY3WbAE0ZiyXJFddNZX+v7hB313W3fJ4a5fsjvLSTblVfEMt2NfN
szEd8oXIFXN1WzyN52COod3M7gUTFQL4eH3l+aEDsppj+gcpFcfkAmtoRACVXKo0
5GJeJci6PurEp+MbiVZw3KNvl/24/A==
=upRn
-----END PGP SIGNATURE-----

--eqp4TxRxnD4KrmFZ--


--===============4506328383128135741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4506328383128135741==--
