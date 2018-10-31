From: Jiada Wang <jiada_wang@mentor.com>
Subject: Re: [PATCH linux-next v1 2/4] clk: renesas: Add binding document for
 AVB Counter Clock
Date: Wed, 31 Oct 2018 21:00:49 +0900
Message-ID: <9f9fbf3a-4455-bdf3-0438-b39b9cdda112@mentor.com>
References: <20181025072349.15173-1-jiada_wang@mentor.com>
 <20181025072349.15173-3-jiada_wang@mentor.com>
 <154083775062.98144.11157403961171783929@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <154083775062.98144.11157403961171783929@swboyd.mtv.corp.google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, geert+renesas@glider.be, horms@verge.net.au, magnus.damm@gmail.com, mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Stephen

Thanks for your comments

On 2018/10/30 3:29, Stephen Boyd wrote:
> Quoting jiada_wang@mentor.com (2018-10-25 00:23:47)
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
>> +  - reg: Base address and length of the memory resource used by the AVB
>> +  - #clock-cells: Must be 1
>> +
>> +Example
>> +-------
>> +
>> +       clk_avb: avb-clock@ec5a011c {
>> +               compatible = "renesas,clk-avb";
>> +               reg = <0 0xec5a011c 0 0x24>;
> This is an odd register offset. Is this just one clk inside of a larger
> clk controller?
>
Yes, avb_counter clock is part of Audio Clock Generator reg: <0 
0xec5a0000 0 0x140>,
but "adg" has already been declared in R-Car GEN2/GEN3 SoC .dtsi file, 
with reg: <0 0xec5a0000 0 0x100>,
which leaves <0 0xec5a0100 0 0x140> currently not used by any module.

Thanks,
Jiada
