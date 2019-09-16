From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [PATCH v2 1/7] clk: imx8m: Set CLK_GET_RATE_NOCACHE on
 dram_alt/apb
Date: Mon, 16 Sep 2019 23:03:53 +0000
Message-ID: <VI1PR04MB70239F26BE42AD5E6FC3639DEE8C0@VI1PR04MB7023.eurprd04.prod.outlook.com>
References: <cover.1566315740.git.leonard.crestez@nxp.com>
 <90bfeebcb76e76d286ed7f022ea9e0d9a569ebe2.1566315740.git.leonard.crestez@nxp.com>
 <20190916203312.CF8D02067B@mail.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, =?iso-8859-2?Q?Artur_=A6wigo=F1?= <a.swigon@partner.samsung.com>, Jacky Bai <ping.bai@nxp.com>, Viresh Kumar <viresh.kumar@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Alexandre Bailon <abailon@baylibre.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Abel Vesa <abel.vesa@nxp.com>, Saravana Kannan <saravanak@google.com>, Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, dl-linux-imx <linux-imx@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Aisheng Dong <aisheng.dong@nxp.com>, Anson Huang <anson.huang@nxp.com>, Kyungmin Park <kyungmin.park@samsung.com>
List-Id: devicetree@vger.kernel.org

On 2019-09-16 11:33 PM, Stephen Boyd wrote:
> Quoting Leonard Crestez (2019-08-20 08:45:06)
>> Dram frequency changes required modifying these clocks outside the
>> control of clk framework. Mark them as CLK_GET_RATE_NOCACHE so that
>> rates are always read back from registers.
> 
> Why can't we control the clks from the clk framework? Please add that
> information in the commit text here.

OK, I will update commit message and comments

These clocks are only modified for DRAM frequency switches during which 
DRAM is briefly inaccessible. The switch is performed with a SMC call to 
by TF-A which runs from a SRAM area. Upon returning to linux several 
clocks bits are modified and we need to update them.

For rate bits an easy solution is to just mark with 
CLK_GET_RATE_NOCACHE, muxes are handled explicitly.

Linux code performing the SMC call is also part of this series:

     https://patchwork.kernel.org/patch/11104145/

>> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
>> ---
>>   drivers/clk/imx/clk-imx8mm.c | 6 ++++--
>>   drivers/clk/imx/clk-imx8mn.c | 6 ++++--
>>   drivers/clk/imx/clk-imx8mq.c | 7 ++++---
>>   3 files changed, 12 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/clk/imx/clk-imx8mm.c b/drivers/clk/imx/clk-imx8mm.c
>> index 4ead3ea2713c..6cac80550f43 100644
>> --- a/drivers/clk/imx/clk-imx8mm.c
>> +++ b/drivers/clk/imx/clk-imx8mm.c
>> @@ -526,12 +526,14 @@ static int imx8mm_clocks_probe(struct platform_device *pdev)
>>          /* IPG */
>>          clks[IMX8MM_CLK_IPG_ROOT] = imx_clk_divider2("ipg_root", "ahb", base + 0x9080, 0, 1);
>>          clks[IMX8MM_CLK_IPG_AUDIO_ROOT] = imx_clk_divider2("ipg_audio_root", "audio_ahb", base + 0x9180, 0, 1);
>>   
>>          /* IP */
>> -       clks[IMX8MM_CLK_DRAM_ALT] = imx8m_clk_composite("dram_alt", imx8mm_dram_alt_sels, base + 0xa000);
>> -       clks[IMX8MM_CLK_DRAM_APB] = imx8m_clk_composite_critical("dram_apb", imx8mm_dram_apb_sels, base + 0xa080);
>> +       clks[IMX8MM_CLK_DRAM_ALT] = __imx8m_clk_composite("dram_alt", imx8mm_dram_alt_sels, base + 0xa000,
>> +                       CLK_GET_RATE_NOCACHE);
>> +       clks[IMX8MM_CLK_DRAM_APB] = __imx8m_clk_composite("dram_apb", imx8mm_dram_apb_sels, base + 0xa080,
>> +                       CLK_IS_CRITICAL | CLK_GET_RATE_NOCACHE);
> 
> Also, add a comment to this effect about why it can't be done from the
> clk framework wherever the CLK_GET_RATE_NOCACHE flag is set. Basically
> this flag is a hack and is an example of something that we need to fix.

DRAM freq switch requires multiple clk changes to be performed 
atomically while DRAM itself is not accessible so it's not something to 
"fix".

--
Regards,
Leonard
