Return-Path: <SRS0=5DI3=NC=buserror.net=oss@kernel.org>
Message-ID: <23919e8b8ec0d7cd9eb7fb1a134adbb9a17ca209.camel@buserror.net>
From: Scott Wood <oss@buserror.net>
Date: Mon, 22 Oct 2018 00:20:45 -0500
In-Reply-To: <DB5PR0401MB2213DC3FA17E6B8E42258EDFF3F40@DB5PR0401MB2213.eurprd04.prod.outlook.com>
References: <20180919073906.34187-1-andy.tang@nxp.com>
	 <20180919073906.34187-2-andy.tang@nxp.com>
	 <bb158670f1556156f17c3a9eefaa0a5e35c1591e.camel@buserror.net>
	 <DB5PR0401MB2213DC3FA17E6B8E42258EDFF3F40@DB5PR0401MB2213.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 2/3] powerpc: t102x: upgrade the legacy clock node
To: Andy Tang <andy.tang@nxp.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>
Cc: "sboyd@kernel.org" <sboyd@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Mon, 2018-10-22 at 01:34 +0000, Andy Tang wrote:
> Hi Scott,
> 
> Please see my reply inline.
> 
> > -----Original Message-----
> > From: Scott Wood <oss@buserror.net>
> > Sent: 2018年10月21日 7:54
> > To: Andy Tang <andy.tang@nxp.com>; mturquette@baylibre.com
> > Cc: sboyd@kernel.org; robh+dt@kernel.org; mark.rutland@arm.com;
> > linux-clk@vger.kernel.org; devicetree@vger.kernel.org
> > Subject: Re: [PATCH 2/3] powerpc: t102x: upgrade the legacy clock node
> > 
> > On Wed, 2018-09-19 at 15:39 +0800, andy.tang@nxp.com wrote:
> > > +clockgen: global-utilities@e1000 {
> > > +	compatible = "fsl,qoriq-clockgen";
> > 
> > Where does this compatible string come from?
> > 
> > > +		compatible = "fsl,t1023-clockgen";
> > >  	};
> > 
> > And here you overwrite it with only the chip-specific compatible?
> > 
> > Is t1023 incompatible with both fsl,qoriq-clockgen-1.0 and
> > fsl,qoriq-clockgen- 2.0?  The existing dts says 2.0; is that wrong?
> > 
> > BTW, assuming it is 2.0 compatible and thus the use of
> > qoriq-clockgen2.dtsi is correct, the best course of action is probably to
> > to
> > remove the legacy stuff from all fsl chips, rather than introduce a new
> > dtsi.
> > In fact it'd be nice to see it all removed in any case. :-)
> 
> qoriq-clockgen*.dtsi are used by legacy bindings. The contents are all of
> legacy bindings.
> To use new framework, I introduce a new dtsi which contains new bindings and
> used for all PPC soc.
> A chip-specific compatible is needed because driver will use it to get chip-
> specific clock tree information.
> The clock information was defined in driver not in dts in new framework,
> remember?

I'm aware that a chip-specific compatible is required.  What is unusual (on
PPC) is providing *only* the chip-specific compatible.  I was expecting
something more along the lines of https://patchwork.ozlabs.org/patch/486565/

Granted, the driver requiring two different compatibles to be present is odd,
and was a convenience based on what was already in the device trees, but the
fsl,qoriq-clockgen-2.0 compatible is part of the new binding (albeit an
optional part).  I guess I don't mind no longer relying on it, but at least
remove the "fsl,qoriq-clockgen" string.

-Scott
