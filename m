From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: An extremely simplified pinctrl bindings proposal
Date: Sun, 5 Feb 2012 19:07:51 -0800
Message-ID: <CAJuYYwQ2yczBh+CBFWohZPM+9jHXYxyxYzL8CS4puE96v4fDXw@mail.gmail.com>
References: <74CDBE0F657A3D45AFBB94109FB122FF178E5D3160@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF178E5D3160@HQMAIL01.nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@nvidia.com>
Cc: Dong Aisheng <dongas86@gmail.com>, Shawn Guo <shawn.guo@linaro.org>, Dong Aisheng-B29396 <B29396@freescale.com>, "Linus Walleij (linus.walleij@linaro.org)" <linus.walleij@linaro.org>, "Sascha Hauer (s.hauer@pengutronix.de)" <s.hauer@pengutronix.de>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "cjb@laptop.org" <cjb@laptop.org>, "Simon Glass (sjg@chromium.org)" <sjg@chromium.org>, "Grant Likely (grant.likely@secretlab.ca)" <grant.likely@secretlab.ca>, "ext Tony Lindgren (tony@atomide.com)" <tony@atomide.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On 4 February 2012 21:31, Stephen Warren <swarren@nvidia.com> wrote:
> Sorry, I haven't had a chance to read any of the pincrl emails from
> Friday onwards. However, I thought a bit more about this, and decided
> to propose someting much simpler:
>
> Thoughts:
>
> * Defining all the pins, groups, functions, ... takes a lot of space,
> =A0whether it's in static data in pinctrl drivers or in the device tr=
ee.
> =A0The lists must also be stored in RAM at runtime.
>
> * It's been very difficult to come up with a generic description of a=
ll
> =A0pin controller's capabilities. This is true even irrespective of d=
evice
> =A0tree; think pin config where we've agonized over whether we can cr=
eate
> =A0a standardized list of pin config properties, or need to allow eac=
h
> =A0pinctrl driver to define its own set of properties, etc.
>
> * The only real use of the lists is for debugfs. Drivers shouldn't ex=
pect
> =A0to directly request specific pinctrl settings, since that would en=
code
> =A0knowledge of an individual SoC's pin controller. This should be
> =A0abstracted from drivers.
>
> * The data in debugfs could easily be replaced by a raw register dump
> =A0coupled with a SoC-specific script to print out what each register
> =A0means.
>
> My proposal below is to radically simplify the pinctrl subsystem, and
> make it little more than a system to execute a list of arbitrary regi=
ster
> writes.

Thanks for your work on pinctrl bindings proposal.

