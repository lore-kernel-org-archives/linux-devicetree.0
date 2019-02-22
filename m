From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 05/14] clk: qcom: apcs-msm8916: get parent clock names from DT
Date: Fri, 22 Feb 2019 10:11:42 -0800
Message-ID: <155085910216.77512.12604271825136479370@swboyd.mtv.corp.google.com>
References: <1548700381-22376-1-git-send-email-jorge.ramirez-ortiz@linaro.org> <1548700381-22376-6-git-send-email-jorge.ramirez-ortiz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548700381-22376-6-git-send-email-jorge.ramirez-ortiz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, arnd@arndb.de, bjorn.andersson@linaro.org, david.brown@linaro.org, enric.balletbo@collabora.com, heiko@sntech.de, horms+renesas@verge.net.au, jagan@amarulasolutions.com, jassisinghbrar@gmail.com, jorge.ramirez-ortiz@linaro.org, mark.rutland@arm.com, mturquette@baylibre.com, olof@lixom.net, robh+dt@kernel.org, sibis@codeaurora.org, will.deacon@arm.com
Cc: vkoul@kernel.org, niklas.cassel@linaro.org, georgi.djakov@linaro.org, amit.kucheria@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, khasim.mohammed@linaro.org
List-Id: devicetree@vger.kernel.org

Quoting Jorge Ramirez-Ortiz (2019-01-28 10:32:52)
> @@ -61,6 +65,25 @@ static int qcom_apcs_msm8916_clk_probe(struct platform=
_device *pdev)
>         if (!a53cc)
>                 return -ENOMEM;
> =20
> +       /* check if the parent names are present in the device tree */

This looks odd.

> +       ret =3D devm_clk_bulk_get(parent, ARRAY_SIZE(pclks), pclks);
> +       if (ret =3D=3D -EPROBE_DEFER)
> +               return ret;

Why can't we use of_clk_parent_fill() if we know this is always a DT
platform?  The parent clks may not be registered at the time of probe?
Maybe this series should wait for the parent registration stuff I'm
working on so that this can be made simpler.

> +
> +       if (!ret) {
> +               gpll0_a53cc[0] =3D __clk_get_name(pclks[0].clk);
> +               gpll0_a53cc[1] =3D __clk_get_name(pclks[1].clk);
> +               a53cc->pclk =3D pclks[1].clk;
> +       } else {
> +               /* support old binding where only pll was explicitily def=
ined */
> +               a53cc->pclk =3D devm_clk_get(parent, NULL);
> +               if (IS_ERR(a53cc->pclk)) {
> +                       ret =3D PTR_ERR(a53cc->pclk);
> +                       dev_err(dev, "failed to get clk: %d\n", ret);
> +                       return ret;
> +               }
> +       }
> +
>         init.name =3D "a53mux";
>         init.parent_names =3D gpll0_a53cc;
>         init.num_parents =3D ARRAY_SIZE(gpll0_a53cc);
