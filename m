From: Chunyan Zhang <zhang.chunyan@linaro.org>
Subject: Re: [PATCH] Documentation: clock: address more for clock-cells property
Date: Mon, 5 Jun 2017 11:15:25 +0800
Message-ID: <CAG2=9p_fOV6QBTTHWeSAaMa=3J2tkpD7z+ju+PEy+fQCV59BUA@mail.gmail.com>
References: <1496306801-19239-1-git-send-email-zhang.chunyan@linaro.org> <20170602225621.GE20170@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20170602225621.GE20170@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Lyra Zhang <zhang.lyra@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On 3 June 2017 at 06:56, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 06/01, Chunyan Zhang wrote:
>> The value of property 'clock-cells' is not determined only by the number of
>> clock outputs in one clock node, it is actually determined by whether the
>> clock output in this node can be referenced directly without index.  If
>> the output clock has to be referenced by a index, the clock-cell of this
>> clock node can't be defined 0.
>>
>> Signed-off-by: Chunyan Zhang <zhang.chunyan@linaro.org>
>> ---
>>  Documentation/devicetree/bindings/clock/clock-bindings.txt | 10 ++++++++--
>>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> I'm leaving this patch for Rob/DT maintainers to apply.
>
>>
>> diff --git a/Documentation/devicetree/bindings/clock/clock-bindings.txt b/Documentation/devicetree/bindings/clock/clock-bindings.txt
>> index 2ec489e..cef3db5 100644
>> --- a/Documentation/devicetree/bindings/clock/clock-bindings.txt
>> +++ b/Documentation/devicetree/bindings/clock/clock-bindings.txt
>> @@ -15,8 +15,14 @@ value of a #clock-cells property in the clock provider node.
>>
>>  Required properties:
>>  #clock-cells:           Number of cells in a clock specifier; Typically 0 for nodes
>> -                with a single clock output and 1 for nodes with multiple
>> -                clock outputs.
>> +                with a single clock output and it must be able to be
>> +                referenced without index, and 1 for nodes with single or
>> +                multiple clock outputs which have to be referenced by index.
>> +
>> +                Please note that if a node with a single clock output
>> +                but it has "clock-indices" property (see bellow), it has
>> +                to be referenced by index, its "#clock-cells" cannot be
>> +                defined 0.
>
> Maybe this should be added to the clock-indices area of the
> document instead of here? It seems to me that you can't have
> clock-indices if you have #clock-cells=<0>, and that's sort of
> obvious because 0 cells means 1 output and >0 cells means
> potentially many outputs.

Sorry for not being able to document clear enough.
Let me try to explain why I added this paragraph here rather than
clock-indices area.

The sentence "0 for nodes with a single clock output" made me confused.
In the platform I'm working on, some clock has a single clock output
though, the identifying number for the clock output , #clock-cells
cannot be set 0.

I just wanted to make this sort of cases being cleared.  My point was
that clock-cells with zero was not for all kinds of clocks which has
one single output.

I tried to rewrite the description below, would it be better? :)

--- a/Documentation/devicetree/bindings/clock/clock-bindings.txt
+++ b/Documentation/devicetree/bindings/clock/clock-bindings.txt
@@ -18,6 +18,9 @@ Required properties:
                   with a single clock output and 1 for nodes with multiple
                   clock outputs.

+                  There's one exception, please see the description for
+                  clock-indices below.
+
 Optional properties:
 clock-output-names: Recommended to be a list of strings of clock output signal
                    names indexed by the first cell in the clock specifier.
@@ -48,6 +51,13 @@ clock-indices:          If the identifying number
for the clocks in the node
                   is not linear from zero, then this allows the mapping of
                   identifiers into the clock-output-names array.

+                  This property not only servers for clocks with multiple
+                  clock outputs, but also for clocks with a single clock
+                  output whose identifying number is not zero.
+
+                  So long as clock-indices is set, clock-cells cannot be
+                  set zero.
+
 For example, if we have two clocks <&oscillator 1> and <&oscillator 3>:


Thanks for the review,
Chunyan

>
> --
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