With this new approach, how much of the pinctrl susbystem is used in
device tree mode. Last time I had proposed something similar to this
(http://marc.info/?l=3Dlinux-kernel&m=3D132697880016289&w=3D2), you wer=
e not
happy about that approach since the pinctrl subsystem is largely
under-utilized (http://marc.info/?l=3Dlinux-kernel&m=3D132735884622374&=
w=3D2),
expect for providing a interface which individual
pinctrl/pinmux/pinconfig drivers will use to implement a function that
programs the hardware.

There need not be pinmux/pinctrl/pinconfig bindings that are designed
for the linux pinctrl subsystem. DT allows specifying the
pinconfig/pinmux properties in a simple way, which was not possible in
non-dt case and hence the pinctrl subsystem. Other OS'es which might
not have a pinctrl subsystem, similar to what linux has, should also
find the pinctrl bindings useful.

Regards,
Thomas.

>
> Advantages:
>
> * No need to define any kind of data model for pinctrl.
>
> * No need to store any list of pins/groups/function/parameters/... ei=
ther
> =A0in static data, in device tree, or at run-time.
>
> * No need to store the the selected board-specific settings anywhere =
either.
>
> * Completely generic; can handle anything that exists now or in the f=
uture.
>
> * Handles pin mux and pin config identically.
>
> * Extremely simple to implement and understand; probably just a few K
> =A0of code and no data. I assume this will be very appealing to those
> =A0interested in using the binding within U-Boot too.
>
> * The lists of register writes can just as easily be provided by boar=
d
> =A0files as device tree, so operation should be identical.
>
> Disadvantages:
>
> * Creating the list of register values/masks may be a little painful.=
 If
> =A0we move forward with this, we'd want to strongly push dtc towards
> =A0providing named constants, expressesion, macros, etc. Those dtc fe=
atures
> =A0would be very useful anyway.
>
> * Lack of high-level semantic meaning to the data; but I assert there=
's
> =A0little benefit to having that anyway.
>
> =A0To solve this, write a script to parse each pinctrl driver's regca=
che
> =A0file and print out all the register meanings.
>
> * This scheme wouldn't represent which device "owns" which pins/group=
s,
> =A0nor be able to validate that different devices' pinmux settings do=
n't
> =A0conflict.
>
> =A0I don't think this is a huge issue though, since that's mainly err=
or-
> =A0checking. Any problems should be just as obvious during testing wh=
ether
> =A0they cause the HW to fail to operate correctly, or whether they ca=
use
> =A0pinctrl to throw an error. Equally, there are many error condition=
s
> =A0that pinctrl core wasn't checking for anyway.
>
> Precedent:
>
> * There was previous discussion on using this exact technique for pin=
mux
> =A0at a previous Linaro Connect:
>
> =A0http://www.spinics.net/lists/linux-tegra/msg01943.html
>
> * There is an existing binding that works very similarly, for the Mav=
ell
> =A0PHY:
>
> =A0http://www.gossamer-threads.com/lists/linux/kernel/1305624
> =A0drivers/net/phy/marvell.c
>
> =A0Explicit mention was made here that a simple list of register writ=
es
> =A0avoiding the complexity of representing a huge number of combinati=
ons
> =A0in the device tree.
>
> tegra20.dtsi:
>
> pinmux: pinmux@70000000 {
> =A0 =A0 =A0 =A0compatible =3D "nvidia,tegra20-pinmux";
> =A0 =A0 =A0 =A0reg =3D <0x70000014 0x10> =A0/* Tri-state registers */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0<0x70000080 0x20> =A0/* Mux registers */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0<0x700000a0 0x14> =A0/* Pull-up/down regis=
ters */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0<0x70000868 0xa8>; /* Pad control register=
s */
>
> =A0 =A0 =A0 =A0pinmux_i2c1_spdio_active: pinmux-i2c1-spdio-active {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg-init =3D
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Set pingroup SPDO to functi=
on I2C1 */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A01 =A0 =A0 =A0 =A0 =A0/=
* Register "bank" in controller */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00x8c =A0 =A0 =A0 /* Re=
gister offset */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00x000000c0 /* Write bi=
tmask, 0 for whole register */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00x00000080 /* Write va=
lue */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Set pingroup SPDI to functi=
on I2C1 */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A01 =A0 =A0 =A0 =A0 =A0/=
* Register "bank" in controller */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00x8c =A0 =A0 =A0 /* Re=
gister offset */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00x00000300 /* Write bi=
tmask, 0 for whole register */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00x00000200 /* Write va=
lue */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0>;
> =A0 =A0 =A0 =A0};
> =A0 =A0 =A0 =A0pinmux_i2c1_spdio_suspend: pinmux-i2c1-spdio-suspend {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0...
> =A0 =A0 =A0 =A0};
> };
>
> tegra-seaboard.dts:
>
> i2c@7000c000 {
> =A0 =A0 =A0 =A0/*
> =A0 =A0 =A0 =A0 * These are phandles to nodes that containthe reg-ini=
t list. Can
> =A0 =A0 =A0 =A0 * we have phandles to properties instead? Then we wou=
ldn't need
> =A0 =A0 =A0 =A0 * all those nodes which each just contains 1 property=
=2E
> =A0 =A0 =A0 =A0 */
> =A0 =A0 =A0 =A0pinctrl =3D <&pinmux_i2c1_spdio_active &pinmux_i2c1_sp=
dio_suspend>;
> =A0 =A0 =A0 =A0pinctrl-names =3D "active", "suspend";
> };
>
> In order to support programming more than one pin controller at once,=
 we
> could include the phandle of the pin controller in the "reg-init" pro=
perty:
>
> somewhere-other-than-under-a-pin-controller {
> =A0 =A0 =A0 =A0pinmux-foo {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg-init =3D
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&tegra_pmx /* Pin cont=
roller */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A02 =A0 =A0 =A0 =A0 =A0/=
* Number of entries for this controller */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A01 =A0 =A0 =A0 =A0 =A0/=
* Register "bank" in controller */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00x8c =A0 =A0 =A0 /* Re=
gister offset */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00x000000c0 /* Write bi=
tmask, 0 for whole register */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00x00000080 /* Write va=
lue */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A01 =A0 =A0 =A0 =A0 =A0/=
* Register "bank" in controller */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00x8c =A0 =A0 =A0 /* Re=
gister offset */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00x00000300 /* Write bi=
tmask, 0 for whole register */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00x00000200 /* Write va=
lue */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&other_pmx /* Pin cont=
roller */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A01 =A0 =A0 =A0 =A0 =A0/=
* Number of entries for this controller */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00 =A0 =A0 =A0 =A0 =A0/=
* Register "bank" in controller */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00x04 =A0 =A0 =A0 /* Re=
gister offset */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00x000000ff /* Write bi=
tmask, 0 for whole register */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00x0000005a /* Write va=
lue */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0>;
> =A0 =A0 =A0 =A0}
> };
>
> When parsing a reg-init property, we know if it contains phandles by:
> * If node containing property is a child of a pin controller, the pro=
perty
> =A0doesn't containt pin controller phandles.
> * Otherwise, it does.
>
> What are people's thoughts. Thinking about all the issues involved, t=
his
> is certainly the approach I like most right now.
>
> --
> nvpublic
>
