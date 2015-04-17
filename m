From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [v3] dt/bindings: qoriq-clock: Add binding for FMan clock mux
Date: Fri, 17 Apr 2015 00:41:21 -0500
Message-ID: <1429249281.32545.52.camel@freescale.com>
References: <1429008968-24707-1-git-send-email-igal.liberman@freescale.com>
	 <1429119357.22867.724.camel@freescale.com>
	 <DM2PR03MB38330DBBFFD1BC45D58F447E6E40@DM2PR03MB383.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <DM2PR03MB38330DBBFFD1BC45D58F447E6E40-ufbTtyGzTTRJonC5hhDUuuO6mTEJWrR4XA4E9RH9d+qIuWR1G4zioA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liberman Igal-B31950 <Igal.Liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 2015-04-16 at 01:11 -0500, Liberman Igal-B31950 wrote:
> 
> 
> Regards,
> Igal Liberman.
> 
> > -----Original Message-----
> > From: Wood Scott-B07421
> > Sent: Wednesday, April 15, 2015 8:36 PM
> > To: Liberman Igal-B31950
> > Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> > Subject: Re: [v3] dt/bindings: qoriq-clock: Add binding for FMan clock mux
> > 
> > On Tue, 2015-04-14 at 13:56 +0300, Igal.Liberman wrote:
> > > From: Igal Liberman <Igal.Liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > >
> > > v3: Addressed feedback from Scott:
> > > 	- Removed clock specifier description.
> > >
> > > v2: Addressed feedback from Scott:
> > > 	- Moved the "fman-clk-mux" clock provider details
> > > 	  under "clocks" property.
> > >
> > > Signed-off-by: Igal Liberman <Igal.Liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > > ---
> > >  .../devicetree/bindings/clock/qoriq-clock.txt      |   17 +++++++++++++++--
> > >  1 file changed, 15 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/clock/qoriq-clock.txt
> > > b/Documentation/devicetree/bindings/clock/qoriq-clock.txt
> > > index b0d7b73..2bb3b38 100644
> > > --- a/Documentation/devicetree/bindings/clock/qoriq-clock.txt
> > > +++ b/Documentation/devicetree/bindings/clock/qoriq-clock.txt
> > > @@ -65,9 +65,10 @@ Required properties:
> > >  		It takes parent's clock-frequency as its clock.
> > >  	* "fsl,qoriq-platform-pll-1.0" for the platform PLL clock (v1.0)
> > >  	* "fsl,qoriq-platform-pll-2.0" for the platform PLL clock (v2.0)
> > > +	* "fsl,fman-clk-mux" for the Frame Manager clock.
> > >  - #clock-cells: From common clock binding. The number of cells in a
> > > -	clock-specifier. Should be <0> for "fsl,qoriq-sysclk-[1,2].0"
> > > -	clocks, or <1> for "fsl,qoriq-core-pll-[1,2].0" clocks.
> > > +	clock-specifier. Should be <0> for "fsl,qoriq-sysclk-[1,2].0" and
> > > +	"fsl,fman-clk-mux" clocks or <1> for "fsl,qoriq-core-pll-[1,2].0".
> > >  	For "fsl,qoriq-core-pll-1.0" clocks, the single
> > >  	clock-specifier cell may take the following values:
> > >  	* 0 - equal to the PLL frequency
> > > @@ -145,6 +146,18 @@ Example for clock block and clock provider:
> > >  			clocks = <&sysclk>;
> > >  			clock-output-names = "platform-pll", "platform-pll-
> > div2";
> > >  		};
> > > +
> > > +		fm0clk: fm0-clk-mux {
> > > +			#clock-cells = <0>;
> > > +			reg = <0x10 4>
> > > +			compatible = "fsl,fman-clk-mux";
> > > +			clocks = <&pll0 0>, <&pll0 1>, <&pll0 2>, <&pll0 3>,
> > > +				 <&platform_pll 0>, <&pll1 1>, <&pll1 2>;
> > > +			clock-names = "pll0", "pll0-div2", "pll0-div3",
> > > +				      "pll0-div4", "platform-pll", "pll1-div2",
> > > +				      "pll1-div3";
> > > +			clock-output-names = "fm0-clk";
> > > +		};
> > >  	};
> > >  };
> > >
> > 
> > I don't see this register in the manuals for older DPAA chips, such as
> > p4080 or p3041.  Is it present but undocumented?  Should I be looking
> > somewhere other than "Clocking Memory Map"?
> > 
> 
> It's available only in part of the new chips (T4, T2, B4).
> In T1024/T1040 there's only one option for FMan clock so this register is not available.

So it's part of the 2.0 chassis?  I'd stick a 2.0 in there, then.  Who
knows what we may see in the future.

-Scott


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
