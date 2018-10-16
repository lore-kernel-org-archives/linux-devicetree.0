From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v13 8/8] clk: qcom: Add ACD path to CPU clock driver for msm8996
Date: Tue, 16 Oct 2018 16:56:48 -0700
Message-ID: <153973420806.5275.356235896596182005@swboyd.mtv.corp.google.com>
References: <20180614215358.11264-1-ilia.lin@gmail.com>
 <20180614215358.11264-9-ilia.lin@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180614215358.11264-9-ilia.lin@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ilia.lin@gmail.com
Cc: Ilia Lin <ilialin@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Will Deacon <will.deacon@arm.com>, Amit Kucheria <amit.kucheria@linaro.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Quoting ilia.lin@gmail.com (2018-06-14 14:53:55)
> @@ -176,6 +183,9 @@ static struct clk_alpha_pll pwrcl_alt_pll =3D {
>         },
>  };
>  =

> +void __iomem *base;
> +static void qcom_cpu_clk_msm8996_acd_init(void __iomem *base);
> +

Why are we doing this?

> @@ -393,6 +404,10 @@ qcom_cpu_clk_msm8996_register_clks(struct device *de=
v, struct regmap *regmap)
>         clk_alpha_pll_configure(&perfcl_alt_pll, regmap, &altpll_config);
>         clk_alpha_pll_configure(&pwrcl_alt_pll, regmap, &altpll_config);
>  =

> +       /* Enable alt PLLs */
> +       clk_prepare_enable(pwrcl_alt_pll.clkr.hw.clk);
> +       clk_prepare_enable(perfcl_alt_pll.clkr.hw.clk);

Are the alt PLLs CLK_IS_CRITICAL?

> +
>         ret =3D clk_notifier_register(pwrcl_pmux.clkr.hw.clk, &pwrcl_pmux=
.nb);
>         if (ret)
>                 return ret;
> @@ -402,10 +417,48 @@ qcom_cpu_clk_msm8996_register_clks(struct device *d=
ev, struct regmap *regmap)
>         return ret;
>  }
>  =

> +#define CPU_AFINITY_MASK 0xFFF
> +#define PWRCL_CPU_REG_MASK 0x3
> +#define PERFCL_CPU_REG_MASK 0x103
> +
> +#define L2ACDCR_REG 0x580ULL
> +#define L2ACDTD_REG 0x581ULL
> +#define L2ACDDVMRC_REG 0x584ULL
> +#define L2ACDSSCR_REG 0x589ULL
> +
> +static DEFINE_SPINLOCK(acd_lock);
> +
> +static void qcom_cpu_clk_msm8996_acd_init(void __iomem *base)
> +{
> +       u64 hwid;
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&acd_lock, flags);
> +
> +       hwid =3D read_cpuid_mpidr() & CPU_AFINITY_MASK;
> +
> +       kryo_l2_set_indirect_reg(L2ACDTD_REG, 0x00006A11);
> +       kryo_l2_set_indirect_reg(L2ACDDVMRC_REG, 0x000E0F0F);
> +       kryo_l2_set_indirect_reg(L2ACDSSCR_REG, 0x00000601);
> +
> +       if (PWRCL_CPU_REG_MASK =3D=3D (hwid | PWRCL_CPU_REG_MASK)) {
> +               writel(0xF, base + PWRCL_REG_OFFSET + SSSCTL_OFFSET);
> +               wmb();
> +               kryo_l2_set_indirect_reg(L2ACDCR_REG, 0x002C5FFD);
> +       }
> +
> +       if (PERFCL_CPU_REG_MASK =3D=3D (hwid | PERFCL_CPU_REG_MASK)) {
> +               kryo_l2_set_indirect_reg(L2ACDCR_REG, 0x002C5FFD);
> +               writel(0xF, base + PERFCL_REG_OFFSET + SSSCTL_OFFSET);
> +               wmb();

Please add comments to the barriers here so we know what they're doing.
I guess the first one is ordering writel with the indirect register
access, but the other one I don't know what it's doing.

> +       }
> +
> +       spin_unlock_irqrestore(&acd_lock, flags);
> +}
> +
>  static int qcom_cpu_clk_msm8996_driver_probe(struct platform_device *pde=
v)
>  {
>         int ret;
> -       void __iomem *base;

Ok but still, why?

>         struct resource *res;
>         struct regmap *regmap;
>         struct clk_hw_onecell_data *data;
> @@ -429,6 +482,8 @@ static int qcom_cpu_clk_msm8996_driver_probe(struct p=
latform_device *pdev)
>         if (ret)
>                 return ret;
>  =

> +       qcom_cpu_clk_msm8996_acd_init(base);
> +
>         data->hws[0] =3D &pwrcl_pmux.clkr.hw;
>         data->hws[1] =3D &perfcl_pmux.clkr.hw;
>         data->num =3D 2;
> -- =

> 2.11.0
>=20
