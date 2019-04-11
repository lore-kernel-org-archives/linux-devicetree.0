From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 3/3] clk: qcom: Add QCS404 TuringCC
Date: Thu, 11 Apr 2019 13:36:44 -0700
Message-ID: <155501500497.20095.1440923707925089208@swboyd.mtv.corp.google.com>
References: <20190306174758.22462-1-bjorn.andersson@linaro.org> <20190306174758.22462-4-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190306174758.22462-4-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Michael Turquette <mturquette@baylibre.com>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Bjorn Andersson (2019-03-06 09:47:58)
> +
> +static int turingcc_probe(struct platform_device *pdev)
> +{
> +       int ret;
> +
> +       pm_runtime_enable(&pdev->dev);
> +       ret =3D pm_clk_create(&pdev->dev);

Neat solution. Thanks!

> +       if (ret)
> +               goto disable_pm_runtime;
> +
> +       ret =3D pm_clk_add(&pdev->dev, NULL);
