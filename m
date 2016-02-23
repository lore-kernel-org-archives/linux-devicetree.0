From: Joachim Eastwood <manabian@gmail.com>
Subject: Re: [PATCH v2 2/2] doc: dt: add documentation for lpc1850-creg-clk driver
Date: Tue, 23 Feb 2016 23:12:44 +0100
Message-ID: <CAGhQ9Vw6AG=MCPXOXR3tm0mTNiDz4ULBjQgwDSL0iV+B6uRKDw@mail.gmail.com>
References: <1455994417-4471-1-git-send-email-manabian@gmail.com>
	<1455994417-4471-3-git-send-email-manabian@gmail.com>
	<20160223180844.GA11770@rob-hp-laptop>
	<CAGhQ9VxYsQSccS2dyWL_DPLTc80SJUkjFupbHAeXX3-WY-1Ofw@mail.gmail.com>
	<CAL_JsqJkxm+CfTNLQ+pPSrfNkokb3ooL0UXr9jjY6H88_jb_5A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJkxm+CfTNLQ+pPSrfNkokb3ooL0UXr9jjY6H88_jb_5A@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 23 February 2016 at 22:58, Rob Herring <robh@kernel.org> wrote:
> On Tue, Feb 23, 2016 at 12:53 PM, Joachim  Eastwood <manabian@gmail.com> wrote:
>> On 23 February 2016 at 19:08, Rob Herring <robh@kernel.org> wrote:
>>> On Sat, Feb 20, 2016 at 07:53:37PM +0100, Joachim Eastwood wrote:
>>>> Add DT binding documentation for lpc1850-creg-clk driver.
>>>>
>>>> Signed-off-by: Joachim Eastwood <manabian@gmail.com>
>>>> ---
>>>>  .../devicetree/bindings/clock/lpc1850-creg-clk.txt | 52 ++++++++++++++++++++++
>>>>  1 file changed, 52 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/clock/lpc1850-creg-clk.txt
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/clock/lpc1850-creg-clk.txt b/Documentation/devicetree/bindings/clock/lpc1850-creg-clk.txt
>>>> new file mode 100644
>>>> index 000000000000..0c83d373b766
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/clock/lpc1850-creg-clk.txt
>>>> @@ -0,0 +1,52 @@
>>>> +* NXP LPC1850 CREG clocks
>>>> +
>>>> +The NXP LPC18xx/43xx CREG (Configuration Registers) block contains
>>>> +control registers for two low speed clocks. One of the clocks is a
>>>> +32 kHz oscillator driver with power up/down and clock gating. Next
>>>> +is a fixed divider that creates a 1 kHz clock from the 32 kHz osc.
>>>> +
>>>> +These clocks are used by the RTC and the Event Router peripherials.
>>>> +The 32 kHz can also be routed to other peripherials to enable low
>>>> +power modes.
>>>> +
>>>> +This binding uses the common clock binding:
>>>> +    Documentation/devicetree/bindings/clock/clock-bindings.txt
>>>> +
>>>> +Required properties:
>>>> +- compatible:
>>>> +     Should be "nxp,lpc1850-creg-clk"
>>>> +- #clock-cells:
>>>> +     Shall have value <1>.
>>>> +- clocks:
>>>> +     Shall contain a phandle to the fix 32 kHz crystall.
>>>> +
>>>> +The creg-clk node must be a child of the creg syscon node.
>>>> +
>>>> +The following clocks are available from the clock node.
>>>> +
>>>> +Clock ID     Name
>>>> +   0          1 kHz clock
>>>> +   1         32 kHz Oscillator
>>>> +
>>>> +Example:
>>>> +soc {
>>>> +     creg: syscon@40043000 {
>>>> +             compatible = "nxp,lpc1850-creg", "syscon", "simple-mfd";
>>>> +             reg = <0x40043000 0x1000>;
>>>> +
>>>> +             creg_clk: clock-controller@004 {
>>>
>>> What is 4? A unit address should have a corresponding reg prop. and no
>>> leading zeros.
>>
>> It is the fourth register in the creg syscon block.
>
> Probably should be the offset rather than register count.
>
>> Does this look better:
>> creg_clk: clock-controller@4 {
>>     compatible = "nxp,lpc1850-creg-clk";
>>     reg = <0x4>;
>>     clocks = <&xtal32>;
>>     #clock-cells = <1>;
>> };
>>
>> Note that the reg property isn't really useful in the driver, but I
>> guess we should have it either way(?).
>>
>> Alternatively I could drop the unit address and reg property. What do you think?
>
> Either way is fine. Though I would expect something needs to know the offset.

I have the offset in the driver itself. I don't except the driver to
reusable since the CREG block is highly SoC specific. If a new user
came along we could also place the register offset in the driver's
of_match_data.

I'll remove the unit address in the next version.

I have a couple of other device under the CREG that has unit address
already. I'll get them cleaned up as well.


Thanks for looking through the binding, Rob!


regards,
Joachim Eastwood
