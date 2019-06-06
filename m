From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 2/3] clk: qcom: Add MSM8998 GPU Clock Controller (GPUCC) driver
Date: Thu, 06 Jun 2019 16:00:49 -0700
Message-ID: <20190606230050.2F33720645@mail.kernel.org>
References: <20190528164616.38517-1-jeffrey.l.hugo@gmail.com> <20190528164803.38642-1-jeffrey.l.hugo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190528164803.38642-1-jeffrey.l.hugo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@baylibre.com
Cc: agross@kernel.org, david.brown@linaro.org, bjorn.andersson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, marc.w.gonzalez@free.fr, jcrouse@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
List-Id: devicetree@vger.kernel.org

Quoting Jeffrey Hugo (2019-05-28 09:48:03)
> diff --git a/drivers/clk/qcom/gpucc-msm8998.c b/drivers/clk/qcom/gpucc-ms=
m8998.c
> new file mode 100644
> index 000000000000..e45062e40718
> --- /dev/null
> +++ b/drivers/clk/qcom/gpucc-msm8998.c
> +
> +static int gpucc_msm8998_probe(struct platform_device *pdev)
> +{
> +       struct regmap *regmap;
> +       struct clk *xo;
> +
> +       /*
> +        * We must have a valid XO to continue until orphan probe defer is
> +        * implemented.
> +        */
> +       xo =3D clk_get(&pdev->dev, "xo");

Why is this necessary?

> +       if (IS_ERR(xo))
> +               return PTR_ERR(xo);
> +       clk_put(xo);
> +
> +       regmap =3D qcom_cc_map(pdev, &gpucc_msm8998_desc);
> +       if (IS_ERR(regmap))
> +               return PTR_ERR(regmap);
> +
> +       /* force periph logic on to acoid perf counter corruption */

avoid?

> +       regmap_write_bits(regmap, gfx3d_clk.clkr.enable_reg, BIT(13), BIT=
(13));
> +       /* tweak droop detector (GPUCC_GPU_DD_WRAP_CTRL) to reduce leakag=
e */
> +       regmap_write_bits(regmap, gfx3d_clk.clkr.enable_reg, BIT(0), BIT(=
0));
> +
> +       return qcom_cc_really_probe(pdev, &gpucc_msm8998_desc, regmap);
> +}
> +
