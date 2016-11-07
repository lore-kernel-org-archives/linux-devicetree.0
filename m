From: Gabriel Fernandez <gabriel.fernandez@st.com>
Subject: Re: [PATCH 1/6] clk: stm32f4: Add PLL_I2S & PLL_SAI for STM32F429/469
 boards
Date: Mon, 7 Nov 2016 15:05:46 +0100
Message-ID: <42c31c00-3b0b-b1e7-46c1-0c849b14dae2@st.com>
References: <1478523943-23142-1-git-send-email-gabriel.fernandez@st.com>
 <1478523943-23142-2-git-send-email-gabriel.fernandez@st.com>
 <d60df94d-8f42-12eb-af55-2fc839c126bc@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d60df94d-8f42-12eb-af55-2fc839c126bc@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Thompson <daniel.thompson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Nicolas Pitre <nico@linaro.org>, Arnd Bergmann <arnd@arndb.de>, andrea.merello@gmail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, kernel@stlinux.com, ludovic.barre@st.com, olivier.bideau@st.com, amelie.delaunay@st.com
List-Id: devicetree@vger.kernel.org

Hi Daniel,

Thanks for reviewing.


On 11/07/2016 02:53 PM, Daniel Thompson wrote:
> On 07/11/16 13:05, gabriel.fernandez@st.com wrote:
>> From: Gabriel Fernandez <gabriel.fernandez@st.com>
>>
>> This patch introduces PLL_I2S and PLL_SAI.
>> Vco clock of these PLLs can be modify by DT (only n multiplicator,
>> m divider is still fixed by the boot-loader).
>> Each PLL has 3 dividers. PLL should be off when we modify the rate.
>>
>> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
>> ---
>>  drivers/clk/clk-stm32f4.c | 371 
>> ++++++++++++++++++++++++++++++++++++++++++++--
>>  1 file changed, 359 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
>> index c2661e2..7641acd 100644
>> --- a/drivers/clk/clk-stm32f4.c
>> +++ b/drivers/clk/clk-stm32f4.c
>> @@ -28,6 +28,7 @@
> > ...
>> +static const struct clk_div_table pll_divp_table[] = {
>> +    { 0, 2 }, { 1, 4 }, { 2, 6 }, { 3, 8 },
>> +};
>> +
>>  /*
>>   * Decode current PLL state and (statically) model the state we 
>> inherit from
>>   * the bootloader.
>>   */
>
> This comment isn't right. For a start the model is no longer static.
>
you're right, i will suppress it.

>
>> @@ -615,18 +944,24 @@ struct stm32f4_clk_data {
>>      const struct stm32f4_gate_data *gates_data;
>>      const u64 *gates_map;
>>      int gates_num;
>> +    const struct stm32f4_pll_data *pll_data;
>> +    int pll_num;
>
> pll_num is unused.
>
ok

BR

Gabriel

>
> Daniel.
