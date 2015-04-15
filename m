From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] powerpc/dts: Update the core cluster PLL node(s)
Date: Wed, 15 Apr 2015 12:14:35 -0500
Message-ID: <1429118075.22867.719.camel@freescale.com>
References: <1429005306-24544-1-git-send-email-igal.liberman@freescale.com>
	 <1429042868.22867.689.camel@freescale.com>
	 <1429042950.22867.690.camel@freescale.com>
	 <DM2PR03MB3831BEEDD2C17991818FFA9E6E50@DM2PR03MB383.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <DM2PR03MB3831BEEDD2C17991818FFA9E6E50-ufbTtyGzTTRJonC5hhDUuuO6mTEJWrR4XA4E9RH9d+qIuWR1G4zioA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liberman Igal-B31950 <Igal.Liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2015-04-15 at 06:07 -0500, Liberman Igal-B31950 wrote:
> 
> 
> Regards,
> Igal Liberman.
> 
> > -----Original Message-----
> > From: Wood Scott-B07421
> > Sent: Tuesday, April 14, 2015 11:23 PM
> > To: Liberman Igal-B31950
> > Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> > Subject: Re: [PATCH] powerpc/dts: Update the core cluster PLL node(s)
> > 
> > On Tue, 2015-04-14 at 15:21 -0500, Scott Wood wrote:
> > > On Tue, 2015-04-14 at 12:55 +0300, Igal.Liberman wrote:
> > > > From: Igal Liberman <Igal.Liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > > >
> > > > This patch replaces the following:
> > > > 	https://patchwork.ozlabs.org/patch/427664/
> > > >
> > > > This patch is described by the following binding document update:
> > > > 	https://patchwork.ozlabs.org/patch/461150/
> > > >
> > > > Signed-off-by: Igal Liberman <Igal.Liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > > > ---
> > > >  arch/powerpc/boot/dts/fsl/qoriq-clockgen2.dtsi |    6 ++++--
> > > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/arch/powerpc/boot/dts/fsl/qoriq-clockgen2.dtsi
> > > > b/arch/powerpc/boot/dts/fsl/qoriq-clockgen2.dtsi
> > > > index 48e0b6e..7e1f074 100644
> > > > --- a/arch/powerpc/boot/dts/fsl/qoriq-clockgen2.dtsi
> > > > +++ b/arch/powerpc/boot/dts/fsl/qoriq-clockgen2.dtsi
> > > > @@ -49,14 +49,16 @@ global-utilities@e1000 {
> > > >  		reg = <0x800 0x4>;
> > > >  		compatible = "fsl,qoriq-core-pll-2.0";
> > > >  		clocks = <&sysclk>;
> > > > -		clock-output-names = "pll0", "pll0-div2", "pll0-div4";
> > > > +		clock-output-names = "pll0", "pll0-div2", "pll0-div3",
> > > > +				      "pll0-div4";
> > > >  	};
> > > >  	pll1: pll1@820 {
> > > >  		#clock-cells = <1>;
> > > >  		reg = <0x820 0x4>;
> > > >  		compatible = "fsl,qoriq-core-pll-2.0";
> > > >  		clocks = <&sysclk>;
> > > > -		clock-output-names = "pll1", "pll1-div2", "pll1-div4";
> > > > +		clock-output-names = "pll1", "pll1-div2", "pll1-div3",
> > > > +				      "pll1-div4";
> > >
> > > Wait, so if the driver implements the binding you submitted, you'll
> > > break compatibility with these older device trees...
> > >
> > > I think we need to just accept the ugly count-the-clock-names approach
> > > and document it.
> > 
> > Is there any current 2.0 clock consumer that references pll-div4?
> > 
> 
> I looked at T4240 for example, there's a mux node which adds pll-div4 option:
> mux0: mux0@0 {
> 	#clock-cells = <0>;
> 	reg = <0x0 0x4>;
> 	compatible = "fsl,qoriq-core-mux-2.0";
> 	clocks = <&pll0 0>, <&pll0 1>, <&pll0 2>,
> 		<&pll1 0>, <&pll1 1>, <&pll1 2>,
> 		<&pll2 0>, <&pll2 1>, <&pll2 2>;
> 	clock-names = "pll0", "pll0-div2", "pll0-div4",
> 		"pll1", "pll1-div2", "pll1-div4",
> 		"pll2", "pll2-div2", "pll2-div4";
> 	clock-output-names = "cmux0";
> };
> 
> After this change <&pll0 2> will represent "pll0-div3" and not "pll0-div4".

So this needs to be updated to match -- and it confirms that existing
device trees will be broken if you base the interpretation on compatible
rather than the number of clock-output-names.

-Scott


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
