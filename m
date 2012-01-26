From: Simon Glass <sjg@chromium.org>
Subject: Re: Pinmux bindings proposal V2
Date: Thu, 26 Jan 2012 09:42:22 -0800
Message-ID: <CAPnjgZ3Xhebn1x1A-Vdy78DWbDd=cp0AK6tL-R1SRzS4GdF97g@mail.gmail.com>
References: <74CDBE0F657A3D45AFBB94109FB122FF1780DAB4CE@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF1780DAB4CE@HQMAIL01.nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@nvidia.com>
Cc: Dong Aisheng-B29396 <B29396@freescale.com>, "Linus Walleij (linus.walleij@linaro.org)" <linus.walleij@linaro.org>, "Sascha Hauer (s.hauer@pengutronix.de)" <s.hauer@pengutronix.de>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "cjb@laptop.org" <cjb@laptop.org>, Dong Aisheng <dongas86@gmail.com>, "Shawn Guo (shawn.guo@linaro.org)" <shawn.guo@linaro.org>, Thomas Abraham <thomas.abraham@linaro.org>, Tony Lindgren <tony@atomide.com>, "Grant Likely (grant.likely@secretlab.ca)" <grant.likely@secretlab.ca>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On Fri, Jan 20, 2012 at 2:22 PM, Stephen Warren <swarren@nvidia.com> wr=
ote:
> Here's V2 of my pinmux binding proposal, after incorporating some fee=
dback
> from Shawn Guo and Dong Aisheng. Main changes:
>
> 1) Require the "pin config" nodes the be children of the pinmux contr=
oller
> =A0 node, rather than allowing them to alternatively be children of t=
he
> =A0 device node that's using them. This allows removal of the pin con=
troller
> =A0 phandle as the first entry in each specifier.
>
> 2) Add explicit #pinmux-cells and #pinconfig-cells properties to the =
pin
> =A0 controller, so that pin controllers can define the layout of thei=
r mux
> =A0 and configuration specifiers.
>
> 3) Don't document a "1:1" model; only document a "1:n" model, whereby=
 each
> =A0 named state for a device node can refer to multiple pin configura=
tion
> =A0 nodes. This allows:
>
> =A0 a) A device to use multiple configuration nodes from a single pin
> =A0 =A0 =A0controller. For example, one may specify a very common sub=
set of
> =A0 =A0 =A0the configuration for a particular device, and another may=
 specify
> =A0 =A0 =A0a few board-specific tweaks on top of that.
>
> =A0 b) A single device to specify configurations for multiple pin
> =A0 =A0 =A0controllers.
>
> TODO: I should write a real binding document for this, rather than si=
mply
> providing a commented example.
>
> Note: I've used named constants below just to make this easier to rea=
d.
> We still don't have a solution to actually use named constants in dtc=
 yet.
