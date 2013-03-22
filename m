From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: RFC v2: Zynq Clock Controller
Date: Fri, 22 Mar 2013 15:41:01 -0700
Message-ID: <128fc723-ace7-4f4c-95d9-971b42a52080@CH1EHSMHS028.ehs.local>
References: <27dae808-1d3a-4001-8eb2-b0a6e2a34b8f@AM1EHSMHS013.ehs.local>
 <514B5254.50101@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <514B5254.50101@metafoo.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lars-Peter Clausen <lars@metafoo.de>
Cc: Mike Turquette <mturquette@linaro.org>, Josh Cartwright <josh.cartwright@ni.com>, Michal Simek <michal.simek@xilinx.com>, Peter Crosthwaite <pcrost@xilinx.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, git@xilinx.com, Jan =?utf-8?B?TMO8YmJl?= <jlu@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Stephen Warren <swarren@wwwdotorg.org>, Peter De Schrijver <pdeschrijver@nvidia.com>
List-Id: devicetree@vger.kernel.org

Hi Lars,

On Thu, Mar 21, 2013 at 07:32:52PM +0100, Lars-Peter Clausen wrote:
> On 03/21/2013 12:56 AM, S=C3=B6ren Brinkmann wrote:
> > Hi,
> >=20
> > I spent some time working on this and incorporating feedback. Here'=
s an updated proposal for a clock controller for Zynq:
> >=20
> > Required properties:
> >  - #clock-cells : Must be 1
> >  - compatible : "xlnx,ps7-clkc"  (this may become 'xlnx,zynq-clkc' =
terminology differs a bit between Xilinx internal and mainline)
> >  - ps-clk-frequency : Frequency of the oscillator providing ps_clk =
in HZ
> >                      (usually 33 MHz oscillators are used for Zynq =
platforms)
> >  - clock-output-names : List of strings used to name the clock outp=
uts. Shall be a list of the outputs given below.
> >=20
> > Optional properties:
> >  - clocks : as described in the clock bindings
> >  - clock-names : as described in the clock bindings
> >=20
> > Clock inputs:
> > The following strings are optional parameters to the 'clock-names' =
property in
> > order to provide optional (E)MIO clock sources.
> >  - swdt_ext_clk
> >  - gem0_emio_clk
> >  - gem1_emio_clk
> >  - mio_clk_XX          # with XX =3D 00..53
> >=20
> > Example:
> >         clkc: clkc {
> >                 #clock-cells =3D <1>;
> >                 compatible =3D "xlnx,ps7-clkc";
> >                 ps-clk-frequency =3D <33333333>;
>=20
> The input frequency should be a clock as well.
Again, monolithic vs split. I don't see a reason not to just internally
call clk_register_fixed_rate(). That way its children do not have to
cope with a variable name for the xtal.
Also, with my proposal 'clocks' and 'clock-names' would be purely
optional properties, only required if optional external inputs are
present. Having the xtal defined externally would add mandatory entries=
 for
those props.

>=20
> >                 clock-output-names =3D "armpll", "ddrpll", "iopll",=
 "cpu_6or4x", "cpu_3or2x", "cpu_2x", "cpu_1x", "ddr2x", "ddr3x", "dci",=
 "lqspi", "smc", "pcap", "gem0", "gem1", "fclk0", "fclk1", "fclk2", "fc=
lk3", "can0", "can1", "sdio0", "sdio1", "uart0", "uart1", "spi0", "spi1=
", "dma", "usb0_aper", "usb1_aper", "gem0_aper", "gem1_aper", "sdio0_ap=
er", "sdio1_aper", "spi0_aper", "spi1_aper", "can0_aper", "can1_aper", =
"i2c0_aper", "i2c1_aper", "uart0_aper", "uart1_aper", "gpio_aper", "lqs=
pi_aper", "smc_aper", "swdt", "dbg_trc", "dbg_apb";  /* long list... ex=
planation below */
> >                 /* optional props */
> >                 clocks =3D <&clkc 16>, <&clk_foo>;
> >                 clock-names =3D "gem1_emio_clk", "can_mio_clk_23";
> >         };
> >=20
> > With this revised bindings arbitrary upstream and downstream clock =
providers should be supported and it's also possible to loop back an ou=
tput as input. The downside of supporting this is, that I don't see a w=
ay around explicitly listing the clock output names in the DT.
> > The reason for this is, that a downstream clock provider should use=
 of_clk_get_parent_name() to obtain its parent clock name. For a block =
