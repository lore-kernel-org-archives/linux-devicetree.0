From: "Leonidas P. Papadakos" <papadakospan@gmail.com>
Subject: Re: [PATCH 1/2] clk: rockchip: add clock for the watchdog pclk on
 rk3328
Date: Thu, 06 Jun 2019 14:42:20 +0300
Message-ID: <1559821340.1384.0@gmail.com>
References: <20190605235714.22432-1-papadakospan@gmail.com>
 <3485393.4UdOu2YNQE@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <3485393.4UdOu2YNQE@phil>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, itdaniher@gmail.com
List-Id: devicetree@vger.kernel.org


Hi,
> 
> Am Donnerstag, 6. Juni 2019, 01:57:13 CEST schrieb Leonidas P. 
> Papadakos:
>>  From: <itdaniher@gmail.com>
> 
> Why is the From different from the Signed-off-by? Would also need a 
> full name.
> If the patch is from you, please just use the same From as for the 
> Signed-off-by.
> 

I mistakenly though this was the way to credit someone for a patch, but 
it seems to be different.
I'll Cc: the author of this patch

>> 
>>  Following the discussion here:
>>  https://github.com/rockchip-linux/kernel/issues/123
>> 
>>  it can be seen that these are the changes needed to enable the use 
>> of the hardware watchdog in the rk3328 SoC.
>> 
>>  This is in line with past changes for the rk3288:
>>  
>> http://lists.infradead.org/pipermail/linux-rockchip/2015-January/002314.html
>> 
>>  Signed-off-by: Leonidas P. Papadakos <papadakospan@gmail.com>
>>  ---
>>   drivers/clk/rockchip/clk-rk3328.c      | 9 +++++++++
>>   include/dt-bindings/clock/rk3328-cru.h | 1 +
>>   2 files changed, 10 insertions(+)
>> 
>>  diff --git a/drivers/clk/rockchip/clk-rk3328.c 
>> b/drivers/clk/rockchip/clk-rk3328.c
>>  index 076b9777a..546ee0ab7 100644
>>  --- a/drivers/clk/rockchip/clk-rk3328.c
>>  +++ b/drivers/clk/rockchip/clk-rk3328.c
>>  @@ -876,6 +876,8 @@ static const char *const 
>> rk3328_critical_clocks[] __initconst = {
>> 
>>   static void __init rk3328_clk_init(struct device_node *np)
>>   {
>>  +	struct clk *clk;
>>  +
>>   	struct rockchip_clk_provider *ctx;
>>   	void __iomem *reg_base;
>> 
>>  @@ -892,6 +894,13 @@ static void __init rk3328_clk_init(struct 
>> device_node *np)
>>   		return;
>>   	}
>> 
>>  +	clk = clk_register_fixed_factor(NULL, "pclk_wdt", "pclk_bus", 0, 
>> 1, 1);
>>  +	if (IS_ERR(clk))
>>  +		pr_warn("%s: could not register clock pclk_wdt: %ld\n",
>>  +			__func__, PTR_ERR(clk));
>>  +	else
>>  +		rockchip_clk_add_lookup(ctx, clk, PCLK_WDT);
>>  +
> 
> I've just Cc'ed you on 2 patches adding a SGRF_GATE clock-type. Please
> use that as base for you rk3328-wdt-clock, so that we don't introduce 
> more
> boilderplate code.
> 
> 
>>   	rockchip_clk_register_plls(ctx, rk3328_pll_clks,
>>   				   ARRAY_SIZE(rk3328_pll_clks),
>>   				   RK3328_GRF_SOC_STATUS0);
> 
>>  diff --git a/include/dt-bindings/clock/rk3328-cru.h 
>> b/include/dt-bindings/clock/rk3328-cru.h
>>  index afb811340..555b4ff66 100644
>>  --- a/include/dt-bindings/clock/rk3328-cru.h
>>  +++ b/include/dt-bindings/clock/rk3328-cru.h
>>  @@ -164,6 +164,7 @@
>>   #define PCLK_DCF		233
>>   #define PCLK_SARADC		234
>>   #define PCLK_ACODECPHY		235
>>  +#define PCLK_WDT		236
>> 
>>   /* hclk gates */
>>   #define HCLK_PERI		308
> 
> please split the addition of the clock-id into a separate patch only 
> adding
> said id.
> 
> 
> Thanks
> Heiko
> 

I know less than him on this, but I want the feedback to be visible in 
the Cc:
