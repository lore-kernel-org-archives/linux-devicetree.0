From: Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: RFC v2: Zynq Clock Controller
Date: Thu, 21 Mar 2013 19:32:52 +0100
Message-ID: <514B5254.50101@metafoo.de>
References: <27dae808-1d3a-4001-8eb2-b0a6e2a34b8f@AM1EHSMHS013.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <27dae808-1d3a-4001-8eb2-b0a6e2a34b8f@AM1EHSMHS013.ehs.local>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?U8O2cmVuIEJyaW5rbWFubg==?= <soren.brinkmann@xilinx.com>
Cc: Mike Turquette <mturquette@linaro.org>, Josh Cartwright <josh.cartwright@ni.com>, Michal Simek <michal.simek@xilinx.com>, Peter Crosthwaite <pcrost@xilinx.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, git@xilinx.com, =?UTF-8?B?SmFuIEzDvA==?= =?UTF-8?B?YmJl?= <jlu@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Stephen Warren <swarren@wwwdotorg.org>, Peter De Schrijver <pdeschrijver@nvidia.com>
List-Id: devicetree@vger.kernel.org

On 03/21/2013 12:56 AM, S=C3=B6ren Brinkmann wrote:
> Hi,
>=20
> I spent some time working on this and incorporating feedback. Here's =
an updated proposal for a clock controller for Zynq:
>=20
> Required properties:
>  - #clock-cells : Must be 1
>  - compatible : "xlnx,ps7-clkc"  (this may become 'xlnx,zynq-clkc' te=
rminology differs a bit between Xilinx internal and mainline)
>  - ps-clk-frequency : Frequency of the oscillator providing ps_clk in=
 HZ
>                      (usually 33 MHz oscillators are used for Zynq pl=
atforms)
>  - clock-output-names : List of strings used to name the clock output=
s. Shall be a list of the outputs given below.
>=20
> Optional properties:
>  - clocks : as described in the clock bindings
>  - clock-names : as described in the clock bindings
>=20
> Clock inputs:
> The following strings are optional parameters to the 'clock-names' pr=
operty in
> order to provide optional (E)MIO clock sources.
>  - swdt_ext_clk
>  - gem0_emio_clk
>  - gem1_emio_clk
>  - mio_clk_XX          # with XX =3D 00..53
>=20
> Example:
>         clkc: clkc {
>                 #clock-cells =3D <1>;
>                 compatible =3D "xlnx,ps7-clkc";
>                 ps-clk-frequency =3D <33333333>;

The input frequency should be a clock as well.

>                 clock-output-names =3D "armpll", "ddrpll", "iopll", "=
cpu_6or4x", "cpu_3or2x", "cpu_2x", "cpu_1x", "ddr2x", "ddr3x", "dci", "=
lqspi", "smc", "pcap", "gem0", "gem1", "fclk0", "fclk1", "fclk2", "fclk=
3", "can0", "can1", "sdio0", "sdio1", "uart0", "uart1", "spi0", "spi1",=
 "dma", "usb0_aper", "usb1_aper", "gem0_aper", "gem1_aper", "sdio0_aper=
", "sdio1_aper", "spi0_aper", "spi1_aper", "can0_aper", "can1_aper", "i=
2c0_aper", "i2c1_aper", "uart0_aper", "uart1_aper", "gpio_aper", "lqspi=
_aper", "smc_aper", "swdt", "dbg_trc", "dbg_apb";  /* long list... expl=
anation below */
>                 /* optional props */
>                 clocks =3D <&clkc 16>, <&clk_foo>;
>                 clock-names =3D "gem1_emio_clk", "can_mio_clk_23";
>         };
>=20
> With this revised bindings arbitrary upstream and downstream clock pr=
oviders should be supported and it's also possible to loop back an outp=
ut as input. The downside of supporting this is, that I don't see a way=
 around explicitly listing the clock output names in the DT.
