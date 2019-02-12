From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH RFC] arm64: dts: allwinner: a64: teres-i: Enable audio
Date: Tue, 12 Feb 2019 11:09:29 +0100
Message-ID: <20190212100929.iqsxu443qrkl6myf@flea>
References: <20190211111245.GA18147@lst.de>
 <E1gtBlV-0000Wl-Cv@stardust.g4.wien.funkfeuer.at>
 <20190211153945.e34fpwkuk67l7lc6@flea>
 <E1gtHJj-0000iY-G8@stardust.g4.wien.funkfeuer.at>
 <20190212083850.7genwc6ipnxtl7eo@flea>
 <E1gtUZn-0000NW-MA@stardust.g4.wien.funkfeuer.at>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7882474693559003522=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <E1gtUZn-0000NW-MA@stardust.g4.wien.funkfeuer.at>
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


--===============7882474693559003522==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="klwiwpgyagqv7dfc"
Content-Disposition: inline


--klwiwpgyagqv7dfc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 12, 2019 at 10:42:03AM +0100, Harald Geyer wrote:
> Maxime Ripard writes:
> > On Mon, Feb 11, 2019 at 08:32:35PM +0100, Harald Geyer wrote:
> > > > We want to model this properly. I guess using a pinctrl driver
> > > > controlled through GPIO (similar to what regulator-gpio is) would b=
e a
> > > > good first step.
> > >=20
> > > I considered this too, but didn't like it:
> > >=20
> > > 1) Seems like a bit of overkill.
> > >
> > > 2) The HW at hand is a rather different kind of multiplexer than
> > > what pinctrl assumes. We don't want two mutually exclusive devices,
> > > (Ie don't make the kernel unbind /dev/console for the sake of audio.)
> > > but we want switch the jack between two devices, that might both be
> > > active at the same time. This looks more like the channel multiplexers
> > > used with many ADCs and such. I guess, I could start a new subsystem
> > > around this. Seems like even more overkill.
> >=20
> > I'm not quite sure about how that's different from what pinctrl
> > assumes. pinctrl assumes to handle devices that have multiple signals
> > as input, and one as output. Isn't that exactly what you have?
>=20
> I think the pinctrl way would be to have the audio card device
> request the HP jack and the uart node request the HP jack and only
> once device could probe successfully. Ie it is about ressource
> allocation, not true multiplexing where both devices can use the
> ressource at the same time. Am I wrong?

By default, it's what happens yes, but you can definitely have more
complex behaviour that would support changing dynamically back and
forth that muxing.

> Or course we don't actually want true multiplexing for audio quality
> reasons, but I don't see how we could use pinctrl without doing nasty
> things to /dev/console ...

You can't have multiplexing, because that device doesn't allow you to:
it allows only a single signal out at a given time. If you're using
audio, you will not be able to get your logs out of the UART.

And /dev/console is always there as far as I'm aware.

> > And pinctrl can be used dynamically as well if you need to
>=20
> Can you explain or point me to the relevant explanation in the docs?
> I don't seem to know about it.

pinctrl_select_state is what you would want to call, you would have a
good example of that runtime change in
drivers/i2c/muxes/i2c-mux-pinctrl.c.

> > > Instead I just got the original patch working, by implementing
> > > "output-high" DT property in sunxi-pinctrl. I'll send a patch for
> > > review soon.
> >=20
> > What do you want to do with output-high exactly?
>=20
> Exactly what I do in the patch that started this thread.
> (I'll resend when wens' cpvdd patch is available for me to rebase onto.)

There's a few issues with that approach as well:

  - We're actively trying to remove the pinctrl nodes for the GPIOs

  - It's completely static: if one only wants to use the UART all the
    time, they would have to change the DTB, which might or might not
    be possible. Note that this could be trickier: why would you
    prevent the console from working for example if the audio support
    isn't built in? or as a module that might or might not be loaded?

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--klwiwpgyagqv7dfc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXGKbWQAKCRDj7w1vZxhR
xTIoAQDVB/ZfluKsNODvSEtdPz9xyCAf/Bbel0opVkWTEvc+7wD/f8gggAmApmZq
7FGTkqGgxpxk4bmMPBmuKL4EiVDDNQw=
=Y85k
-----END PGP SIGNATURE-----

--klwiwpgyagqv7dfc--


--===============7882474693559003522==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7882474693559003522==--
