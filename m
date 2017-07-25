From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2 2/3] clk: meson: meson8b: register the built-in reset controller
Date: Tue, 25 Jul 2017 21:17:26 +0200
Message-ID: <CAFBinCC0MeHyN2zHj1ZkO=7-h1sj1+bST5+08iR1dbt3Aqsn7w@mail.gmail.com>
References: <20170722185807.10504-1-martin.blumenstingl@googlemail.com>
 <20170722185807.10504-3-martin.blumenstingl@googlemail.com> <5976FA26.1050907@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <5976FA26.1050907@baylibre.com>
Sender: linux-clk-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, khilman@baylibre.com, carlo@caione.org, jbrunet@baylibre.com, linux-clk@vger.kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org, linux@armlinux.org.uk, mark.rutland@arm.com, mturquette@baylibre.com, sboyd@codeaurora.org
List-Id: devicetree@vger.kernel.org

Hi Neil,

On Tue, Jul 25, 2017 at 9:58 AM, Neil Armstrong <narmstrong@baylibre.com> w=
rote:
>
>
> Le 22/07/2017 20:58, Martin Blumenstingl a =C3=A9crit :
>> The clock controller also includes some reset lines. This patch
>> implements a reset controller to assert and de-assert these resets.
>> The reset controller itself is registered early (through
>> CLK_OF_DECLARE_DRIVER) because it is needed very early in the boot
>> process (to start the secondary CPU cores).
>>
>> According to the public S805 datasheet there are two more reset bits
>> in the HHI_SYS_CPU_CLK_CNTL0 register, which are not implemented by
>> this patch (as these seem to be unused in Amlogic's vendor Linux kernel
>> sources and their u-boot tree):
>> - bit 15: GEN_DIV_SOFT_RESET
>> - bit 14: SOFT_RESET
>>
>> All information was taken from the public S805 Datasheet and Amlogic's
>> vendor GPL kernel sources. This patch is based on an earlier version
>> submitted by Carlo Caione.
>>
>> Suggested-by: Carlo Caione <carlo@endlessm.com>
>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>> ---
>>  drivers/clk/meson/Kconfig   |   1 +
>>  drivers/clk/meson/meson8b.c | 159 +++++++++++++++++++++++++++++++++++++=
+++----
>>  drivers/clk/meson/meson8b.h |  25 ++++++-
>>  3 files changed, 172 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
>> index 5588f75a8414..d2d0174a6eca 100644
>> --- a/drivers/clk/meson/Kconfig
>> +++ b/drivers/clk/meson/Kconfig
>> @@ -6,6 +6,7 @@ config COMMON_CLK_AMLOGIC
>>  config COMMON_CLK_MESON8B
>>       bool
>>       depends on COMMON_CLK_AMLOGIC
>> +     select RESET_CONTROLLER
>>       help
>>         Support for the clock controller on AmLogic S802 (Meson8),
>>         S805 (Meson8b) and S812 (Meson8m2) devices. Say Y if you
>> diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
>> index bb3f1de876b1..0f853057885c 100644
>> --- a/drivers/clk/meson/meson8b.c
>> +++ b/drivers/clk/meson/meson8b.c
>> @@ -25,6 +25,8 @@
>>  #include <linux/clk-provider.h>
>>  #include <linux/of_address.h>
>>  #include <linux/platform_device.h>
>> +#include <linux/reset-controller.h>
>> +#include <linux/slab.h>
>>  #include <linux/init.h>
>>
>>  #include "clkc.h"
>> @@ -32,6 +34,13 @@
>>
>>  static DEFINE_SPINLOCK(clk_lock);
>>
>> +static void __iomem *clk_base;
>> +
>> +struct meson8b_clk_reset {
>> +     struct reset_controller_dev reset;
>> +     void __iomem *base;
>> +};
>> +
>>  static const struct pll_rate_table sys_pll_rate_table[] =3D {
>>       PLL_RATE(312000000, 52, 1, 2),
>>       PLL_RATE(336000000, 56, 1, 2),
>> @@ -690,20 +699,114 @@ static struct clk_divider *const meson8b_clk_divi=
ders[] =3D {
>>       &meson8b_mpeg_clk_div,
>>  };
>>
>> +static const struct meson8b_clk_reset_line {
>> +     u32 reg;
>> +     u8 bit_idx;
>> +} meson8b_clk_reset_bits[] =3D {
>> +     [RESETID_L2_CACHE_SOFT_RESET] =3D {
>> +             .reg =3D HHI_SYS_CPU_CLK_CNTL0, .bit_idx =3D 30
>> +     },
>> +     [RESETID_AXI_64_TO_128_BRIDGE_A5_SOFT_RESET] =3D {
>> +             .reg =3D HHI_SYS_CPU_CLK_CNTL0, .bit_idx =3D 29
>> +     },
>> +     [RESETID_SCU_SOFT_RESET] =3D {
>> +             .reg =3D HHI_SYS_CPU_CLK_CNTL0, .bit_idx =3D 28
>> +     },
>> +     [RESETID_CPU3_SOFT_RESET] =3D {
>> +             .reg =3D HHI_SYS_CPU_CLK_CNTL0, .bit_idx =3D 27
>> +     },
>> +     [RESETID_CPU2_SOFT_RESET] =3D {
>> +             .reg =3D HHI_SYS_CPU_CLK_CNTL0, .bit_idx =3D 26
>> +     },
>> +     [RESETID_CPU1_SOFT_RESET] =3D {
>> +             .reg =3D HHI_SYS_CPU_CLK_CNTL0, .bit_idx =3D 25
>> +     },
>> +     [RESETID_CPU0_SOFT_RESET] =3D {
>> +             .reg =3D HHI_SYS_CPU_CLK_CNTL0, .bit_idx =3D 24
>> +     },
>> +     [RESETID_A5_GLOBAL_RESET] =3D {
>> +             .reg =3D HHI_SYS_CPU_CLK_CNTL0, .bit_idx =3D 18
>> +     },
>> +     [RESETID_A5_AXI_SOFT_RESET] =3D {
>> +             .reg =3D HHI_SYS_CPU_CLK_CNTL0, .bit_idx =3D 17
>> +     },
>> +     [RESETID_A5_ABP_SOFT_RESET] =3D {
>> +             .reg =3D HHI_SYS_CPU_CLK_CNTL0, .bit_idx =3D 16
>> +     },
>> +     [RESETID_AXI_64_TO_128_BRIDGE_MMC_SOFT_RESET] =3D {
>> +             .reg =3D HHI_SYS_CPU_CLK_CNTL1, .bit_idx =3D 30
>> +     },
>> +     [RESETID_VID_CLK_CNTL_SOFT_RESET] =3D {
>> +             .reg =3D HHI_VID_CLK_CNTL, .bit_idx =3D 15
>> +     },
>> +     [RESETID_VID_DIVIDER_CNTL_SOFT_RESET_POST] =3D {
>> +             .reg =3D HHI_VID_DIVIDER_CNTL, .bit_idx =3D 7
>> +     },
>> +     [RESETID_VID_DIVIDER_CNTL_SOFT_RESET_PRE] =3D {
>> +             .reg =3D HHI_VID_DIVIDER_CNTL, .bit_idx =3D 3
>> +     },
>> +     [RESETID_VID_DIVIDER_CNTL_RESET_N_POST] =3D {
>> +             .reg =3D HHI_VID_DIVIDER_CNTL, .bit_idx =3D 1
>> +     },
>> +     [RESETID_VID_DIVIDER_CNTL_RESET_N_PRE] =3D {
>> +             .reg =3D HHI_VID_DIVIDER_CNTL, .bit_idx =3D 0
>> +     },
>> +};
>> +
>> +static int meson8b_clk_reset_update(struct reset_controller_dev *rcdev,
>> +                                 unsigned long id, bool assert)
>> +{
>> +     struct meson8b_clk_reset *meson8b_clk_reset =3D
>> +             container_of(rcdev, struct meson8b_clk_reset, reset);
>> +     unsigned long flags;
>> +     const struct meson8b_clk_reset_line *reset;
>> +     u32 val;
>> +
>> +     if (id >=3D ARRAY_SIZE(meson8b_clk_reset_bits))
>> +             return -EINVAL;
>> +
>> +     reset =3D &meson8b_clk_reset_bits[id];
>> +
>> +     spin_lock_irqsave(&clk_lock, flags);
>> +
>> +     val =3D readl(meson8b_clk_reset->base + reset->reg);
>> +     if (assert)
>> +             val |=3D BIT(reset->bit_idx);
>> +     else
>> +             val &=3D ~BIT(reset->bit_idx);
>> +     writel(val, meson8b_clk_reset->base + reset->reg);
>> +
>> +     spin_unlock_irqrestore(&clk_lock, flags);
>> +
>> +     return 0;
>> +}
>> +
>> +static int meson8b_clk_reset_assert(struct reset_controller_dev *rcdev,
>> +                                  unsigned long id)
>> +{
>> +     return meson8b_clk_reset_update(rcdev, id, true);
>> +}
>> +
>> +static int meson8b_clk_reset_deassert(struct reset_controller_dev *rcde=
v,
>> +                                    unsigned long id)
>> +{
>> +     return meson8b_clk_reset_update(rcdev, id, false);
>> +}
>> +
>> +static const struct reset_control_ops meson8b_clk_reset_ops =3D {
>> +     .assert =3D meson8b_clk_reset_assert,
>> +     .deassert =3D meson8b_clk_reset_deassert,
>> +};
>> +
>>  static int meson8b_clkc_probe(struct platform_device *pdev)
>>  {
>> -     void __iomem *clk_base;
>>       int ret, clkid, i;
>>       struct clk_hw *parent_hw;
>>       struct clk *parent_clk;
>>       struct device *dev =3D &pdev->dev;
>>
>> -     /*  Generic clocks and PLLs */
>> -     clk_base =3D of_iomap(dev->of_node, 1);
>> -     if (!clk_base) {
>> -             pr_err("%s: Unable to map clk base\n", __func__);
>> +     if (!clk_base)
>>               return -ENXIO;
>> -     }
>>
>>       /* Populate base address for PLLs */
>>       for (i =3D 0; i < ARRAY_SIZE(meson8b_clk_plls); i++)
>> @@ -743,7 +846,7 @@ static int meson8b_clkc_probe(struct platform_device=
 *pdev)
>>               /* FIXME convert to devm_clk_register */
>>               ret =3D devm_clk_hw_register(dev, meson8b_hw_onecell_data.=
hws[clkid]);
>>               if (ret)
>> -                     goto iounmap;
>> +                     return ret;
>>       }
>>
>>       /*
>> @@ -766,15 +869,11 @@ static int meson8b_clkc_probe(struct platform_devi=
ce *pdev)
>>       if (ret) {
>>               pr_err("%s: failed to register clock notifier for cpu_clk\=
n",
>>                               __func__);
>> -             goto iounmap;
>> +             return ret;
>>       }
>>
>>       return of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,
>>                       &meson8b_hw_onecell_data);
>> -
>> -iounmap:
>> -     iounmap(clk_base);
>> -     return ret;
>>  }
>>
>>  static const struct of_device_id meson8b_clkc_match_table[] =3D {
>> @@ -793,3 +892,39 @@ static struct platform_driver meson8b_driver =3D {
>>  };
>>
>>  builtin_platform_driver(meson8b_driver);
>> +
>> +static void __init meson8b_clkc_reset_init(struct device_node *np)
>> +{
>> +     struct meson8b_clk_reset *rstc;
>> +     int ret;
>> +
>> +     /* Generic clocks, PLLs and some of the reset-bits */
>> +     clk_base =3D of_iomap(np, 1);
>> +     if (!clk_base) {
>> +             pr_err("%s: Unable to map clk base\n", __func__);
>> +             return;
>> +     }
>> +
>> +     rstc =3D kzalloc(sizeof(*rstc), GFP_KERNEL);
>> +     if (!rstc)
>> +             return;
>> +
>> +     /* Reset Controller */
>> +     rstc->base =3D clk_base;
>> +     rstc->reset.ops =3D &meson8b_clk_reset_ops;
>> +     rstc->reset.nr_resets =3D ARRAY_SIZE(meson8b_clk_reset_bits);
>> +     rstc->reset.of_node =3D np;
>> +     ret =3D reset_controller_register(&rstc->reset);
>> +     if (ret) {
>> +             pr_err("%s: Failed to register clkc reset controller: %d\n=
",
>> +                    __func__, ret);
>> +             return;
>> +     }
>> +}
>> +
>> +CLK_OF_DECLARE_DRIVER(meson8_clkc, "amlogic,meson8-clkc",
>> +                   meson8b_clkc_reset_init);
>> +CLK_OF_DECLARE_DRIVER(meson8b_clkc, "amlogic,meson8b-clkc",
>> +                   meson8b_clkc_reset_init);
>> +CLK_OF_DECLARE_DRIVER(meson8m2_clkc, "amlogic,meson8m2-clkc",
>> +                   meson8b_clkc_reset_init);
>> diff --git a/drivers/clk/meson/meson8b.h b/drivers/clk/meson/meson8b.h
>> index a687e02547dc..5f4d8e49dd4d 100644
>> --- a/drivers/clk/meson/meson8b.h
>> +++ b/drivers/clk/meson/meson8b.h
>> @@ -37,6 +37,9 @@
>>  #define HHI_GCLK_AO                  0x154 /* 0x55 offset in data sheet=
 */
