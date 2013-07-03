From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Best practice device tree design for display subsystems/DRM
Date: Wed, 03 Jul 2013 19:38:48 +0200
Message-ID: <51D461A8.3020507@gmail.com>
References: <20130702191923.GD13924@flint.arm.linux.org.uk>
 <51D330AC.5060903@gmail.com>
 <CAMLZHHTbkfxmzrSrAU586Ywxptk=4Njzb0_puWxhfBcmBB0BWQ@mail.gmail.com>
 <51D348F5.2080205@gmail.com>
 <00ae01ce77cb$524d57f0$f6e807d0$%dae@samsung.com>
 <20130703090242.GM516@pengutronix.de> <51D3EA0E.2090008@gmail.com>
 <00ba01ce77d2$80285f10$80791d30$%dae@samsung.com>
 <20130703095338.GH13924@flint.arm.linux.org.uk> <51D40275.4020806@gmail.com>
 <20130703113224.GI13924@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130703113224.GI13924-f404yB8NqCZvn6HldHNs0ANdhmdF6hFW@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Russell King <rmk-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: 'Jean-Francois Moine' <moinejf-GANU6spQydw@public.gmane.org>, 'Daniel Drake' <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>, 'Sascha Hauer' <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/03/13 13:32, Russell King wrote:
> On Wed, Jul 03, 2013 at 12:52:37PM +0200, Sebastian Hesselbarth wrote:
>> But honestly, I see no way around it and it is the only way
>> to allow to even have the decision for one or two cards at all.
>> There is no way for auto-probing the users intention...

Russell,

in general, for me it is hard to find out when you are really asking
questions, use rhetorical questions or sarcasm. I am not a native 
speaker, so do not take any of the below personal if I am not getting
the point of it.

> It's not _just_ about the users intention - for get that, because really
> it's to do with solving a much bigger question, and that question is:
>
> 	How do we know when all the components are present?

By exploiting phandles passed to the supernode. That supernode is very
board specific so it is defined in a board dts and can take into account
every available/unavailable physical device.

> In other words, how do we know that we have LCD0 and LCD1 connected to
> the DCON, which is connected to a LCD and/or a HDMI tranceiver.  How

About LCD0/LCD1 connected to DCON, you have to deal with that in the
subsystem driver, i.e. DRM driver knows about some possible DCON but
registers it only if there is a phandle to a node compatible with
"marvell,armada-510-dcon" passed.

About LCD (panel)/HDMI transceiver, use a (hopefully standard) property
to hook the device (LCD0 on Dove) with the node of the HDMI transmitter.

> do we know that the on-board VGA DACs are wired up and to be used?

Boards not using VGA DAC (LCD1 on Dove) just disable the device_node
and do not pass the node's phandle in the supernode.

> How do we know which I2C bus the VGA port is connected to, and whether
> to expect an I2C bus?

Again, passing a phandle to the i2c-controller node in lcd1 node.
Please note that the pure existence of this phandle property does not
in any way imply you have to use it at all in the driver. But if you
have a driver for Dove's LCD1 and that needs to know how it can access
monitor's EDID, connect it to the i2c-controller node.

I understand that this very i2c-controller driver may not be loaded
the time DRM driver accesses it. But that is not related to DT but
driver core. Currently, I guess -EPROBEDEFER or bail out is the only
option. But from a driver POV you can still say: "somebody told me
to use i2c0 for EDID, so don't blame me it is not there".

> Let's look at the Cubox setup (sorry, but you _will_ have to use a
> fixed-width font for this):
>
> CPU bus
> |
> +-I2C -------------TDA998X --(HDMI)--> Display
> |                    |
> |               (RGB888+clock+sync)
> +-LCD0 ---------.   /
> +--------------DCON ---(VGA)---> not wired
> +-LCD1 (unused)-'
>
> DCON can allegedly route the data from LCD0 or LCD1 to the parallel
> interface which the TDA998x sits on, and/or the VGA interface.  In
> the case of other setups, the TDA998x may be a LCD panel.

dove.dtsi:
...
soc {
	internal-regs {
		...
		i2c0: i2c-controller@abcd0 {
			compatible = "marvell,mv64xxx-i2c";
			...
			status = "disabled";
		};

		lcd0: lcd-controller@820000 {
			compatible = "marvell,armada-510-lcd";
			reg = <0x820000 0x1000>;
			status = "disabled";
		};

		lcd1: lcd-controller@810000 {
			compatible = "marvell,armada-510-lcd";
			reg = <0x810000 0x1000>;
			status = "disabled";
		};

		dcon: display-controller@830000 {
			compatible = "marvell,armada-510-dcon";
			reg = <0x830000 0x100>;
			status = "disabled";
		};
	};
};

dove-cubox.dts:
/include/ "dove.dtsi"

video {
	card0 {
		compatible = "marvell,armada-510-video",
                              "linux,video-card";
		linux,video-memory-size = <0x100000>;
		linux,video-devices = <&lcd0 &dcon>;
	};
};

&dcon { status = "okay"; };

&lcd0 {
	status = "okay";
	clocks = <&si5351 0>;
	clock-names = "extclk0";
	/* pin config 0 = DUMB_RGB888 */
	marvell,pin-configuration = <0>;
	...
	linux,video-external-encoder = <&tda998x>;
};

