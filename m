From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [linux-sunxi] Re: [PATCH] ARM: dts: sun8i: h3: Add dts file for
 Libre Computer Board ALL-H3-CC H3 ver.
Date: Tue, 28 Nov 2017 13:11:42 +0100
Message-ID: <20171128121142.pdk2yi2nklhf2iyg@flea.home>
References: <20171128041211.17375-1-wens@csie.org>
 <20171128084359.rzplftb3z53cgukp@flea.home>
 <CAGb2v67dg1dCw+n3aQ1aFqtZXU245v6jQ0E=4onPYjUOpUHjPw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="djupls66xhwzyywl"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v67dg1dCw+n3aQ1aFqtZXU245v6jQ0E=4onPYjUOpUHjPw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--djupls66xhwzyywl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 28, 2017 at 05:26:37PM +0800, Chen-Yu Tsai wrote:
> On Tue, Nov 28, 2017 at 4:43 PM, Maxime Ripard
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > Hi,
> >
> > On Tue, Nov 28, 2017 at 12:12:11PM +0800, Chen-Yu Tsai wrote:
> >> The Libre Computer Board ALL-H3-CC from Libre Technology is a Raspberry
> >> Pi B+ form factor single board computer based on the Allwinner H3 SoC.
> >> The board has 1GB DDR3 SDRAM, provided by 4 2Gb chips. The mounting ho=
les
> >> and connectors are in the exact same position as on the Raspberry Pi B=
+.
> >>
> >> Raspberry Pi B+ like peripherals supported on this board include:
> >>
> >>   - Power input through micro-USB connector (without USB OTG)
> >>   - Native 100 Mbps ethernet using the internal PHY, as opposed to
> >>     USB-based on the RPi
> >>   - 4x USB 2.0 host ports, directly connected to the SoC, as opposed to
> >>     being connected through a USB 2.0 hub on the RPi
> >>   - TV and audio output on a 3.5mm TRRS jack
> >>   - HDMI output
> >>   - Micro-SD card slot
> >>   - Standard RPi B+ GPIO header, with the standard peripherals routed =
to
> >>     the same pins.
> >>
> >>     * 5V, 3.3V power, and ground
> >>     * I2C0 on the H3 is routed to I2C1 pins on the RPi header
> >>     * I2C1 on the H3 is routed to I2C0 pins on the RPi header
> >>     * UART1 on the H3 is routed to UART0 pins on the RPi header
> >>     * SPI0 on the H3 is routed to SPI0 pins on the RPi header,
> >>       with GPIO pin PA17 replacing the missing Chip Select 1
> >>     * I2S1 on the H3 is routed to PCM pins on the RPi header
> >>
> >>   - Additional peripherals from the H3 are available on different pins.
> >>     These include I2S0, JTAG, PWM1, SPDIF, SPI1, and UART3
> >>
> >> In addition, there are a number of new features:
> >>
> >>   - Console UART header
> >>   - Consumer IR receiver
> >>   - Camera interface (not compatible with RPi)
> >>   - Onboard microphone
> >>   - eMMC expansion module port
> >>   - Heatsink mounting holes
> >>
> >> This patch adds a dts file for this board that enables all "onboard"
> >> peripherals currently supported. This means no display or camera
> >> support.
> >>
> >> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> >> ---
> >>
> >> There are two other variants [1] of this board, with different SoCs and
> >> DRAM configuration. But the board remains the same, thanks to the SoCs
> >> being pin compatible.
> >>
> >> Do we need different board compatible strings?
> >
> > Yes.
> >
> >> FWIW the soc compatible string already encodes the soc variant, and
> >> the DRAM stuff is handled by the bootloader. The filename also has
> >> the SoC family and chip name.  The displayed board model also has
> >> the SoC variant included. The board itself is named "ALL-H3-CC".
> >
> > The point of a board compatible is to identify the way a board
> > behaves. If we ever need to make any quirks for one particular board,
> > we have to have a compatible that uniquely identifies it.
> >
> > However, we can have an intermediate compatible as well to catch all
> > those similar boards.
> >
> > Something like:
> >    compatible =3D "libretech,h3-tritium", "libretech,tritium", "allwinn=
er,sun8i-h3";
>=20
> compatible =3D "libretech,all-h3-cc-h3", "libretech,all-h3-cc",
> "allwinner,sun8i-h3";
>=20
> (See below about the names.) Does that look confusing?

