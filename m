From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v1 3/4] clk: qcom: Add MSM8998 Multimedia Clock Controller (MMCC) driver
Date: Tue, 05 Feb 2019 14:06:02 -0800
Message-ID: <154940436246.169292.7591382350282828249@swboyd.mtv.corp.google.com>
References: <1548866102-30224-1-git-send-email-jhugo@codeaurora.org> <1548866171-30341-1-git-send-email-jhugo@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548866171-30341-1-git-send-email-jhugo@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, mturquette@baylibre.com
Cc: marc.w.gonzalez@free.fr, andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jeffrey Hugo <jhugo@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Quoting Jeffrey Hugo (2019-01-30 08:36:11)
[..]
> +};
> +MODULE_DEVICE_TABLE(of, mmcc_msm8998_match_table);
> +
> +static int mmcc_msm8998_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       int i, ret;
> +       struct regmap *regmap;
> +       struct clk *c;
> +
> +       c =3D devm_clk_get(dev, "xo");
> +       if (!IS_ERR(c))
> +               dummy_xo_init.parent_names =3D
> +                                       (const char *[]){__clk_get_name(c=
)};
> +       else
> +               return PTR_ERR(c);
> +
> +       c =3D devm_clk_get(dev, "gpll0");
> +       if (!IS_ERR(c))
> +               dummy_gpll0_init.parent_names =3D
> +                                       (const char *[]){__clk_get_name(c=
)};
> +       else
> +               return PTR_ERR(c);

Urgh, my parent mapping series can't come be merged fast enough it
seems!

> +
> +       regmap =3D qcom_cc_map(pdev, &mmcc_msm8998_desc);
> +       if (IS_ERR(regmap))
> +               return PTR_ERR(regmap);
> +
> +       for (i =3D 0; i < ARRAY_SIZE(mmcc_msm8998_hws); i++) {
> +               ret =3D devm_clk_hw_register(dev, mmcc_msm8998_hws[i]);

I think we should make this common to the qcom_cc_desc now. Can you
throw in an optional list of clk_hw pointers that also get registered as
its own patch and update the existing drivers that are all doing this?

> +               if (ret)
> +                       return ret;
> +       }
> +
> +       return qcom_cc_really_probe(pdev, &mmcc_msm8998_desc, regmap);
> +}
