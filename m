From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Best practice device tree design for display subsystems/DRM
Date: Tue, 02 Jul 2013 23:41:09 +0200
Message-ID: <51D348F5.2080205@gmail.com>
References: <CAMLZHHREVEdRuHaD0imRu4pUv15ZyWYF2J9WCBEw-frxBry-Lw@mail.gmail.com>
 <20130702204255.2044c01b@armhf>
 <20130702191923.GD13924@flint.arm.linux.org.uk> <51D330AC.5060903@gmail.com>
 <CAMLZHHTbkfxmzrSrAU586Ywxptk=4Njzb0_puWxhfBcmBB0BWQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAMLZHHTbkfxmzrSrAU586Ywxptk=4Njzb0_puWxhfBcmBB0BWQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Daniel Drake <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>
Cc: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Russell King <rmk-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 07/02/2013 11:04 PM, Daniel Drake wrote:
> On Tue, Jul 2, 2013 at 1:57 PM, Sebastian Hesselbarth
> <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  wrote:
>> I am against a super node which contains lcd and dcon/ire nodes. You can
>> enable those devices on a per board basis. We add them to dove.dtsi but
>> disable them by default (status = "disabled").
>>
>> The DRM driver itself should get a video-card node outside of
>> soc/internal-regs where you can put e.g. video memory hole (or video
>> mem size if it will be taken from RAM later)
>
> For completeness of the discussion, and my understanding too, can you
> explain your objections to the display super-node in a bit more
> detail?

lcd-controller nodes and dcon node will need to be children of
internal-regs nodes. The internal-regs node is required for address
translation as the mbus base address can be configured. The above does
not permit a super-node - but you cannot have the nodes above outside
of internal-regs.

As Russell stated, he wants a proposal for the "unusual case" i.e.
you have two lcd controllers. You use one for Xorg and the other for
e.g. running a linux terminal console.

This would require some reference from the super node to the lcd
controller to sort out which DRM device (represented by the super
node) should be using which lcd controller device.

Using status = "disabled" alone will only allow to enable or disable
lcd controller nodes but not assign any of it to your two super-nodes.

So my current proposal after thinking about Russell's statements
whould be phandles as Jean-Francois already mentioned. I am not sure
what OF maintainers will think about it, but that is another thing.

Basically, you will have:
(Note: names and property-names are just to show how it could work,
and example is joined from possible future dove.dtsi and dove-board.dts)

video {
	/* Single video card w/ multiple lcd controllers */
	card0 {
		compatible = "marvell,armada-510-display";
		reg = <0 0x3f000000 0x1000000>; /* video-mem hole */
		/* later: linux,video-memory-size = <0x1000000>; */
		marvell,video-devices = <&lcd0 &lcd1 &dcon>;
	};

	/* OR: Multiple video card w/ single lcd controllers */
	card0 {
		compatible = "marvell,armada-510-display";
		...
		marvell,video-devices = <&lcd0>;
	};

	card1 {
		compatible = "marvell,armada-510-display";
		...
		marvell,video-devices = <&lcd1>;
	};
};

mbus {
	compatible = "marvell,dove-mbus";
	ranges = <...>;

	sb-regs {
		ranges = <0 0xf1000000 0 0x100000>;
		...
	}

	nb-regs {
		ranges = <0 0xf1800000 0 0x100000>;

		lcd0: lcd-controller@20000 {
			compatible = "marvell,armada-510-lcd";
			reg = <0x20000 0x1000>;
			interrupts = <47>;
			...
			/* use EXTCLK0 with lcd0 */
			clocks = <&ext_clk0>;
			clock-names = "extclk0";
			marvell,external-encoder = <&tda998x>;
		};

		lcd1: lcd-controller@10000 {
			compatible = "marvell,armada-510-lcd";
			reg = <0x10000 0x1000>;
			interrupts = <46>;
			...
			/* use LCDPLL with lcd1 */
			clocks = <&lcd_pll_clk>;
			clock-names = "lcdpll";
		};
	}
};

&i2c0 {
	tda998x: hdmi-transmitter@60 {
		compatible = "nxp,tda19988";
		reg = <0x60>;
		...
	}
};

Each lcd controller node represents a platform_device and the display
nodes above should look up phandles and determine type (ctrc or dcon)
by compatible string of the nodes the phandles point to.

Sebastian
