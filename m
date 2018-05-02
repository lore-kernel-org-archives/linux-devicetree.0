From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: clock: Introduce QCOM RPMh clock bindings
Date: Wed, 02 May 2018 08:10:52 -0700
Message-ID: <152527385298.138124.8046800128520264876@swboyd.mtv.corp.google.com>
References: <1525258277-3478-1-git-send-email-tdas@codeaurora.org>
 <1525258277-3478-2-git-send-email-tdas@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1525258277-3478-2-git-send-email-tdas@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, Odelu Kukatla <okukatla@codeaurora.org>, Amit Nischal <anischal@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Taniya Das <tdas@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Quoting Taniya Das (2018-05-02 03:51:16)
> Add RPMh clock device bindings for Qualcomm Technology Inc's SoCs. These
> devices would be used for communicating resource state requests to control
> the clocks managed by RPMh.
> =

> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> Reviewed-by: Rob Herring <robh@kernel.org>

When you change things you shouldn't keep around reviewed-by tags if it
significantly changes..

> +Example :
> +
> +#include <dt-bindings/clock/qcom,rpmh.h>
> +
> +       &apps_rsc {
> +               rpmhcc: clock-controller {
> +                       compatible =3D "qcom,sdm845-rpmh-clk";
> +                       #clock-cells =3D <1>;
> +                       assigned-clocks =3D <&clock_rpmh RPMH_CXO_CLK>,
> +                                       <&clock_rpmh RPMH_CXO_CLK_A>,
> +                                       <&clock_rpmh RPMH_LN_BB_CLK2>,
> +                                       <&clock_rpmh RPMH_LN_BB_CLK2_A>,
> +                                       <&clock_rpmh RPMH_LN_BB_CLK3>,
> +                                       <&clock_rpmh RPMH_LN_BB_CLK3_A>;
> +                       assigned-clock-parents =3D <&xo_board_div>,
> +                                               <&xo_board_div>,
> +                                               <&xo_board_div>,
> +                                               <&xo_board_div>,
> +                                               <&xo_board_div>,
> +                                               <&xo_board_div>,

There's only one parent, so assigned-clock-parents doesn't really make
sense. If anything, we would have 'clocks =3D ' here and specify the xo
board clk and the div 2 clk that live in DT. But I already merged this
binding, two patchsets ago. Please look in clk-next.

> +               };
> +#define RPMH_RF_CLK2                           8
> +#define RPMH_RF_CLK2_A                         9
> +#define RPMH_RF_CLK3                           10
> +#define RPMH_RF_CLK3_A                         11
> +

Ok. I dropped CLK4* from the previous patch you sent and dropped Amit's
signed-off-by.
