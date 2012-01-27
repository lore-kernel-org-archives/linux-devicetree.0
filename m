From: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: Pinmux bindings proposal V2
Date: Thu, 26 Jan 2012 18:21:12 -0800
Message-ID: <20120127022111.GK29812@atomide.com>
References: <74CDBE0F657A3D45AFBB94109FB122FF1780DAB4CE@HQMAIL01.nvidia.com>
 <CAPnjgZ3Xhebn1x1A-Vdy78DWbDd=cp0AK6tL-R1SRzS4GdF97g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPnjgZ3Xhebn1x1A-Vdy78DWbDd=cp0AK6tL-R1SRzS4GdF97g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

Hi,

* Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> [120126 09:11]:
> 
> On Fri, Jan 20, 2012 at 2:22 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> 
> 1. It doesn't seem to make full use of the device tree format. For example,
> 
>    <TEGRA_PMX_PG_DTD TEGRA_PMX_CONF_DRIVE_STRENGTH 5>
> 
> would be better as something like
> 
>     drive-strength = <5>;
> 
> if we could arrange it. It also reduces the need for these
> TEGRA_PMX_CONF_DRIVE_STRENGTH defines.

I agree. This is something that most pinmux/pinconf drivers need to
implement, so it's best done in a generic way.
 
> In tegra20.dtsi:
> 
> / {
> 	&tegra_pmx {
> 		#address-cells = <1>;
> 		#size-cells = <0>;
> 
> 		/*
> 		 * This is the first option for SDIO1. It comes out
> 		 * on pin groups DTA and DTD. Boards can simply use this
> 		 * phandle in the driver node to get this option. Any options
> 		 * not used could potentially be dropped from the device tree
> 		 * blob for space-constrained boot loaders.
> 		 */
> 		pmx_sdhci1_dta_dtd: sdhci1-dta-dtd@0 {
> 			#address-cells = <1>;
> 			#size-cells = <0>;
> 			reg = <0>;
> 			label = "SDIO1 on DTA, DTD (4-bit)";
> 
> 			/*
> 			 * Here are the pin groups needed for this option.
> 			 * First DTA, then DTD.
> 			 */
> 			pmx@dta {
> 				reg = <PG_DTA>;
> 				mux = <PMX_MUX_SDIO1>;
> 				drive-strengh = <5>;
> 				slew-rate = <4>;

Using reg for the register offsets here makes sense to me. But doesn't that
mean that now we're back to having a node for each pin? And that is something
we're trying to avoid because of the bloat as most systems have one register
per pin, so this is not efficient for listing multiple pins.

So maybe we should just use what Stephen suggested for the array of registers
here:

				mux = <MUX_OFFSET1 INITIAL_MUX_VALUE1
				       MUX_OFFSET2 INITIAL_MUX_VALUE2>;

> 
> 				/*
> 				 * We support two states here, active
> 				 * and standby. Properties in these child
> 				 * nodes can override the ones at this level.
> 				 * Drivers can move between states just by
> 				 * making the changes in these nodes.
> 				 */
> 				state-active {
> 					reg = <PMX_CONF_ACTIVE>;
> 					tristate = <0>;
> 				};
> 				state-standby {
> 					reg = <PMX_CONF_STANDBY>;
> 					tristate = <1>;
> 					drive-strengh = <2>;
> 				};
> 			};

This seems like a qood way to represent the alternative mux states for
the muxes that need them. This is assuming the states have standard
bindings and not some random names. I still don't know if we need them
though. And again when we have multiple registers, we'd have to have
either multiple entries for each pin, or use the array instead of reg.

Maybe we need two bindings: A minimal subset of what Stephen is suggesting
that can handle 95% of the muxes with minimal overhead, then what you're
suggesting for the few muxes that need multiple states?

Regards,

Tony
