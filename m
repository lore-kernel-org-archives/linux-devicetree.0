From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v1 6/6] clk: hi6220: use CLK_OF_DECLARE_DRIVER
Date: Mon, 18 Mar 2019 13:21:29 -0700
Message-ID: <155294048956.20095.14072308972262767231@swboyd.mtv.corp.google.com>
References: <1552937931-23050-1-git-send-email-peter.griffin@linaro.org> <1552937931-23050-7-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1552937931-23050-7-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>, airlied@linux.ie, daniel@ffwll.ch, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, p.zabel@pengutronix.de, robh+dt@kernel.org, xuwei5@hisilicon.com
Cc: john.stultz@linaro.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, yuq825@gmail.com
List-Id: devicetree@vger.kernel.org

Quoting Peter Griffin (2019-03-18 12:38:51)
> As now we also need to probe in the reset driver as well.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  drivers/clk/hisilicon/clk-hi6220.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Doesn't this need to be squashed with the reset driver bits so we don't
have a bisection hole?

>=20
> diff --git a/drivers/clk/hisilicon/clk-hi6220.c b/drivers/clk/hisilicon/c=
lk-hi6220.c
> index a87809d..952ffe2 100644
> --- a/drivers/clk/hisilicon/clk-hi6220.c
> +++ b/drivers/clk/hisilicon/clk-hi6220.c
> @@ -89,7 +89,7 @@ static void __init hi6220_clk_ao_init(struct device_nod=
e *np)
>         hisi_clk_register_gate_sep(hi6220_separated_gate_clks_ao,
>                                 ARRAY_SIZE(hi6220_separated_gate_clks_ao)=
, clk_data_ao);
>  }
> -CLK_OF_DECLARE(hi6220_clk_ao, "hisilicon,hi6220-aoctrl", hi6220_clk_ao_i=
nit);
> +CLK_OF_DECLARE_DRIVER(hi6220_clk_ao, "hisilicon,hi6220-aoctrl", hi6220_c=
lk_ao_init);

Can you also add a comment indicating why/what is the other driver that
is probing the same device node?
