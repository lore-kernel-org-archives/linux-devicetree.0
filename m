Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190819163748.18318-4-tdas@codeaurora.org>
References: <20190819163748.18318-1-tdas@codeaurora.org> <20190819163748.18318-4-tdas@codeaurora.org>
Subject: Re: [PATCH v2 3/3] clk: qcom: Add Global Clock controller (GCC) driver for SC7180
From: Stephen Boyd <sboyd@kernel.org>
Date: Wed, 21 Aug 2019 11:01:59 -0700
Message-Id: <20190821180200.1F7EF2082F@mail.kernel.org>
To: robh+dt@kernel.org
Cc: David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Taniya Das <tdas@codeaurora.org>
List-ID: <devicetree@vger.kernel.org>

Quoting Taniya Das (2019-08-19 09:37:48)
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index e1ff83cc361e..ebd4902afd9f 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -322,5 +331,4 @@ config KRAITCC
>         help
>           Support for the Krait CPU clocks on Qualcomm devices.
>           Say Y if you want to support CPU frequency scaling.
> -
>  endif

Please remove this hunk

> diff --git a/drivers/clk/qcom/gcc-sc7180.c b/drivers/clk/qcom/gcc-sc7180.c
> new file mode 100644
> index 000000000000..8718b675d609
> --- /dev/null
> +++ b/drivers/clk/qcom/gcc-sc7180.c
[...]
> +       },
> +};
> +
> +/* Camera Subsystem requires always ON. */

Yes, but why? This comment is useful unless it explains why.

> +static struct clk_branch gcc_camera_ahb_clk =3D {
> +       .halt_reg =3D 0xb008,
> +       .halt_check =3D BRANCH_HALT,
> +       .hwcg_reg =3D 0xb008,
> +       .hwcg_bit =3D 1,
> +       .clkr =3D {
> +               .enable_reg =3D 0xb008,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_camera_ahb_clk",
> +                       .flags =3D CLK_IS_CRITICAL,
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch gcc_camera_hf_axi_clk =3D {
> +       .halt_reg =3D 0xb020,
> +       .halt_check =3D BRANCH_HALT,
> +       .clkr =3D {
> +               .enable_reg =3D 0xb020,
> +               .enable_mask =3D BIT(0),
