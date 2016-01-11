From: Igal Liberman <igal.liberman-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [v2] powerpc/fsl: Update fman dt binding with pcs-phy and tbi-phy
Date: Mon, 11 Jan 2016 09:23:59 +0000
Message-ID: <AMXPR04MB248CB84E0F389149CA964BBECC90@AMXPR04MB248.eurprd04.prod.outlook.com>
References: <1450921331-25309-1-git-send-email-igal.liberman@freescale.com>
 <20151230162733.GA2518@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151230162733.GA2518@rob-hp-laptop>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Igal Liberman <Igal.Liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Madalin-Cristian Bucur <madalin.bucur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "shaohui.xie-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <shaohui.xie-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

> -----Original Message-----
> From: Rob Herring [mailto:robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]
> Sent: Wednesday, December 30, 2015 6:28 PM
> To: Igal Liberman <Igal.Liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; Scott Wood
> <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>; Madalin-Cristian Bucur
> <madalin.bucur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>; shaohui.xie-KZfg59tc24xl57MIdRCFDg@public.gmane.org
> Subject: Re: [v2] powerpc/fsl: Update fman dt binding with pcs-phy and tbi-
> phy
> 
> On Thu, Dec 24, 2015 at 03:42:11AM +0200, igal.liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org
> wrote:
> > From: Igal Liberman <igal.liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> >
> > The FMan contains internal PHY devices used for SGMII connections to
> > external PHYs. When these PHYs are in use a reference is needed for
> > both the external PHY and the internal one. For the external PHY
> > phy-handle provides the reference. For the internal PHY a new handle
> > is required.
> > In dTSEC, the internal PHY is a TBI (Ten Bit Interface) PHY, the
> > handle used will be tbi-handle.
> > In mEMAC, the internal PHY is a PCS (Physical Coding Sublayer) PHY,
> > the handle used will be pcsphy-handle.
> 
> This is fairly commom for 10G eth I think. Can't you use the common PHY
> binding here in the case without internal MDIO bus? Just because you use it
> that doesn't mean you have to use the generic phy subsystem in the kernel.
> 

mEMAC and dTSEC always have internal MDIO bus.
I was requested to use generic PHY API for internal PHY configuration by netdev, this part was accepted. 

> Perhaps phy-handle should be deprecated in favor of doing something like
> this if you need a phandle to both:
> 
> phys = <&internal-phy>, <&external-phy>;
> 

I think that pcsphy-handle and tbi-handle represent the hardware in a good way.
This is the actual name of the hardware.

> > diff --git a/Documentation/devicetree/bindings/powerpc/fsl/fman.txt
> > b/Documentation/devicetree/bindings/powerpc/fsl/fman.txt
> > index 1fc5328..55c2c03 100644
> > --- a/Documentation/devicetree/bindings/powerpc/fsl/fman.txt
> > +++ b/Documentation/devicetree/bindings/powerpc/fsl/fman.txt
> > @@ -315,6 +315,16 @@ PROPERTIES
> >  		Value type: <phandle>
> >  		Definition: A phandle for 1EEE1588 timer.
> >
> > +- pcsphy-handle
> > +		Usage required for "fsl,fman-memac" MACs
> > +		Value type: <phandle>
> > +		Definition: A phandle for pcsphy.
> > +
> > +- tbi-handle
> > +		Usage required for "fsl,fman-dtsec" MACs
> > +		Value type: <phandle>
> > +		Definition: A phandle for tbiphy.
> > +
> >  EXAMPLE
> >
> >  fman1_tx28: port@a8000 {
> > @@ -340,6 +350,7 @@ ethernet@e0000 {
> >  	reg = <0xe0000 0x1000>;
> >  	fsl,fman-ports = <&fman1_rx8 &fman1_tx28>;
> >  	ptp-timer = <&ptp-timer>;
> > +	tbi-handle = <&tbi0>;
> 
> What does the tbi0 node contain? It should be present in the example.
> 

There is an example in under MDIO section:

mdio@e3120 {
	compatible = "fsl,fman-mdio";
	reg = <0xe3120 0xee0>;
	fsl,fman-internal-mdio;

	tbi1: tbi-phy@8 {
		reg = <0x8>;
		device_type = "tbi-phy";
	};
};

I used different indexes to make sure that it's aligned to the other examples in the binding document.

> Rob

Thank you for your feedback, 
Igal
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
