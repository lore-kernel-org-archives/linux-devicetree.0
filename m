From: Dong Aisheng-B29396 <B29396-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: Pinmux bindings proposal
Date: Wed, 18 Jan 2012 09:32:40 +0000
Message-ID: <7FE21149F4667147B645348EC6057885094F47@039-SN2MPN1-013.039d.mgd.msft.net>
References: <74CDBE0F657A3D45AFBB94109FB122FF17801D202F@HQMAIL01.nvidia.com>
 <7FE21149F4667147B645348EC6057885091DEA@039-SN2MPN1-013.039d.mgd.msft.net>
 <20120117082334.GA31295@S2101-09.ap.freescale.net>
 <74CDBE0F657A3D45AFBB94109FB122FF17801D22EB@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF17801D22EB-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org" <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org" <cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>, "s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Dong Aisheng <dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> -----Original Message-----
> From: Stephen Warren [mailto:swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org]
....

> > Considering the different pinctrl configurations for the same client
> > device usually share the same pinmux and only pinconf varies.  It may
> > worth introducing another level phandle reference.  Something like the
> > following:
> 
> I don't think there's a need for another level of indirection. The 1:n model I
> was talking about already handles this, I believe. See below.
> 
> > 	pinmux_sdhci: pinmux-sdhci {
> > 		mux =
> > 			<&tegra_pmx TEGRA_PMX_PG_DTA TEGRA_PMX_MUX_1>
> > 			<&tegra_pmx TEGRA_PMX_PG_DTD TEGRA_PMX_MUX_1>;
> > 	};
> >
> > 	pinconf_sdhci_active: pinconf-sdhci-active {
> > 		config =
> > 			<&tegra_pmx TEGRA_PMX_PG_DTA TEGRA_PMX_CONF_DRIVE_STRENGTH 5>
> > 			<&tegra_pmx TEGRA_PMX_PG_DTD TEGRA_PMX_CONF_DRIVE_STRENGTH 5>
> > 			<&tegra_pmx TEGRA_PMX_PG_DTA TEGRA_PMX_CONF_SLEW_RATE 4>
> > 			<&tegra_pmx TEGRA_PMX_PG_DTD TEGRA_PMX_CONF_SLEW_RATE 8>;
> > 	};
> >
> > 	pinconf_sdhci_suspend: pinconf-sdhci-suspend {
> > 		config =
> > 			<&tegra_pmx TEGRA_PMX_PG_DTA TEGRA_PMX_CONF_TRISTATE 1>
> > 			<&tegra_pmx TEGRA_PMX_PG_DTD TEGRA_PMX_CONF_TRISTATE 1>
> > 			<&tegra_pmx TEGRA_PMX_PG_DTA TEGRA_PMX_CONF_DRIVE_STRENGTH 5>
> > 			<&tegra_pmx TEGRA_PMX_PG_DTD TEGRA_PMX_CONF_DRIVE_STRENGTH 5>
> > 			<&tegra_pmx TEGRA_PMX_PG_DTA TEGRA_PMX_CONF_SLEW_RATE 4>
> > 			<&tegra_pmx TEGRA_PMX_PG_DTD TEGRA_PMX_CONF_SLEW_RATE 8>;
> > 	};
> 
> Those 3 nodes make sense to me.
> 
> > 	pinctrl_sdhci_active: pinctrl-sdhci-active {
> > 		pinmux = <&pinmux_sdhci>;
> > 		pinconf = <&pinconf_sdhci_active>;
> > 	};
> >
> > 	pinctrl_sdhci_suspend: pinctrl-sdhci-suspend {
> > 		pinmux = <&pinmux_sdhci>;
> > 		pinconf = <&pinconf_sdhci_suspend>;
> > 	};
> 
> I think we can avoid those 2 nodes.
> 
> > 	sdhci@c8000200 {
> > 		...
> > 		pinctrl = <&pinctrl_sdhci_active> <&pinctrl_sdhci_suspend>;
> > 		pinctrl-names = "active", "suspend";
> > 	};
> 
> And rewrite that node as:
> 
> sdhci@c8000200 {
>     ...
>     pinctrl = <&pinmux_sdhci> <&pinconf_sdhci_active>
>               <&pinmux_sdhci> <&pinconf_sdhci_suspend>;
>     pinctrl-names = "active", "active", "suspend", "suspend"; };
> 
> The only slight disadvantage here is that the person constructing the
> pinctrl/pinctrl-names properties needs to know to explicitly list both the
> separate mux/config phandles for each value in pinctrl-names. Still, this seems
> a reasonable compromise; the user is still picking from a bunch of pre-
> defined/canned nodes, they simply need to list 2 (or n in
> general) of them for each state.
> 
> > This will be pretty useful for imx6 usdhc case, which will have 3
> > pinctrl configuration for each usdhc device (imx6 has 4 usdhc
> > devices), pinctrl-50mhz, pinctrl-100mhz and pinctrl-200mhz.  All these
> > 3 states have the exactly same pinmux settings, and only varies on pinconf.
> 
> Yes, I definitely agree there's a need for this.
> 
> As an aside, I wonder if the following would be any better:
> 
> sdhci@c8000200 {
>     ...
>     pinctrl = <&pinmux_sdhci> <&pinconf_sdhci_active>
>               <&pinmux_sdhci> <&pinconf_sdhci_suspend>;
>     /* Number of entries in pinctrl for each in pinctrl-names */
>     pinctrl-entries = <2 2>;
>     pinctrl-names = "active", "suspend"; };
> 
> That seems more complex though.
> 
This makes sense to me.

Regards
Dong Aisheng
