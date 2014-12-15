From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH RESEND v2] mfd: syscon: add child device support
Date: Mon, 15 Dec 2014 09:58:19 +0000
Message-ID: <20141215095819.GB7972@x1>
References: <1417451138-13583-1-git-send-email-p.zabel@pengutronix.de>
 <1418636633.3193.3.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1418636633.3193.3.camel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Flora Fu <flora.fu@mediatek.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

On Mon, 15 Dec 2014, Philipp Zabel wrote:
> Am Montag, den 01.12.2014, 17:25 +0100 schrieb Philipp Zabel:
> > For devices which have a complete register for themselves, it is po=
ssible to
> > place them next to the syscon device with overlapping reg ranges. T=
he same is
> > not possible for devices which only occupy bitfields in registers s=
hared with
> > other users.
> > For devices that are completely controlled by bitfields in the sysc=
on address
> > range, such as multiplexers or voltage regulators, allow to put chi=
ld devices
> > into the syscon device node.
>=20
> What is the status of this patch?
> Is this ok to be applied after the merge window closes?
>=20
> For reference, these are the previous threads:
> https://lkml.org/lkml/2014/5/27/422
> https://lkml.org/lkml/2014/11/3/134

As this is such an important driver I need more Acks for users/testers
and senior reviewers before applying.

> > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > ---
> > Changes since v1:
> >  - Reworded binding documentation to allow #size-cells =3D <1>, whi=
ch is useful
> >    for syscon children that are controlled through a (possibly shar=
ed) register
> >    range.
> > ---
> >  Documentation/devicetree/bindings/mfd/syscon.txt | 13 ++++++++++++=
+
> >  drivers/mfd/syscon.c                             |  3 +++
> >  2 files changed, 16 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/mfd/syscon.txt b/Doc=
umentation/devicetree/bindings/mfd/syscon.txt
> > index fe8150b..0c6b497 100644
> > --- a/Documentation/devicetree/bindings/mfd/syscon.txt
> > +++ b/Documentation/devicetree/bindings/mfd/syscon.txt
> > @@ -9,12 +9,25 @@ using a specific compatible value), interrogate t=
he node (or associated
> >  OS driver) to determine the location of the registers, and access =
the
> >  registers directly.
> > =20
> > +Optionally, devices that are controlled exclusively through syscon=
 registers,
> > +or even bitfields in shared syscon registers, can also be added as=
 child nodes
> > +to the syscon device node. These devices can implicitly assume the=
ir parent
> > +node is a syscon provider without referencing it explicitly via ph=
andle.
> > +In this case, the syscon node should have #address-cells =3D <1> a=
nd
> > +#size-cells =3D <0> or <1> and no ranges property.
> > +
> >  Required properties:
> >  - compatible: Should contain "syscon".
> >  - reg: the register region can be accessed from syscon
> > =20
> > +Optional properties:
> > +- #address-cells: Should be 1.
> > +- #size-cells: Should be 0 or 1.
> > +
> >  Examples:
> >  gpr: iomuxc-gpr@020e0000 {
> > +	#address-cells =3D <1>;
> > +	#size-cells =3D <0>;
> >  	compatible =3D "fsl,imx6q-iomuxc-gpr", "syscon";
> >  	reg =3D <0x020e0000 0x38>;
> >  };
> > diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
> > index ca15878..38da178 100644
> > --- a/drivers/mfd/syscon.c
> > +++ b/drivers/mfd/syscon.c
> > @@ -155,6 +155,9 @@ static int syscon_probe(struct platform_device =
*pdev)
> > =20
> >  	dev_dbg(dev, "regmap %pR registered\n", res);
> > =20
> > +	if (!of_device_is_compatible(pdev->dev.of_node, "simple-bus"))
> > +		of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
> > +
> >  	return 0;
> >  }
> > =20
>=20
>=20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
