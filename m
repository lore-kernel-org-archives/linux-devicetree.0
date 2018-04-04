From: David Lechner <david@lechnology.com>
Subject: Re: [PATCH v8 25/42] ARM: davinci: dm644x: add new clock init using
 common clock framework
Date: Wed, 4 Apr 2018 11:21:02 -0500
Message-ID: <b44de0a4-776d-153c-54e3-ce6ddc4f074f@lechnology.com>
References: <1521168778-27236-1-git-send-email-david@lechnology.com>
 <1521168778-27236-26-git-send-email-david@lechnology.com>
 <333f49c7-bafd-8e2d-65e9-7d1aff4836de@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <333f49c7-bafd-8e2d-65e9-7d1aff4836de@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Adam Ford <aford173@gmail.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 04/03/2018 05:26 AM, Sekhar Nori wrote:
> On Friday 16 March 2018 08:22 AM, David Lechner wrote:
>> +static struct resource dm644x_pll1_resources[] = {
>> +	{
>> +		.start	= DAVINCI_PLL1_BASE,
>> +		.end	= DAVINCI_PLL1_BASE + SZ_4K - 1,
> 
> The .end should be DAVINCI_PLL1_BASE + SZ_1K - 1, otherwise it prevents
> PLL2 from getting registered.
> 
>> +		.flags	= IORESOURCE_MEM,
>> +	},
>> +};
>> +
>> +static struct platform_device dm644x_pll1_device = {
>> +	.name		= "dm644x-pll1",
>> +	.id		= -1,
>> +	.resource	= dm644x_pll1_resources,
>> +	.num_resources	= ARRAY_SIZE(dm644x_pll1_resources),
>> +};
>> +
>> +static struct resource dm644x_pll2_resources[] = {
>> +	{
>> +		.start	= DAVINCI_PLL2_BASE,
>> +		.end	= DAVINCI_PLL2_BASE + SZ_4K - 1,
> 
> And this too should be fixed, else it prevents the PSC from getting
> registered.

Thanks. I've checked and this needs to be fixed for dm646x, dm355 and
dm365 as well.
