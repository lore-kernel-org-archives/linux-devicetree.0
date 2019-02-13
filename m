From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH RFC] arm64: dts: allwinner: a64: teres-i: Enable audio
Date: Wed, 13 Feb 2019 16:53:11 +0100
Message-ID: <20190213155311.ovkpim3lxwyvuhhj@flea>
References: <20190211111245.GA18147@lst.de>
 <E1gtBlV-0000Wl-Cv@stardust.g4.wien.funkfeuer.at>
 <20190211153945.e34fpwkuk67l7lc6@flea>
 <E1gtHJj-0000iY-G8@stardust.g4.wien.funkfeuer.at>
 <20190212083850.7genwc6ipnxtl7eo@flea>
 <E1gtUZn-0000NW-MA@stardust.g4.wien.funkfeuer.at>
 <20190212100929.iqsxu443qrkl6myf@flea>
 <E1gtds8-0000NB-Re@stardust.g4.wien.funkfeuer.at>
 <20190213094442.da2dy6d5bb527nft@flea>
 <E1gtsx9-0000RP-08@stardust.g4.wien.funkfeuer.at>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8099922158534419357=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <E1gtsx9-0000RP-08@stardust.g4.wien.funkfeuer.at>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, info@olimex.com, Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Torsten Duwe <duwe@lst.de>, ibu@radempa.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============8099922158534419357==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pnts26et4s5ojq4c"
Content-Disposition: inline


--pnts26et4s5ojq4c
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 13, 2019 at 12:43:46PM +0100, Harald Geyer wrote:
> Hi Maxime!
>=20
> Maxime Ripard writes:
> > On Tue, Feb 12, 2019 at 08:37:36PM +0100, Harald Geyer wrote:
> > > > There's a few issues with that approach as well:
> > > >=20
> > > >   - We're actively trying to remove the pinctrl nodes for the GPIOs
> > >=20
> > > For what reason? Maybe it doesn't apply to this usecase?
> >=20
> > This is kind of separate. At the moment, on all our SoCs but the H6,
> > requesting a pin to a separate state using pinctrl doesn't mark the
> > GPIO muxed on that pin as reserved, so through the GPIO userspace
> > interface (or calling gpio_request from within the kernel, but that
> > seems less of a risk) anyone is free to just request a GPIO on a pin
> > already requested, behind the consumer drivers' back. Which is pretty
> > bad.
>=20
> Really, I'm surprised. This is not the behaviour I remember from A20
> and A64. Indeed, testing this on teres with the debug detect pin claimed
> by audio, I get:
>=20
> root@teres:/sys/kernel/debug/pinctrl/1f02c00.pinctrl# cat pinmux-pins
> Pinmux settings per pin
> Format: pin (name): mux_owner|gpio_owner (strict) hog?
> pin 352 (PL0): device 1f03400.rsb function s_rsb group PL0
> pin 353 (PL1): device 1f03400.rsb function s_rsb group PL1
> pin 354 (PL2): GPIO 1f02c00.pinctrl:354
> pin 355 (PL3): UNCLAIMED
> pin 356 (PL4): UNCLAIMED
> pin 357 (PL5): UNCLAIMED
> pin 358 (PL6): UNCLAIMED
> pin 359 (PL7): GPIO 1f02c00.pinctrl:359
> pin 360 (PL8): GPIO 1f02c00.pinctrl:360
> pin 361 (PL9): device sound function gpio_out group PL9
> pin 362 (PL10): UNCLAIMED
> pin 363 (PL11): UNCLAIMED
> pin 364 (PL12): GPIO 1f02c00.pinctrl:364
> [...]
>=20
> root@teres:/sys/class/gpio# echo 361 >export
> bash: echo: Schreibfehler: Das Argument ist ung=FCltig.
>=20
> So I can't access this from sysfs, even though the error code is a
> bit odd: I'd expect EBUSY instead of EINVAL. I can export any of the
> UNCLAIMED pins/gpios.
>=20
> Trying with libgpiod as well, I see that the state of the pin is reported
> incorretly, but I still can't access it:
>=20
> gpiochip0 - 32 lines:
>         line   0:      unnamed       unused   input  active-high
>         line   1:      unnamed       unused   input  active-high
>         line   2:      unnamed      "reset"  output   active-low [used]
>         line   3:      unnamed       unused   input  active-high
>         line   4:      unnamed       unused   input  active-high
>         line   5:      unnamed       unused   input  active-high
>         line   6:      unnamed       unused   input  active-high
>         line   7:      unnamed  "usb1-vbus"  output  active-high [used]
>         line   8:      unnamed "Lid Switch"   input   active-low [used]
>         line   9:      unnamed       unused   input  active-high
>         line  10:      unnamed      "sysfs"   input  active-high [used]
>         line  11:      unnamed       unused   input  active-high
>         line  12:      unnamed     "enable"  output  active-high [used]
>         line  13:      unnamed       unused   input  active-high
>=20
> root@teres:~# gpioget 1f02c00.pinctrl 9
> gpioget: error reading GPIO values: Invalid argument
>=20
> On a pin exported to sysfs I get EBUSY as expected:
> root@teres:~# gpioget 1f02c00.pinctrl 10
> gpioget: error reading GPIO values: Device or resource busy
>=20
> And reading an unclaimed pin works as expected too:
> root@teres:~# gpioget 1f02c00.pinctrl 11
> 0
>=20
> Either I misunderstood what you have written or it isn't true.

