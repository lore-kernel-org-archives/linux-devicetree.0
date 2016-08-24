From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RESEND] [PATCH v2 2/4] dt-bindings: Add jdi lt070me05000 panel
 bindings
Date: Wed, 24 Aug 2016 14:32:46 +0200
Message-ID: <20160824123246.GA3714@ulmo.ba.sec>
References: <1469978126-925-1-git-send-email-simhavcs@gmail.com>
 <1469978126-925-2-git-send-email-simhavcs@gmail.com>
 <20160824114534.GA3169@ulmo.ba.sec>
 <CAGWqDJ7L3DPKo9iHT4+FZvksO8hbwQ4Zfb5qVrTEwmYcXb_U2A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="pWyiEgJYm5f9v55/"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGWqDJ7L3DPKo9iHT4+FZvksO8hbwQ4Zfb5qVrTEwmYcXb_U2A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinay Simha <simhavcs@gmail.com>
Cc: Archit Taneja <archit.taneja@gmail.com>, John Stultz <john.stultz@linaro.org>, Sumit Semwal <sumit.semwal@linaro.org>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 24, 2016 at 05:34:55PM +0530, Vinay Simha wrote:
> thierry,
>=20
> this is the reference pinouts of the panel
> http://www.tonylabs.com/wp-content/uploads/LT070ME05000-pinouts.jpg

I can't open that file.

> as you suggest , i will change the vcc-supply,
>=20
>  - iovcc-supply: phandle of the regulator that supplies power to
>           the IOVCC voltage input (1.8 V)
>=20
> will keep the other two(vddp-supply, dcdc_en-supply) remaining same.

"dcdc_en" sounds to me like it should be a GPIO rather than a regulator.

According to this datasheet:

	http://kb.52solution.com/data/uploads/2016/04/07/3172846545705cc22d050e.pdf

the input voltages are indeed VDD, VDDp and IOVCC, though with slightly
larger tolerances than the previous datasheet. VDD and VDDp can both go
=66rom 3.0 V to 5.0 V. DCDC_EN is indeed an additional GPIO to enable the
VDDp supply.

I think you'd need something along these lines:

	- vdd-supply: LED power supply (3.0-5.0 V)
	- vddp-supply: power IC supply (3.0-5.0 V)
	- iovcc-supply: LCM power supply (1.8 V)
	- dcdc-en-gpios: power IC supply enable
	- led-en-gpios: LED backlight enable

Or perhaps your vddp-supply should be a regulator that's controlled by
the GPIO that you'd put in dcdc-en-gpios. That might work better. That
would leave only led-en-gpios as the only enable GPIOs property, so it
would be okay to keep the name "enable-gpios", I guess.

Thierry

