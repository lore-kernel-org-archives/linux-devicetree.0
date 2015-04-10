From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] QorIQ/TMU: add TMU node to device tree for QorIQ T104x
Date: Fri, 10 Apr 2015 17:40:46 -0500
Message-ID: <1428705646.22867.601.camel@freescale.com>
References: <1427782669-20368-1-git-send-email-hongtao.jia@freescale.com>
	 <1428638140.22867.583.camel@freescale.com>
	 <BLUPR03MB14924B9EBBD1C5635B0487DE1FA0@BLUPR03MB149.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <BLUPR03MB14924B9EBBD1C5635B0487DE1FA0-GeMU99Gfrrs/d2CkLcLUf+O6mTEJWrR4XA4E9RH9d+qIuWR1G4zioA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jia Hongtao-B38951 <hongtao.jia-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 2015-04-10 at 01:23 -0500, Jia Hongtao-B38951 wrote:
> 
> 
> > -----Original Message-----
> > From: Wood Scott-B07421
> > Sent: Friday, April 10, 2015 11:56 AM
> > To: Jia Hongtao-B38951
> > Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> > robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
> > Subject: Re: [PATCH] QorIQ/TMU: add TMU node to device tree for QorIQ
> > T104x
> > 
> > On Tue, 2015-03-31 at 14:17 +0800, Jia Hongtao wrote:
> > > This is Thermal Monitoring Unit for QorIQ platform.
> > >
> > > Signed-off-by: Jia Hongtao <hongtao.jia-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > > ---
> > >  .../devicetree/bindings/thermal/qoriq-thermal.txt  | 58
> > +++++++++++++++
> > >  arch/powerpc/boot/dts/fsl/qoriq-tmu-t104xsi.dtsi   | 82
> > ++++++++++++++++++++++
> > >  arch/powerpc/boot/dts/fsl/t1040si-post.dtsi        |  1 +
> > >  3 files changed, 141 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/thermal/qoriq-thermal.txt
> > >  create mode 100644 arch/powerpc/boot/dts/fsl/qoriq-tmu-t104xsi.dtsi
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/thermal/qoriq-thermal.txt
> > > b/Documentation/devicetree/bindings/thermal/qoriq-thermal.txt
> > > new file mode 100644
> > > index 0000000..dfc17fa
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/thermal/qoriq-thermal.txt
> > > @@ -0,0 +1,58 @@
> > > +* Thermal Monitoring Unit (TMU) on Freescale QorIQ SoCs
> > > +
> > > +Required properties:
> > > +- compatible : "fsl,qoriq-tmu".
> > 
> > compatible: Must include "fsl,qoriq-tmu". The version of the device is
> > 	    determined by the TMU IP Block Revision Register (IPBRR0)
> > 	    at offset 0x0BF8.
> > 
> > 	    Table of correspondences between IPBRR0 values and example
> > 	    chips:
> > 		Value           Device
> > 		-----------     -------
> > 		0x01900102      T1040
> 
> I will update it in next version.
> 
> > 
> > > +- reg : address range of TMU registers.
> > > +- interrupts : should contain the interrupt for TMU.
> > 
> > s/should contain/contains/
> 
> Thanks for the correction.
> 
> > 
> > > +- calibration : calibration table for TMU.
> > 
> > What is the format of the calibration table, and where does one get the
> > data?
> 
> There are four calibration config range, for each range we got a couple of
> pairs formatted like <TTCFGR, TSCFGR> at offset of <0x0080, 0x0084>.

The binding document needs to explain this, in more detail, as well as
how one determines the data.

Is this configuration or hardware description?

-Scott


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
