From: Biwen Li <biwen.li@nxp.com>
Subject: RE: [EXT] Re: [v4,3/3] Documentation: dt: binding: fsl: Add
 'fsl,ippdexpcr1-alt-addr' property
Date: Wed, 9 Oct 2019 07:07:31 +0000
Message-ID: <DB7PR04MB4490AAF196950B43FA11590A8F950@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20190926024118.15931-1-biwen.li@nxp.com>
 <20190926024118.15931-3-biwen.li@nxp.com> <20190927171420.GA28375@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190927171420.GA28375@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Leo Li <leoyang.li@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, Ran Wang <ran.wang_1@nxp.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

>=20
> On Thu, Sep 26, 2019 at 10:41:18AM +0800, Biwen Li wrote:
> > The 'fsl,ippdexpcr1-alt-addr' property is used to handle an errata
> > A-008646 on LS1021A
> >
> > Signed-off-by: Biwen Li <biwen.li@nxp.com>
> > ---
> > Change in v4:
> >       - rename property name
> >         fsl,ippdexpcr-alt-addr -> fsl,ippdexpcr1-alt-addr
> >
> > Change in v3:
> >       - rename property name
> >         fsl,rcpm-scfg -> fsl,ippdexpcr-alt-addr
> >
> > Change in v2:
> >       - update desc of the property 'fsl,rcpm-scfg'
> >
> >  .../devicetree/bindings/soc/fsl/rcpm.txt      | 21
> +++++++++++++++++++
> >  1 file changed, 21 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> > b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> > index 5a33619d881d..751a7655b694 100644
> > --- a/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> > +++ b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> > @@ -34,6 +34,13 @@ Chassis Version            Example Chips
> >  Optional properties:
> >   - little-endian : RCPM register block is Little Endian. Without it RC=
PM
> >     will be Big Endian (default case).
> > + - fsl,ippdexpcr1-alt-addr : The property is related to a hardware iss=
ue
> > +   on SoC LS1021A and only needed on SoC LS1021A.
> > +   Must include 1 + 2 entries.
> > +   The first entry must be a link to the SCFG device node.
> > +   The non-first entry must be offset of registers of SCFG.
> > +   The second and third entry compose an alt offset address
> > +   for IPPDEXPCR1(SCFG_SPARECR8)
>=20
> If only on 1 SoC, can't all this be implied by "fsl,ls1021a-rcpm"?
Currently on SoC LS1021A. Maybe other soc need this!
>=20
> Adding a property means you need both a new dtb and kernel to fix the
> errata. Using the compatible string means you only need a new kernel.
You are right, but it will be more flexible. Thanks.
>=20
> >
> >  Example:
> >  The RCPM node for T4240:
> > @@ -43,6 +50,20 @@ The RCPM node for T4240:
> >               #fsl,rcpm-wakeup-cells =3D <2>;
> >       };
> >
> > +The RCPM node for LS1021A:
> > +     rcpm: rcpm@1ee2140 {
> > +             compatible =3D "fsl,ls1021a-rcpm", "fsl,qoriq-rcpm-2.1+";
>=20
> Both of these compatible strings aren't documented.
These compatible strings is here: https://patchwork.kernel.org/patch/111052=
81/
>=20
> > +             reg =3D <0x0 0x1ee2140 0x0 0x8>;
> > +             #fsl,rcpm-wakeup-cells =3D <2>;
> > +
> > +             /*
> > +              * The second and third entry compose an alt offset
> > +              * address for IPPDEXPCR1(SCFG_SPARECR8)
> > +              */
> > +             fsl,ippdexpcr1-alt-addr =3D <&scfg 0x0 0x51c>;
> > +     };
> > +
> > +
> >  * Freescale RCPM Wakeup Source Device Tree Bindings
> >  -------------------------------------------
> >  Required fsl,rcpm-wakeup property should be added to a device node if
> > the device
> > --
> > 2.17.1
> >
