From: Jiada Wang <jiada_wang@mentor.com>
Subject: Re: [PATCH linux-next v1 2/4] clk: renesas: Add binding document for
 AVB Counter Clock
Date: Fri, 26 Oct 2018 11:32:36 +0900
Message-ID: <d6053012-85b1-3fbf-c35b-c5c5816e9fa8@mentor.com>
References: <20181025072349.15173-1-jiada_wang@mentor.com>
 <20181025072349.15173-3-jiada_wang@mentor.com> <20181025214925.GA5197@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181025214925.GA5197@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org, horms@verge.net.au, magnus.damm@gmail.com, mark.rutland@arm.com, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Rob


On 2018/10/26 6:49, Rob Herring wrote:
> On Thu, Oct 25, 2018 at 04:23:47PM +0900, jiada_wang@mentor.com wrote:
>> From: Jiada Wang <jiada_wang@mentor.com>
>>
>> Add device tree bindings for avb counter clock for Renesas
>> R-Car Socs.
>>
>> Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
>> ---
>>   .../bindings/clock/renesas,avb-clk.txt        | 19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/clock/renesas,avb-clk.txt
>>
>> diff --git a/Documentation/devicetree/bindings/clock/renesas,avb-clk.txt b/Documentation/devicetree/bindings/clock/renesas,avb-clk.txt
>> new file mode 100644
>> index 000000000000..03bf50b5830c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/renesas,avb-clk.txt
>> @@ -0,0 +1,19 @@
>> +* Renesas AVB Counter Clock
>> +
>> +The AVB Counter Clocks are provided by avb_counter8 Clock Generator,
>> +avb_counter8 has dividers which operates with S0D1ϕ clock and has
>> +8 output clocks.
>> +
>> +Required Properties:
>> +  - compatible: Must be "renesas,clk-avb"
> Should be SoC specific?
yes, avb counter clock is SoC specific, I will move avb clock node to 
Soc .dtsi in next version
>
> If the h/w block is called "AVB Counter" then use "avb-counter" in the
> compatible string.
will update compatible string
>> +  - reg: Base address and length of the memory resource used by the AVB
>> +  - #clock-cells: Must be 1
>> +
>> +Example
>> +-------
>> +
>> +	clk_avb: avb-clock@ec5a011c {
> clock-controller@...
will replace with "clock-controller"

Thanks,
Jiada
>
>> +		compatible = "renesas,clk-avb";
>> +		reg = <0 0xec5a011c 0 0x24>;
>> +		#clock-cells = <1>;
>> +	};
>> -- 
>> 2.17.0
>>
