From: Lars Persson <lars.persson@axis.com>
Subject: Re: [PATCH 1/2] clk: add device tree binding for artpec-6 pll1 clock
Date: Wed, 17 Feb 2016 11:29:14 +0100
Message-ID: <56C44B7A.7030600@axis.com>
References: <cover.1455206007.git.larper@axis.com> <2686b3bbb9ec1c86828b365645bd7f997a9780b4.1455206007.git.larper@axis.com> <20160212163916.GA7677@rob-hp-laptop> <56C034BA.7070806@axis.com> <20160216235927.2278.40353@quark.deferred.io>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160216235927.2278.40353@quark.deferred.io>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Lars Persson <larper@axis.com>, Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, sboyd@codeaurora.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 02/17/2016 12:59 AM, Michael Turquette wrote:
> Quoting Lars Persson (2016-02-14 00:03:06)
>>
>> On 02/12/2016 05:39 PM, Rob Herring wrote:
>>> On Thu, Feb 11, 2016 at 05:01:03PM +0100, Lars Persson wrote:
>>>> Add device tree documentation for the main PLL in the Artpec-6 SoC.
>>> Roughly how many clocks does this SoC have?
>> It will have 17 clocks declared in the device tree and three
>> SoC-specific clock drivers.
> Are all of those clks going to individual DT nodes with clock-cells = 0?
>
> If so, I wonder if you should be targeting a clock-controller style
> binding description, with a node that represents the clock-controller IP
> block, with clock-cells >= 1. It really comes down to whether or not
> these clock controls exist in the same IP block.

Indeed most clocks come from the same clock controller IP. However there 
was nothing to control there because this clock tree is completely 
static. This is why we chose to describe it in the device tree using the 
standard clock components.

The two audio related clock drivers that we will submit for a later 
merge window will have control knobs. There will be one mux belonging to 
the common clock controller and fractional dividers as separate IPs.

I guess we could create a clock controller that outputs the pll1 clock 
and in the future also the muxed audio clock. Then describe the rest of 
the clock tree with standard components in the DT.

>
> You mentioned three distinct clock drivers. So possibly three clock
> controller nodes in DT then?
We still prefer to fully describe the static parts of the the clock tree 
in the DT. Will you accept this ?
>
> Is there a reference manual/register map available for this SoC?
No.
>>>> Signed-off-by: Lars Persson <larper@axis.com>
>>>> ---
>>>>    Documentation/devicetree/bindings/clock/artpec6.txt | 16 ++++++++++++++++
>>>>    1 file changed, 16 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/clock/artpec6.txt
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/clock/artpec6.txt b/Documentation/devicetree/bindings/clock/artpec6.txt
>>>> new file mode 100644
>>>> index 0000000..521fec8
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/clock/artpec6.txt
>>>> @@ -0,0 +1,16 @@
>>>> +* Clock bindings for Axis ARTPEC-6 chip
> Please specify that this is based on the clock provider binding in
> Documentation/devicetree/bindings/clock/clock-bindings.txt
Will be fixed in v2.
>
> Regards,
> Mike
>
>>>> +
>>>> +Required properties:
>>>> +- #clock-cells: Should be <0>
>>>> +- compatible: Should be "axis,artpec6-pll1-clock"
>>>> +- reg: Address and length of the DEVSTAT register.
>>>> +- clocks: The PLL's input clock.
>>>> +
>>>> +Examples:
>>>> +
>>>> +pll1_clk: pll1_clk {
>>>> +    #clock-cells = <0>;
>>>> +    compatible = "axis,artpec6-pll1-clock";
>>>> +    reg = <0xf8000000 4>;
>>>> +    clocks = <&ext_clk>;
>>>> +};
>>>> -- 
>>>> 2.1.4
>>>>
