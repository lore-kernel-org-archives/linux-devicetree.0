From: Li Yang <leoyang.li@nxp.com>
Subject: Re: [v3,3/3] Documentation: dt: binding: fsl: Add 'fsl,ippdexpcr-alt-addr'
 property
Date: Wed, 25 Sep 2019 09:07:12 -0500
Message-ID: <CADRPPNQ+=au2qRL2K-tzhH8HK1+sO+ut9YBhYw4UhWSv5FF88A@mail.gmail.com>
References: <20190924024548.4356-1-biwen.li@nxp.com> <20190924024548.4356-3-biwen.li@nxp.com>
 <AM0PR04MB667690EE76D327D0FC09F7818F840@AM0PR04MB6676.eurprd04.prod.outlook.com>
 <DB7PR04MB449034C4BBAA89685A2130F78F870@DB7PR04MB4490.eurprd04.prod.outlook.com>
 <AM0PR04MB66762594DDFC6E5B00BD103C8F870@AM0PR04MB6676.eurprd04.prod.outlook.com>
 <DB7PR04MB4490FECDC76507AADC35948E8F870@DB7PR04MB4490.eurprd04.prod.outlook.com>
 <AM0PR04MB6676BD24B814C3D1D67CF9F88F870@AM0PR04MB6676.eurprd04.prod.outlook.com>
 <DB7PR04MB4490EAE9591B5AE7112C9D188F870@DB7PR04MB4490.eurprd04.prod.outlook.com>
 <AM0PR04MB6676B8A6F7C7C3BC822B45B28F870@AM0PR04MB6676.eurprd04.prod.outlook.com>
 <DB7PR04MB44902BADDDFD090BAF4178C68F870@DB7PR04MB4490.eurprd04.prod.outlook.com>
 <DB7PR04MB4490684FE0E95695E89173948F870@DB7PR04MB4490.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DB7PR04MB4490684FE0E95695E89173948F870@DB7PR04MB4490.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Biwen Li <biwen.li@nxp.com>
