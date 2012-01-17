From: Dong Aisheng-B29396 <B29396-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: Pinmux bindings proposal
Date: Tue, 17 Jan 2012 09:46:42 +0000
Message-ID: <7FE21149F4667147B645348EC6057885092D56@039-SN2MPN1-013.039d.mgd.msft.net>
References: <74CDBE0F657A3D45AFBB94109FB122FF17801D202F@HQMAIL01.nvidia.com>
 <7FE21149F4667147B645348EC6057885091DEA@039-SN2MPN1-013.039d.mgd.msft.net>
 <20120117082334.GA31295@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120117082334.GA31295-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
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
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org" <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org" <cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Dong Aisheng <dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> -----Original Message-----
> From: Shawn Guo [mailto:shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org]
> Sent: Tuesday, January 17, 2012 4:24 PM
> To: Dong Aisheng-B29396
> Cc: Stephen Warren; linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org; s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org;
> rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org; kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org; cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org; Simon Glass
> (sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org); Dong Aisheng; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-
> kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> Subject: Re: Pinmux bindings proposal
> Importance: High
> 
> On Mon, Jan 16, 2012 at 12:50:02PM +0000, Dong Aisheng-B29396 wrote:
> ...
> > >                 /*
> > >                  * The actual definition of the complete state of the
> > >                  * pinmux as required by some driver.
> > >                  *
> > >                  * These can be either directly in the device node, or
> > >                  * somewhere in tegra20.dtsi in order to provide pre-
> > >                  * selected/common configurations. Hence, they're referred
> > >                  * to by phandle above.
> > >                  */
> > >                 pmx_sdhci_active: {
> > >                         /*
> > >                          * Pin mux settings. Mandatory?
> > Mandatory for what?
> >
> > >                          * Not mandatory if the 1:1 mentioned above is
> > >                          * extended to 1:n.
> > >                          *
> > >                          * Format is <&pmx_controller_phandle
> muxable_entity_id
> > >                          * selected_function>.
> > >                          *
> > >                          * The pmx phandle is required since there may be
> more
> > >                          * than one pinmux controller in the system. Even if
> > >                          * this node is inside the pinmux controller itself,
> I
> > >                          * think it's simpler to just always have this field
> > >                          * present in the binding for consistency.
> > >                          *
> > >                          * Alternative: Format is <&pmx_controller_phandle
> > >                          * pmx_controller_specific_data>. In this case, the
> > >                          * pmx controller needs to define #pinmux-mux-cells,
> > >                          * and provide the pinctrl core with a mapping
> > >                          * function to handle the rest of the data in the
> > >                          * property. This is how GPIOs and interrupts work.
> > >                          * However, this will probably interact badly with
> > >                          * wanting to parse the entire pinmux map early in
> > >                          * boot, when perhaps the pinctrl core is
> initialized,
> > >                          * but the pinctrl driver itself is not.
> > >                          */
> > >                         mux =
> > >                                 <&tegra_pmx TEGRA_PMX_PG_DTA TEGRA_PMX_MUX_1>
> > >                                 <&tegra_pmx TEGRA_PMX_PG_DTD TEGRA_PMX_MUX_1>
> > >                                 /* Syntax example */
> > >                                 <&foo_pmx FOO_PMX_PG_X
> > > FOO_PMX_MUX_0>;
> > I'm still think how do we construct the pinmux map for such binding.
> > The format you're using is:
> > <&pmx_controller_phandle muxable_entity_id selected_function> For
> > contruct pinmux map, we need to know at least 3 things for a device:
> > a) pinctrl device b) function name c) group name.
> > For a, we can get it from this binding.
> > But for b and c, since they are constants, how to convert to name string?
> >
> I guess, for function name, it should be retrieved from the client device node,
> and for the group name, it should be retrieved from the node here.
> 
I guess Stephen's idea is to retrieving the function name and group name
>From the pinctrl driver since Tagre prefers to define those things in driver
Rather than in board file or soc.dts file.
But it does not fit for IMX since we define it in soc.dts.

> For above example, the function name can be picked from sdhci device node
> pinctr-names property I proposed,
If I understand correctly, the pinctrl-names property you proposed represents
The pin group state.
 
> and the group name can just be
> 'pmx_sdhci_active', which is not a very nice name here and reminds me the
> following point.
> 
No, I don't think it's suitable for group name since pmx_sdhci_active is not a
group node (actually it includes many groups).

> Considering the different pinctrl configurations for the same client device
> usually share the same pinmux and only pinconf varies. 
I have the same doubts before.
Is there a real case that device has the different pinmux in different state?
Stephen?

