From: =?iso-8859-2?Q?Vicen=FEiu_Galanopulo?=
        <vicentiu.galanopulo@nxp.com>
Subject: RE: [RFC PATCH v2] net: phy: Added device tree binding for dev-addr
 and dev-addr code check-up
Date: Tue, 27 Mar 2018 08:10:35 +0000
Message-ID: <HE1PR0402MB3578B3D33160EBE59C2FD7D7EEAC0@HE1PR0402MB3578.eurprd04.prod.outlook.com>
References: <20180323150522.9603-1-vicentiu.galanopulo@nxp.com>
 <20180326222509.ppt5aqzqdarhm44d@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180326222509.ppt5aqzqdarhm44d@rob-hp-laptop>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "davem@davemloft.net" <davem@davemloft.net>, "marcel@holtmann.org" <marcel@holtmann.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Madalin-cristian Bucur <madalin.bucur@nxp.com>, Alexandru Marginean <alexandru.marginean@nxp.com>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Rob Herring [mailto:robh@kernel.org]
> Sent: Tuesday, March 27, 2018 1:25 AM
> To: Vicen=FEiu Galanopulo <vicentiu.galanopulo@nxp.com>
> Cc: netdev@vger.kernel.org; linux-kernel@vger.kernel.org;
> mark.rutland@arm.com; davem@davemloft.net; marcel@holtmann.org;
> devicetree@vger.kernel.org; Madalin-cristian Bucur <madalin.bucur@nxp.com=
>;
> Alexandru Marginean <alexandru.marginean@nxp.com>
> Subject: Re: [RFC PATCH v2] net: phy: Added device tree binding for dev-a=
ddr
> and dev-addr code check-up
>=20
> On Fri, Mar 23, 2018 at 10:05:22AM -0500, Vicentiu Galanopulo wrote:
> > Reason for this patch is that the Inphi PHY has a vendor specific
> > address space for accessing the
> > C45 MDIO registers - starting from 0x1e.
> >
> > A search of the dev-addr property is done in of_mdiobus_register.
> > If the property is found in the PHY node,
> > of_mdiobus_register_static_phy is called. This is a wrapper function
> > for of_mdiobus_register_phy which finds the device in package based on
> > dev-addr and fills devices_addrs:
> > devices_addrs is a new field added to phy_c45_device_ids.
> > This new field will store the dev-addr property on the same index
> > where the device in package has been found.
> > In order to have dev-addr in get_phy_c45_ids(), mdio_c45_ids is passed
> > from of_mdio.c to phy_device.c as an external variable.
> > In get_phy_device a copy of the mdio_c45_ids is done over the local
> > c45_ids (wich are empty). After the copying, the c45_ids will also
> > contain the static device found from dev-addr.
> > Having dev-addr stored in devices_addrs, in get_phy_c45_ids(), when
> > probing the identifiers, dev-addr can be extracted from devices_addrs
> > and probed if devices_addrs[current_identifier] is not 0.
> > This way changing the kernel API is avoided completely.
> >
> > As a plus to this patch, num_ids in get_phy_c45_ids, has the value 8
> > (ARRAY_SIZE(c45_ids->device_ids)),
> > but the u32 *devs can store 32 devices in the bitfield.
> > If a device is stored in *devs, in bits 32 to 9, it will not be found.
> > This is the reason for changing in phy.h, the size of device_ids
> > array.
> >
> > Signed-off-by: Vicentiu Galanopulo <vicentiu.galanopulo@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/net/phy.txt |  6 ++
>=20
> Please split bindings to separate patch.

=20
Thanks Rob for your comments. I was considering doing that after I reach a =
more stable, non-RFC version of the patch. I also added a v3, before
your comments, I think... so in the next one, v4, I will split the binding =
to a separate patch.


>=20
> >  drivers/net/phy/phy_device.c                  | 22 +++++-
> >  drivers/of/of_mdio.c                          | 98 +++++++++++++++++++=
+++++++-
> >  include/linux/phy.h                           |  5 +-
> >  4 files changed, 125 insertions(+), 6 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/net/phy.txt
> > b/Documentation/devicetree/bindings/net/phy.txt
> > index d2169a5..82692e2 100644
> > --- a/Documentation/devicetree/bindings/net/phy.txt
> > +++ b/Documentation/devicetree/bindings/net/phy.txt
> > @@ -61,6 +61,11 @@ Optional Properties:
> >  - reset-deassert-us: Delay after the reset was deasserted in microseco=
nds.
> >    If this property is missing the delay will be skipped.
> >
> > +- dev-addr: If set, it indicates the device address of the PHY to be
> > +used
> > +  when accessing the C45 PHY registers over MDIO. It is used for
> > +vendor specific
> > +  register space addresses that do no conform to standard address for
> > +the MDIO
> > +  registers (e.g. MMD30)
>=20
> This is a 2nd MDIO address, right? Can't you just append this to reg prop=
erty?
>=20
> Rob

Yes, it is a 2nd MDIO address which is coming from the PHY vendor. This add=
ress cannot be obtained by querying the MDIO bus, it's specified in the PHY=
 datasheet. The current kernel implementation was relying on the fact that =
this address is in the decimal 0 to 7 range. That worked for the PHYs which=
 already have a kernel driver, but for the new Inphi PHY, which I'm trying =
to add, it didn't. =20
If I were to append the dev-addr address to the reg property,  I would have=
 to fit two 32bit variable into a single one... in my opinion the code is c=
learer having the two addresses as distinct variables.... And so far, the c=
omments from Andrew or Florian didn't go in this direction.. =20

Vicentiu
