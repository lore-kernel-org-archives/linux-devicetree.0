From: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] ARM: socfpga: dts: add fpga manager
Date: Tue, 13 Oct 2015 22:27:48 +0200
Message-ID: <20151013202748.GD17155@pengutronix.de>
References: <1444760900-1373-1-git-send-email-atull@opensource.altera.com>
 <20151013185750.GB17155@pengutronix.de>
 <alpine.DEB.2.02.1510131412500.3527@linux-builds1>
 <alpine.DEB.2.10.1510132142250.2247@atull-730U3E-740U3E>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.10.1510132142250.2247@atull-730U3E-740U3E>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: atull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Cc: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi!

On Tue, Oct 13, 2015 at 09:46:15PM +0200, atull wrote:
> On Tue, 13 Oct 2015, Dinh Nguyen wrote:
> 
> > On Tue, 13 Oct 2015, Steffen Trumtrar wrote:
> > 
> > > Hi Alan!
> > > 
> > > On Tue, Oct 13, 2015 at 01:28:20PM -0500, atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org wrote:
> > > > From: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> > > > 
> > > > Add FPGA manager to device tree for SoCFPGA.
> > > > 
> > > > Signed-off-by: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> > > > ---
> > > >  arch/arm/boot/dts/socfpga.dtsi | 7 +++++++
> > > >  1 file changed, 7 insertions(+)
> > > > 
> > > > diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
> > > > index 314e589..e37ba11 100644
> > > > --- a/arch/arm/boot/dts/socfpga.dtsi
> > > > +++ b/arch/arm/boot/dts/socfpga.dtsi
> > > > @@ -834,5 +834,12 @@
> > > >  			compatible = "altr,sys-mgr", "syscon";
> > > >  			reg = <0xffd08000 0x4000>;
> > > >  		};
> > > > +
> > > > +		hps_0_fpgamgr: fpgamgr@0xff706000 {
> > > > +			compatible = "altr,socfpga-fpga-mgr";
> > > > +			reg = <0xFF706000 0x1000
> > > > +			       0xFFB90000 0x1000>;
> > > > +			interrupts = <0 175 4>;
> > > > +		};
> > > >  	};
> > > >  };
> > > 
> > > Please keep the format in line with the rest of the file:
> > > Hexvalues are lowercase and no 0x after the "fpgamgr@".
> > > I'd say "And please put the node in its proper position
> > > according to its address", but I see just now, that the
> > > dtsi is all messed up right now anyway :-(
> > > 
> 
> "all messed up" seems kind of unclear and overstated here.  From the 
> context, I assume you mean that you are pointing out that the nodes
> are in more or less alphatetical order and not in order of address.  Is 
> that what you mean or is the dtsi really all messed up?
> 

"more or less" was the thing that bugged me.
And for the record: I didn't try to blame anyone for this. I put
many of the nodes there myself ;-)

Regards,
Steffen

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