> It may worth introducing
> another level phandle reference.  Something like the following:
> 
> 	pinmux_sdhci: pinmux-sdhci {
> 		mux =
> 			<&tegra_pmx TEGRA_PMX_PG_DTA TEGRA_PMX_MUX_1>
> 			<&tegra_pmx TEGRA_PMX_PG_DTD TEGRA_PMX_MUX_1>;
> 	};
> 
> 	pinconf_sdhci_active: pinconf-sdhci-active {
> 		config =
> 			<&tegra_pmx TEGRA_PMX_PG_DTA TEGRA_PMX_CONF_DRIVE_STRENGTH 5>
> 			<&tegra_pmx TEGRA_PMX_PG_DTD TEGRA_PMX_CONF_DRIVE_STRENGTH 5>
> 			<&tegra_pmx TEGRA_PMX_PG_DTA TEGRA_PMX_CONF_SLEW_RATE 4>
> 			<&tegra_pmx TEGRA_PMX_PG_DTD TEGRA_PMX_CONF_SLEW_RATE 8>;
> 	};
> 
> 	pinconf_sdhci_suspend: pinconf-sdhci-suspend {
> 		config =
> 			<&tegra_pmx TEGRA_PMX_PG_DTA TEGRA_PMX_CONF_TRISTATE 1>
> 			<&tegra_pmx TEGRA_PMX_PG_DTD TEGRA_PMX_CONF_TRISTATE 1>
> 			<&tegra_pmx TEGRA_PMX_PG_DTA TEGRA_PMX_CONF_DRIVE_STRENGTH 5>
> 			<&tegra_pmx TEGRA_PMX_PG_DTD TEGRA_PMX_CONF_DRIVE_STRENGTH 5>
> 			<&tegra_pmx TEGRA_PMX_PG_DTA TEGRA_PMX_CONF_SLEW_RATE 4>
> 			<&tegra_pmx TEGRA_PMX_PG_DTD TEGRA_PMX_CONF_SLEW_RATE 8>;
> 	};
> 
The config makes sense to me.
The only question is how to get group name to match with the predefined groups.

Besides per pin group configuration support, we may also want per pin configuration
Support as the latest patch sent by Linus.
http://www.spinics.net/lists/arm-kernel/msg155712.html

> 	pinctrl_sdhci_active: pinctrl-sdhci-active {
> 		pinmux = <&pinmux_sdhci>;
> 		pinconf = <&pinconf_sdhci_active>;
> 	};
> 
> 	pinctrl_sdhci_suspend: pinctrl-sdhci-suspend {
> 		pinmux = <&pinmux_sdhci>;
> 		pinconf = <&pinconf_sdhci_suspend>;
> 	};
> 
> 	sdhci@c8000200 {
> 		...
> 		pinctrl = <&pinctrl_sdhci_active> <&pinctrl_sdhci_suspend>;
> 		pinctrl-names = "active", "suspend";
> 	};
> 
> This will be pretty useful for imx6 usdhc case, which will have 3 pinctrl
> configuration for each usdhc device (imx6 has 4 usdhc devices), pinctrl-50mhz,
> pinctrl-100mhz and pinctrl-200mhz.  All these 3 states have the exactly same
> pinmux settings, and only varies on pinconf.
> 
> > >                          /*
> > >                          * Pin configuration settings. Optional.
> > >                          *
> > >                          * Format is <&pmx_controller_phandle
> muxable_entity_id
> > >                          * configuration_option configuration_value>.
> > >                          */
> > >                         config =
> > >                                 <&tegra_pmx TEGRA_PMX_PG_DTA
> > > TEGRA_PMX_CONF_DRIVE_STRENGTH 5>
> > >                                 <&tegra_pmx TEGRA_PMX_PG_DTD
> > > TEGRA_PMX_CONF_DRIVE_STRENGTH 5>
> > >                                 <&tegra_pmx TEGRA_PMX_PG_DTA
> > > TEGRA_PMX_CONF_SLEW_RATE 4>
> > >                                 <&tegra_pmx TEGRA_PMX_PG_DTD
> > > TEGRA_PMX_CONF_SLEW_RATE 8>;
> > >                         /*
> > >                          * Perhaps allow additional custom properties here
> to
> > >                          * express things we haven't thought of. The pinctrl
> > >                          * drivers would be responsible for parsing them.
> > >                          */
> > >                 };
> > >                 pmx_sdhci_standby: {
> > >                         mux =
> > >                                 <&tegra_pmx TEGRA_PMX_PG_DTA TEGRA_PMX_MUX_1>
> > >                                 <&tegra_pmx TEGRA_PMX_PG_DTD
> TEGRA_PMX_MUX_1>;
> > >                         config =
> > >                                 <&tegra_pmx TEGRA_PMX_PG_DTA
> > > TEGRA_PMX_CONF_TRISTATE 1>
> > >                                 <&tegra_pmx TEGRA_PMX_PG_DTD
> > > TEGRA_PMX_CONF_TRISTATE 1>
> > >                                 <&tegra_pmx TEGRA_PMX_PG_DTA
> > > TEGRA_PMX_CONF_DRIVE_STRENGTH 5>
> > >                                 <&tegra_pmx TEGRA_PMX_PG_DTD
> > > TEGRA_PMX_CONF_DRIVE_STRENGTH 5>
> > >                                 <&tegra_pmx TEGRA_PMX_PG_DTA
> > > TEGRA_PMX_CONF_SLEW_RATE 4>
> > >                                 <&tegra_pmx TEGRA_PMX_PG_DTD
> > > TEGRA_PMX_CONF_SLEW_RATE 8>;
> > >                 };
> > >         };
> > > };
> > >
> > > Integer IDs for "muxable entities": Pins on IMX, pin groups on Tegra:
> > >
> > If "muxable entities" is pins on IMX, I'm wondering how we define the
> > predefined Functions and groups or if we still need to do that.
> >
> Let's put this in the example below.
> 
> 	pinmux_usdhc1: pinmux-usdhc1 {
> 		mux = <IMX6Q_PAD_SD1_DAT1 0>
> 		      <IMX6Q_PAD_SD1_DAT2 0>
> 		      ...
> 	};
> 
Yes, I agree.
And in this way we're still using virtual groups.
It has no big difference as we did before like:
pinmux-groups {
        uart4grp: group@0 {
                grp-name = "uart4grp";
                grp-pins = <107 108>;
                grp-mux = <4 4>;
        };

        sd4grp: group@1 {
                grp-name = "sd4grp";
                grp-pins = <170 171 180 181 182 183 184 185 186 187>;
                grp-mux = <0 0 1 1 1 1 1 1 1 1>;
        };
};

