From: Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] USB: doc: Binding document for ehci-platform driver
Date: Wed, 24 Oct 2012 19:37:31 +0200
Message-ID: <16682515.Yr7sQYmXfE@bender>
References: <Pine.LNX.4.44L0.1210241249010.1282-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <Pine.LNX.4.44L0.1210241249010.1282-100000-IYeN2dnnYyZXsRXLowluHWD2FQJk+8+b@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday 24 October 2012 12:54:05 Alan Stern wrote:
> On Wed, 24 Oct 2012, Stephen Warren wrote:
> 
> > Device tree files always need a completely specific value in the
> > compatible property, even when less-specific/more-generic values are
> > also present. So for example, the Linux driver might only care about the
> > following existing:
> > 
> > compatible = "usb-ehci".
> > 
> > However, any actual EHCI controller is always some specific model, so
> > the compatible value must define which specific model it is, e.g.:
> > 
> > compatible = "nvidia,tegra20-ehci", "usb-ehci".
> > 
> > Now lets say the Tegra30 EHCI controller is identical to the Tegra20
> > controller. That needs to be explicitly represented too:
> > 
> > compatible = "nvidia,tegra30-ehci", "nvidia,tegra20-ehci", "usb-ehci".
> > 
> > In that case, the driver might still only declare support for
> > "nvidia,tegra20-ehci", but "nvidia,tegra30-ehci" is added to be explicit
> > about the actual HW model.
> > 
> > This doesn't continue forever though; you typically only list the
> > specific HW model, the base specific model it's compatible with, and any
> > generic value needed. So, a hypothetical Tegra40 EHCI controller would be:
> > 
> > compatible = "nvidia,tegra40-ehci", "nvidia,tegra20-ehci", "usb-ehci".
> > 
> > Given that, there is always something to key any newly required quirk
> > off, so even if the need for a quirk is found later, the device tree
> > already contains the information needed to trigger it.
> 
> Okay.  It appears that quite a few .dts/.dtsi files mention "usb-ehci", 
> for no apparent reason (given that the drivers don't list it):
> 
> [stern@iolanthe usb-3.6]$ find arch -name '*.dts*' | xargs grep usb-ehci
> arch/mips/cavium-octeon/octeon_3xxx.dts:                                compatible = "cavium,octeon-6335-ehci","usb-ehci";
> arch/mips/cavium-octeon/octeon_68xx.dts:                                compatible = "cavium,octeon-6335-ehci","usb-ehci";
> arch/arm/boot/dts/tegra20.dtsi:         compatible = "nvidia,tegra20-ehci", "usb-ehci";
> arch/arm/boot/dts/tegra20.dtsi:         compatible = "nvidia,tegra20-ehci", "usb-ehci";
> arch/arm/boot/dts/tegra20.dtsi:         compatible = "nvidia,tegra20-ehci", "usb-ehci";
> arch/arm/boot/dts/at91sam9x5.dtsi:                      compatible = "atmel,at91sam9g45-ehci", "usb-ehci";
> arch/arm/boot/dts/spear13xx.dtsi:                       compatible = "st,spear600-ehci", "usb-ehci";
> arch/arm/boot/dts/spear13xx.dtsi:                       compatible = "st,spear600-ehci", "usb-ehci";
> arch/arm/boot/dts/spear3xx.dtsi:                        compatible = "st,spear600-ehci", "usb-ehci";
> arch/arm/boot/dts/spear600.dtsi:                        compatible = "st,spear600-ehci", "usb-ehci";
> arch/arm/boot/dts/spear600.dtsi:                        compatible = "st,spear600-ehci", "usb-ehci";
> arch/arm/boot/dts/at91sam9g45.dtsi:                     compatible = "atmel,at91sam9g45-ehci", "usb-ehci";
> arch/powerpc/boot/dts/wii.dts:                  compatible = "nintendo,hollywood-usb-ehci",
> arch/powerpc/boot/dts/wii.dts:                                  "usb-ehci";
> arch/powerpc/boot/dts/sequoia.dts:                      compatible = "ibm,usb-ehci-440epx", "usb-ehci";
> arch/powerpc/boot/dts/canyonlands.dts:                  compatible = "ibm,usb-ehci-460ex", "usb-ehci";
> 
> Is there a real reason that I'm not aware of?  Or can all these entries
> safely be removed?

Apart from the powerpc entries for which a real driver exists, the others were
probably added in the hope that sooner or later, someone will come up with
a matching driver, and the corresponding dts file would not even have to be
updated to benefit from this.
--
Florian
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