> On Wed, Aug 24, 2016 at 5:15 PM, Thierry Reding
> <thierry.reding@gmail.com> wrote:
> > On Sun, Jul 31, 2016 at 08:45:21PM +0530, Vinay Simha BN wrote:
> >> Add documentation for lt070me05000 panel
> >>
> >> Cc: Archit Taneja <archit.taneja@gmail.com>
> >> Cc: John Stultz <john.stultz@linaro.org>
> >> Cc: Thierry Reding <thierry.reding@gmail.com>
> >> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> >> Signed-off-by: Vinay Simha BN <simhavcs@gmail.com>
> >> Acked-by: Rob Herring <robh@kernel.org>
> >>
> >> ---
> >> v2:
> >>  * incorporated rob herring and thierry reviews
> >>    gpio to gpios, gpio to regulator using fixed regulators
> >>    and pwm backlight is removed, since it is controlled by
> >>    dcs commands
> >> ---
> >>  .../bindings/display/panel/jdi,lt070me05000.txt    | 57 +++++++++++++=
+++++++++
> >>  1 file changed, 57 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/display/panel/jd=
i,lt070me05000.txt
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/panel/jdi,lt070=
me05000.txt b/Documentation/devicetree/bindings/display/panel/jdi,lt070me05=
000.txt
> >> new file mode 100644
> >> index 0000000..613b76f
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000=
=2Etxt
> >> @@ -0,0 +1,57 @@
> >> +JDI model LT070ME05000 1200x1920 7" DSI Panel
> >> +
> >> +Required properties:
> >> +- compatible: should be "jdi,lt070me05000"
> >> +- vddp-supply: phandle of the regulator that provides the supply volt=
age
> >> +  Power IC supply (3-5V)
> >> +- dcdc_en-supply: phandle of the regulator that provides the supply v=
oltage
> >> +  Power IC supply enable, High active
> >> +- vcc-supply: phandle of the regulator that provides the supply volta=
ge
> >> +  IOVCC , power supply for LCM (1.8V)
> >
> > I was just going to apply this and wanted to add some information about
> > how many lanes the panel uses, so I looked at the datasheet linked to in
> > patch 4/4:
> >
> >         http://panelone.net/en/7-0-inch/JDI_LT070ME05000_7.0_inch-datas=
heet
> >
> > and noticed that the power supplies in the binding here don't match the
> > ones listed in the datasheet. Granted, the datasheet is somewhat meager,
> > but it lists the following three input voltages:
> >
> >         - IOVCC at 1.8 V
> >         - VDD at 3.0 V
> >         - VDDP at 3.0 V
> >
> > This matches in part what the above binding describes, but it's not
> > quite right, so I'm wondering if the name for dcdc_en-supply came from
> > the board schematics and reflects the name of the rail on the board
> > design that provides this rather than the input voltage on the panel.
> >
> > I think we should follow the names in the panel datasheet so that people
> > can more easily reference the correct regulators when using this panel
> > on a different board. I'd suggest:
> >
> >         - iovcc-supply: phandle of the regulator that supplies power to
> >           the IOVCC voltage input (1.8 V)
> >         - vdd-supply: phandle of the regulator that supplies power to
> >           the VDD voltage input (3.0 V)
> >         - vddp-supply: phandle of the regulator that supplies power to
> >           the VDDP voltage input (3.0 V)
> >
> > Any objections?
> >
> > Thierry
>=20
>=20
>=20
> --=20
> regards,
> vinaysimha

--pWyiEgJYm5f9v55/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXvZPsAAoJEN0jrNd/PrOhZsoP/jf8If5+EBAouj9ULwD0Mfum
O9JCRyD7JUJOxbgzmOn2LI0uwovZHKQfBDk2tGqFkxG+uYPqniosfNq3AWGg7OqW
DYpNQmXWbMyKxTe1m7Rwz7byikhZvXNWpHDBKYQXRTMQvNH6CunAsiU2JhoHznVh
ag05fLEuH/s5iQrW4T63GBpiMSUDnQ6HxCfi6ieSzpqZEy72Gm8CxHjEN1mx5Vof
Xkyvzodf127sRSp463Y8RYs6XtOhSzseIV7uNWzBd9hqfimPeqzooY+5gTDfV6BR
l7BgKazDqQJrm121Iy1WuX/Uo22WjxdCjhyMBbdLrJrPfjpgaEPSQM3hN3LjLhr+
/D9XJVLGM6K68AkVh6RiHlS2Alp1O8OxptJRt2HQbxdnKqx2aQT03s7mkH+DJXdf
aSskmyQmr738QdwEFSi3lhUM/HL1W/3rEsmei7HVt1znzUjwow2xX69lSmIu9Gze
ywFQYMz5UC82atn9yk8c1e/aSyFYNilsTrDMMz8y8b5FazZhXAH4T+82GfNxEV7+
nrTzXz6q/fCzh1IRNuDRuPCzYitHZJqvd5sL43At/gYZnLLW23CZHXf6Q4B75yen
UA6Lx5jFn8hDZBfw+6sIcpqsmXLMiVN4C7XC1NOHimSalIOTaHOHbBZJLFRFHu4R
tJexLWNsGazZTGF66YcD
=gvSc
-----END PGP SIGNATURE-----

--pWyiEgJYm5f9v55/--
