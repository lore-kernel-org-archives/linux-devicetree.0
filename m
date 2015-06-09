From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH V2] QorIQ/TMU: add TMU node to device tree for QorIQ
 T104x
Date: Tue, 9 Jun 2015 12:47:29 -0500
Message-ID: <1433872049.2477.80.camel@freescale.com>
References: <1429085868-47577-1-git-send-email-hongtao.jia@freescale.com>
	 <BLUPR03MB1498C018F80A754767DF48FE1CC0@BLUPR03MB149.namprd03.prod.outlook.com>
	 <1432669078.7862.13.camel@freescale.com>
	 <BLUPR03MB149DC0A753423EB27293931E1BE0@BLUPR03MB149.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <BLUPR03MB149DC0A753423EB27293931E1BE0-GeMU99Gfrrs/d2CkLcLUf+O6mTEJWrR4XA4E9RH9d+qIuWR1G4zioA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jia Hongtao-B38951 <hongtao.jia-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2015-06-08 at 21:19 -0500, Jia Hongtao-B38951 wrote:
> > -----Original Message-----
> > From: Wood Scott-B07421
> > Sent: Wednesday, May 27, 2015 3:38 AM
> > To: Jia Hongtao-B38951
> > Cc: edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org; linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org;
> > devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
> > Subject: Re: [PATCH V2] QorIQ/TMU: add TMU node to device tree for 
> > QorIQ
> > T104x
> > 
> > On Tue, 2015-05-26 at 01:33 -0500, Jia Hongtao-B38951 wrote:
> > > diff --git a/arch/powerpc/boot/dts/fsl/t1040si-post.dtsi
> > > > b/arch/powerpc/boot/dts/fsl/t1040si-post.dtsi
> > > > index 15ae462..bb9f792 100644
> > > > --- a/arch/powerpc/boot/dts/fsl/t1040si-post.dtsi
> > > > +++ b/arch/powerpc/boot/dts/fsl/t1040si-post.dtsi
> > > > @@ -345,6 +345,7 @@
> > > >             reg        = <0xea000 0x4000>;
> > > >     };
> > > > 
> > > > +/include/ "qoriq-tmu-t104xsi.dtsi"
> > > >  /include/ "elo3-dma-0.dtsi"
> > > >  /include/ "elo3-dma-1.dtsi"
> > > >  /include/ "qoriq-espi-0.dtsi"
> > 
> > Why is this chip-specific enough to be called "t104xsi", but not 
> > chip-
> > specific enough to just go directly into t1040si-post?
> 
> T104x platform share the same calibration data.

Which t104x are you referring to that doesn't use t1040si-post.dtsi?  
Plus, given the numbering scheme it's always possible that a new t104x 
comes out that has little to do with existing t104x.

-Scott


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
