From: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Subject: Re: [PATCH 01/13] clk: qcom: gcc: limit GPLL0_AO_OUT operating
 frequency
Date: Fri, 21 Dec 2018 13:36:44 +0100
Message-ID: <6814777f-1e5f-bd99-db63-a0050dcdd930@linaro.org>
References: <1545039990-19984-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1545039990-19984-2-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <e97d9050-effc-56d7-0f9b-768df90dd73a@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e97d9050-effc-56d7-0f9b-768df90dd73a@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Taniya Das <tdas@codeaurora.org>, robh+dt@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org, david.brown@linaro.org, sboyd@kernel.org, will.deacon@arm.com, mturquette@baylibre.com, jassisinghbrar@gmail.com
Cc: bjorn.andersson@linaro.org, vkoul@kernel.org, niklas.cassel@linaro.org, sibis@codeaurora.org, georgi.djakov@linaro.org, arnd@arndb.de, horms+renesas@verge.net.au, heiko@sntech.de, enric.balletbo@collabora.com, jagan@amarulasolutions.com, olof@lixom.net, amit.kucheria@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 12/21/18 12:19, Taniya Das wrote:
>
>
> On 12/17/2018 3:16 PM, Jorge Ramirez-Ortiz wrote:
>> Limit the GPLL0_AO_OUT_MAIN operating frequency as per its hardware
>> specifications.
>>
>> Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
>> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
>> ---
>>   drivers/clk/qcom/gcc-qcs404.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/gcc-qcs404.c 
>> b/drivers/clk/qcom/gcc-qcs404.c
>> index 64da032..833436a 100644
>> --- a/drivers/clk/qcom/gcc-qcs404.c
>> +++ b/drivers/clk/qcom/gcc-qcs404.c
>> @@ -304,10 +304,16 @@ static struct clk_alpha_pll gpll0_out_main = {
>>       },
>>   };
>>   +static const struct pll_vco gpll0_ao_out_vco[] = {
>> +    { 800000000, 800000000, 0 },
>> +};
>> +
>>   static struct clk_alpha_pll gpll0_ao_out_main = {
>>       .offset = 0x21000,
>>       .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
>>       .flags = SUPPORTS_FSM_MODE,
>> +    .vco_table = gpll0_ao_out_vco,
>> +    .num_vco = ARRAY_SIZE(gpll0_ao_out_vco),
>
> Could you please help as to why this is required? This is a fixed PLL 
> and we do not require a VCO table for it.

Hi Taniya,

this patch - the additional information that it provides about the 
hardware - helps to select the right parent clock for a given frequency.

On the qcs404 this clock is one of the two parent clocks of the apcs 
clock controller (the other one being the high frequency pll)
When cpufreq sets a target frequency, there is an iteration through the 
list of parents to select the one that delivers the best match.

When attempting to set the clock for an alpha_pll, the operation does a 
sanity check to validate that the requested frequency is in fact 
reachable using the vco range: trying to set a value that is not in 
range will fail.

This patch makes sure that its range is explicitly defined.

It also helps making sure there are no rounding issues when setting its 
value: without it the clock was being read at 799MHz


>
>>       .clkr = {
>>           .enable_reg = 0x45000,
>>           .enable_mask = BIT(0),
>>
>
