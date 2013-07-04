From: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: RE: Best practice device tree design for display subsystems/DRM
Date: Thu, 04 Jul 2013 11:03:39 +0900
Message-ID: <008401ce785a$b3c22d00$1b468700$%dae@samsung.com>
References: <51D330AC.5060903@gmail.com>
 <CAMLZHHTbkfxmzrSrAU586Ywxptk=4Njzb0_puWxhfBcmBB0BWQ@mail.gmail.com>
 <51D348F5.2080205@gmail.com> <00ae01ce77cb$524d57f0$f6e807d0$%dae@samsung.com>
 <20130703090242.GM516@pengutronix.de> <51D3EA0E.2090008@gmail.com>
 <00ba01ce77d2$80285f10$80791d30$%dae@samsung.com>
 <20130703095338.GH13924@flint.arm.linux.org.uk> <51D40275.4020806@gmail.com>
 <00cc01ce77e2$844b3a80$8ce1af80$%dae@samsung.com>
 <20130703120458.GJ13924@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <20130703120458.GJ13924-f404yB8NqCZvn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Content-language: ko
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
To: 'Russell King' <rmk-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: 'Jean-Francois Moine' <moinejf-GANU6spQydw@public.gmane.org>, 'Daniel Drake' <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, 'Sascha Hauer' <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, 'Sebastian Hesselbarth' <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Russell King [mailto:rmk-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org]
> Sent: Wednesday, July 03, 2013 9:05 PM
> To: Inki Dae
> Cc: 'Sebastian Hesselbarth'; 'Sascha Hauer'; 'Daniel Drake'; 'Jean-
> Francois Moine'; devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; dri-
> devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> Subject: Re: Best practice device tree design for display subsystems/DRM
> 
> On Wed, Jul 03, 2013 at 08:43:20PM +0900, Inki Dae wrote:
> > In case of fbdev, framebuffer driver would use lcd0 or lcd1 driver, or
> lcd0
> > and lcd1 drivers which are placed in drivers/video/backlight/.
> 
> No, that's totally wrong.  Framebuffer drivers are not backlights.
> Framebuffer drivers go in drivers/video not drivers/video/backlight.
> 

Really not that mean. Framebuffer driver controls DCON, and lcd panel driver
controls lcd0 or lcd1. Maybe there is *wrong use of sentence* . Sorry about
it.

> > And let's assume the following:
> >
> > On board A
> >      Display controller ------------- lcd 0
> > On board B
> >      Display controller ------------- lcd 1
> > On board C
> >      Display controller ------------- lcd 0 and lcd 1
> >
> > Without the super node, user could configure Linux kernel through
> menuconfig
> > like below;
> > 	board A:  enabling lcd 0, and disabling lcd 1,
> > 	board B: disabling lcd 0, and enabling lcd 1,
> > 	board C: enabling lcd 0 and lcd 1.
> 
> I don't think so.  By using menuconfig, you completely miss the point of
> using DT - which is to allow us to have a single kernel image which can
> support multiple boards with different configurations, even different
> SoCs.
> 
> > All we have to do is to configure menuconfig to enable only drivers for
> > certain board. Why does fbdev need the super node? Please give me
> comments
> > if there is my missing point.
> 
> fbdev needs the supernode _OR_ some way to specify that information which
> you're putting into menuconfig, because what's correct for the way one
> board is physically wired is not correct for how another board is
> physically wired.
> 
> With that information in menuconfig, you get a kernel image which can
> support board A, or board B, or board C but not a single kernel image
> which can support board A and board B and board C by loading that very
> same kernel image onto all three boards with just a different DT image.
> 
> This is the *whole* point of ARM moving over to DT.
> 
> If we wanted to use menuconfig to sort these kinds of board specific
> details, we wouldn't be investing so much time and effort into moving
> over to DT for ARM.  In fact, we used to use menuconfig to sort out
> some of these kinds of details, and we've firmly decided that this is
> the wrong approach.
> 
> Today, there is a very strong push towards having a single kernel image
> which runs on every (modern) ARM board with DT describing not only the
> board level hardware but also the internal SoC as well.
> 

Dear Russell. I understand what you try to do and that's true. Please see
the below in addition,

dove.dtsi:
...
soc {
	internal-regs {
		...
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

Board A.dts:
/include/ "dove.dtsi"

dcon: display-controller@830000 {
	compatible = "marvell,armada-510-video",
                             "linux,video-card";
	linux,video-memory-size = <0x100000>;
	linux,video-devices = <&lcd0 &dcon>;
};
...


Board B.dts:
/include/ "dove.dtsi"

dcon: display-controller@830000 {
	compatible = "marvell,armada-510-video",
                             "linux,video-card";
	linux,video-memory-size = <0x100000>;
	linux,video-devices = <&lcd1 &dcon>;
};
...

Board C.dts:
/include/ "dove.dtsi"

dcon: display-controller@830000 {
	compatible = "marvell,armada-510-video",
                             "linux,video-card";
	linux,video-memory-size = <0x100000>;
	linux,video-devices = <&lcd0 &lcd1 &dcon>;
};
...

Like above, board specific dts files could have their own board specific
information. So I think we can do and are already doing what you try to do
without the super node. The super node don't really mean real hardware.


Thanks,
Inki Dae

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


> --
> Russell King
