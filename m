From: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: Pinmux bindings proposal V2
Date: Fri, 27 Jan 2012 09:37:32 -0800
Message-ID: <20120127173732.GJ13504@atomide.com>
References: <74CDBE0F657A3D45AFBB94109FB122FF1780DAB4CE@HQMAIL01.nvidia.com>
 <CAPnjgZ3Xhebn1x1A-Vdy78DWbDd=cp0AK6tL-R1SRzS4GdF97g@mail.gmail.com>
 <20120127022111.GK29812@atomide.com>
 <CAPnjgZ2EkvTMsOkWyf4pfwRpvcvYs=WaKy5Gi8fdkAUQmvt=ig@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPnjgZ2EkvTMsOkWyf4pfwRpvcvYs=WaKy5Gi8fdkAUQmvt=ig-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Dong Aisheng <dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org" <cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>, "Sascha Hauer (s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org)" <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

* Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> [120127 07:12]:
> 
> On Thu, Jan 26, 2012 at 6:21 PM, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org> wrote:
> >
> > Maybe we need two bindings: A minimal subset of what Stephen is suggesting
> > that can handle 95% of the muxes with minimal overhead, then what you're
> > suggesting for the few muxes that need multiple states?
> 
> Perhaps that would work, it certainly deals nicely with making the
> rare cases less ugly if indeed they are rare. Of course a single
> binding that is not too ugly and still reasonably efficient would be
> best.
> 
> I will have a think about this a bit more and see if anything leaps
> out. It's quite an interesting problem...

Just to try to recap what has come up so far:

1. We need to avoid bloating things for basic cases to initialize
   several hundred pins.

2. Some muxes need to define multiple states.

3. We need to pass a flag for each mux to know whether or
   not it can be freed after init.

So how about let's do separate static and dynamic bindings,
something like this:

	/*
	 * Static init time only mux where
	 * we only specify phandle to driver
	 * and, offset of the mux, and the value.
	 * These pins are discarded after init.
	 *
	 * Format:	  mux_ctrl      offset value
	 */
	pinctrl-static = <&pmx_driver1  0x0020 0x1245
			   &pmx_driver2 0x0022 0x6578>;

	/*
	 * Dynamic mux where the mux is kept around after
	 * init and multiple states can be defined for
	 * a mux as a subnode of the pinmux controller.
	 *
	 * Format:	   mux_phandle   initial state
	 */ 
	pinctrl-dynamic = <&pmx_sdhci    PMX_STATE_ENABLED
			   &pmx_ehci_xcv PMX_STATE_ENABLED>;

This would make pinctrl-static binding follow the same
standard as GPIO binding and can be parsed easily with
of_parse_phandle_with_args.

Then for pinctrl-dynamic we can make a custom parser,
and the binding can follow the more readable format as
Simon posted.

Regards,

Tony