This happens when you have a pin requested in pinctrl, but for a
function that isn't a GPIO, and you try to request the GPIO on that
pin. In you example, such a case can happen if you do sed
s/364/361/. Since this is the PMIC, you should probably test this on
some other device though :)

> > There's support for such a check in pinctrl, and we did enable it for
> > the H6. However, one of its side effect is that you can't have a
> > pinctrl node for a GPIO anymore (at least without significantly
> > reworking the GPIO API in the kernel).
>=20
> Can you point me to some background reading?

Background reading for what?

> > We did enable it for the H6, since it didn't have any backward
> > compatibility to take care of, but it's disabled at the moment for all
> > the other SoCs to be able to flip that switch at some point. And
> > that's why we're moving away from it as well.
>=20
> Well ... that's good to know, because I have a couple of custom DTs
> with pinctrl nodes for a GPIO. I think it should be documented as
> deprecated in the binding then.

It's not documented anywhere that we need it.

> Also I wonder how I can select drive strength or bias on a gpio line when
> I can't use pinctrl with them anymore.

That's one of the items we need to take care of as well, yes, but that
can be handled through a GPIO flag in the descriptor.

There's a series currently taking care of the bias:
https://www.spinics.net/lists/linux-gpio/msg36444.html

> > > I think the real downside of this approach is, that using the UART
> > > makes the internal speakers/mic unuseable too.
> >=20
> > That's also a pretty big issue.
>=20
> I certainly agree it's unfortunate.
>=20
> > > But we need a way to control the mux from userspace and aside from
> > > unbinding the ideas proposed thus far are:
> > >
> > > a) control the gpio directly
> > > b) control the gpio via leds-gpio
> > >=20
> > > (a) was dismissed because we can't set a default from DT
> > > (b) was dismissed because some rogue app might try to blink it
> > >=20
> > > The clean solution might be to write mux-gpio, which is actually
> > > identical to leds-gpio but lives in /sys/class/mux_switches/ and
> > > uses different filenames. But that's going down the "invent a new
> > > subsystem road", which I believe is overkill for what is a debugging
> > > facility for a single board.
> >=20
> > I still believe we should aim at supporting this through pinctrl, and
> > adding an userspace API is definitely easier than a full subsystem.
>=20
> Getting everybody to agree on a new API (especially a userspace ABI)
> is a major headache (and rightly so, we want to get something right on
> the first attempt that is going to stay around forever). I don't think
> some quirky debugging feature is worth the effort.
>=20
> And frankly I don't care much about audio on the teres. I started
> working on this because I feel kind of responsible for keeping the
> teres DT up-to-date with what the kernel can support. But if the
> kernel can't support it ATM: so be it.
>=20
> As a compromise I think we could add all the nodes to the DT but mark
> their status as "disabled". That would help everybody wanting to enable
> audio but still be technically correct.

I understand if you don't want to go after that goal yourself, but
that doesn't sound practical either. Especially since the A64, more
and more people are putting the DT in a ROM, so we can't just change
it as we wish.

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--pnts26et4s5ojq4c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXGQ9ZwAKCRDj7w1vZxhR
xQlpAQC3s6S/lLzl83oKK2k2zpnP0DeHzIw66883WEJbGlS6sAD/YDWhze+xFv1m
LBmuyFXnY+ikSZYayjToROQyTXWjAQU=
=bH6b
-----END PGP SIGNATURE-----

--pnts26et4s5ojq4c--


--===============8099922158534419357==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8099922158534419357==--
