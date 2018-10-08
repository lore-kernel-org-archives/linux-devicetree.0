From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v5 2/2] clk: qcom: Add lpass clock controller driver for SDM845
Date: Sun, 07 Oct 2018 19:45:51 -0700
Message-ID: <153896675144.119890.3991549600874849177@swboyd.mtv.corp.google.com>
References: <1537266338-18661-1-git-send-email-tdas@codeaurora.org>
 <1537266338-18661-3-git-send-email-tdas@codeaurora.org>
 <153816066933.119890.2976485722156069351@swboyd.mtv.corp.google.com>
 <66fc65d8-92ec-f32c-6edb-ad4952695395@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <66fc65d8-92ec-f32c-6edb-ad4952695395@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Taniya Das <tdas@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Taniya Das (2018-10-04 05:01:27)
> =

> On 9/29/2018 12:21 AM, Stephen Boyd wrote:
> > Quoting Taniya Das (2018-09-18 03:25:38)
> >> @@ -3469,6 +3495,8 @@ enum {
> >>          [GCC_QSPI_CORE_CLK_SRC] =3D &gcc_qspi_core_clk_src.clkr,
> >>          [GCC_QSPI_CORE_CLK] =3D &gcc_qspi_core_clk.clkr,
> >>          [GCC_QSPI_CNOC_PERIPH_AHB_CLK] =3D &gcc_qspi_cnoc_periph_ahb_=
clk.clkr,
> >> +       [GCC_LPASS_Q6_AXI_CLK] =3D NULL,
> >> +       [GCC_LPASS_SWAY_CLK] =3D NULL,
> >>   };
> >>   =

> >>   static const struct qcom_reset_map gcc_sdm845_resets[] =3D {
> >> @@ -3583,6 +3611,13 @@ static int gcc_sdm845_probe(struct platform_dev=
ice *pdev)
> >>          if (ret)
> >>                  return ret;
> >>   =

> >> +       if (of_property_read_bool(pdev->dev.of_node, "qcom,lpass-prote=
cted")) {
> > =

> > Shouldn't this be negated? So that we only add the clks when lpass isn't
> > protected?
> >
> =

> I was of the opinion to add the flag only when LPASS clocks are =

> required. But I am fine negating it too.

It's stating that lpass clks are protected, so presumably we wouldn't
add the property on devices without the XPU configured. This means that
most configurations would have it protected and then this flag is needed
almost all the time. O well!
