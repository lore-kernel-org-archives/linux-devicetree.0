From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [v2] dt/bindings: qoriq-clock: Add binding for FMan clock mux
Date: Mon, 13 Apr 2015 15:20:57 -0500
Message-ID: <1428956457.22867.629.camel@freescale.com>
References: <1428479031-26597-1-git-send-email-igal.liberman@freescale.com>
	 <1428527516.22867.509.camel@freescale.com>
	 <DM2PR03MB383D9FD2888970950261FB2E6FB0@DM2PR03MB383.namprd03.prod.outlook.com>
	 <1428598976.22867.535.camel@freescale.com>
	 <DM2PR03MB3835E1F5A269C969994FDA0E6F80@DM2PR03MB383.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <DM2PR03MB3835E1F5A269C969994FDA0E6F80-ufbTtyGzTTRJonC5hhDUuuO6mTEJWrR4XA4E9RH9d+qIuWR1G4zioA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liberman Igal-B31950 <Igal.Liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, 2015-04-12 at 10:54 -0500, Liberman Igal-B31950 wrote:
> 
> 
> Regards,
> Igal Liberman.
> 
> > -----Original Message-----
> > From: Wood Scott-B07421
> > Sent: Thursday, April 09, 2015 8:03 PM
> > To: Liberman Igal-B31950
> > Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> > Subject: Re: [v2] dt/bindings: qoriq-clock: Add binding for FMan clock mux
> > 
> > On Thu, 2015-04-09 at 02:18 -0500, Liberman Igal-B31950 wrote:
> > >
> > >
> > > Regards,
> > > Igal Liberman.
> > >
> > > > -----Original Message-----
> > > > From: Wood Scott-B07421
> > > > Sent: Thursday, April 09, 2015 12:12 AM
> > > > To: Liberman Igal-B31950
> > > > Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> > > > Subject: Re: [v2] dt/bindings: qoriq-clock: Add binding for FMan
> > > > clock mux
> > > >
> > > > On Wed, 2015-04-08 at 10:43 +0300, Igal.Liberman wrote:
> > > > > @@ -76,6 +77,52 @@ Required properties:
> > > > >
> > > > >  Recommended properties:
> > > > >  - clocks: Should be the phandle of input parent clock
> > > > > +	For "fsl,fman-clk-mux" clock there are several options for parent
> > > > > +	clock (clock provider), the parent is determined according to the
> > > > > +	Reset Configuration Word of the specific device:
> > > > > +		* P2041, P3041:
> > > > > +			* 0 - equal to platform PLL divided by 2
> > > > > +			* 1 - equal to PLL2 divided by 2
> > > > > +		* P4080 (Both FMans):
> > > > > +			* 0 - equal to platform PLL divided by 2
> > > > > +			* 1 - equal to PLL3 divided by 2
> > > > ...
> > > >
> > > >
> > > > Again, the clock specifier format is determined by the clock
> > > > provider, not the clock consumer.
> > > >
> > >
> > > Scott,
> > > The "clocks" property contains all possible clock providers, right?
> > > In the text above I'm trying to explain how the FMan clock provider is
> > determined and what are the options for each SoC.
> > > Do you think that we shouldn't have this explanation? Can you please
> > elaborate?
> > 
> > I'm saying that the clock specifiers must be the same regardless of the node
> > that is consuming the clock.  You can't define certain values as only being "for
> > fsl,fman-clk-mux".
> > 
> 
> Just to make things clear,
> In "fm0clk/fm1clk" node, "clocks" holds a list of clock specifiers.
> This list reflects all optional clock providers for a specific hardware, this list varies between different SoCs.
> All those possible providers described by other nodes, as clock providers.
> Please notice that this bindings describes the possible source clock for FMan mux, not the providers themselves.
> 
> You mentioned the following: "You can't define certain values as only being "for fsl,fman-clk-mux"."
> I'm defining those values in the clock provider nodes and using those values as clock providers for FMan mux, it can be used be other HW blocks too.

My point is that the encoding of the clock specifier is not
fman-specific and thus fman should not appear in the description.

-Scott


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
