From: Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: RE: [PATCH 2/3] Documentation: DT: Add entry for DPAA2 console
Date: Fri, 4 Jan 2019 17:50:37 +0000
Message-ID: <VI1PR0402MB280090CC66E990AD6E82F52FE08E0@VI1PR0402MB2800.eurprd04.prod.outlook.com>
References: <1545406240-3061-1-git-send-email-ioana.ciornei@nxp.com>
 <1545406240-3061-3-git-send-email-ioana.ciornei@nxp.com>
 <20190103203250.GA18731@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190103203250.GA18731@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Leo Li <leoyang.li@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Roy Pledge <roy.pledge@nxp.com>, Ioana Ciocoi Radulescu <ruxandra.radulescu@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

> Subject: Re: [PATCH 2/3] Documentation: DT: Add entry for DPAA2 console
>=20
> On Fri, Dec 21, 2018 at 03:31:11PM +0000, Ioana Ciornei wrote:
> > This patch adds a devicetree binding documentation for FSL's DPAA2
> > console.
> >
> > Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/misc/dpaa2-console.txt | 11
> +++++++++++
> >  MAINTAINERS                                              |  1 +
> >  2 files changed, 12 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/misc/dpaa2-console.txt
> >
> > diff --git a/Documentation/devicetree/bindings/misc/dpaa2-console.txt
> > b/Documentation/devicetree/bindings/misc/dpaa2-console.txt
> > new file mode 100644
> > index 0000000..f4e16b1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/misc/dpaa2-console.txt
> > @@ -0,0 +1,11 @@
> > +DPAA2 console support
> > +
> > +Required properties:
> > +
> > +    - compatible
> > +        Value type: <string>
> > +        Definition: Must be "dpaa2-console".
> > +    - reg
> > +        Value type: <prop-encoded-array>
> > +        Definition: A standard property.  Specifies the region where t=
he MCFBA
> > +                    (MC firmware base address) register can be found.
>=20
> What's the relationship between MCFBA and the console?

The console is basically a log buffer of the MC firmware, and is found at a=
 known offset compared to the firmware image's runtime base address.

> The binding should describe the h/w block or firmware interface not the f=
eature you want to
> implement. Are there other functions provided by the MC firmware?

The MC firmware manages all hardware resources related to networking or any=
 other accelerators.
Any interaction with the firmware is made through commands put in memory ma=
pped regions.
The fsl-mc bus driver is the one that already manages this interaction with=
 the MC.

Ioana

>=20
> Rob