with multiple outputs of_clk_get_parent_name() can return a valid clock=
 name only when 'clock-output-names' is present.
> > Probably the fclks are the only realistic use case to become parent=
 of downstream clock providers, but I could imagine that e.g. a device =
driver like UART wants to use the CCF to model its internal clocks, hen=
ce it would require its parent clock name. Even though a device driver =
could use clk_get_parent() and __clk_get_name(), of_clk_get_parent_name=
() should probably work as well. I simply have a bad feeling about brea=
king of_clk_get_parent_name() for any clock.
> > But after all, I'm open for finding a better solution for this.
> >=20
> >=20
> > Similar, inputs for optional clock sources through (E)MIO pins can =
be defined as described in the clock bindings using the 'clocks' and 'c=
lock-names' properties, with 'clock-names' being an arbitrary subset of=
 the documented names. The actual parent clock names are internally res=
olved using of_clk_get_parent_name().
> >=20
> >=20
> > Regarding this monolithic solution versus a finer granular split:
> >=20
> > On cost of more complex probing we would also have:
> >  - one clock driver covering the peripheral clocks
> >  - one for the CPU clock domain
> >  - one for the DDR clock domain
> >  - one for GEM
> >  - one for CAN
> >  - one for the APER clks
> >  - one for the PLLs
> >  - one for fclks
>=20
> fclks are the same as peripheral clocks except for the gate bit, as f=
ar as I
> can see.
And that makes them quite different, since they have to access multiple
registers instead of a single one. Also, the fclks have two dividers.
If you want to cover all of those with a single driver, you need a
plethora of arguments/properties to catch the small differences.

>=20
> >  - probably one for the debug clocks (not sure whether we need thos=
e)
> >=20
> > Except for the peripheral one and probably the fclk, they would all=
 be instantiated just once. So, there is not a lot of reuse going on.
>=20
> PLLs are going to be instantiated multiple times as well.
As mentioned in the very next sentence, I rather see a single driver
with multiple outputs. Take suspend: My plan is to have a few functions
like zynq_clk_(suspend|resume). That should take care of bypassing
shutting down the PLLs (and probably more). Therefore it's easier to
have them all in a single driver.
And if it turned out, that other clocks require special handling for
such system level functions, that could be addressed that way too with
the monolithic approach.

>=20
> > Fclks I would probably also rather put into one driver with four ou=
tputs instead of instantiating a single output driver multiple times. S=
ame for PLLs.
> >=20
> > And then there is e.g. a mux for the system watchdog input which do=
esn't really fit anywhere and it would be pretty much ridiculous to hav=
e another clock driver just for that one and it would also become "hidd=
en" in one of the others.
> >=20
> > In my opinion that's just not necessary. We would create a bunch of=
 clock drivers including DT bindings for them, probing would become mor=
e complex and it doesn't really help with the probe/naming issue. So, I=
 don't think it's beneficial to go down that road.
> >=20
> > The monolithic solution would need one custom driver for the PLLs, =
DT bindings wouldn't be required for it though. Everything else should =
be internally described using the clock-primitives.
> >=20
> > Other than having a much simpler probe and init process, I still th=
ink it might be beneficial to have this monolithic block with a holisti=
c view of the clock tree. For suspend e.g. I think the clock controller=
 could export functions like zynq_clkc_(suspend|resume) and then the co=
