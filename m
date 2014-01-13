From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4 0/2] ohci and ehci-platform clks, phy and
 dt support
Date: Mon, 13 Jan 2014 16:54:42 +0100
Message-ID: <52D40C42.2050408@redhat.com>
References: <Pine.LNX.4.44L0.1401111728150.16586-100000@netrider.rowland.org> <52D2064B.3010103@prisktech.co.nz> <52D292DA.8010709@gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Return-path: <linux-sunxi+bncBDL4X2GMZUKRBUUY2CLAKGQEXVLNHDQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <52D292DA.8010709-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 01/12/2014 02:04 PM, Tomasz Figa wrote:
> Hi,
>
> [Cc'ing DT maintainers directly]
>

<snip>

>>> Alan Stern Wrote:
>> I prefer the -generic option, although generic- is equally fine - Having
>> said that, I don't really care if it's called mmio either (although this
>> does seem less 'descriptive').

I can do a v5 changing the compatible string to generix-Xhci, if that will
put an end to all this discussion, then again, there may be a better way, see
below.

>
> Grepping over existing dts files, I can find several occurrences of "usb-ehci" compatible string:
>
> at91sam9g45.dtsi:                       compatible = "atmel,at91sam9g45-ehci", "usb-ehci";
> at91sam9x5.dtsi:                        compatible = "atmel,at91sam9g45-ehci", "usb-ehci";
> omap3.dtsi:                             compatible = "ti,ehci-omap", "usb-ehci";
> omap4.dtsi:                             compatible = "ti,ehci-omap", "usb-ehci";
> omap5.dtsi:                             compatible = "ti,ehci-omap", "usb-ehci";
> sama5d3.dtsi:                   compatible = "atmel,at91sam9g45-ehci", "usb-ehci";
> spear13xx.dtsi:                 compatible = "st,spear600-ehci", "usb-ehci";
> spear13xx.dtsi:                 compatible = "st,spear600-ehci", "usb-ehci";
> spear3xx.dtsi:                  compatible = "st,spear600-ehci", "usb-ehci";
> spear600.dtsi:                  compatible = "st,spear600-ehci", "usb-ehci";
> spear600.dtsi:                  compatible = "st,spear600-ehci", "usb-ehci";
> tegra114.dtsi:          compatible = "nvidia,tegra30-ehci", "usb-ehci";
> tegra114.dtsi:          compatible = "nvidia,tegra30-ehci", "usb-ehci";
> tegra20.dtsi:           compatible = "nvidia,tegra20-ehci", "usb-ehci";
> tegra20.dtsi:           compatible = "nvidia,tegra20-ehci", "usb-ehci";
> tegra20.dtsi:           compatible = "nvidia,tegra20-ehci", "usb-ehci";
> tegra30.dtsi:           compatible = "nvidia,tegra30-ehci", "usb-ehci";
> tegra30.dtsi:           compatible = "nvidia,tegra30-ehci", "usb-ehci";
> tegra30.dtsi:           compatible = "nvidia,tegra30-ehci", "usb-ehci";
>
> Same for "usb-ohci":
>
> arch/arm/boot/dts/at91rm9200.dtsi:                      compatible = "atmel,at91rm9200-ohci", "usb-ohci";
> arch/arm/boot/dts/at91sam9260.dtsi:                     compatible = "atmel,at91rm9200-ohci", "usb-ohci";
> arch/arm/boot/dts/at91sam9263.dtsi:                     compatible = "atmel,at91rm9200-ohci", "usb-ohci";
> arch/arm/boot/dts/at91sam9g45.dtsi:                     compatible = "atmel,at91rm9200-ohci", "usb-ohci";
> arch/arm/boot/dts/at91sam9n12.dtsi:                     compatible = "atmel,at91rm9200-ohci", "usb-ohci";
> arch/arm/boot/dts/at91sam9x5.dtsi:                      compatible = "atmel,at91rm9200-ohci", "usb-ohci";
> arch/arm/boot/dts/lpc32xx.dtsi:                 compatible = "nxp,ohci-nxp", "usb-ohci";
> arch/arm/boot/dts/omap3.dtsi:                           compatible = "ti,ohci-omap3", "usb-ohci";
> arch/arm/boot/dts/omap4.dtsi:                           compatible = "ti,ohci-omap3", "usb-ohci";
> arch/arm/boot/dts/omap5.dtsi:                           compatible = "ti,ohci-omap3", "usb-ohci";
> arch/arm/boot/dts/sama5d3.dtsi:                 compatible = "atmel,at91rm9200-ohci", "usb-ohci";
> arch/arm/boot/dts/spear13xx.dtsi:                       compatible = "st,spear600-ohci", "usb-ohci";
> arch/arm/boot/dts/spear13xx.dtsi:                       compatible = "st,spear600-ohci", "usb-ohci";
> arch/arm/boot/dts/spear3xx.dtsi:                        compatible = "st,spear600-ohci", "usb-ohci";
> arch/arm/boot/dts/spear3xx.dtsi:                        compatible = "st,spear600-ohci", "usb-ohci";
> arch/arm/boot/dts/spear600.dtsi:                        compatible = "st,spear600-ohci", "usb-ohci";
> arch/arm/boot/dts/spear600.dtsi:                        compatible = "st,spear600-ohci", "usb-ohci";
>
> For "usb-ehci" there is even a documentation file [1], while "usb-ohci" seems to be undocumented.
>
> [1] Documentation/devicetree/bindings/usb/usb-ehci.txt
>
> Aren't they both something that should be accounted for in this series?

I agree that usb-Xhci would be the best compatible strings to use.

The problem with usb-ehci is that there already is a ppc specific driver binding to that
compatible string, doing various ppc specific controller initialization.

Thinking more about this, there is one possible solution though, the ehci-ppc-of.c is
guarded in Kconfig with:

         depends on PPC_OF

If we add an inverted check to the Kconfig option for platform-ehci.c, ie:

config USB_EHCI_HCD_PLATFORM
         tristate "Generic EHCI driver for a platform device"
	depends on !PPC_OF

Then we can be certain that we don't end up with 2 drivers claiming the
usb-ehci compatible on ppc platforms. I've done some quick research
and it seems that ehci-platform.c is only used on arm and mips devices, so
excluding its use on ppc should not be an issue.

Then later on someone, who has the actual hardware to test, can merge the
ppc specific quirk handling into ehci-platform,c and ehci-ppc-of.c can go
away entirely.

Alan, if you agree this is the best way forward, I'll do a v5 with the proposed
changes.

Regards,

Hans
