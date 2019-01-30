Return-Path: <SRS0=IkuC=QG=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr50071.outbound.protection.outlook.com ([40.107.5.71]:34112
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732323AbfA3Sbu (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 30 Jan 2019 13:31:50 -0500
From: Khalil Blaiech <kblaiech@mellanox.com>
Subject: RE: [PATCH v2 2/2] dt-bindings: i2c: I2C binding for Mellanox
 BlueField SoC
Date: Wed, 30 Jan 2019 18:31:46 +0000
Message-ID: <VI1PR05MB427177E87A574AF126F4E169A6900@VI1PR05MB4271.eurprd05.prod.outlook.com>
References: <cover.1543941145.git.kblaiech@mellanox.com>
 <559a79756c9da9a7b188ffa141a2056a83c60de6.1543941145.git.kblaiech@mellanox.com>
 <20181218155304.GA31027@bogus>
In-Reply-To: <20181218155304.GA31027@bogus>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Wolfram Sang <wsa@the-dreams.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, David Woods <dwoods@mellanox.com>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Rob,

Apologies for the late reply. It wasn't that easy to address your comments
and revisit the design of the driver. Please note that I applied the necess=
ary
changes and submitted a V3.

> On Tue, Dec 04, 2018 at 12:40:58PM -0500, Khalil Blaiech wrote:
> > Added device tree bindings documentation for Mellanox BlueField I2C
> > SMBus controller.
> >
> > Reviewed-by: David Woods <dwoods@mellanox.com>
> > Signed-off-by: Khalil Blaiech <kblaiech@mellanox.com>
> > ---
> >  .../devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt | 67
> > ++++++++++++++++++++++
> >  1 file changed, 67 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt
> >
> > diff --git
> > a/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt
> > b/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt
> > new file mode 100644
> > index 0000000..61a8037
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt
> > @@ -0,0 +1,67 @@
> > +Device tree configuration for the Mellanox I2C SMBus on BlueField
> > +SoCs
> > +
> > +Required Properties:
> > +- reg        :	address offset and length of the device registers. The
> > +		registers consists of a set of dedicated and shared
> > +	       	resources:
>=20
> mixed tab and spaces.

Removed the spaces and used tabs instead (sorry about that).

>=20
> > +
> > +			1: Smbus block registers (dedicated)
> > +			2: Cause master registers (dedicated)
> > +			3: Cause slave registers (dedicated)
> > +			4: Cause coalesce registers (shared)
> > +			5: GPIO 0 registers (shared)
> > +			6: CorePLL registers (shared)
> > +
> > +		The BlueField SoCs includes three I2C bus controllers;
> > +		the set of resources <address length> must be defined
> > +		as follow:
> > +
> > +		i2c bus 0:
> > +		    <0x02804000 0x800>	/* Smbus[0]        */
> > +		    <0x02801200 0x020>	/* Cause Master[0] */
> > +		    <0x02801260 0x020>	/* Cause Slave[0]  */
> > +		    <0x02801300 0x010>	/* Cause Coalesce  */
> > +		    <0x02802000 0x100>	/* GPIO 0          */
> > +		    <0x02800358 0x008>	/* CorePll         */
> > +
> > +		i2c bus 1:
> > +		    <0x02804800 0x800>	/* Smbus[1]        */
> > +		    <0x02801220 0x020>	/* Cause Master[1] */
> > +		    <0x02801280 0x020>	/* Cause Slave[1]  */
>=20
> > +		    <0x02801300 0x010>	/* Cause Coalesce  */
> > +		    <0x02802000 0x100>	/* GPIO 0          */
> > +		    <0x02800358 0x008>	/* CorePll         */
>=20
> You should not have overlapping register addresses in DT. These should be
> separate nodes.

>From our perspective, a separate node would make things more complicated
because this would imply a sophisticated probe routine for such simple devi=
ce;
this may also require a deferral of the probe of the i2c controllers...
That being said, I believe the intuitive approach would be to implement a l=
ogic
within the driver code that maps the device memory and serialize the access=
 to
the common registers. The only convenient of such approach is to keep the
common register definitions consistent across our platforms...

By the way, these definitions were initially based on the design of our har=
dware.

>=20
> Rob

Regards,
Khalil
