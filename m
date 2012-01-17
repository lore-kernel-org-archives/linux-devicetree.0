From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [RFC v2 7/9] arm/dt: Common plat-versatile support for icst and
 sp804 based system clocks
Date: Tue, 17 Jan 2012 15:59:17 -0700
Message-ID: <CACxGe6skBjDEKwnmYqCFJURBg79CRc=0maSAshUeUf78GLTczA@mail.gmail.com>
References: <1323727329-4989-1-git-send-email-grant.likely@secretlab.ca>
 <1323727329-4989-7-git-send-email-grant.likely@secretlab.ca> <74CDBE0F657A3D45AFBB94109FB122FF17801D2363@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF17801D2363@HQMAIL01.nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@nvidia.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Russell King <linux@arm.linux.org.uk>, Rob Herring <rob.herring@calxeda.com>, Sascha Hauer <kernel@pengutronix.de>, Mike Turquette <mturquette@ti.com>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 17, 2012 at 2:05 PM, Stephen Warren <swarren@nvidia.com> wr=
ote:
> Grant Likely wrote at Monday, December 12, 2011 3:02 PM:
> ...
>> diff --git a/arch/arm/plat-versatile/clock.c b/arch/arm/plat-versati=
le/clock.c
> ...
>> +void __init versatile_dt_icst_clk_setup(struct device_node *np)
>> +{
>> + =A0 =A0 const struct of_device_id *match;
>> + =A0 =A0 struct icst_of_clk *icst;
>> + =A0 =A0 const struct icst_params *params;
>> + =A0 =A0 u32 ref, vd_range[2], rd_range[2], vco_offset, lock_offset=
;
>> + =A0 =A0 __iomem void * base;
>> +
>> + =A0 =A0 /*
>> + =A0 =A0 =A0* Only try to drive clocks that we know how to control.
>> + =A0 =A0 =A0* ie. attached to an ARM Versatile block of system regi=
sters
>> + =A0 =A0 =A0*/
>> + =A0 =A0 if (!of_device_is_compatible(np->parent, "arm,versatile-sy=
s-regs"))
>> + =A0 =A0 =A0 =A0 =A0 =A0 return;
> ...
>> + =A0 =A0 base =3D of_iomap(np->parent, 0);
>
> Is this pattern (that of "re-using" a parent node's registers) someth=
ing
> legitimate that you'd expect to see wide-spread use?

Yes, it is completely legitimate.  In this particular case, the
binding must specifically state that the child node uses the parent
node's reg region, and that would place strict limits on where this
binding can be used.

> I ask because Tegra's CAR (Clock And Reset) HW module controls all th=
e
> clocks in the system. The registers for the various clocks are often
> inter-mingled, so it's not possible to give each clock a node with a
> reg property, since they'd all overlap and conflict. Instead, should =
we
> do something like the following, coupled with the above pattern in th=
e
> per-clock drivers:
>
> car@60006000 {
> =A0 =A0compatible =3D "nvidia,tegra20-car";
> =A0 =A0reg =3D < 0x60006000 0x1000 >;
>
> =A0 =A0osc@0 {
> =A0 =A0 =A0 =A0compatible =3D "nvidia,tegra20-clk-osc";
> =A0 =A0};
> =A0 =A0pll_p@1 {
> =A0 =A0 =A0 =A0compatible =3D "nvidia,tegra20-clk-pll";
> =A0 =A0 =A0 =A0pll_id =3D <0>;
> =A0 =A0};
> =A0 =A0pll_c@2 {
> =A0 =A0 =A0 =A0compatible =3D "nvidia,tegra20-clk-pll";
> =A0 =A0 =A0 =A0pll_id =3D <1>;
> =A0 =A0};
> =A0 =A0...
> };

Sure, that's fine.

>
> Similar, we have many "peripheral" clocks; leaf nodes that are the cl=
ocks
> for UART, I2C, SPI, ... that are all controlled in a very similar fas=
hion.
> I can see a couple of alternative ways of representing this:
>
> a)
>
> One big node with a ton of clock inputs and outputs:
>
> =A0 =A0periphclk {
> =A0 =A0 =A0 =A0compatible =3D "nvidia,tegra20-clk-periphs";
> =A0 =A0 =A0 =A0#clock-cells =3D <1>;
> =A0 =A0 =A0 =A0/*
> =A0 =A0 =A0 =A0 * This ends up listing almost all clocks in the syste=
m;
> =A0 =A0 =A0 =A0 * most are usable as a source for /some/ peripheral c=
lock
> =A0 =A0 =A0 =A0 */
> =A0 =A0 =A0 =A0clocks =3D <&pll_p 0> <&pll_c 0> <&pll_m 0 ...>;
> =A0 =A0 =A0 =A0clock-names =3D "pll_p", "pll_c", "pll_m", ...;
> =A0 =A0 =A0 =A0/* And there are maybe 50 of these */
> =A0 =A0 =A0 =A0clock-output-names =3D "uart1", "uart2", "i2c1", "i2c2=
", "spi1", ...;
> =A0 =A0};
>
> Simon Glass proposed something similar to this on the U-Boot mailing
> list for Tegra's peripheral clocks (since he's working on upstreaming
> Tegra USB support and adding device tree at the same time, and needs
> to parameterize clock IDs in the device tree, since he's not using
> AUXDATA). I'm worried that the huge number of peripheral clocks in th=
e
> above binding would be unwieldy.

You've got a lot of latitude here.  This is fine, and I think for a
lot of cases, particularly if there is a kind of 'clock nexus' in an
soc, that it is an excellent option.  You can also have one node per
clock, or you can do something in between where clocks get logically
grouped together based on the system design.  It is also true that
there is no need to expose every soc clock in the dts.  Only the leaf
clocks provided to devices need to appear.  Internal intermediary
clocks can, and probably should, be hidden from the devices.

> I'm also unclear how to know which of
> the "clock-names" is the parent for each of the "clock-output-names",
> or if this isn't something the current clock bindings are supports to
> address. Each peripclk is an independent mux, divider, and gate.

The common binding doesn't say anything about this.  It is entirely up
to the specific clock device binding to specify how consumed clocks
map to produced clocks.

>
> b)
>
> A node for each peripheral clock:
>
> =A0 =A0uart1@0 {
> =A0 =A0 =A0 =A0compatible =3D "nvidia,tegra20-clk-uart";
> =A0 =A0 =A0 =A0clocks =3D <&pll_p 0>;
> =A0 =A0 =A0 =A0clock-names =3D "clk";
> =A0 =A0};
>
> =A0 =A0uart2@1 {
> =A0 =A0 =A0 =A0compatible =3D "nvidia,tegra20-clk-uart";
> =A0 =A0 =A0 =A0clocks =3D <&pll_p 0>;
> =A0 =A0 =A0 =A0clock-names =3D "clk";
> =A0 =A0};
>
> =A0 =A0i2s@2 {
> =A0 =A0 =A0 =A0compatible =3D "nvidia,tegra20-clk-i2s";
> =A0 =A0 =A0 =A0clocks =3D <&audio_clk 0>;
> =A0 =A0 =A0 =A0clock-names =3D "clk";
> =A0 =A0};
>
> etc.

My primary worry here is that it will result in an unwieldy number of
nodes in a hurry.

g.
