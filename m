Return-Path: <SRS0=klaB=NZ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr60086.outbound.protection.outlook.com ([40.107.6.86]:43168
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725952AbeKOJ6f (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 15 Nov 2018 04:58:35 -0500
From: Khalil Blaiech <kblaiech@mellanox.com>
Subject: RE: [PATCH 2/2] dt-bindings: i2c: I2C binding for Mellanox BlueField
 SoC
Date: Wed, 14 Nov 2018 23:53:01 +0000
Message-ID: <VI1PR05MB4271E85F07AF47B7D7FA8398A6C30@VI1PR05MB4271.eurprd05.prod.outlook.com>
References: <cover.1541174814.git.kblaiech@mellanox.com>
 <894b09ec9b4a18c91c3573145c59b8ff41c8ea04.1541174814.git.kblaiech@mellanox.com>
 <5bea0e9e.1c69fb81.dad72.3ca2@mx.google.com>
In-Reply-To: <5bea0e9e.1c69fb81.dad72.3ca2@mx.google.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Wolfram Sang <wsa@the-dreams.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, David Woods <dwoods@mellanox.com>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Rob,

Thank you, for having taken the time to review this change and providing
feedback.

> On Fri, Nov 02, 2018 at 12:53:11PM -0400, Khalil Blaiech wrote:
> > Added device tree bindings documentation for Mellanox BlueField I2C
> > SMBus controller.
> >
> > Reviewed-by: David Woods <dwoods@mellanox.com>
> > Signed-off-by: Khalil Blaiech <kblaiech@mellanox.com>
> > ---
> >  .../devicetree/bindings/i2c/mellanox,i2c-mlx.txt   | 58
> ++++++++++++++++++++++
> >  1 file changed, 58 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/i2c/mellanox,i2c-mlx.txt
> >
> > diff --git
> > a/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlx.txt
> > b/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlx.txt
> > new file mode 100644
> > index 0000000..49c9e2f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlx.txt
> > @@ -0,0 +1,58 @@
> > +Device tree configuration for the Mellanox I2C SMBus on BlueField
> > +SoCs
> > +
> > +Required Properties:
> > +- reg        : address offset and range of bus device registers
>=20
> Need to enumerate the exact list.

Okay.

>=20
> > +- compatible : should be "mellanox,i2c-mlx"
>=20
> Kind of generic.

Please note that we do not provide identifier/serial number for our I2C
device. I can think of  "mellanox,i2c-mlxbf" instead where "bf" refers to
our SoC.  Is this less generic?

>=20
> > +- interrupts : interrupt number
> > +- bus        : hardware bus identifier. BlueField ARM side has three b=
us
> > +               controllers; thus, values might be 0, 1, or 2
>=20
> We don't do bus indexes in DT.

Actually, it is critical for us to know what bus we are using and/or exposi=
ng
to user space; we rely on the bus identifier to match the hardware block.
On the other hand, we don't want to put complex logic in the driver because
it may require hardcoding memory region addresses. And we don't want to
do that, right?

So, maybe we should redefine it? And refer to with different property name.=
..

>=20
> > +- profile    : device profile. This ensures compatibility between actu=
al
> > +               driver and ACPI/DT. The most recent profile is "mlnx-bf=
18"
>=20
> What? compatible is what that is for.

Sorry! Totally agree. I'll get rid of it.

>=20
> > +
> > +Optional Properties:
> > +- bus-freq   : bus frequency used to configure timing registers; allow=
ed
> > +               values are 100, 400 and 1000; those are expressed in
> > +KHz
>=20
> clock-frequency (in Hz) is the standard property for this.

Okay

>=20
> > +
> > +Examples:
> > +
> > +i2c0 {
> > +	compatible =3D "mellanox,i2c-mlx";
> > +	reg =3D <0x02804000 0x800>,	/* Smbus[0]        */
> > +              <0x02801200 0x020>, 	/* Cause Master[0] */
> > +              <0x02801260 0x020>, 	/* Cause Slave[0]  */
> > +              <0x02801300 0x010>, 	/* Cause Coalesce  */
>=20
> > +              <0x02802000 0x100>, 	/* GPIO 0          */
> > +              <0x02800358 0x008>; 	/* CorePll         */
>=20
> Are these 2 really part of the I2C block?

Our hardware design is quite complex, roughly, we have kind of
centralized block which contains multiple sub-blocks. These regs
are shared among the I2C controllers (i.e., sub-blocks).  These
are needed during device initialization.
You'll also notice the "Cause Coalesce" above.  =20

>=20
> > +	interrupts =3D <57>;
> > +	bus =3D <1>;
> > +	bus-freq =3D <100>;
> > +	profile =3D "mlnx-bf18";
> > +};
> > +
> > +i2c1 {
>=20
> These 2 examples don't add anything. Remove them.

Okay.

>=20
> > +	compatible =3D "mellanox,i2c-mlx";
> > +	reg =3D <0x02804800 0x800>,	/* Smbus[1]        */
> > +              <0x02801220 0x020>, 	/* Cause Master[1] */
> > +              <0x02801280 0x020>, 	/* Cause Slave[1]  */
> > +              <0x02801300 0x010>, 	/* Cause Coalesce  */
> > +              <0x02802000 0x100>, 	/* GPIO 0          */
> > +              <0x02800358 0x008>; 	/* CorePll         */
> > +	interrupts =3D <57>;
> > +	bus =3D <1>;
> > +	bus-freq =3D <100>;
> > +	profile =3D "mlnx-bf18";
> > +};
> > +
> > +i2c2 {
> > +	compatible =3D "mellanox,i2c-mlx";
> > +	reg =3D <0x02805000 0x800>,	/* Smbus[2]        */
> > +              <0x02801240 0x020>, 	/* Cause Master[2] */
> > +              <0x028012a0 0x020>, 	/* Cause Slave[1]  */
> > +              <0x02801300 0x010>, 	/* Cause Coalesce  */
> > +              <0x02802000 0x100>, 	/* GPIO 0          */
> > +              <0x02800358 0x008>; 	/* CorePll         */
> > +	interrupts =3D <57>;
> > +	bus =3D <2>;
> > +	bus-freq =3D <400>;
> > +	profile =3D "mlnx-bf18";
> > +};
> > --
> > 2.1.2
> >

Regards,
-Khalil
