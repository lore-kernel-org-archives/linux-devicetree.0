From: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 4/5] dt-bindings: add binding for marvell berlin4ct SoC
Date: Thu, 8 Oct 2015 19:13:02 +0800
Message-ID: <20151008191302.6d6d636b@xhacker>
References: <1442931156-5877-1-git-send-email-jszhang@marvell.com>
	<1442931156-5877-5-git-send-email-jszhang@marvell.com>
	<20151001225027.GT19319@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151001225027.GT19319-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On Thu, 1 Oct 2015 15:50:27 -0700
Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:

> On 09/22, Jisheng Zhang wrote:
> > +This binding uses the common clock binding[1].
> > +
> > +[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
> > +
> > +The berlin4ct clock subsystem generates and supplies clock to various
> > +controllers within the berlin4ct SoC. The berlin4ct contains 3 clock controller
> > +blocks: pll, gateclk, berlin-clk.
> > +
> > +Required Properties:
> > +
> > +- compatible: should be one of the following.
> > +  - "marvell,berlin-pll" - pll compatible
> > +  - "marvell,berlin4ct-clk" - berlin clk compatible
> > +  - "marvell,berlin4ct-gateclk" - gateclk compatible
> > +- reg: physical base address of the clock controller and length of memory mapped
> > +  region. For pll, the second reg defines the bypass register base address and
> > +  length of memory mapped region.
> > +- #clock-cells: for pll should 0, for gateclk and berlin clk should be 1.
> > +- #bypass-shift: the bypass bit in bypass register.
> > +
> > +Example:
> > +
> > +syspll: syspll {
> > +	compatible = "marvell,berlin-pll";
> > +	reg = <0xea0200 0x14>, <0xea0710 4>;
> > +	#clock-cells = <0>;
> > +	clocks = <&osc>;
> > +	bypass-shift = /bits/ 8 <0>;
> > +};
> > +
> > +clk: clk {
> > +	compatible = "marvell,berlin4ct-clk";
> > +	reg = <0xea0720 0x144>;
> > +	#clock-cells = <1>;
> > +	clocks = <&syspll>;
> > +};
> 
> Is there one clock controller at 0xea0000 of size 0x1000? We've

there's no clock controller at 0xea0000 with so big size. In BG4CT, we have
the following different kind of plls/clks

1. cpupll/syspll/mempll: the same IP, the pll register is put with the user
together, plus one shared bypass control register. For example: mempll register
is put with DDR controller registers together. cpupll, syspll and mempll share
the same bypass register: 0xea0710. 

2. gateclks: the clk can only be enabled or disabled, the control bits are put
into one(or two) register(s)

3. clks: can be disabled/enabled, change the divider, etc.. all these clks
registers are put together. In this register space, some space may not be used.


[PATCH 5/5] shows the layout of the clk/pll registers

> been trying to push people towards using the device model and
> writing drivers with probe instead of using CLK_OF_DECLARE() for

Is there any existing clk drivers switched to this type. I'll grep and
take that for an example.

> their platform clocks. From the looks of this binding, we're
> splitting up the different types of clocks into their own nodes
> and then registering them with CLK_OF_DECLARE.

Could you please kindly give advice about how to avoid the splitting?

Thanks a lot for review,
Jisheng
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
