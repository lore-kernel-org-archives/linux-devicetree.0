From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 2/2] dt: bindings: tps65217: add compatible property
 for subnodes
Date: Wed, 8 Oct 2014 11:47:17 +0100
Message-ID: <20141008104717.GG20647@lee--X1>
References: <1660410.j399mvljTo@lenovobook>
 <20141006212232.GF18035@lee--X1>
 <CAJKbBDCSrPd=JGP2sfk1D-eNf55iYBKUqBtqA=4m6r5xL6oYnQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAJKbBDCSrPd=JGP2sfk1D-eNf55iYBKUqBtqA=4m6r5xL6oYnQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Johannes Pointner <johannes.pointner@gmail.com>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 08 Oct 2014, Johannes Pointner wrote:

> 2014-10-06 23:22 GMT+02:00 Lee Jones <lee.jones@linaro.org>:
> > On Thu, 25 Sep 2014, Johannes Pointner wrote:
> >
> >> Add documentation for compatible property of subnodes.
> >>
> >> Signed-off-by: Johannes Pointner <johannes.pointner@br-automation.=
com>
> >> ---
> >>  Documentation/devicetree/bindings/regulator/tps65217.txt         =
| 7 ++++++-
> >>  .../devicetree/bindings/video/backlight/tps65217-backlight.txt   =
| 9 ++++++---
> >>  2 files changed, 12 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/regulator/tps65217.=
txt b/Documentation/devicetree/bindings/regulator/tps65217.txt
> >> index 4f05d20..8ae3a3b 100644
> >> --- a/Documentation/devicetree/bindings/regulator/tps65217.txt
> >> +++ b/Documentation/devicetree/bindings/regulator/tps65217.txt
> >> @@ -14,6 +14,9 @@ Required properties:
> >>  Optional properties:
> >>  - ti,pmic-shutdown-controller: Telling the PMIC to shutdown on PW=
R_EN toggle.
> >>
> >> +Required subnode properties:
> >> +- compatible: "ti,tps65217-pmic"
> >> +
> >>    The valid names for regulators are:
> >>    tps65217: dcdc1, dcdc2, dcdc3, ldo1, ldo2, ldo3 and ldo4
> >>
> >> @@ -23,9 +26,11 @@ Example:
> >>
> >>       tps: tps@24 {
> >>               compatible =3D "ti,tps65217";
> >> +             reg =3D <0x24>;
> >>               ti,pmic-shutdown-controller;
> >>
> >> -             regulators {
> >> +             tps_pmic: regulators {
> >
> > How is the tps_pmic label used?
> >
> >> +                     compatible =3D "ti,tps65217-pmic";
> >
> > I'd like to see a '\n' here.
> I will add a newline here.
> >
> >>                       dcdc1_reg: dcdc1 {
> >>                               regulator-min-microvolt =3D <900000>=
;
> >>                               regulator-max-microvolt =3D <1800000=
>;
> >> diff --git a/Documentation/devicetree/bindings/video/backlight/tps=
65217-backlight.txt b/Documentation/devicetree/bindings/video/backlight=
/tps65217-backlight.txt
> >> index 5fb9279..f92f154 100644
> >> --- a/Documentation/devicetree/bindings/video/backlight/tps65217-b=
acklight.txt
> >> +++ b/Documentation/devicetree/bindings/video/backlight/tps65217-b=
acklight.txt
> >> @@ -6,19 +6,22 @@ used to drive LEDs for use as backlights.
> >>  Required properties:
> >>  - compatible: "ti,tps65217"
> >>  - reg: I2C slave address
> >> -- backlight: node for specifying WLED1 and WLED2 lines in TPS6521=
7
> >> +- backlight: subnode for specifying WLED1 and WLED2 lines in TPS6=
5217
> >> +
> >> +Required subnode properties:
> >> +- compatible: "ti,tps65217-bl"
> >>  - isel: selection bit, valid values: 1 for ISEL1 (low-level) and =
2 for ISEL2 (high-level)
> >>  - fdim: PWM dimming frequency, valid values: 100, 200, 500, 1000
> >>  - default-brightness: valid values: 0-100
> >>
> >> -Each regulator is defined using the standard binding for regulato=
rs.
> >>
> >>  Example:
> >>
> >>       tps: tps@24 {
> >>               reg =3D <0x24>;
> >>               compatible =3D "ti,tps65217";
> >
> > I'd like to see a '\n' here.
> I will add a newline here.
> >
> >> -             backlight {
> >> +             tps_bl: backlight {
> >
> > Same here.  Is this label used?
> >
> >> +                     compatible =3D "ti,tps65217-bl";
> >>                       isel =3D <1>;  /* 1 - ISET1, 2 ISET2 */
> >>                       fdim =3D <100>; /* TPS65217_BL_FDIM_100HZ */
> >>                       default-brightness =3D <50>;
> >
>=20
> Regarding the labels: The backlight label could be used like the
> following. I use it like this in my tests with the tilcdc panel drive=
r
> which has a backlight support.
>=20
>     panel {
>         backlight =3D <&tps_bl>;
>=20
>         panel-info {
>             ac-bias        =3D <255>;
>             ac-bias-intrpt    =3D <0>;
>             dma-burst-sz    =3D <16>;
>             bpp        =3D <32>;
>             fdd        =3D <0x80>;
>             sync-edge    =3D <0>;
>             sync-ctrl    =3D <1>;
>             .
>             .
>             .
>=20
> I'm not sure if there could be actual use for the pmic label, but I
> thought if I add a label to backlight, I have to add one to the pmic
> too to keep it similar.

No, not at all.  If it's not used, you should remove it.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
