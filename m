From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH RFC] arm64: dts: allwinner: a64: teres-i: Enable audio
Date: Wed, 13 Feb 2019 10:44:42 +0100
Message-ID: <20190213094442.da2dy6d5bb527nft@flea>
References: <20190211111245.GA18147@lst.de>
 <E1gtBlV-0000Wl-Cv@stardust.g4.wien.funkfeuer.at>
 <20190211153945.e34fpwkuk67l7lc6@flea>
 <E1gtHJj-0000iY-G8@stardust.g4.wien.funkfeuer.at>
 <20190212083850.7genwc6ipnxtl7eo@flea>
 <E1gtUZn-0000NW-MA@stardust.g4.wien.funkfeuer.at>
 <20190212100929.iqsxu443qrkl6myf@flea>
 <E1gtds8-0000NB-Re@stardust.g4.wien.funkfeuer.at>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8096033062538905620=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <E1gtds8-0000NB-Re@stardust.g4.wien.funkfeuer.at>
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


--===============8096033062538905620==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="z5xaxtwbz6nm3a4l"
Content-Disposition: inline


--z5xaxtwbz6nm3a4l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable



On Tue, Feb 12, 2019 at 08:37:36PM +0100, Harald Geyer wrote:
> Maxime Ripard writes:
> > > > And pinctrl can be used dynamically as well if you need to
> > >
> > > Can you explain or point me to the relevant explanation in the docs? I
> > > don't seem to know about it.
> >=20
> > pinctrl_select_state is what you would want to call,
> > you would have a good example of that runtime change in
> > drivers/i2c/muxes/i2c-mux-pinctrl.c.
>=20
> I believe we have misunderstood each other somewhere. The above example
> seems to be about one device (mux driver) requesting a set of pins and th=
en
> switching between different pinconfig states thereby activating
> different subsets of pins.

Not quite, it's supposed to drive two set of pins (with different
muxings) connected to a single i2c controller. It's a 1-N relationship

> I don't see a way to have two devices request the same set of pins.
> I could write gpio-mux-pinctrl, but I don't see how this helps much
> either.

You can't at the same time. But precisely, pinctrl provides the
guarantee and the synchronisation needed for two devices to operate on
the same set of pins
>=20
> > > > > Instead I just got the original patch working, by implementing
> > > > > "output-high" DT property in sunxi-pinctrl. I'll send a patch for
> > > > > review soon.
> > > >
> > > > What do you want to do with output-high exactly?
> > >
> > > Exactly what I do in the patch that started this thread. (I'll resend
> > > when wens' cpvdd patch is available for me to rebase onto.)
> >=20
> > There's a few issues with that approach as well:
> >=20
> >   - We're actively trying to remove the pinctrl nodes for the GPIOs
>=20
> For what reason? Maybe it doesn't apply to this usecase?

This is kind of separate. At the moment, on all our SoCs but the H6,
requesting a pin to a separate state using pinctrl doesn't mark the
GPIO muxed on that pin as reserved, so through the GPIO userspace
interface (or calling gpio_request from within the kernel, but that
seems less of a risk) anyone is free to just request a GPIO on a pin
already requested, behind the consumer drivers' back. Which is pretty
bad.

There's support for such a check in pinctrl, and we did enable it for
the H6. However, one of its side effect is that you can't have a
pinctrl node for a GPIO anymore (at least without significantly
reworking the GPIO API in the kernel).

We did enable it for the H6, since it didn't have any backward
compatibility to take care of, but it's disabled at the moment for all
the other SoCs to be able to flip that switch at some point. And
that's why we're moving away from it as well.

> >   - It's completely static: if one only wants to use the UART all the
> >   time, they would have to change the DTB, which might or might not be
> >   possible. Note that this could be trickier: why would you prevent the
> >   console from working for example if the audio support isn't built in?
> >   or as a module that might or might not be loaded?
>=20
> No, it's not that static:
> * Before the audio device probes, UART is active. (You want UART all the
>   time: Just prevent the audio module from loading.)

If the bootloader configured it that way, if the audio support was
compiled as a module and not builtin, or if no-one fiddles with that
pin for whatever reason. 1 and (especially) 2 are pretty big ifs.=20

> * When you have used audio and suddenly want to have UART instead: Just
>   unbind the audio device and set the gpio to low or input from userspace.
>   (I intended unbinding to be sufficient, but it seems pinctrl doesn't
>    set the pin back to input when it is freed and I don't see a straight
>    forward way to force that. I guess it is okay however: Somebody
>    switching between UART and audio regularly has to know about the
>    details anyway.)

And this one is going to be a nightmare for distros to discover :/

> I also tested suspend/resume/poweroff and it mostly works. The only
> glitch is, that during suspend there is a short period of UART noise
> on the HP. (But no such problem during resume or poweroff.) I suspect
> the regulator supplying the gpio bank is shut down quite early when
> suspending. It doesn't matter for this discussion: There likely would
> be the same behaviour with any other approach too.
>=20
> I think the real downside of this approach is, that using the UART
> makes the internal speakers/mic unuseable too.

That's also a pretty big issue.

> But we need a way to control the mux from userspace and aside from
> unbinding the ideas proposed thus far are:
>
> a) control the gpio directly
> b) control the gpio via leds-gpio
>=20
> (a) was dismissed because we can't set a default from DT
> (b) was dismissed because some rogue app might try to blink it
>=20
> The clean solution might be to write mux-gpio, which is actually
> identical to leds-gpio but lives in /sys/class/mux_switches/ and
> uses different filenames. But that's going down the "invent a new
> subsystem road", which I believe is overkill for what is a debugging
> facility for a single board.

I still believe we should aim at supporting this through pinctrl, and
adding an userspace API is definitely easier than a full subsystem.

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--z5xaxtwbz6nm3a4l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXGPnCgAKCRDj7w1vZxhR
xRYVAP9aN5xv6piEdObz9wKlMqZ8DWwYC6JTFtm2zks6oHaQlQD8CZd80xxbTYBf
qCIGLU7fxc+n9jaOzQF6MRmuoNjpAgk=
=D9Us
-----END PGP SIGNATURE-----

--z5xaxtwbz6nm3a4l--


--===============8096033062538905620==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8096033062538905620==--