&i2c0 {
	status = "okay";

	tda998x: hdmi-transmitter@60 {
		compatible = "nxp,tda19988";
		reg = <0x60>;
		/* pin config 18 = RGB888 */
		nxp,pin-configuration = <18>;
		/* HPD gpio pin */
		interrupt-gpios = <&gpio0 12>;
	};

	si5351: programmable-pll {
		/* Note: this binding already exists */
		compatible = "silabs,5351a-msop10";
		...
		#clock-cells = <1>;

		/* referenced as <&si5351 0> */
		clk0: {
			silabs,drive-strength = <8>;
			silabs,clk-source = <0>;
			...
		};
	};
};

> The OLPC setup (which seems to be the more common case in terms of the
> on-SoC device structure):
>
> CPU bus
> |
> +-LCD ---(RGB666+clock+sync)----> LCD panel
>
> and I believe an HDMI tranceiver somewhere.

(for the sake of simplicity, I am assuming OLPC is Armada 510
aka Dove, which it isn't)

dove-olpc.dts:
/include/ "dove.dtsi"

video {
	card0 {
		compatible = "marvell,armada-510-video",
                              "linux,video-card";
		linux,video-memory-size = <0x100000>;
		linux,video-devices = <&lcd0>;
	};
};

&lcd0 {
	status = "okay";
	/* core clock 5 = LCD PLL */
	clocks = <&core_clk 5>;
	clock-names = "lcdclk";
	/* pin config 1 = DUMB_RGB666 */
	marvell,pin-configuration = <1>;

	videomodes {
		mode_800x600 {
			...
		};
	};
};

> In the above diagrams, "LCD" and "LCD0"/"LCD1" are essentially all the
> same basic IP block, so they should use the same driver code.  Moreover,
> each named element is a separate platform device.
>
> In the first, to drive that correctly, you need the following before
> "loading" the display system:
> 1. LCD0, and optionally LCD1 and DCON to be found and known to display driver.

Looping over phandles passed by a video-devices property of the 
supernode. Cubox video card node finds lcd0 and dcon, OLPC finds lcd0
only.

> 2. I2C driver to be probed and available for use.

phandle property in lcd controller node passing the i2c controller
node. Cubox finds tda998x, OLPC does not have the property;

> 3. TDA998x to be found and known to display driver.

IMHO the exact model, e.g. TDA19988, Analog Devices 1234, shouldn't
even be "known" to the display driver. You should have specific
properties for rgb/yuv pin configuration in Dove lcd-controller node
(marvell,pin-configuration) and tda998x node (nxp,pin-configuration).

> Only once you have all those components can you allow display to "load".

Or fail, if DT is not sufficient for a DRM/fbdev driver.

> Now consider the case where the TDA998x is not present but the parallel
> interface is connected directly to a LCD panel.  This then becomes:
> 1. LCD0, and optionally LCD1 and DCON to be found and known to display driver.
> 2. LCD panel details known to display driver.

Different marvell,pin-configuration property value. There is no way to
probe the correct configuration given by board wiring, so rely on DT
author to (a) set lcd-controller property correctly and (b) set tda998x
property correctly.

> If the VGA port is being used, then both of these cases need to be
> supplemented with:
> N. I2C bus for VGA DDC to be probed and available for use.

marvell,ddc-i2c-controller = <&i2c0>;

> N+1. DCON must be known to the display driver.

That there may be a DCON will be known by the display driver, if it
should be used is passed by the video-device property above.

> N+2. LCD1 required if different display modes on the devices are required.

Either obey EDID or if it is a dumb lcd display, pass available modes
using of_videomode or similar.

> In the OLPC case, it's just:
> 1. LCD to be found and known to display driver.
> 2. LCD panel details known to display driver.
>
> What you should be getting from the above is that the platform devices
> which are required for any kind of display subsystem driver to initialize
> is not really a function of the "software" use case, but how (a) the
> board hardware has been designed and put together, and (b) the internal
> structure of the SoC.

Exactly, the driver has to be prepared for any possible (or yet known)
configuration of separate/required devices. Super node defines the
board specific setup.

> Moreover, the problem which we're facing is this: how does a display
> driver know which platform devices to expect from a DT description to
> make the decision that all parts required for the physical wiring of
> the board are now present.

That is maybe the trickiest point. But as long as all involved devices
share the same API (e.g. DRM) there should be an "easy" way. If you
cross subsystems borders, e.g. DRM <-> ASoC, I have absolutely no clue,
yet.

> Consider this too: what if you have a LCD panel on your RGB888 interface
> which is also connected to a HDMI transceiver which can do scaling and
> re-syncing (basically format conversion - the TDA998x appears to have
> this capability), and you drive it with a mode suitable for HDMI but not
> the LCD panel because the driver doesn't know that there's a LCD panel
> also connected?  This is why I feel that the hotplug idea is actually
> rather unsafe, and if we go down that path we're building in that risk.

We already have this situation on CuBox. SPDIF is connected to a SPDIF
jack and tda998x SPDIF audio input. ASoC doesn't know about one stream
of audio connected to multiple "codecs" with possibly different
requirements.

> (And I think the OLPC guys may be have exactly that kind of setup...)

I hope the whole explanations above at least clear out how the logical
and physical setup can be accomplished by using DT and phandles. About
the hotplug/suspend/driver load order, it is way beyond of what I know
about driver core and different subsystems.

Also, please note that all property names, prefixes, and compatible
strings are just for reference and in no way represent actual
requirements for subsystems/SoCs/boards. Vendor specific prefixes
("marvell", "nxp",...) represent properties that can only be interpreted
correctly by that very driver, "linux" prefix represents properties
that can possibly be shared among different drivers/subsystems.

Sebastian
