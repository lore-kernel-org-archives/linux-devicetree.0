From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH-V5 4/4] mfd: devicetree: bindings: Add new 88pm800 mfd
 binding
Date: Wed, 1 Jul 2015 08:43:08 +0100
Message-ID: <20150701074308.GD3210@x1>
References: <1435591877-18214-1-git-send-email-vaibhav.hiremath@linaro.org>
 <1435591877-18214-5-git-send-email-vaibhav.hiremath@linaro.org>
 <CAJKOXPfijVCgudEZXX+53zAaHiXsbL-eM4RHmP35cwgvxHr_XA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAJKOXPfijVCgudEZXX+53zAaHiXsbL-eM4RHmP35cwgvxHr_XA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof =?utf-8?Q?Koz=C5=82owski?= <k.kozlowski.k@gmail.com>
Cc: Vaibhav Hiremath <vaibhav.hiremath@linaro.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, sameo@linux.intel.com, yizhang@marvell.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 30 Jun 2015, Krzysztof Koz=C5=82owski wrote:

> 2015-06-30 0:31 GMT+09:00 Vaibhav Hiremath <vaibhav.hiremath@linaro.o=
rg>:
> > With addition of DT support to 88pm800 mfd driver, this patch
> > adds new DT binding documentation along with respective properties.
> >
> > Signed-off-by: Vaibhav Hiremath <vaibhav.hiremath@linaro.org>
>=20
> Looks okay,

You forgot to add your *-by.

> > ---
> >  Documentation/devicetree/bindings/mfd/88pm800.txt | 53 +++++++++++=
++++++++++++
> >  1 file changed, 53 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mfd/88pm800.t=
xt
> >
> > diff --git a/Documentation/devicetree/bindings/mfd/88pm800.txt b/Do=
cumentation/devicetree/bindings/mfd/88pm800.txt
> > new file mode 100644
> > index 0000000..dec842f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/88pm800.txt
> > @@ -0,0 +1,53 @@
> > +* Marvell 88PM80x Power Management IC
> > +
> > +Required parent device properties:
> > +- compatible           : "marvell,88pm800", "marvell,88pm805", "ma=
rvell,88pm860"
> > +- reg                  : the I2C slave address for the 88pm80x fam=
ily chip
> > +- interrupts           : IRQ line for the 88pm80x family chip
> > +- interrupt-controller : describes the 88pm80x family chip as an i=
nterrupt
> > +                         controller
> > +- #interrupt-cells     : should be 1.
> > +                         The cell is the 88pm80x local IRQ number
> > +
> > +88pm80x family of devices consists of varied group of sub-devices:
> > +
> > +Device                 Supply Names     Description
> > +------                 ------------     -----------
> > +88pm80x-onkey          :               : On key
> > +88pm80x-rtc            :               : RTC
> > +88pm80x-regulator      :               : Regulators
> > +
> > +Example:
> > +
> > +       pmic: 88pm800@30 {
> > +               compatible =3D "marvell,88pm800";
> > +               reg =3D <0x30>;
> > +               interrupts =3D <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
> > +               interrupt-parent =3D <&gic>;
> > +               interrupt-controller;
> > +               #interrupt-cells =3D <1>;
> > +
> > +               regulators {
> > +                       compatible =3D "marvell,88pm80x-regulator";
> > +
> > +                       buck1a: BUCK1A {
> > +                               regulator-name =3D "BUCK1A";
> > +                               regulator-min-microvolt =3D <600000=
>;
> > +                               regulator-max-microvolt =3D <180000=
0>;
> > +                               regulator-boot-on;
> > +                               regulator-always-on;
> > +                       };
> > +
> > +                       ldo1: LDO1 {
> > +                               regulator-name =3D "LDO1";
> > +                               regulator-min-microvolt =3D <170000=
0>;
> > +                               regulator-max-microvolt =3D <330000=
0>;
> > +                               regulator-boot-on;
> > +                               regulator-always-on;
> > +                       };
> > +               };
> > +
> > +               rtc {
> > +                       compatible =3D "marvell,88pm80x-rtc";
> > +               };
> > +       };
> >
> >
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