Cc: "shawnguo@kernel.org" <shawnguo@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, Ran Wang <ran.wang_1@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 24, 2019 at 11:27 PM Biwen Li <biwen.li@nxp.com> wrote:
>
> > > >
> > > > > > > > > >
> > > > > > > > > > The 'fsl,ippdexpcr-alt-addr' property is used to handle
> > > > > > > > > > an errata
> > > > > > > > > > A-008646 on LS1021A
> > > > > > > > > >
> > > > > > > > > > Signed-off-by: Biwen Li <biwen.li@nxp.com>
> > > > > > > > > > ---
> > > > > > > > > > Change in v3:
> > > > > > > > > >       - rename property name
> > > > > > > > > >         fsl,rcpm-scfg -> fsl,ippdexpcr-alt-addr
> > > > > > > > > >
> > > > > > > > > > Change in v2:
> > > > > > > > > >       - update desc of the property 'fsl,rcpm-scfg'
> > > > > > > > > >
> > > > > > > > > >  Documentation/devicetree/bindings/soc/fsl/rcpm.txt | 14
> > > > > > > > > > ++++++++++++++
> > > > > > > > > >  1 file changed, 14 insertions(+)
> > > > > > > > > >
> > > > > > > > > > diff --git
> > > > > > > > > > a/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> > > > > > > > > > b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> > > > > > > > > > index 5a33619d881d..157dcf6da17c 100644
> > > > > > > > > > --- a/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> > > > > > > > > > +++ b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> > > > > > > > > > @@ -34,6 +34,11 @@ Chassis Version            Example
> > > > Chips
> > > > > > > > > >  Optional properties:
> > > > > > > > > >   - little-endian : RCPM register block is Little Endian.
> > > > > > > > > > Without it
> > > > > RCPM
> > > > > > > > > >     will be Big Endian (default case).
> > > > > > > > > > + - fsl,ippdexpcr-alt-addr : Must add the property for
> > > > > > > > > > + SoC LS1021A,
> > > > > > > > >
> > > > > > > > > You probably should mention this is related to a hardware
> > > > > > > > > issue on LS1021a and only needed on LS1021a.
> > > > > > > > Okay, got it, thanks, I will add this in v4.
> > > > > > > > >
> > > > > > > > > > +   Must include n + 1 entries (n =
> > > > > > > > > > + #fsl,rcpm-wakeup-cells, such
> > > as:
> > > > > > > > > > +   #fsl,rcpm-wakeup-cells equal to 2, then must include
> > > > > > > > > > + 2
> > > > > > > > > > + +
> > > > > > > > > > + 1
> > > > > entries).
> > > > > > > > >
> > > > > > > > > #fsl,rcpm-wakeup-cells is the number of IPPDEXPCR
> > > > > > > > > registers on an
> > > > > SoC.
> > > > > > > > > However you are defining an offset to scfg registers here.
> > > > > > > > > Why these two are related?  The length here should
> > > > > > > > > actually be related to the #address-cells of the soc/.
> > > > > > > > > But since this is only needed for LS1021, you can
> > > > > > > > just make it 3.
> > > > > > > > I need set the value of IPPDEXPCR resgiters from ftm_alarm0
> > > > > > > > device node(fsl,rcpm-wakeup = <&rcpm 0x0 0x20000000>;
> > > > > > > > 0x0 is a value for IPPDEXPCR0, 0x20000000 is a value for
> > > > > IPPDEXPCR1).
> > > > > > > > But because of the hardware issue on LS1021A, I need store
> > > > > > > > the value of IPPDEXPCR registers to an alt address. So I
> > > > > > > > defining an offset to scfg registers, then RCPM driver get
> > > > > > > > an abosolute address from offset, RCPM driver write the
> > > > > > > > value of IPPDEXPCR registers to these abosolute
> > > > > > > > addresses(backup the value of IPPDEXPCR
> > > > > registers).
> > > > > > >
> > > > > > > I understand what you are trying to do.  The problem is that
> > > > > > > the new fsl,ippdexpcr-alt-addr property contains a phandle and an
> > offset.
> > > > > > > The size of it shouldn't be related to #fsl,rcpm-wakeup-cells.
> > > > > > You maybe like this: fsl,ippdexpcr-alt-addr = <&scfg 0x51c>;/*
> > > > > > SCFG_SPARECR8 */
> > > > >
> > > > > No.  The #address-cell for the soc/ is 2, so the offset to scfg
> > > > > should be 0x0 0x51c.  The total size should be 3, but it shouldn't
> > > > > be coming from #fsl,rcpm-wakeup-cells like you mentioned in the
> > binding.
> > > > Oh, I got it. You want that fsl,ippdexpcr-alt-add is relative with
> > > > #address-cells instead of #fsl,rcpm-wakeup-cells.
> > >
> > > Yes.
> > I got an example from drivers/pci/controller/dwc/pci-layerscape.c
> > and arch/arm/boot/dts/ls1021a.dtsi as follows:
> > fsl,pcie-scfg = <&scfg 0>, 0 is an index
> >
> > In my fsl,ippdexpcr-alt-addr = <&scfg 0x0 0x51c>, It means that 0x0 is an alt
> > offset address for IPPDEXPCR0, 0x51c is an alt offset address For
> > IPPDEXPCR1 instead of 0x0 and 0x51c compose to an alt address of
> > SCFG_SPARECR8.
> Maybe I need write it as:
> fsl,ippdexpcr-alt-addr = <&scfg 0x0 0x0 0x0 0x51c>;
> first two 0x0 compose an alt offset address for IPPDEXPCR0,
> last 0x0 and 0x51c compose an alt address for IPPDEXPCR1,

I remember the hardware issue is only is only related to IPPDEXPCR1
register, no idea why you need to define IPPDEXPCR0 in the binding.

>
> Best Regards,
> Biwen Li
> > >
> > > Regards,
> > > Leo
> > > > >
> > > > > > >
> > > > > > > > >
> > > > > > > > > > +   The first entry must be a link to the SCFG device node.
> > > > > > > > > > +   The non-first entry must be offset of registers of SCFG.
> > > > > > > > > >
> > > > > > > > > >  Example:
> > > > > > > > > >  The RCPM node for T4240:
> > > > > > > > > > @@ -43,6 +48,15 @@ The RCPM node for T4240:
> > > > > > > > > >               #fsl,rcpm-wakeup-cells = <2>;
> > > > > > > > > >       };
> > > > > > > > > >
> > > > > > > > > > +The RCPM node for LS1021A:
> > > > > > > > > > +     rcpm: rcpm@1ee2140 {
> > > > > > > > > > +             compatible = "fsl,ls1021a-rcpm", "fsl,qoriq-rcpm-
> > > > > > 2.1+";
> > > > > > > > > > +             reg = <0x0 0x1ee2140 0x0 0x8>;
> > > > > > > > > > +             #fsl,rcpm-wakeup-cells = <2>;
> > > > > > > > > > +             fsl,ippdexpcr-alt-addr = <&scfg 0x0 0x51c>; /*
> > > > > > > > > > SCFG_SPARECR8 */
> > > > > > > > > > +     };
> > > > > > > > > > +
> > > > > > > > > > +
> > > > > > > > > >  * Freescale RCPM Wakeup Source Device Tree Bindings
> > > > > > > > > >  -------------------------------------------
> > > > > > > > > >  Required fsl,rcpm-wakeup property should be added to a
> > > > > > > > > > device node if the device
> > > > > > > > > > --
> > > > > > > > > > 2.17.1
>