>
> tegra20.dtsi:
>
> / {
> =A0 =A0 =A0 =A0/*
> =A0 =A0 =A0 =A0 * The SoC .dtsi file will define the basic properties=
 of each HW
> =A0 =A0 =A0 =A0 * module; compatible, reg, interrupts, ... There's no=
 change here
> =A0 =A0 =A0 =A0 * relative to normal practice.
> =A0 =A0 =A0 =A0 */
> =A0 =A0 =A0 =A0tegra_pmx: pinmux@70000000 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0compatible =3D "nvidia,tegra20-pinmux"=
;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg =3D <0x70000014 0x10 =A0 /* Tri-st=
ate registers */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x70000080 0x20 =A0 /* Mu=
x registers */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x700000a0 0x14 =A0 /* Pu=
ll-up/down registers */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x70000868 0xa8>; /* Pad =
control registers */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/*
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * Common pin control bindings specify=
 that these properties
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * must exist in a pin controller. Eac=
h individual pin
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * controller's bindings specify the v=
alues.
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0#pinmux-cells =3D <2>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0#pinconfig-cells =3D <3>;
> =A0 =A0 =A0 =A0};
>
> =A0 =A0 =A0 =A0sdhci@c8000200 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0compatible =3D "nvidia,tegra20-sdhci";
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg =3D <0xc8000200 0x200>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0interrupts =3D <0 15 0x04>;
> =A0 =A0 =A0 =A0};
> };
>
> tegra20.dtis or tegra-harmony.dts:
>
> /{
> =A0 =A0 =A0 =A0/*
> =A0 =A0 =A0 =A0 * The pin controller node will contain child nodes th=
at define
> =A0 =A0 =A0 =A0 * various subsets of the overall pin state.
> =A0 =A0 =A0 =A0 *
> =A0 =A0 =A0 =A0 * These nodes may be defined in the SoC .dtsi file if=
 the vendor
> =A0 =A0 =A0 =A0 * wants to provide a set of common configurations for=
 customers
> =A0 =A0 =A0 =A0 * or users to pick from.
> =A0 =A0 =A0 =A0 *
> =A0 =A0 =A0 =A0 * These nodes may be defined in the board .dts file t=
oo; e.g. if
> =A0 =A0 =A0 =A0 * a particular board uses a configuration that isn't =
in the set
> =A0 =A0 =A0 =A0 * of provided common options, or the SoC vendor simpl=
y chose not
> =A0 =A0 =A0 =A0 * to provide a set of common options.
> =A0 =A0 =A0 =A0 */
> =A0 =A0 =A0 =A0&tegra_pmx {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/*
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * There are (may be) many of these pi=
n configuration child
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * nodes. Each is referenced by phandl=
e from device nodes.
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * Below I've shown an example of an S=
DHCI controller. There
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * is a set of common settings in node=
 pmx_sdhci. The slight
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * differences between active and stan=
dby states are in nodes
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * pmc_sdhci_active and pmx_sdhci_susp=
end.
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * Note though the the 3-node split is=
 just an example; you
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * could easily have a single node for=
 devices that don't
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * need separate active/suspend state,=
 or many more nodes
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * for a device with a more complex se=
t of shared settings
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * or that uses more states.
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pmx_sdhci: pinconfig-sdhci {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/*
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * The mux property is=
 a list of muxable entities
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * and the mux functio=
n to select for it. The number
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * of cells in each en=
try is the pin controller's
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * #pinmux-cells prope=
rty. The pin controller's
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * binding defines wha=
t the cells mean. The pinctrl
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * driver is responsib=
le for mapping this data to
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * the (group, functio=
n) pair required to fill in
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * the pinctrl subsyst=
em's pinmux mapping table.
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mux =3D
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<TEGRA=
_PMX_PG_DTA TEGRA_PMX_MUX_SDIO1>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<TEGRA=
_PMX_PG_DTD TEGRA_PMX_MUX_SDIO1>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/*
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * The config property=
 is a list of muxable entities
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * and individual conf=
iguration setting. The number
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * of cells in each en=
try is the pin controller's
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * #pinconfig-cells pr=
operty. The pin controller's
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * binding defines wha=
t the cells mean. The pinctrl
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * driver is responsib=
le for mapping this data to
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * the (group, config)=
 pair required to fill in
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * the pinctrl subsyst=
em's pin configuration table.
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0config =3D
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<TEGRA=
_PMX_PG_DTA TEGRA_PMX_CONF_DRIVE_STRENGTH 5>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<TEGRA=
_PMX_PG_DTD TEGRA_PMX_CONF_DRIVE_STRENGTH 5>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<TEGRA=
_PMX_PG_DTA TEGRA_PMX_CONF_SLEW_RATE 4>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<TEGRA=
_PMX_PG_DTD TEGRA_PMX_CONF_SLEW_RATE 8>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0};
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pmx_sdhci_active: pinconfig-sdhci-acti=
ve {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/*
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * In each of these no=
des, both the mux and config
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * properties are opti=
onal. This node represents the
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * additions to pmx_sd=
hci that are specific to an
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * active state. In th=
is case, only pin configuration
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * settings are differ=
ent.
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0config =3D
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<TEGRA=
_PMX_PG_DTA TEGRA_PMX_CONF_TRISTATE 0>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<TEGRA=
_PMX_PG_DTD TEGRA_PMX_CONF_TRISTATE 0>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0};
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pmx_sdhci_standby: pinconfig-sdhci-sta=
ndby {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0config =3D
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<TEGRA=
_PMX_PG_DTA TEGRA_PMX_CONF_TRISTATE 1>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<TEGRA=
_PMX_PG_DTD TEGRA_PMX_CONF_TRISTATE 1>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0};
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/*
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * ... continuing from the comment in =
pmx_sdhci_active:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * However, one could imagine represen=
ting GPIO as a regular
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * pinmux function, and have a board .=
dts file create an
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * extra node to represent that, and h=
ence containing just
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * a mux property:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pmx_sdhci_harmony: pinconfig-sdhci-har=
mony {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mux =3D <TEGRA_PMX_PIN=
_GPIO_PA1 TEGRA_PMX_MUX_GPIO>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0};
> =A0 =A0 =A0 =A0};
> };
>
> tegra-harmony.dts:
>
> /{
> =A0 =A0 =A0 =A0sdhci@c8000200 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/*
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * Each device node contains a few pro=
perties to describe
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * the named pinmux states that are av=
ailable to it.
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * The binding for the device node spe=
cifies the state names
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * that must be described; common exam=
ples such as "default"
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * or "active" and "suspend" may be un=
iversal, but the IO
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * protocol that a device supports may=
 demand that more
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * states be defined, such as "active-=
12mhz", "active-50mhz",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * "suspend". Drivers request these na=
med states e.g. using
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * pinctrl's pinmux_get("state_name") =
API.
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * pinctrl-names lists the available s=
tate names.
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * Unlike the common clock binding, I =
assume here that states
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * are always requested by name. If we=
 don't like that idea,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * we'd could make this property optio=
nal, and add a new API
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * pinmux_get(state_id) to the pinctrl=
 subsystem.
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pinctrl-names =3D "active", "suspend";
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/*
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * pinctrl-entries contains a single c=
ell for each state name
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * in pinctrl-names. It defines how ma=
ny entries are present
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * in property "pinctrl" for the given=
 named state.
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * Here, state "active" covers 2 entri=
es (0 and 1) in pinctrl,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * and state "suspend" covers 2 more e=
ntries (2 and 3) in
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * pinctrl.
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pinctrl-entries =3D <2 2>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/*
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * pinctrl contains a list of phandles=
=2E Each refers to one of
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * the pin config nodes within the pin=
 controller. So, to set
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * up state "active", nodes pmx_sdhci =
and pmx_sdhci_active
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * must both be programmed. To set up =
state "suspend", nodes
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * pmx_sdhci and pmx_sdhci_standby mus=
t be programmed.
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pinctrl =3D <&pmx_sdhci> <&pmx_sdhci_a=
ctive>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<&pmx_sdhci> <&pmx=
_sdhci_standby>;
> =A0 =A0 =A0 =A0};
> };
>
> --
> nvpublic
>

I have been through this carefully and thought about how this might be
implemented. Your example has really helped me to understand this
properly, as the 70-email-long thread was a huge amount of reading.

So I have the following comments in general:

1. It doesn't seem to make full use of the device tree format. For exam=
ple,

   <TEGRA_PMX_PG_DTD TEGRA_PMX_CONF_DRIVE_STRENGTH 5>

would be better as something like

    drive-strength =3D <5>;

if we could arrange it. It also reduces the need for these
TEGRA_PMX_CONF_DRIVE_STRENGTH defines.

2. The TEGRA_PMX_ prefix on everything seems unnecessary to me and
makes it harder to read and more long-winded. Other SOCs will not
include the same header, I think. Can we just drop this?

3. To me, the pinctrl-entries following by pinctrl also does not make
great use of the device tree. It seems to me that this:

pinctrl-entries =3D <2 2>;
pinctrl =3D <&pmx_sdhci> <&pmx_sdhci_active>
=A0 =A0 =A0 =A0 =A0<&pmx_sdhci> <&pmx_sdhci_standby>;

where you say:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * Here, state "active" covers 2 entri=
es (0 and 1) in pinctrl,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * and state "suspend" covers 2 more e=
ntries (2 and 3) in
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * pinctrl.

might be better as something like:

state-active {
       mux =3D  <&pmx_sdhci> <&pmx_sdhci_active>;
};

state-standby {
       mux =3D  <&pmx_sdhci> <&pmx_sdhci_standby>;
};

which means that we don't need to represent a 2-dimensional array in a
single property, which seems error-prone and complicated. In general I
wonder if we can make more use of hierarchy. This might help it be
more extensible in future also.

4. Your example for different 'states' is clear, but I'm not sure if
you are intending to handling actual different pin assignments in
these 'states'. To me this is the big point: does SDIO1 come out pin
groups DTA and DTC; or does it come out pin groups SLXA-D. That's what
the boards want to select. I think the state side of it may be best as
a separate thing, which drivers may even just handle themselves if
they are basic implementations. Or they may just want to implement the
active state (U-Boot).

5. My previous email suggested that the SOC define several possible
options for each peripheral so that the board vendor can just select
them from a menu. All the device tree complexity would then live in
the SOC file (tegra20.dtsi in this case) and very little in the board
file. I still think that is a worthwhile goal. You have this in there,
but I feel it could be simplified further, to a single phandle
perhaps.

6. Looking ahead I imagine that the pinmux nodes will become large. I
don't know how large but looking at some of the kernel bindings for TI
I do get a little alarmed. Board vendors may wish to try to cut down
the size of the device tree blob, particularly for use in the boot
loader. With the binding in your email I think that would be hard to
do. In particular if people know that standby is not being used in the
boot loader, I think they would need to do things like change:

pinctrl-entries =3D <2 2>;
pinctrl =3D <&pmx_sdhci> <&pmx_sdhci_active>
=A0 =A0 =A0 =A0 =A0<&pmx_sdhci> <&pmx_sdhci_standby>;

to:

pinctrl-entries =3D <2>;
pinctrl =3D <&pmx_sdhci> <&pmx_sdhci_active>;

just so that they can delete the standby nodes and reduce the blob
size. It seems a little messy. For this purpose it would be much nicer
if the board vendor could just remove nodes [please, discussion about
whether board vendors SHOULD do this aside]. If everything is nicely
set up in the device tree hierarchy that would be simpler. For
example, board vendors could remove all the pinmux node that they are
not using (let's say they keep SDIO1 DTA, DTC and SDIO2 SLX but remove
the other SDIO1 and SDIO2 nodes and remove all SDIO3 and SDIO4 nodes).
Even better if one day we have a way of automatically filtering out
these unused nodes when creating the device tree blob for a board -
separate discussion.

7. It would be nice to avoid huge data tables in the code, and keep
these in the device tree where possible. I only mention this because
it keeps coming up in the threads.

So, rather than just provide vague feedback, I though I would try to
modify your binding according to the above, so it is below, for
consideration. I am not entirely happen with having the states under
each pin, but I do think it makes the meaning very clear. The example
pinmux is made up and doesn't correspond properly to Tegra2.


In tegra-harmony.dts:

/ {
	/* Select pin mux for these two SDHCI ports */
	sdhci@c8000200 {
		pinctrl =3D <&pmx_sdhci1_dta_dtd>;
	};

	sdhci@c8000400 {
		pinctrl =3D <&pmx_sdhci2_sdb_sdc>;
	};
};

In tegra20.dtsi:

/ {
	&tegra_pmx {
		#address-cells =3D <1>;
		#size-cells =3D <0>;

		/*
		 * This is the first option for SDIO1. It comes out
		 * on pin groups DTA and DTD. Boards can simply use this
		 * phandle in the driver node to get this option. Any options
		 * not used could potentially be dropped from the device tree
		 * blob for space-constrained boot loaders.
		 */
		pmx_sdhci1_dta_dtd: sdhci1-dta-dtd@0 {
			#address-cells =3D <1>;
			#size-cells =3D <0>;
			reg =3D <0>;
			label =3D "SDIO1 on DTA, DTD (4-bit)";

			/*
			 * Here are the pin groups needed for this option.
			 * First DTA, then DTD.
			 */
			pmx@dta {
				reg =3D <PG_DTA>;
				mux =3D <PMX_MUX_SDIO1>;
				drive-strengh =3D <5>;
				slew-rate =3D <4>;

				/*
				 * We support two states here, active
				 * and standby. Properties in these child
				 * nodes can override the ones at this level.
				 * Drivers can move between states just by
				 * making the changes in these nodes.
				 */
				state-active {
					reg =3D <PMX_CONF_ACTIVE>;
					tristate =3D <0>;
				};
				state-standby {
					reg =3D <PMX_CONF_STANDBY>;
					tristate =3D <1>;
					drive-strengh =3D <2>;
				};
			};
			pmx@dtd {
				reg =3D <PG_DTD>;
				mux =3D <PMX_MUX_SDIO1>;
				slew-rate =3D <8>;
				pmx-active {
					reg =3D <PMX_CONF_ACTIVE>;
					tristate =3D <0>;
					drive-strengh =3D <5>;
				};
				pmx-standby {
					reg =3D <PMX_CONF_STANDBY>;
					tristate =3D <1>;
					drive-strengh =3D <2>;
				};
			};
		};

		/*
		 * This is the second option for SDIO1. It comes out
		 * on four SLX pins and supports 8-bit data.
		 */
		pmx_sdhci_slx: sdhci-slx@1 {
			#address-cells =3D <1>;
			#size-cells =3D <0>;
			reg =3D <1>;
			label =3D "SDIO1 on SLXA, C, D, X (8-bit)";
			pmx@slxa {
				reg =3D <PG_SLXA>;
				mux =3D <PMX_MUX_SDIO1>;
				drive-strengh =3D <5>;
				slew-rate =3D <4>;
				state-active {
					reg =3D <PMX_CONF_ACTIVE>;
					tristate =3D <0>;
				};
				state-standby {
					reg =3D <PMX_CONF_STANDBY>;
					tristate =3D <1>;
				};
			}
			pmx@slxb {
				reg =3D <PG_SLXB>;
				mux =3D <PMX_MUX_SDIO1>;
				drive-strengh =3D <5>;
				slew-rate =3D <4>;
				state-active {
					reg =3D <PMX_CONF_ACTIVE>;
					tristate =3D <0>;
				};
				state-standby {
					reg =3D <PMX_CONF_STANDBY>;
					tristate =3D <1>;
				};
			}
			pmx@slxc {
				reg =3D <PG_SLXC>;
				mux =3D <PMX_MUX_SDIO1>;
				drive-strengh =3D <5>;
				slew-rate =3D <4>;
				state-active {
					reg =3D <PMX_CONF_ACTIVE>;
					tristate =3D <0>;
				};
				state-standby {
					reg =3D <PMX_CONF_STANDBY>;
					tristate =3D <1>;
				};
			}
			pmx@slxd {
				reg =3D <PG_SLXD>;
				mux =3D <PMX_MUX_SDIO1>;
				drive-strengh =3D <5>;
				slew-rate =3D <4>;
				state-active {
					reg =3D <PMX_CONF_ACTIVE>;
					tristate =3D <0>;
				};
				state-standby {
					reg =3D <PMX_CONF_STANDBY>;
					tristate =3D <1>;
				};
			};
		};

		/*
		 * This is the first option for SDIO2...
		 */
		pmx_sdhci2_sdb_sdc: sdhci2-sdb-sdc@0 {
			#address-cells =3D <1>;
			#size-cells =3D <0>;
			reg =3D <0>;
			label =3D "SDIO2 on SDB, SDC (4-bit)";
			...
		...
		};
	};
};


Regards,
Simon
