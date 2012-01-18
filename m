From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: Pinmux bindings proposal
Date: Wed, 18 Jan 2012 17:46:07 +0530
Message-ID: <CAJuYYwSNuMAcjaTNeCq=LmeP8KrvGNjcn1FP6VY0NarEhkY_aA@mail.gmail.com>
References: <74CDBE0F657A3D45AFBB94109FB122FF17801D202F@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF17801D202F@HQMAIL01.nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@nvidia.com>
Cc: Dong Aisheng-B29396 <B29396@freescale.com>, "linus.walleij@stericsson.com" <linus.walleij@stericsson.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "cjb@laptop.org" <cjb@laptop.org>, "Simon Glass (sjg@chromium.org)" <sjg@chromium.org>, Dong Aisheng <dongas86@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On 14 January 2012 02:09, Stephen Warren <swarren@nvidia.com> wrote:
> I thought a bit more about pinmux DT bindings. I came up with somethi=
ng
> that I like well enough, and is pretty similar to the binding that Do=
ng
> posted recently. I think it'll work for both Tegra's and IMX's needs.
> Please take a look!
>
> Note: I've used named constants below just to make this easier to rea=
d.
> We still don't have a solution to actually use named constants in dtc=
 yet.
>
> tegra20.dtsi:
>
> / {
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
> =A0 =A0 =A0 =A0};
>
> =A0 =A0 =A0 =A0sdhci@c8000200 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0compatible =3D "nvidia,tegra20-sdhci";
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg =3D <0xc8000200 0x200>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0interrupts =3D <0 15 0x04>;
> =A0 =A0 =A0 =A0};
> };
>
> tegra-harmony.dts:
>
> /{
> =A0 =A0 =A0 =A0sdhci@c8000200 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0cd-gpios =3D <&gpio 69 0>; /* gpio PI5=
 */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0wp-gpios =3D <&gpio 57 0>; /* gpio PH1=
 */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0power-gpios =3D <&gpio 155 0>; /* gpio=
 PT3 */
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/*
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * A list of named configurations that=
 this device needs.
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * Format is a list of <"name" &phandl=
e_of_pmx_configuration>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * Multiple "name"s are needed e.g. to=
 support active/suspend,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * or whatever device-defined states a=
re appropriate. The
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * device defines which names are need=
ed, just like a device
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * defines which regulators, clocks, G=
PIOs, interrupts, ...
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * it needs.
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * This example shows a 1:1 relation b=
etween name and phandle.
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * We might want a 1:n relation, so th=
at we can blend multiple
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * pre-defined sets of data together, =
e.g. one pre-defined set
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * for the pin mux configuration, anot=
her for the pin config
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * settings, both being put into the s=
ingle "default" setting
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * for this one device.
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * A pinmux controller can contain thi=
s property too, to
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * define "hogged" or "system" pin mux=
 configuration.
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * Note: Mixing strings and integers i=
n a property seems
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * unusual. However, I have seen other=
 bindings floating
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * around that are starting to do this=
=2E..
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pinmux =3D
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<"default" &pmx_sdhci_=
active>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<"suspend" &pmx_sdhci_=
suspend>;
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* 1:n example: */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pinmux =3D
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<"default" &pmx_sdhci_=
mux_a>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<"default" &pmx_sdhci_=
pincfg_a>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<"suspend" &pmx_sdhci_=
mux_a>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<"suspend" &pmx_sdhci_=
pincfg_a_suspend>;
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/*
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * Alternative: One property for each =
required state. But,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * how does pinctrl core know which pr=
operties to parse?
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * Every property named "pinctrl*" see=
ms a little too far-
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * reaching. Perhaps if we used vendor=
-name "pinmux", that'd
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * be OK, i.e. pinmux,default and pinm=
ux,suspend?
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pinmux =3D <&pmx_sdhci_active>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pinmux-suspend <&pmx_sdhci_suspend>;
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* 1:n example: */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pinmux =3D <&pmx_sdhci_mux_a &pmx_sdhc=
i_pincfg_a>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pinmux-suspend =3D <&pmx_sdhci_mux_a &=
pmx_sdhci_pincfg_a_suspend>;
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/*
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * The actual definition of the comple=
te state of the
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * pinmux as required by some driver.
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * These can be either directly in the=
 device node, or
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * somewhere in tegra20.dtsi in order =
to provide pre-
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * selected/common configurations. Hen=
ce, they're referred
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * to by phandle above.
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pmx_sdhci_active: {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/*
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * Pin mux settings. M=
andatory?
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * Not mandatory if th=
e 1:1 mentioned above is
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * extended to 1:n.
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * Format is <&pmx_con=
troller_phandle muxable_entity_id
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * selected_function>.
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * The pmx phandle is =
required since there may be more
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * than one pinmux con=
troller in the system. Even if
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * this node is inside=
 the pinmux controller itself, I
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * think it's simpler =
to just always have this field
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * present in the bind=
ing for consistency.
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * Alternative: Format=
 is <&pmx_controller_phandle
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * pmx_controller_spec=
ific_data>. In this case, the
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * pmx controller need=
s to define #pinmux-mux-cells,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * and provide the pin=
ctrl core with a mapping
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * function to handle =
the rest of the data in the
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * property. This is h=
ow GPIOs and interrupts work.
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * However, this will =
probably interact badly with
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * wanting to parse th=
e entire pinmux map early in
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * boot, when perhaps =
the pinctrl core is initialized,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * but the pinctrl dri=
ver itself is not.
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mux =3D
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<&tegr=
a_pmx TEGRA_PMX_PG_DTA TEGRA_PMX_MUX_1>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<&tegr=
a_pmx TEGRA_PMX_PG_DTD TEGRA_PMX_MUX_1>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Syn=
tax example */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<&foo_=
pmx FOO_PMX_PG_X FOO_PMX_MUX_0>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/*
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * Pin configuration s=
ettings. Optional.
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * Format is <&pmx_con=
troller_phandle muxable_entity_id
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * configuration_optio=
n configuration_value>.
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0config =3D
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<&tegr=
a_pmx TEGRA_PMX_PG_DTA TEGRA_PMX_CONF_DRIVE_STRENGTH 5>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<&tegr=
a_pmx TEGRA_PMX_PG_DTD TEGRA_PMX_CONF_DRIVE_STRENGTH 5>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<&tegr=
a_pmx TEGRA_PMX_PG_DTA TEGRA_PMX_CONF_SLEW_RATE 4>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<&tegr=
a_pmx TEGRA_PMX_PG_DTD TEGRA_PMX_CONF_SLEW_RATE 8>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/*
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * Perhaps allow addit=
ional custom properties here to
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * express things we h=
aven't thought of. The pinctrl
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * drivers would be re=
sponsible for parsing them.
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0};
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pmx_sdhci_standby: {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mux =3D
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<&tegr=
a_pmx TEGRA_PMX_PG_DTA TEGRA_PMX_MUX_1>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<&tegr=
a_pmx TEGRA_PMX_PG_DTD TEGRA_PMX_MUX_1>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0config =3D
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<&tegr=
a_pmx TEGRA_PMX_PG_DTA TEGRA_PMX_CONF_TRISTATE 1>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<&tegr=
a_pmx TEGRA_PMX_PG_DTD TEGRA_PMX_CONF_TRISTATE 1>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<&tegr=
a_pmx TEGRA_PMX_PG_DTA TEGRA_PMX_CONF_DRIVE_STRENGTH 5>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<&tegr=
a_pmx TEGRA_PMX_PG_DTD TEGRA_PMX_CONF_DRIVE_STRENGTH 5>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<&tegr=
a_pmx TEGRA_PMX_PG_DTA TEGRA_PMX_CONF_SLEW_RATE 4>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<&tegr=
a_pmx TEGRA_PMX_PG_DTD TEGRA_PMX_CONF_SLEW_RATE 8>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0};
> =A0 =A0 =A0 =A0};
> };
>
> Integer IDs for "muxable entities": Pins on IMX, pin groups on Tegra:
>
> =A0 =A0TEGRA_PMX_PG_DTA
> =A0 =A0TEGRA_PMX_PG_DTD
>
> Each individual pinmux driver's bindings needs to define what each in=
teger
> ID represents.
>
> Integer IDs for the "mux functions". Note that these are the raw valu=
es
> written into hardware, not any driver-defined abstraction, and not an=
y
> kind of "virtual group" that's been invented to make OEMs life easier=
:
>
> =A0 =A0TEGRA_PMX_MUX_0
> =A0 =A0TEGRA_PMX_MUX_1
> =A0 =A0...
> =A0 =A0TEGRA_PMX_MUX_3 (for Tegra, 7 for IMX)
>
> Since these are the raw IDs that go into HW, there's no need to speci=
fy
> each ID's meanings in the binding.
>
> Integer IDs for "pin config parameters":
>
> =A0 =A0TEGRA_PMX_CONF_TRISTATE
> =A0 =A0TEGRA_PMX_CONF_DRIVE_STRENGTH
> =A0 =A0TEGRA_PMX_CONF_SLEW_RATE
>
> Each individual pinmux driver's bindings needs to define what each in=
teger
> ID represents, and what the legal "value"s are for each one.
>
> Advantages:
>
> * Provides for both mux settings and "pin configuration".
>
> * Allows the "pinmux configuration" nodes to be part of the SoC .dtsi
> =A0file if desired to provide pre-defined pinmux configurations to
> =A0choose from.
>
> * Allows the "pinmux configuration" nodes to be part of the per-devic=
e
> =A0node if you don't want to use pre-defined configurations.
>
> * When pre-defined configurations are present, if you need something
> =A0custom, you can do it easily.
>
> * Can augment pre-defined configurations by listing n nodes for each
> =A0"name"d pinmux configuration, e.g. to add one extra pin config
> =A0value.
>
> * Parsing is still quite simple:
> =A01) Parse "pinmux" property in device node to get phandle.
> =A02) Parse "mux" property in the node reference by the phandle,
> =A0 =A0 splitting into a list of pmx phandle, entity, mux func.
> =A03) For each entry, pass entity, function to the appropriate mux
> =A0 =A0 driver. (For U-Boot, this might mean check that the phandle
> =A0 =A0 points at the expected place, and ignore the entry if not?)
> =A04) Mux driver simply converts "muxable entity" to the register
> =A0 =A0address, write the "function" value straight to the register.
>
> Disadvantages:
>
> * If you're not using pre-defined configurations, you still have to d=
ump
> =A0all the pinmux configuration into a sub-node of the device node, a=
nd
> =A0have a property point at it using a phandle. This is slightly more
> =A0complex than simply putting the mux/config properties right into t=
he
> =A0device node. However, it additionally allows one to have multiple
> =A0"name"d configurations (e.g. for suspend) very easily, and isn't o=
verly
> =A0complex, so I can live with this.
>
> Changes to pinctrl subsystem:
>
> Very little, I think:
>
> * Need to pass raw function IDs through to the driver instead of the =
driver
> =A0defining some logical table. Actually, this is just a change to in=
dividual
> =A0drivers, since they can define the functions "func0", "func1", ...=
 "funcn"
> =A0as I mentioned before.
>
> * Need to add the code to actually parse this of course.
>
> One additional thought: If dtc does grow named constants, we can prov=
ide
> HW-function-based names for the mux functions, e.g.:
>
> TEGRA_PMX_DTA_RSVD0 0
> TEGRA_PMX_DTA_SDIO2 1
> TEGRA_PMX_DTA_VI =A0 =A02
> TEGRA_PMX_DTA_RSVD3 3
>
> TEGRA_PMX_DTF_I2C3 =A00
> TEGRA_PMX_DTF_RSVD1 1
> TEGRA_PMX_DTF_VI =A0 =A02
> TEGRA_PMX_DTF_RSVD3 3
> ...
>
> That'd allow the .dts to include functionality-based named for the mu=
x
> function selection, but the .dtb to still include the raw HW mux fiel=
d
> values. And this is something completely within the control of the So=
C
> .dtsi file; if you don't like it, you don't have to do it.
>
> --
> nvpublic

The pinmux_get() function checks if there is an active user of the
pinmux and declines requests if the pinmux has been taken. With the dt
bindings that you have listed, can such a check be still enforced.
Also, will it be possible to support runtime pinmuxing with the above
listed dt bindings?

Thanks,
Thomas.