>>  #define HHI_SYS_CPU_CLK_CNTL1                0x15c /* 0x57 offset in da=
ta sheet */
>>  #define HHI_MPEG_CLK_CNTL            0x174 /* 0x5d offset in data sheet=
 */
>> +#define HHI_VID_CLK_CNTL             0x17c /* 0x5f offset in data sheet=
 */
>> +#define HHI_VID_DIVIDER_CNTL         0x198 /* 0x66 offset in data sheet=
 */
>> +#define HHI_SYS_CPU_CLK_CNTL0                0x19c /* 0x67 offset in da=
ta sheet */
>>  #define HHI_MPLL_CNTL                        0x280 /* 0xa0 offset in da=
ta sheet */
>>  #define HHI_SYS_PLL_CNTL             0x300 /* 0xc0 offset in data sheet=
 */
>>  #define HHI_VID_PLL_CNTL             0x320 /* 0xc8 offset in data sheet=
 */
>> @@ -163,7 +166,27 @@
>>
>>  #define CLK_NR_CLKS          96
>>
>> -/* include the CLKIDs that have been made part of the stable DT binding=
 */
>> +#define RESETID_L2_CACHE_SOFT_RESET                          0
>> +#define RESETID_AXI_64_TO_128_BRIDGE_A5_SOFT_RESET           1
>> +#define RESETID_SCU_SOFT_RESET                                       2
>> +#define RESETID_CPU0_SOFT_RESET                                      3
>> +#define RESETID_CPU1_SOFT_RESET                                      4
>> +#define RESETID_CPU2_SOFT_RESET                                      5
>> +#define RESETID_CPU3_SOFT_RESET                                      6
>> +#define RESETID_A5_GLOBAL_RESET                                      7
>> +#define RESETID_A5_AXI_SOFT_RESET                            8
>> +#define RESETID_A5_ABP_SOFT_RESET                            9
>> +#define RESETID_AXI_64_TO_128_BRIDGE_MMC_SOFT_RESET          10
>> +#define RESETID_VID_CLK_CNTL_SOFT_RESET                              11
>> +#define RESETID_VID_DIVIDER_CNTL_SOFT_RESET_POST             12
>> +#define RESETID_VID_DIVIDER_CNTL_SOFT_RESET_PRE                      13
>> +#define RESETID_VID_DIVIDER_CNTL_RESET_N_POST                        14
>> +#define RESETID_VID_DIVIDER_CNTL_RESET_N_PRE                 15
>
> I think you should directly expose them in a dt-bindings/reset/meson8b-cl=
kc-reset.h file and include it here.
just to confirm: do you want to move these to separate (new) header or
would meson8b-clkc.h be fine as well?
in either case: I suspect that changes to these will be very rare (as
I've re-checked that Amlogic's GPL kernel or u-boot definitely uses
these), so exposing them directly probably makes sense

>> +
>> +/*
>> + * include the CLKID and RESETID that have
>> + * been made part of the stable DT binding
>> + */
>>  #include <dt-bindings/clock/meson8b-clkc.h>
>>
>>  #endif /* __MESON8B_H */
>>
>
> Apart from that :
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
thank you for reviewing my patches from this and the SMP/hotplug series!


Martin