ntroller handles the PLL bypassing/shutdown.
> > Regarding full dynamic reparenting, I don't know how exactly that c=
ould work, but with the clock controller there is at least a block wher=
e that intelligence would be going and which has knowledge of all the '=
struct clk *' required to reparent clocks.
> >=20
> > Regarding the DT description, it is probably controversial what is =
considered better. I, like the Tegra folks, think having one clock cont=
roller in there is fine and hides irrelevant implementation details.
> >=20
>=20
> I still don't like the monolithic solution. From my point of view it =
is
> architecturally inferior, it is a bad abstraction. You argue that for=
 a
> non-monolithic version you'd have to implement a clock driver for eac=
h
> different type of clock. But you still have to do this for the monoli=
thic
> version, they'd probably just end up in one huge messy file. Unless y=
ou are
> going to duplicate huge amounts of lines you'd probably have function=
s like
> add_gem_clk, add_peripheral_clk, add_pll_clk and so on in your monoli=
thic drivers.
It probably makes sense to differ between having custom drivers and
describing the whole clock tree in DT.

=46rom reusability perspective, it may make sense to factor out some co=
de
in drivers. IMHO, this does only apply to the peripheral clocks, since
everything else isn't reused and/or quite Zynq specific.
But a monolithic approach would not even prevent this. You could just
transparently change the implementation: Just add a clock driver,
replace the original code in the controller to use the new driver
instead and you're good. No need to touch DT bindings.

In Zynq a peripheral clock is essentially described by:
        clk =3D clk_register_mux(NULL, mux_name, parents, 4, 0,        =
           =20
                        clk_ctrl, 4, 2, 0, lock);                      =
         =20
                                                                       =
         =20
        clk =3D clk_register_divider(NULL, div_name, mux_name, 0, clk_c=
trl, 8, 6, =20
                        CLK_DIVIDER_ONE_BASED, lock);                  =
         =20
                                                                       =
         =20
        clks[clk0] =3D clk_register_gate(NULL, clk_name0, div_name,    =
           =20
                        CLK_SET_RATE_PARENT, clk_ctrl, 0, 0, lock);    =
         =20

If we wrapped this by a driver, any code outside of that driver couldn'=
t
change the mux setting, since its struct clk* is not exposed outside.
To get around this we'd have to reimplement all the clock ops, to creat=
e a
clock which supports all possible operations.
In the monolithic approach we could simply remember that struct clk* an=
d
work with it.

Bottom line: Factoring out some parts of the monolithic driver might
make sense for some parts. But it can be done later in a transparent wa=
y,
especially w/o touching DT bindings.


The other thing is describing the whole clock tree in DT:
That would force us to not only describe clocks for which it might make
sense, but also all Zynq specific clocks in custom drivers and DT
bindings and we gain nothing from it.

>=20
> The SLCR is a virtual construct, which groups the clock units togethe=
r. But the
> clock units are the actual entities. E.g. imagine a Zync 2.0, it woul=
d probably
> reuse the same clock units, but there would quite likely be different=
 clocks
> mapped at different addresses. If you choose a non-monolithic impleme=
ntation
> you'd just have to update your devicetree to make this work, with a m=
onolithic
> version you'd have to add a almost identical driver for the v2.
Either way you'll end up with a lot of lines describing the hierarchy.
Either in the dts or in the clock driver.


I think, my problem is, that I do not yet know how certain functionalit=
y
will be implemented later and what exact use-cases have to be supported=
=2E
With the monolithic approach I keep all options open. We hopefully will
never have to touch its DT bindings again. And refactoring the code and
migrating it to use dedicated clock drivers should be transparent
changes, if deemed beneficial.
=46urthermore, I have a driver, which has references to all strucht clk=
*
in the system and can work with the whole clock tree leveraging a syste=
m
level view. Separating things in smaller blocks might complicate things
if a use case requires this.
And finally pushing the whole hierarchy description into the DT seems t=
o
be the most restrictive approach, without offering big rewards.

	Regards,
	S=C3=B6ren
