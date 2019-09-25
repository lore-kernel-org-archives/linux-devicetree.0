From: Biwen Li <biwen.li@nxp.com>
Subject: RE: [v3,3/3] Documentation: dt: binding: fsl: Add
 'fsl,ippdexpcr-alt-addr' property
Date: Wed, 25 Sep 2019 03:13:07 +0000
Message-ID: <DB7PR04MB449034C4BBAA89685A2130F78F870@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20190924024548.4356-1-biwen.li@nxp.com>
 <20190924024548.4356-3-biwen.li@nxp.com>
 <AM0PR04MB667690EE76D327D0FC09F7818F840@AM0PR04MB6676.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <AM0PR04MB667690EE76D327D0FC09F7818F840@AM0PR04MB6676.eurprd04.prod.outlook.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Leo Li <leoyang.li@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, Ran Wang <ran.wang_1@nxp.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

> >
> > The 'fsl,ippdexpcr-alt-addr' property is used to handle an errata
> > A-008646 on LS1021A
> >
> > Signed-off-by: Biwen Li <biwen.li@nxp.com>
> > ---
> > Change in v3:
> > 	- rename property name
> > 	  fsl,rcpm-scfg -> fsl,ippdexpcr-alt-addr
> >
> > Change in v2:
> > 	- update desc of the property 'fsl,rcpm-scfg'
> >
> >  Documentation/devicetree/bindings/soc/fsl/rcpm.txt | 14
> > ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> > b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> > index 5a33619d881d..157dcf6da17c 100644
> > --- a/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> > +++ b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> > @@ -34,6 +34,11 @@ Chassis Version		Example Chips
> >  Optional properties:
> >   - little-endian : RCPM register block is Little Endian. Without it RCPM
> >     will be Big Endian (default case).
> > + - fsl,ippdexpcr-alt-addr : Must add the property for SoC LS1021A,
> 
> You probably should mention this is related to a hardware issue on LS1021a
> and only needed on LS1021a.
Okay, got it, thanks, I will add this in v4.
> 
> > +   Must include n + 1 entries (n = #fsl,rcpm-wakeup-cells, such as:
> > +   #fsl,rcpm-wakeup-cells equal to 2, then must include 2 + 1 entries).
> 
> #fsl,rcpm-wakeup-cells is the number of IPPDEXPCR registers on an SoC.
> However you are defining an offset to scfg registers here.  Why these two
> are related?  The length here should actually be related to the #address-cells
> of the soc/.  But since this is only needed for LS1021, you can just make it 3.
I need set the value of IPPDEXPCR resgiters from ftm_alarm0 device node(fsl,rcpm-wakeup = <&rcpm 0x0 0x20000000>;
0x0 is a value for IPPDEXPCR0, 0x20000000 is a value for IPPDEXPCR1).
But because of the hardware issue on LS1021A, I need store the value of IPPDEXPCR registers
to an alt address. So I defining an offset to scfg registers, then RCPM driver get an abosolute address from offset,
 RCPM driver write the value of IPPDEXPCR registers to these abosolute addresses(backup the value of IPPDEXPCR registers).
> 
> > +   The first entry must be a link to the SCFG device node.
> > +   The non-first entry must be offset of registers of SCFG.
> >
> >  Example:
> >  The RCPM node for T4240:
> > @@ -43,6 +48,15 @@ The RCPM node for T4240:
> >  		#fsl,rcpm-wakeup-cells = <2>;
> >  	};
> >
> > +The RCPM node for LS1021A:
> > +	rcpm: rcpm@1ee2140 {
> > +		compatible = "fsl,ls1021a-rcpm", "fsl,qoriq-rcpm-2.1+";
> > +		reg = <0x0 0x1ee2140 0x0 0x8>;
> > +		#fsl,rcpm-wakeup-cells = <2>;
> > +		fsl,ippdexpcr-alt-addr = <&scfg 0x0 0x51c>; /*
> > SCFG_SPARECR8 */
> > +	};
> > +
> > +
> >  * Freescale RCPM Wakeup Source Device Tree Bindings
> >  -------------------------------------------
> >  Required fsl,rcpm-wakeup property should be added to a device node if
> > the device
> > --
> > 2.17.1
