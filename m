From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 01/14] clk: qcom: gcc: limit GPLL0_AO_OUT operating frequency
Date: Fri, 22 Feb 2019 10:07:32 -0800
Message-ID: <155085885277.77512.880525447229804781@swboyd.mtv.corp.google.com>
References: <1548700381-22376-1-git-send-email-jorge.ramirez-ortiz@linaro.org> <1548700381-22376-2-git-send-email-jorge.ramirez-ortiz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548700381-22376-2-git-send-email-jorge.ramirez-ortiz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, arnd@arndb.de, bjorn.andersson@linaro.org, david.brown@linaro.org, enric.balletbo@collabora.com, heiko@sntech.de, horms+renesas@verge.net.au, jagan@amarulasolutions.com, jassisinghbrar@gmail.com, jorge.ramirez-ortiz@linaro.org, mark.rutland@arm.com, mturquette@baylibre.com, olof@lixom.net, robh+dt@kernel.org, sibis@codeaurora.org, will.deacon@arm.com
Cc: vkoul@kernel.org, niklas.cassel@linaro.org, georgi.djakov@linaro.org, amit.kucheria@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, khasim.mohammed@linaro.org
List-Id: devicetree@vger.kernel.org

Quoting Jorge Ramirez-Ortiz (2019-01-28 10:32:48)
> Limit the GPLL0_AO_OUT_MAIN operating frequency as per its hardware
> specifications.
>=20
> Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>

Acked-by: Stephen Boyd <sboyd@kernel.org>

> diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
> index 64da032..7de4fcf 100644
> --- a/drivers/clk/qcom/gcc-qcs404.c
> +++ b/drivers/clk/qcom/gcc-qcs404.c
> @@ -304,6 +304,7 @@ static struct clk_alpha_pll gpll0_out_main =3D {
>         },
>  };
> =20
> +

Please remove this stray hunk though.

>  static struct clk_alpha_pll gpll0_ao_out_main =3D {
>         .offset =3D 0x21000,
>         .regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
