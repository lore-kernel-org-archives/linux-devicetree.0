From: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: Pinmux bindings proposal V2
Date: Mon, 30 Jan 2012 18:29:06 -0800
Message-ID: <20120131022906.GH9339@atomide.com>
References: <20120124012038.GT22818@atomide.com>
 <74CDBE0F657A3D45AFBB94109FB122FF178CB81EDB@HQMAIL01.nvidia.com>
 <20120125000407.GU22818@atomide.com>
 <74CDBE0F657A3D45AFBB94109FB122FF178CB82433@HQMAIL01.nvidia.com>
 <20120127020832.GJ29812@atomide.com>
 <20120127065752.GB32740@S2101-09.ap.freescale.net>
 <20120127170545.GH13504@atomide.com>
 <20120130015607.GA10470@S2101-09.ap.freescale.net>
 <20120130172042.GE9339@atomide.com>
 <20120131013215.GB24681@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120131013215.GB24681-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Dong Aisheng <dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "Sascha Hauer (s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org)" <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org" <cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

* Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> [120130 16:49]:
> On Mon, Jan 30, 2012 at 09:20:42AM -0800, Tony Lindgren wrote:
> > * Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> [120129 17:13]:
> > > On Fri, Jan 27, 2012 at 09:05:45AM -0800, Tony Lindgren wrote:
> ...
> > > > Wouldn't it be cleaner to just clk_get esdhc_clk during init, then
> > > > do clk_set_rate on it to toggle the rates?
> > > >  
> > > It's not an init-time switch but run-time one.  That said,
> > > sdhci_ops.set_clock will be called during run-time.
> > 
> > Right, basically you don't want to do clk_get or pinmux_get during
> > runtime, you do that once one during init. Then do clk_set_rate or
> > whaterver during runtime.
> > 
> > Is there anything stopping from implementing sdhci_ops.set_rate
> > using clock framework and clk_set_rate in this case BTW?
> >  
> We are doing this exactly for clk, and trying to figure out how to
> handle pinctrl here.  I do not see how we can do pinmux_get at
> init-time and pinmux_set_whatever at run-time.  The pinmux API does
> not work that way.

Hmm OK I see what you mean. Maybe we should have something like
pinmux_get/set_function to change the mux without having to do
pinmux_put and pinmux_get during runtime? As long as the locking is
per pin that should be safe to do.
 
> > > > > > So I'd rather stay out of random named states for
> > > > > > the pins coming from device tree; If we still need them, they should
> > > > > > be common bindings rather than things like "xyz_clock_hack".
> > > > > > 
> > > > > The binding defines the syntax, and I do not see the necessity to
> > > > > force the particular state name, which is really pinctrl client
> > > > > device specific.
> > > > 
> > > > Do you have some other custom pin state example other than the
> > > > clock rate change example above?
> > > > 
> > > I have another case PM related.  To aggressively save power, the pins
> > > configured for particular function during active mode need to be
> > > muxed on gpio mode and output 0 in low-power mode.
> > 
> > OK, but basically only a small subset of pins of the total pins?
> > 
> Actually, all pins used by the block.

That's still a fraction of the total pins on the SoC that need dynamic
remuxing, right?

Regards,

Tony
