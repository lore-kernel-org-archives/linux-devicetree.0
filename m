From: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Subject: Re: Virtual devices (cpufreq etc) and DT
Date: Wed, 3 Aug 2011 17:41:28 +0100
Message-ID: <20110803164128.GQ2607@pulham.picochip.com>
References: <20110803095019.GB2607@pulham.picochip.com>
	<4E39775C.4090305@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4E39775C.4090305-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 03, 2011 at 11:29:16AM -0500, Rob Herring wrote:
> On 08/03/2011 04:50 AM, Jamie Iles wrote:
> > I'm trying to work out how our cpufreq driver fits in with device tree 
> > bindings.  We have a simple driver that just takes a struct clk and 
> > calls clk_set_rate() on it.  Is a node in the device tree the right way 
> > to do this as it isn't really a physical device?  I have the PLL in the 
> > clocks group of the DT:
> 
> Sounds generically useful...

Yes, once I've got it working internally I'll submit this as a generic 
thing for drivers/cpufreq.

> The OF clock bindings are not really completely finalized and work on
> the OF clk code is basically blocked waiting on the common struct clk
> infrastructure.

OK, so for the platform I'm working on mainlining at the moment does 
that mean I should leave the clock bindings for now or is that something 
that can be revised at a later date?

> > 
> > 	clocks {
> > 		...
> > 
> > 		arm_clk: clock@11 {
> > 			compatible = "picochip,pc3x3-pll";
> > 			reg = <0x800a0050 0x8>;
> > 			picoxcell,min-freq = <140000000>;
> > 			picoxcell,max-freq = <700000000>;
> > 			ref-clock = <&ref_clk>, "ref";
> > 			clock-outputs = "cpu";
> > 		};
> > 	};
> > 
> 
> This describes the clock output. You still need to describe the
> connection which is what the cpufreq driver should get. For that you
> need something like this:
> 
> 	cpu@0 {
> 		compatible = "arm,cortex-a9";
> 		reg = <0>;
> 		cpu-clock = <&arm_clk>, "cpu";
> 	};
> 
> 	cpu@1 {
> 		compatible = "arm,cortex-a9";
> 		cpu-clock = <&arm_clk>, "cpu";
> 	};
> 
> Then look for the cpu node(s) and get it's clock.

Ahh, I hadn't thought of adding it to the cpu node, that's a nice way of 
representing it!

> > so I could reference that.  The of clk interface also requires a struct 
> > device for getting the clk so I guess this is needed...
> 
> I ran into that problem as well. Making of_clk_get take a struct
> device_node ptr instead of struct device fixes the problem. Here's a
> patch that does that.

Nice, thanks Rob!

Jamie
