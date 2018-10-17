From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v13 6/8] clk: qcom: cpu-8996: Add support to switch to alternate
 PLL
Date: Wed, 17 Oct 2018 08:32:05 -0700
Message-ID: <153979032539.5275.12064078400966025600@swboyd.mtv.corp.google.com>
References: <20180614215358.11264-1-ilia.lin@gmail.com>
 <20180614215358.11264-7-ilia.lin@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180614215358.11264-7-ilia.lin@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ilia.lin@gmail.com
Cc: Rajendra Nayak <rnayak@codeaurora.org>, Ilia Lin <ilialin@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Will Deacon <will.deacon@arm.com>, Amit Kucheria <amit.kucheria@linaro.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Quoting ilia.lin@gmail.com (2018-06-14 14:53:53)
> @@ -227,6 +232,26 @@ clk_cpu_8996_mux_determine_rate(struct clk_hw *hw, s=
truct clk_rate_request *req)
>         return 0;
>  }
>  =

> +int cpu_clk_notifier_cb(struct notifier_block *nb, unsigned long event,

static? And name it something like clk_cpu_8996_notifier?

> +                       void *data)
> +{
> +       int ret;
> +       struct clk_cpu_8996_mux *cpuclk =3D to_clk_cpu_8996_mux_nb(nb);
> +
> +       switch (event) {
> +       case PRE_RATE_CHANGE:
> +               ret =3D clk_cpu_8996_mux_set_parent(&cpuclk->clkr.hw, ALT=
_INDEX);
> +               break;
> +       case POST_RATE_CHANGE:
> +               ret =3D clk_cpu_8996_mux_set_parent(&cpuclk->clkr.hw, PLL=
_INDEX);
> +               break;
> +       default:
> +               ret =3D 0;
> +               break;
> +       }
> +
> +       return notifier_from_errno(ret);
> +};
