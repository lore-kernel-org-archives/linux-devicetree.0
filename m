From: Aggrwal Poonam-B10812 <B10812-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [PATCH][v2] Device Tree Bindings for Freescale TDM controller
Date: Thu, 22 Mar 2012 05:26:35 +0000
Message-ID: <ACB6D0C0104CFF42A45A5D82A0DD4F3D09F06A@039-SN2MPN1-013.039d.mgd.msft.net>
References: <1332205369-26260-1-git-send-email-poonam.aggrwal@freescale.com>
 <BDBDFD28-0980-491C-B384-BB1F6730211E@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <BDBDFD28-0980-491C-B384-BB1F6730211E-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Singh Sandeep-B37400 <B37400-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Kumar Gala [mailto:galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org]
> Sent: Wednesday, March 21, 2012 11:37 PM
> To: Aggrwal Poonam-B10812
> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org;
> Singh Sandeep-B37400
> Subject: Re: [PATCH][v2] Device Tree Bindings for Freescale TDM
> controller
> 
> 
> On Mar 19, 2012, at 8:02 PM, Poonam Aggrwal wrote:
> 
> > This TDM controller is available in various Freescale SOCs like
> > MPC8315, P1020, P1022, P1010.
> >
> > Signed-off-by: Sandeep Singh <Sandeep-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > Signed-off-by: Poonam Aggrwal <poonam.aggrwal-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > ---
> > Changes in v2:
> > 	- Incorporated Scott's Review comments
> > Documentation/devicetree/bindings/tdm/fsl-tdm.txt |   67
> +++++++++++++++++++++
> > 1 files changed, 67 insertions(+), 0 deletions(-) create mode 100644
> > Documentation/devicetree/bindings/tdm/fsl-tdm.txt
> >
> > diff --git a/Documentation/devicetree/bindings/tdm/fsl-tdm.txt
> > b/Documentation/devicetree/bindings/tdm/fsl-tdm.txt
> > new file mode 100644
> > index 0000000..6553dbe
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/tdm/fsl-tdm.txt
> > @@ -0,0 +1,67 @@
> > +=====================================================================
> > +TDM Device Tree Binding
> > +Copyright (C) 2012 Freescale Semiconductor Inc.
> > +
> > +NOTE: The bindings described in this document are preliminary and
> > +subject to change.
> > +
> > +=====================================================================
> > +TDM (Time Division Multiplexing)
> > +
> > +DESCRIPTION
> > +
> > +The TDM is full duplex serial port designed to allow various devices
> > +including digital signal processors (DSPs) to communicate with a
> > +variety of serial devices including industry standard framers, codecs,
> other DSPs and microprocessors.
> > +
> > +The below properties describe the device tree bindings for Freescale
> > +TDM controller.
> > +This TDM controller is available on various Freescale Processors like
> > +MPC8315, P1020, P1022 and P1010.
> > +
> > +PROPERTIES
> > +
> > +  - compatible
> > +      Usage: required
> > +      Value type: <string>
> > +      Definition: Should contain "fsl,mpc8315-tdm".
> > +	  So mpc8315 will have compatible = "fsl,mpc8315-tdm";
> > +	  p1010 will have compatible "fsl,p1010-tdm", "fsl,mpc8315-tdm";
> > +
> > +  - reg
> > +      Usage: required
> > +      Definition: There are two reg resources. First is for  TDM
> registers and
> > +	  the second for TDM DMAC registers.
> > +
> > +  - clock-frequency
> > +      Usage: optional
> > +      Value type: <u32>
> > +      Definition: The frequency at which the TDM block is operating.
> > +
> > +  - interrupts
> > +      Usage: required
> > +      Definition: This field defines the interrupt specifiers for the
> two
> > +      interrupts. First is for TDM error and second for TDM DMAC.
> > +
> > +  - phy-handle
> > +      Usage: optional
> > +      Value type: <phandle>
> > +      Definition: Phandle of the line controller node or framer node
> eg. SLIC,
> > +	  E1/T1 etc.
> 
> Which way are we going with the name of such handle properties?  Ie
> should this be 'tdm-phy-handle' or keeping it generic is ok?
> 
tdm-phy-handle looks better, but generally all the devices mention just phy-handle (usb, tsec) 
> > +
> > +  - fsl,max-time-slots
> > +      Usage: required
> > +      Value type: <u32>
> > +      Definition: Maximum number of 8-bit time slots in one TDM frame.
> > +	  This is the maximum number which TDM hardware supports.
> > +
> > +EXAMPLE
> > +
> > +	tdm@16000 {
> > +		compatible = "fsl,p1010-tdm", "fsl,mpc8315-tdm";
> > +		reg = <0x16000 0x200 0x2c000 0x2000>;
> > +		clock-frequency = <399999999>; /* typically filled by u-boot
> */
> > +		interrupts = <16 8 62 8>;
> > +		phy-handle = <&zarlink1>;
> > +		fsl-max-time-slots = <128>;
> > +	};
> > --
> > 1.6.5.6
> >
> >
> > _______________________________________________
> > Linuxppc-dev mailing list
> > Linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> > https://lists.ozlabs.org/listinfo/linuxppc-dev
> 
