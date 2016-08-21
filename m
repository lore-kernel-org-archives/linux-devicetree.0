From: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Subject: Re: [PATCH 0/9] mfd: axp20x: Add support for AXP809 PMIC
Date: Sun, 21 Aug 2016 09:51:25 +0300
Message-ID: <1471762285.581.1.camel@plaes.org>
References: <20160821021125.1521-1-wens@csie.org>
Reply-To: plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDJLTBEBXENBBDM74W6QKGQEYRNIDBY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20160821021125.1521-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: wens-jdAy2FN1RRM@public.gmane.org, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, 2016-08-21 at 10:11 +0800, Chen-Yu Tsai wrote:
> Hi everyone,
>=20
> This series adds support for X-Powers' AXP806 PMIC. This is the
> secondary
> PMIC accompanying Allwinner's A80 SoC. For now, only the regulators
> are
> supported. While the AXP806 supports standalone operation, no
> hardware
> exists, so this will not be supported.

Title says AXP809, but in text and in subsequent patches there's also
806/809 confusion.

>=20
> Patch 1 adds AXP806 to the axp20x bindings.
>=20
> Patch 2 adds AXP806 support to the axp20x mfd driver.
>=20
> Patch 3 fixes regulator output adjustment during regulator
> registration
> so it doesn't fail if the higher or lower bounds of its voltage
> constraints
> don't match up with the regulator's voltage granularity.
>=20
> Patch 4 adds AXP806 support to the axp20x regulator driver.
>=20
> Patch 5 adds the unused SW switch output of the AXP809 PMIC on the
> A80
> Optimus board. This was accidentally left out of the AXP809 series.
>=20
> Patch 6 adds the unused SW switch output of the AXP809 PMIC on the
> Cubieboard 4. This was accidentally left out of the AXP809 series.
>=20
> Patch 7 enables AXP809 support on the A80 Optimus board.
>=20
> Patch 8 enables AXP809 support on the Cubieboard 4.
>=20
> Patch 9 disables EHCI1 on the A80 Optimus board.
>=20
>=20
> Regards
> ChenYu
>=20
> Chen-Yu Tsai (9):
> =C2=A0 mfd: axp20x: Add bindings for AXP806 PMIC
> =C2=A0 mfd: axp20x: Add support for AXP806 PMIC
> =C2=A0 regulator: core: Try full range when adjusting regulators to
> =C2=A0=C2=A0=C2=A0=C2=A0constraints
> =C2=A0 regulator: axp20x: support AXP806 variant
> =C2=A0 ARM: dts: sun9i: a80-optimus: Declare AXP809 SW regulator as unuse=
d
> =C2=A0 ARM: dts: sun9i: cubieboard4: Declare AXP809 SW regulator as unuse=
d
> =C2=A0 ARM: dts: sun9i: a80-optimus: Add AXP806 PMIC device node and
> =C2=A0=C2=A0=C2=A0=C2=A0regulators
> =C2=A0 ARM: dts: sun9i: cubieboard4: Add AXP806 PMIC device node and
> =C2=A0=C2=A0=C2=A0=C2=A0regulators
> =C2=A0 ARM: dts: sun9i: a80-optimus: Disable EHCI1
>=20
> =C2=A0Documentation/devicetree/bindings/mfd/axp20x.txt |=C2=A0=C2=A028 ++=
+++-
> =C2=A0arch/arm/boot/dts/sun9i-a80-cubieboard4.dts=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0| 116
> +++++++++++++++++++++
> =C2=A0arch/arm/boot/dts/sun9i-a80-optimus.dts=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 123
> ++++++++++++++++++++++-
> =C2=A0drivers/mfd/axp20x-rsb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A01 +
> =C2=A0drivers/mfd/axp20x.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A072 +++++=
++++++++
> =C2=A0drivers/regulator/axp20x-regulator.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 117
> +++++++++++++++++++--
> =C2=A0drivers/regulator/core.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A08 +-
> =C2=A0include/linux/mfd/axp20x.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A060 +++++++++++
> =C2=A08 files changed, 508 insertions(+), 17 deletions(-)
>=20
> --=C2=A0
> 2.9.3
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