The real problem is do we need to support individual pin mux
Or still using virtual pin group?
For the way Stephen proposed, we can only support individual pin mux
Since IMX pins are not grouped together in HW.

> 	pinconf_usdhc1_50mhz: pinconf-usdhc1-50mhz {
> 		config = <IMX6Q_PAD_SD1_DAT1 IMX6Q_PAD_CONF_ALL 0x834>
> 			 <IMX6Q_PAD_SD1_DAT2 IMX6Q_PAD_CONF_ALL 0x834>
> 			 ...
> 	};
> 
> 	pinconf_usdhc1_100mhz: pinconf-usdhc1-100mhz {
> 		config = <IMX6Q_PAD_SD1_DAT1 IMX6Q_PAD_CONF_ALL 0x330>
> 			 <IMX6Q_PAD_SD1_DAT2 IMX6Q_PAD_CONF_ALL 0x330>
> 			 ...
> 	};
> 
> 	pinconf_usdhc1_200mhz: pinconf-usdhc1-200mhz {
> 		config = <IMX6Q_PAD_SD1_DAT1 IMX6Q_PAD_CONF_ALL 0x334>
> 			 <IMX6Q_PAD_SD1_DAT2 IMX6Q_PAD_CONF_ALL 0x334>
> 			 ...
> 	};
> 
> 	pinctrl_usdhc1_50mhz: pinctrl-usdhc1-50mhz {
> 		pinmux = <&pinmux_usdhc1>;
> 		pinconf = <&pinconf_usdhc1_50mhz>;
> 	};
> 
> 	pinctrl_usdhc1_100mhz: pinctrl-usdhc1-100mhz {
> 		pinmux = <&pinmux_usdhc1>;
> 		pinconf = <&pinconf_usdhc1_100mhz>;
> 	};
> 
> 	pinctrl_usdhc1_200mhz: pinctrl-usdhc1-200mhz {
> 		pinmux = <&pinmux_usdhc1>;
> 		pinconf = <&pinconf_usdhc1_200mhz>;
> 	};
> 
> 	usdhc@02190000 { /* uSDHC1 */
> 		...
> 		pinctrl = <&usdhc1_50mhz>, <&usdhc1_100mhz>, <&usdhc1_200mhz>;
> 		pinctrl-names = "usdhc1-50mhz", "usdhc1-100mhz", "usdhc1-200mhz";
> 	};
> 
> In this example, we have 3 functions/states for client device usdhc1, "usdhc1-
> 50mhz", "usdhc1-100mhz", and "usdhc1-200mhz".  The group is being defined by
> enumerating the pins in property 'mux' of node pinmux_usdhc1.
> 
Yes, It's still under development by Linus.
The last patch Linus sent still does not support state change for specific device.
But the method is ok to me.

> > >     TEGRA_PMX_PG_DTA
> > >     TEGRA_PMX_PG_DTD
> > >
> > > Each individual pinmux driver's bindings needs to define what each
> > > integer ID represents.
> > >
> > Does it mean both pinmux driver and soc.dtsi file need define those
> > macros if dtc Supports constants?
> >
> Yes, I think it does.  But we should try to work out some way letting dts and
> linux driver include the same header file to avoid maintaining two copies of the
> same data.
> 
I'm also care about the potential consistent issue.

Regards
Dong Aisheng
