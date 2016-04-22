From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/4] dt-bindings: Add jdi lt070me05000 panel bindings
Date: Fri, 22 Apr 2016 13:59:13 +0200
Message-ID: <20160422115913.GH9047@ulmo.ba.sec>
References: <20160414171500.GA11505@rob-hp-laptop>
 <1461144755-10633-1-git-send-email-simhavcs@gmail.com>
 <1461144755-10633-2-git-send-email-simhavcs@gmail.com>
 <20160421154546.GA20028@rob-hp-laptop>
 <CAGWqDJ697YTCK8hGFzODCM0q-3ReOgb3qWTYnsuYWzPLqFqxBw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cfJ13FhsvNR/yOpm"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGWqDJ697YTCK8hGFzODCM0q-3ReOgb3qWTYnsuYWzPLqFqxBw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinay Simha <simhavcs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "open list:DRM PANEL DRIVERS" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Sumit.semwal" <sumit.semwal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Archit Taneja <archit.taneja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--cfJ13FhsvNR/yOpm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 22, 2016 at 12:25:52PM +0530, Vinay Simha wrote:
> On Thu, Apr 21, 2016 at 9:15 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> > On Wed, Apr 20, 2016 at 03:02:31PM +0530, Vinay Simha BN wrote:
> >> Add documentation for lt070me05000 panel
> >>
> >> Signed-off-by: Vinay Simha BN <simhavcs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >> ---
> >>  .../bindings/display/panel/jdi,lt070me05000.txt    | 43 +++++++++++++=
+++++++++
> >>  1 file changed, 43 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/display/panel/jd=
i,lt070me05000.txt
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/panel/jdi,lt070=
me05000.txt b/Documentation/devicetree/bindings/display/panel/jdi,lt070me05=
000.txt
> >> new file mode 100644
> >> index 0000000..ffe0550
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000=
=2Etxt
> >> @@ -0,0 +1,43 @@
> >> +JDI model LT070ME05000 1200x1920 7" DSI Panel
> >> +
> >> +Required properties:
> >> +- compatible: should be "jdi,lt070me05000"
> >> +- power-supply: phandle of the regulator that provides the supply vol=
tage
> >> +  IOVCC , power supply for LCM (1.8V)
> >> +- vddp-supply: phandle of the regulator that provides the supply volt=
age
> >> +  Power IC supply (3-5V)
> >> +- dcdc_en-supply: phandle of the regulator that provides the supply v=
oltage
> >> +  Power IC supply enable, High active
> >> +- reset-gpio: phandle of gpio for reset line
> >> +  This should be 8mA, gpio can be configured using mux and pinctrl.
> >> +  XRES, Reset, Low active
> >> +- enable-gpio: phandle of gpio for enable line
> >> +  LED_EN, LED backlight enable, High active
> >
> > These should all be -gpios instead.
> will implement in v3
> >
> >> +- vcc-gpio: phandle of regulator/gpio that provides the supply voltage
> >> +  VDD, LED power supply (3-5V)
> >
> > Is it a regulator or gpio?
> >
> VDD is LED power supply, but in nexus 7 2nd gen they are using gpio 23
> instead of regulator.
> if we use vcc-supply, not sure we can give the gpio device tree entry
> to it in nexus 7 dts. Any inputs ?

You can model it as a fixed regulator that's enabled by a GPIO. See:

	Documentation/devicetree/bindings/regulator/fixed-regulator.txt

> >> +
> >> +Optional properties:
> >> +- pwm-gpio: phandle of gpio/pwm
> >
> > This should use the PWM binding. It may not be a GPIO on some hosts.
>=20
> pwm-gpio will go to the backlight (pwm). right now it is not used
> since pwm pm8921 upstream driver is not yet implemented. Shall i
> remove this pwm-gpio now and the backlight property when pwm pm8921 is
> implemented?

This suggests to me that you don't have a good idea yet what the final
binding would need to look like, so it might be better to get all the
dependencies in place first so that the binding can be validated to work
properly.

Thierry

--cfJ13FhsvNR/yOpm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXGhIQAAoJEN0jrNd/PrOhHBUP+wbmmTsDQ6bizyRTdWfq9GQZ
2n9IPF931PPChZxCLCa3Cp8uaq+g3gmIDtuTy3QWw75RQhk0DN6A0oOaaXq37pQ8
zx3mWIO1+FN4VytccuAcOY4b293FTfZy28nBZWSyvk2vPJv63W3+zj7w1hbf1eda
5Ymc/X7V2vU8ezDeqJutAv9hTzAa/teEQpmHoU8N74oQlphT1s/ofBhBVC4o7KKn
HNPityf8mOlY3e7S0z2g1gJ7XZdCyVCJu2ZGQP8bTlPRA+tsd5qejoIhgdQFtkdc
HfnbfB/AGOykN3X2YhNu54PfOlHBDFI1V2SPdBXXpppL4h4CgHm9BlJwiV1NWBG3
D9W3Gn/n1RXx5/ObIQ4AglR+thA0cFvynl8PJtUnnzmp9dF/509ZwUpZ22ABhLe5
ue4DNn+NNEV55EiZIUEYiFnYVRnJ9Jv5JWinEUvIBHV4Qnc15cVLfQaz9xI3gd7d
2AF8+ARAcLaa/Q2n9zGASHuLSORtfAY8xTWJ+c3DRekNuj3vVUM9N6m60m02F3wJ
lMAiDuLo3cpqEn9qF6P8wiZ9t288+Ckt0U+uwP55yKv0eEDm28638z/2DiD/lQ1G
9Bqs5k/b4C9FXfLCxoTB0EdkMuyn5tpYxEj79qTv6286sZe15PBlp4spxOVnxgIw
ZX3WZUSJV7FHNm3Ebx56
=jywe
-----END PGP SIGNATURE-----

--cfJ13FhsvNR/yOpm--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
