From: Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH 01/13] clk: qcom: gcc: limit GPLL0_AO_OUT operating
 frequency
Date: Fri, 21 Dec 2018 16:49:30 +0530
Message-ID: <e97d9050-effc-56d7-0f9b-768df90dd73a@codeaurora.org>
References: <1545039990-19984-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1545039990-19984-2-git-send-email-jorge.ramirez-ortiz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1545039990-19984-2-git-send-email-jorge.ramirez-ortiz@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>, robh+dt@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org, david.brown@linaro.org, sboyd@kernel.org, will.deacon@arm.com, mturquette@baylibre.com, jassisinghbrar@gmail.com
Cc: bjorn.andersson@linaro.org, vkoul@kernel.org, niklas.cassel@linaro.org, sibis@codeaurora.org, georgi.djakov@linaro.org, arnd@arndb.de, horms+renesas@verge.net.au, heiko@sntech.de, enric.balletbo@collabora.com, jagan@amarulasolutions.com, olof@lixom.net, amit.kucheria@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 12/17/2018 3:16 PM, Jorge Ramirez-Ortiz wrote:
> Limit the GPLL0_AO_OUT_MAIN operating frequency as per its hardware
> specifications.
> 
> Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> ---
>   drivers/clk/qcom/gcc-qcs404.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
> index 64da032..833436a 100644
> --- a/drivers/clk/qcom/gcc-qcs404.c
> +++ b/drivers/clk/qcom/gcc-qcs404.c
> @@ -304,10 +304,16 @@ static struct clk_alpha_pll gpll0_out_main = {
>   	},
>   };
>   
> +static const struct pll_vco gpll0_ao_out_vco[] = {
> +	{ 800000000, 800000000, 0 },
> +};
> +
>   static struct clk_alpha_pll gpll0_ao_out_main = {
>   	.offset = 0x21000,
>   	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
>   	.flags = SUPPORTS_FSM_MODE,
> +	.vco_table = gpll0_ao_out_vco,
> +	.num_vco = ARRAY_SIZE(gpll0_ao_out_vco),

Could you please help as to why this is required? This is a fixed PLL 
and we do not require a VCO table for it.

>   	.clkr = {
>   		.enable_reg = 0x45000,
>   		.enable_mask = BIT(0),
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
