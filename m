From: Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH 1/2] clk: add device tree binding for artpec-6 pll1 clock
Date: Tue, 16 Feb 2016 15:59:27 -0800
Message-ID: <20160216235927.2278.40353@quark.deferred.io>
References: <cover.1455206007.git.larper@axis.com>
 <2686b3bbb9ec1c86828b365645bd7f997a9780b4.1455206007.git.larper@axis.com>
 <20160212163916.GA7677@rob-hp-laptop> <56C034BA.7070806@axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56C034BA.7070806@axis.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lars Persson <lars.persson@axis.com>, Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, sboyd@codeaurora.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Lars Persson (2016-02-14 00:03:06)
> 
> 
> On 02/12/2016 05:39 PM, Rob Herring wrote:
> > On Thu, Feb 11, 2016 at 05:01:03PM +0100, Lars Persson wrote:
> >> Add device tree documentation for the main PLL in the Artpec-6 SoC.
> > Roughly how many clocks does this SoC have?
> It will have 17 clocks declared in the device tree and three 
> SoC-specific clock drivers.

Are all of those clks going to individual DT nodes with clock-cells = 0?

If so, I wonder if you should be targeting a clock-controller style
binding description, with a node that represents the clock-controller IP
block, with clock-cells >= 1. It really comes down to whether or not
these clock controls exist in the same IP block.

You mentioned three distinct clock drivers. So possibly three clock
controller nodes in DT then?

Is there a reference manual/register map available for this SoC?

> 
> >
> >> Signed-off-by: Lars Persson <larper@axis.com>
> >> ---
> >>   Documentation/devicetree/bindings/clock/artpec6.txt | 16 ++++++++++++++++
> >>   1 file changed, 16 insertions(+)
> >>   create mode 100644 Documentation/devicetree/bindings/clock/artpec6.txt
> >>
> >> diff --git a/Documentation/devicetree/bindings/clock/artpec6.txt b/Documentation/devicetree/bindings/clock/artpec6.txt
> >> new file mode 100644
> >> index 0000000..521fec8
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/clock/artpec6.txt
> >> @@ -0,0 +1,16 @@
> >> +* Clock bindings for Axis ARTPEC-6 chip

Please specify that this is based on the clock provider binding in
Documentation/devicetree/bindings/clock/clock-bindings.txt

Regards,
Mike

> >> +
> >> +Required properties:
> >> +- #clock-cells: Should be <0>
> >> +- compatible: Should be "axis,artpec6-pll1-clock"
> >> +- reg: Address and length of the DEVSTAT register.
> >> +- clocks: The PLL's input clock.
> >> +
> >> +Examples:
> >> +
> >> +pll1_clk: pll1_clk {
> >> +    #clock-cells = <0>;
> >> +    compatible = "axis,artpec6-pll1-clock";
> >> +    reg = <0xf8000000 4>;
> >> +    clocks = <&ext_clk>;
> >> +};
> >> -- 
> >> 2.1.4
> >>
> 
