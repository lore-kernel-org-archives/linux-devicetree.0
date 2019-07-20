From: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH v4 4/8] clk: sunxi-ng: v3s: add missing clock slices for MMC2 module clocks
Date: Sat, 20 Jul 2019 17:45:33 +0800
Message-ID: <DF2A53EE-E978-440A-98EF-76FF9F3DC84C@aosc.io>
References: <20190713034634.44585-1-icenowy@aosc.io> <20190713034634.44585-5-icenowy@aosc.io> <20190720094449.dh53rbxz3mc74qls@flea>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190720094449.dh53rbxz3mc74qls@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org



于 2019年7月20日 GMT+08:00 下午5:44:49, Maxime Ripard <maxime.ripard@bootlin.com> 写到:
>On Sat, Jul 13, 2019 at 11:46:30AM +0800, Icenowy Zheng wrote:
>> The MMC2 clock slices are currently not defined in V3s CCU driver,
>which
>> makes MMC2 not working.
>>
>> Fix this issue.
>>
>> Fixes: d0f11d14b0bc ("clk: sunxi-ng: add support for V3s CCU")
>> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
>> ---
>> New patch in v4.
>>
>>  drivers/clk/sunxi-ng/ccu-sun8i-v3s.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
>b/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
>> index 4eb68243e310..9c88015d4419 100644
>> --- a/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
>> +++ b/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
>> @@ -513,6 +513,9 @@ static struct clk_hw_onecell_data
>sun8i_v3s_hw_clks = {
>>  		[CLK_MMC1]		= &mmc1_clk.common.hw,
>>  		[CLK_MMC1_SAMPLE]	= &mmc1_sample_clk.common.hw,
>>  		[CLK_MMC1_OUTPUT]	= &mmc1_output_clk.common.hw,
>> +		[CLK_MMC2]		= &mmc1_clk.common.hw,
>> +		[CLK_MMC2_SAMPLE]	= &mmc1_sample_clk.common.hw,
>> +		[CLK_MMC2_OUTPUT]	= &mmc1_output_clk.common.hw,
>
>You're using the same structures than mmc1, I guess it's a copy and
>paste mistake?

Yes.

>
>Maxime
>
>--
>Maxime Ripard, Bootlin
>Embedded Linux and Kernel engineering
>https://bootlin.com

-- 
使用 K-9 Mail 发送自我的Android设备。