A bit. So they're all going to be called all-h3-cc, even if they don't
sport an H3?

> >
> >> I'm asking as we have the same issue with the Bananapi M2+ [2], where
> >> they've released new variants with different SoCs and DRAM capacities
> >> using the same board. Not sure if they are commercially available thou=
gh.
> >
> > You can have a look at the way we handled all the q8 tablets that were
> > pretty much in the same case. It's been working quite well.
>=20
> You mean the sun?i-reference-tablet-design.dtsi files? I'm thinking we
> might not have to go that far. The other variants could have:
>=20
>     #include "sun8i-h3-libretech-all-h3-cc.dts"
>     #include "sun8i-h5.dtsi"
>=20
>     And then override the board compatible and model.
>=20
> Might not work. I'm not sure at this moment.

It's proven to work quite well with the Q8 stuff. One thing that you
really want to pay attention to is that you wouldn't want to "leak"
devices from the H3 into the H5. I have the feeling that with that
kind of construct we will eventually, and this is much harder to do
with the Q8 stuff.

> >> +                     gpios =3D <&pio 0 7 GPIO_ACTIVE_HIGH>; /* PA7 */
> >> +             };
> >> +     };
> >> +
> >> +     gpio_keys {
> >> +             compatible =3D "gpio-keys";
> >> +
> >> +             recovery {
> >> +                     label =3D "recovery";
> >> +                     linux,code =3D <BTN_0>;
> >
> > How did you pick that keycode?
>=20
> It's the same as the Orange Pis. The board however does mark it as
> "Power Key". However the H3 (on mainline) does not have the ability
> to come back up once powered down, nor do we have the ability to
> power it off right now. (We could turn it off using "gpio-poweroff",
> though I'm sensing the GPIO usage would conflict with the regulator
> drivers.) I'll ask about the intended usage and behavior.

Ok, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--djupls66xhwzyywl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlodUnoACgkQ0rTAlCFN
r3SIYRAAlmQ83jc2ddIqMrxNRWsjQ7wqzNKdinAe98nrcc/fZ1Cc7zFUHs6IF6oq
6ZuZPfa8qrqhwYbPkKro2v8WLcCnZY38YOeklqhl9s6T/oQbGIxdj9NXilGGi1Q9
PHx5n5pYwks8ftNlq22L1QZ399k4vZGSp0ToCpHgvoqQ9nyNmMHF3uWHMfL38Qn4
GybPPyqh6uHf2V2H8IMEJMBJqtUfBe3e01icYEkBQvFh56sNybCsGmJTG2mOxxKH
VF3q+T+bMlGjkhOIWL5TomjhEkY5jpZu6G9y7F8HF36vV3c2+10Q1SvlHGO+RKrX
wGngaNLXTHBFZMi5xZB/AT5Pr1z+sO4eG/n2M3TPLdvjvWe+VJhbpTA61/TXr//g
HYntj9iJELl0nH50fc63rNUH+TKywgyekDNzjH82uEq5EbADUUhRbEUl3BAuBvlX
ctJrxRQdlmeIprVshNLPlC1KwVRfNjlRd1Kpg0WpAHRDkY4OlsuOY3L6fcLlCpJe
h9W74LykmSklDOHX9zL9Jq/Yml4UpWG1ahSWhkQRZgIBVh99wsmsQtb9Qlox8nbM
2xlbUgbO2jUn1gitr83V9F0C1dmNqIo1naLH4q9eSPOg5CH5PdBrFwt8d7acQ4qS
N7raN96l6p4N+wvbblRRAUgvKD6IAPdinMCaBQEMAu7mMcSKGwk=
=2klT
-----END PGP SIGNATURE-----

--djupls66xhwzyywl--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
