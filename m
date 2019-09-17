From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v5 1/8] clk: Zero init clk_init_data in helpers
Date: Tue, 17 Sep 2019 13:39:56 -0700
Message-ID: <20190917203957.9F75C2054F@mail.kernel.org>
References: <20190916161447.32715-1-manivannan.sadhasivam@linaro.org> <20190916161447.32715-2-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190916161447.32715-2-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@baylibre.com, robh+dt@kernel.org
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, haitao.suo@bitmain.com, darren.tsao@bitmain.com, fisher.cheng@bitmain.com, alec.lin@bitmain.com, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Quoting Manivannan Sadhasivam (2019-09-16 09:14:40)
> The clk_init_data struct needs to be initialized to zero for the new
> parent_map implementation to work correctly. Otherwise, the member which
> is available first will get processed.
>=20
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/clk/clk-composite.c  | 2 +-
>  drivers/clk/clk-divider.c    | 2 +-
>  drivers/clk/clk-fixed-rate.c | 2 +-
>  drivers/clk/clk-gate.c       | 2 +-
>  drivers/clk/clk-mux.c        | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/clk/clk-composite.c b/drivers/clk/clk-composite.c
> index b06038b8f658..4d579f9d20f6 100644
> --- a/drivers/clk/clk-composite.c
> +++ b/drivers/clk/clk-composite.c
> @@ -208,7 +208,7 @@ struct clk_hw *clk_hw_register_composite(struct devic=
e *dev, const char *name,
>                         unsigned long flags)
>  {
>         struct clk_hw *hw;
> -       struct clk_init_data init;
> +       struct clk_init_data init =3D { NULL };

I'd prefer { } because then we don't have to worry about ordering the
struct to have a pointer vs. something else first.

>         struct clk_composite *composite;
>         struct clk_ops *clk_composite_ops;
>         int ret;
