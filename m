From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [RFC v2 7/9] arm/dt: Common plat-versatile support for icst and
 sp804 based system clocks
Date: Tue, 17 Jan 2012 13:05:42 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF17801D2363@HQMAIL01.nvidia.com>
References: <1323727329-4989-1-git-send-email-grant.likely@secretlab.ca>
 <1323727329-4989-7-git-send-email-grant.likely@secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1323727329-4989-7-git-send-email-grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
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
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Mike Turquette <mturquette-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Grant Likely wrote at Monday, December 12, 2011 3:02 PM:
...
> diff --git a/arch/arm/plat-versatile/clock.c b/arch/arm/plat-versatile/clock.c
...
> +void __init versatile_dt_icst_clk_setup(struct device_node *np)
> +{
> +	const struct of_device_id *match;
> +	struct icst_of_clk *icst;
> +	const struct icst_params *params;
> +	u32 ref, vd_range[2], rd_range[2], vco_offset, lock_offset;
> +	__iomem void * base;
> +
> +	/*
> +	 * Only try to drive clocks that we know how to control.
> +	 * ie. attached to an ARM Versatile block of system registers
> +	 */
> +	if (!of_device_is_compatible(np->parent, "arm,versatile-sys-regs"))
> +		return;
...
> +	base = of_iomap(np->parent, 0);

Is this pattern (that of "re-using" a parent node's registers) something
legitimate that you'd expect to see wide-spread use?

I ask because Tegra's CAR (Clock And Reset) HW module controls all the
clocks in the system. The registers for the various clocks are often
inter-mingled, so it's not possible to give each clock a node with a
reg property, since they'd all overlap and conflict. Instead, should we
do something like the following, coupled with the above pattern in the
per-clock drivers:

car@60006000 {
    compatible = "nvidia,tegra20-car";
    reg = < 0x60006000 0x1000 >;

    osc@0 {
        compatible = "nvidia,tegra20-clk-osc";
    };
    pll_p@1 {
        compatible = "nvidia,tegra20-clk-pll";
        pll_id = <0>;
    };
    pll_c@2 {
        compatible = "nvidia,tegra20-clk-pll";
        pll_id = <1>;
    };
    ...
};

Similar, we have many "peripheral" clocks; leaf nodes that are the clocks
for UART, I2C, SPI, ... that are all controlled in a very similar fashion.
I can see a couple of alternative ways of representing this:

a)

One big node with a ton of clock inputs and outputs:

    periphclk {
        compatible = "nvidia,tegra20-clk-periphs";
        #clock-cells = <1>;
        /*
         * This ends up listing almost all clocks in the system;
         * most are usable as a source for /some/ peripheral clock
         */
        clocks = <&pll_p 0> <&pll_c 0> <&pll_m 0 ...>;
        clock-names = "pll_p", "pll_c", "pll_m", ...;
        /* And there are maybe 50 of these */
        clock-output-names = "uart1", "uart2", "i2c1", "i2c2", "spi1", ...;
    };

Simon Glass proposed something similar to this on the U-Boot mailing
list for Tegra's peripheral clocks (since he's working on upstreaming
Tegra USB support and adding device tree at the same time, and needs
to parameterize clock IDs in the device tree, since he's not using
AUXDATA). I'm worried that the huge number of peripheral clocks in the
above binding would be unwieldy. I'm also unclear how to know which of
the "clock-names" is the parent for each of the "clock-output-names",
or if this isn't something the current clock bindings are supports to
address. Each peripclk is an independent mux, divider, and gate.

b)

A node for each peripheral clock:

    uart1@0 {
        compatible = "nvidia,tegra20-clk-uart";
        clocks = <&pll_p 0>;
        clock-names = "clk";
    };

    uart2@1 {
        compatible = "nvidia,tegra20-clk-uart";
        clocks = <&pll_p 0>;
        clock-names = "clk";
    };

    i2s@2 {
        compatible = "nvidia,tegra20-clk-i2s";
        clocks = <&audio_clk 0>;
        clock-names = "clk";
    };

etc.

Thanks for cluing me in!

-- 
nvpublic
