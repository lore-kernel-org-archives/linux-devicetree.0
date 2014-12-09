From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 01/19] clk: samsung: exynos5433: Add clocks using common
 clock framework
Date: Tue, 09 Dec 2014 10:04:26 +0900
Message-ID: <54864A9A.7000706@samsung.com>
References: <1417510196-6714-1-git-send-email-cw00.choi@samsung.com>
 <1417510196-6714-2-git-send-email-cw00.choi@samsung.com>
 <54858BBD.5060002@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <54858BBD.5060002-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, chanho61.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, geunsik.lim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Pankaj,

On 12/08/2014 08:30 PM, Pankaj Dubey wrote:
> Hi Chanwoo,
> 
> On Tuesday 02 December 2014 02:19 PM, Chanwoo Choi wrote:
>> This patch adds the support for CMU (Clock Management Units) of Exynos5433
>> which is 64bit SoC and has Octa-cores. This patch supports necessary clocks
>> (PLL/MMC/UART/MCT/I2C/SPI) for kernel boot and includes binding documentation
>> for Exynos5433 clock controller.
>>
>> Cc: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Cc: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Signed-off-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Acked-by: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Acked-by: Geunsik Lim <geunsik.lim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> ---
>>   .../devicetree/bindings/clock/exynos5433-clock.txt | 106 +++
>>   drivers/clk/samsung/Makefile                       |   1 +
>>   drivers/clk/samsung/clk-exynos5433.c               | 967 +++++++++++++++++++++
>>   include/dt-bindings/clock/exynos5433.h             | 199 +++++
>>   4 files changed, 1273 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/clock/exynos5433-clock.txt
>>   create mode 100644 drivers/clk/samsung/clk-exynos5433.c
>>   create mode 100644 include/dt-bindings/clock/exynos5433.h
>>
> 
> [snip]
> 
>> +
>> +static struct samsung_div_clock top_div_clks[] __initdata = {
>> +    /* DIV_TOP2 */
>> +    DIV(CLK_DIV_ACLK_FSYS_200, "div_aclk_fsys_200", "mout_bus_pll_user",
>> +            DIV_TOP2, 0, 3),
>> +
>> +    /* DIV_TOP3 */
>> +    DIV(CLK_DIV_ACLK_IMEM_SSSX, "div_aclk_imem_sssx",
> 
> As per UM, this clock name should be imem_sssx_266

I fixed it on patch6 for CMU_MIF domain.
But, as you comment, I'll fix it on this patch(patch1).

> 
>> +            "mout_bus_pll_user", DIV_TOP3, 24, 3),
>> +    DIV(CLK_DIV_ACLK_IMEM_200, "div_aclk_imem_200",
>> +            "mout_bus_pll_user", DIV_TOP3, 20, 3),
>> +    DIV(CLK_DIV_ACLK_IMEM_266, "div_aclk_imem_266",
>> +            "mout_bus_pll_user", DIV_TOP3, 16, 3),
>> +    DIV(CLK_DIV_ACLK_PERIC_66_B, "div_aclk_peric_66_b",
>> +            "div_aclk_peric_66_a", DIV_TOP3, 12, 3),
>> +    DIV(CLK_DIV_ACLK_PERIC_66_A, "div_aclk_peric_66_a",
>> +            "mout_bus_pll_user", DIV_TOP3, 8, 3),
>> +    DIV(CLK_DIV_ACLK_PERIS_66_B, "div_aclk_peris_66_b",
>> +            "div_aclk_peris_66_a", DIV_TOP3, 4, 3),
>> +    DIV(CLK_DIV_ACLK_PERIS_66_A, "div_aclk_peris_66_a",
> 
> [snip]
> 
>> +
>> +static void __init exynos5433_cmu_mif_init(struct device_node *np)
>> +{
>> +    samsung_cmu_register_one(np, &mif_cmu_info);
>> +}
>> +CLK_OF_DECLARE(exynos5433_cmu_mif, "samsung,exynos5433-cmu-mif",
>> +        exynos5433_cmu_mif_init);
>> +
>> +/*
>> + * Register offset definitions for CMU_PERIC
>> + */
>> +#define DIV_PERIC            0x0600
>> +#define ENABLE_ACLK_PERIC        0x0800
>> +#define ENABLE_PCLK_PERIC0        0x0900
>> +#define ENABLE_PCLK_PERIC1        0x0904
>> +#define ENABLE_SCLK_PERIC        0x0A00
>> +#define ENABLE_IP_PERIC0        0x0B00
>> +#define ENABLE_IP_PERIC1        0x0B04
>> +#define ENABLE_IP_PERIC2        0x0B08
>> +
> 
> nit: Just for consistency, all these offset should be in small case.
> 
>> +static unsigned long peric_clk_regs[] __initdata = {
>> +    DIV_PERIC,
>> +    ENABLE_ACLK_PERIC,
>> +    ENABLE_PCLK_PERIC0,
>> +    ENABLE_PCLK_PERIC1,
>> +    ENABLE_SCLK_PERIC,
>> +    ENABLE_IP_PERIC0,
>> +    ENABLE_IP_PERIC1,
>> +    ENABLE_IP_PERIC2,
>> +};
>> +
> 
> [snip]
> 
> Thanks,
> Pankaj Dubey
> 
> 
> 

Thanks for your review.

Best Regards,
Chanwoo Choi

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