> The reason for this is, that a downstream clock provider should use o=
f_clk_get_parent_name() to obtain its parent clock name. For a block wi=
th multiple outputs of_clk_get_parent_name() can return a valid clock n=
ame only when 'clock-output-names' is present.
> Probably the fclks are the only realistic use case to become parent o=
f downstream clock providers, but I could imagine that e.g. a device dr=
iver like UART wants to use the CCF to model its internal clocks, hence=
 it would require its parent clock name. Even though a device driver co=
uld use clk_get_parent() and __clk_get_name(), of_clk_get_parent_name()=
 should probably work as well. I simply have a bad feeling about breaki=
ng of_clk_get_parent_name() for any clock.
> But after all, I'm open for finding a better solution for this.
>=20
>=20
> Similar, inputs for optional clock sources through (E)MIO pins can be=
 defined as described in the clock bindings using the 'clocks' and 'clo=
ck-names' properties, with 'clock-names' being an arbitrary subset of t=
he documented names. The actual parent clock names are internally resol=
ved using of_clk_get_parent_name().
>=20
>=20
> Regarding this monolithic solution versus a finer granular split:
>=20
> On cost of more complex probing we would also have:
>  - one clock driver covering the peripheral clocks
>  - one for the CPU clock domain
>  - one for the DDR clock domain
>  - one for GEM
>  - one for CAN
>  - one for the APER clks
>  - one for the PLLs
>  - one for fclks

fclks are the same as peripheral clocks except for the gate bit, as far=
 as I
can see.

>  - probably one for the debug clocks (not sure whether we need those)
>=20
> Except for the peripheral one and probably the fclk, they would all b=
e instantiated just once. So, there is not a lot of reuse going on.

PLLs are going to be instantiated multiple times as well.

> Fclks I would probably also rather put into one driver with four outp=
uts instead of instantiating a single output driver multiple times. Sam=
e for PLLs.
>=20
> And then there is e.g. a mux for the system watchdog input which does=
n't really fit anywhere and it would be pretty much ridiculous to have =
another clock driver just for that one and it would also become "hidden=
" in one of the others.
>=20
> In my opinion that's just not necessary. We would create a bunch of c=
lock drivers including DT bindings for them, probing would become more =
complex and it doesn't really help with the probe/naming issue. So, I d=
on't think it's beneficial to go down that road.
>=20
> The monolithic solution would need one custom driver for the PLLs, DT=
 bindings wouldn't be required for it though. Everything else should be=
 internally described using the clock-primitives.
>=20
> Other than having a much simpler probe and init process, I still thin=
k it might be beneficial to have this monolithic block with a holistic =
view of the clock tree. For suspend e.g. I think the clock controller c=
ould export functions like zynq_clkc_(suspend|resume) and then the cont=
roller handles the PLL bypassing/shutdown.
> Regarding full dynamic reparenting, I don't know how exactly that cou=
ld work, but with the clock controller there is at least a block where =
that intelligence would be going and which has knowledge of all the 'st=
ruct clk *' required to reparent clocks.
>=20
> Regarding the DT description, it is probably controversial what is co=
nsidered better. I, like the Tegra folks, think having one clock contro=
ller in there is fine and hides irrelevant implementation details.
>=20

I still don't like the monolithic solution. From my point of view it is
architecturally inferior, it is a bad abstraction. You argue that for a
non-monolithic version you'd have to implement a clock driver for each
different type of clock. But you still have to do this for the monolith=
ic
version, they'd probably just end up in one huge messy file. Unless you=
 are
going to duplicate huge amounts of lines you'd probably have functions =
like
add_gem_clk, add_peripheral_clk, add_pll_clk and so on in your monolith=
ic drivers.

The SLCR is a virtual construct, which groups the clock units together.=
 But the
clock units are the actual entities. E.g. imagine a Zync 2.0, it would =
probably
reuse the same clock units, but there would quite likely be different c=
locks
mapped at different addresses. If you choose a non-monolithic implement=
ation
you'd just have to update your devicetree to make this work, with a mon=
olithic
version you'd have to add a almost identical driver for the v2.

- Lars
