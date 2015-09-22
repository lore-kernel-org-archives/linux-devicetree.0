From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/3] mfd: axp20x: Rename supply names for AXP221 DC1SW
 and DC5LDO regulators
Date: Tue, 22 Sep 2015 23:06:49 +0100
Message-ID: <20150922220649.GJ3442@x1>
References: <1442372732-27434-1-git-send-email-wens@csie.org>
 <1442372732-27434-2-git-send-email-wens@csie.org>
 <20150920041722.GI3039@x1>
 <CAGb2v65pPzZsb0X5WQ6-X9tEqvNYYGPiLrKxR18+nZ0P4R-VCA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v65pPzZsb0X5WQ6-X9tEqvNYYGPiLrKxR18+nZ0P4R-VCA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Maxime Ripard <maxime.ripard@free-electrons.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sun, 20 Sep 2015, Chen-Yu Tsai wrote:

> Hi Lee,
>=20
> On Sun, Sep 20, 2015 at 12:17 PM, Lee Jones <lee.jones@linaro.org> wr=
ote:
> > On Wed, 16 Sep 2015, Chen-Yu Tsai wrote:
> >
> >> The DC1SW and DC5LDO regulators in the AXP221 are internally chain=
ed
> >> to DCDC1 and DCDC5, hence the names. The original bindings used th=
e
> >> parent regulator names for the supply regulator property. This cau=
ses
> >> some confusion when we actually use it in the dts:
> >>
> >>       axp221 {
> >>               /* self supplying? */
> >>               dcdc1-supply =3D <&dcdc1>;
> >>               dcdc5-supply =3D <&dcdc5>;
> >>
> >>               dcdc1: dcdc1 {
> >>                       ...
> >>               };
> >>
> >>               dcdc5: dcdc5 {
> >>                       ...
> >>               };
> >>       };
> >>
> >> Change them to the downstream regulator names, or "dc1sw" and "dc5=
ldo"
> >> respectively.
> >>
> >> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> >> ---
> >>  Documentation/devicetree/bindings/mfd/axp20x.txt | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > Applied, thanks.
>=20
> Mark (in his reply) has a point. If these are internally connect, we
> should just remove them from the bindings, and associate them in the
> driver.
>=20
> I'm looking into this. In the mean time, could you drop this one?

Patch removed.

> >> diff --git a/Documentation/devicetree/bindings/mfd/axp20x.txt b/Do=
cumentation/devicetree/bindings/mfd/axp20x.txt
> >> index 41811223e5be..8e79252b1e7c 100644
> >> --- a/Documentation/devicetree/bindings/mfd/axp20x.txt
> >> +++ b/Documentation/devicetree/bindings/mfd/axp20x.txt
> >> @@ -60,8 +60,8 @@ DCDC2               : DC-DC buck    : vin2-suppl=
y
> >>  DCDC3                : DC-DC buck    : vin3-supply
> >>  DCDC4                : DC-DC buck    : vin4-supply
> >>  DCDC5                : DC-DC buck    : vin5-supply
> >> -DC1SW                : On/Off Switch : dcdc1-supply          : DC=
DC1 secondary output
> >> -DC5LDO               : LDO           : dcdc5-supply          : in=
put from DCDC5
> >> +DC1SW                : On/Off Switch : dc1sw-supply          : DC=
DC1 secondary output
> >> +DC5LDO               : LDO           : dc5ldo-supply         : in=
put from DCDC5
> >>  ALDO1                : LDO           : aldoin-supply         : sh=
ared supply
> >>  ALDO2                : LDO           : aldoin-supply         : sh=
ared supply
> >>  ALDO3                : LDO           : aldoin-supply         : sh=
ared supply
> >

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
