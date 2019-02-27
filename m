Return-Path: <SRS0=iAyG=RC=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr30040.outbound.protection.outlook.com ([40.107.3.40]:30848
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726791AbfB0Ia5 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 27 Feb 2019 03:30:57 -0500
From: Pankaj Bansal <pankaj.bansal@nxp.com>
Subject: RE: [PATCH v3 1/2] dt-bindings: add register based devices' mux
 controller DT bindings
Date: Wed, 27 Feb 2019 08:30:51 +0000
Message-ID: <VI1PR0401MB24969E748AEE91DD50B5BD3AF1740@VI1PR0401MB2496.eurprd04.prod.outlook.com>
References: <20190224135143.24770-1-pankaj.bansal@nxp.com>
 <20190226195354.GA19598@bogus>
 <CADRPPNSJ3Re+Ztfq_-a1D1xRJr3zxreG3irk4RBz6gibwbNNtA@mail.gmail.com>
 <20190226220031.GA7919@bogus>
In-Reply-To: <20190226220031.GA7919@bogus>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: 'Rob Herring' <robh@kernel.org>, Leo Li <leoyang.li@nxp.com>, Peter Rosin <peda@axentia.se>
Cc: Frank Rowand <frowand.list@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Rob,

> -----Original Message-----
> From: Rob Herring [mailto:robh@kernel.org]
> Sent: Wednesday, 27 February, 2019 03:31 AM
> To: Leo Li <leoyang.li@nxp.com>
> Cc: Pankaj Bansal <pankaj.bansal@nxp.com>; Peter Rosin <peda@axentia.se>;
> Frank Rowand <frowand.list@gmail.com>; devicetree@vger.kernel.org
> Subject: Re: [PATCH v3 1/2] dt-bindings: add register based devices' mux
> controller DT bindings
>=20
> On Tue, Feb 26, 2019 at 02:28:12PM -0600, Li Yang wrote:
> > On Tue, Feb 26, 2019 at 1:54 PM Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Sun, Feb 24, 2019 at 08:27:23AM +0000, Pankaj Bansal wrote:
> > > > This adds device tree binding documentation for generic register
> > > > based multiplexer controlled by a bitfields in a parent device's re=
gister
> range.
> > > >
> > > > Signed-off-by: Pankaj Bansal <pankaj.bansal@nxp.com>
> > > > ---
> > > >
> > > > Notes:
> > > >     V3:
> > > >     - Added the patch in series with the driver patch
> > > >     - Fixed the node value out of bitfield error
> > > >     - removed the "parent register r/w functions" line
> > > >     V2:
> > > >     - Removed syscon reference from txt file
> > > >     - Removed loading zeroes from hex numbers
> > > >     - Fixed the depth of dts nodes
> > > >     - fixed minor formatting errors
> > > >
> > > >  .../devicetree/bindings/mux/reg-mux.txt      | 83 ++++++++++++++++=
++
> > > >  1 file changed, 83 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/mux/reg-mux.txt
> > > > b/Documentation/devicetree/bindings/mux/reg-mux.txt
> > > > new file mode 100644
> > > > index 000000000000..8bea6129c113
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/mux/reg-mux.txt
> > > > @@ -0,0 +1,83 @@
> > > > +Generic register bitfield-based multiplexer controller bindings
> > > > +
> > > > +Define register bitfields to be used to control multiplexers. The
> > > > +parent device tree node must be a device node to provide register =
r/w
> access.
> > >
> > > We generally avoid register bit level bindings like this...
> > >
> > > What happens when I need 8 or 16-bit accesses. Or some quirky
> > > encoding of the bits. Or non-contiguous bit fields... It's an
> > > endless extending of the binding to try to handle different cases.
> >
> > I think the intention here is to mimic the existing mmio-mux binding
> > (Documentation/devicetree/bindings/mux/mmio-mux.txt) so that the
> > existing mmio-mux driver can be extended to cover both MMIO and
> > non-MMIO register based muxes.  The bit-width of the register access
> > will be taken care of by the regmap framework.  It is probably true
> > that this can not cover all the register based mux device if they do
> > have quircky register layout, but I think it should be good enough to
> > cover majority of the cases.  If there are devices that cannot be
> > covered by the generic binding and driver, they could create their own
> > bindings and drivers.
>=20
> Other than the somewhat misleading name, why not just reuse the existing
> binding? Worst case, just add another compatible to it and renane the fil=
e. That
> would have saved me reviewing the whole thing again...
>=20

I guess I can rename mmio-mux to reg-mux and add the bindings in it. Becaus=
e really, the
MMIO mux is a special case of register based mux, where the register access=
 is memory mapped.
@Peter Rosin : Are you okay with this?

> But really, you should just be able to use what is there and determine th=
e type of
> access from the parent node (or I suppose regmap does that for you).

The intention is to have an indication that the parent devices produces one=
 (or many) mux
Producers, which are controlled by parent devices' registers.
Which is why I chose compatible "reg-mux".

The parent device's register can be written in any way (MMIO / SPI / I2C) e=
tc.

>=20
> Rob
