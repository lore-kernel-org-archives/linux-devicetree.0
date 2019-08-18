From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 1/2] clk: qcom: Add MSM8998 GPU Clock Controller (GPUCC) driver
Date: Sat, 17 Aug 2019 18:10:43 -0700
Message-ID: <20190818011044.B21742173B@mail.kernel.org>
References: <20190611191949.14906-1-jeffrey.l.hugo@gmail.com> <20190611192049.14958-1-jeffrey.l.hugo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190611192049.14958-1-jeffrey.l.hugo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@baylibre.com
Cc: agross@kernel.org, david.brown@linaro.org, bjorn.andersson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, marc.w.gonzalez@free.fr, jcrouse@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
List-Id: devicetree@vger.kernel.org

Quoting Jeffrey Hugo (2019-06-11 12:20:49)
> +
> +static int gpucc_msm8998_probe(struct platform_device *pdev)
> +{
> +       struct regmap *regmap;
> +       struct clk *xo;
> +
> +       /*
> +        * We must have a valid XO to continue until orphan probe defer is
> +        * implemented.  XO is basically the root of everything.  Since we
> +        * cannot control probe order, its possible XO won't be available
> +        * and the clk framework will allow clients to operate on their
> +        * clocks that depend on XO, which has been observed to cause iss=
ues.
> +        */
> +       xo =3D clk_get(&pdev->dev, "xo");

Sorry, it still bothers me. Please remove any clk consumer API calls in
these MSM8998 drivers and don't put XO into DT for these nodes until the
"observed issues" are resolved with the clk framework.

> +       if (IS_ERR(xo))
