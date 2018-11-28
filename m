From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: clock: Introduce QCOM Graphics clock bindings
Date: Tue, 27 Nov 2018 16:49:37 -0800
Message-ID: <154336617743.88331.11824624815680965054@swboyd.mtv.corp.google.com>
References: <1543120569-14444-1-git-send-email-tdas@codeaurora.org>
 <1543120569-14444-2-git-send-email-tdas@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1543120569-14444-2-git-send-email-tdas@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Taniya Das <tdas@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, Amit Nischal <anischal@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Quoting Taniya Das (2018-11-24 20:36:07)
> From: Amit Nischal <anischal@codeaurora.org>
> =

> Add device tree bindings for graphics clock controller for
> Qualcomm Technology Inc's SDM845 SoCs.
> =

> Signed-off-by: Amit Nischal <anischal@codeaurora.org>

You could have added your sign off here, but I don't think this is
really different from the original posting that's on the list so it's
OK.

> ---
>  .../devicetree/bindings/clock/qcom,gpucc.txt       | 18 ++++++++++++++++
>  include/dt-bindings/clock/qcom,gpucc-sdm845.h      | 24 ++++++++++++++++=
++++++
>  2 files changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gpucc.txt
>  create mode 100644 include/dt-bindings/clock/qcom,gpucc-sdm845.h
> =

> diff --git a/Documentation/devicetree/bindings/clock/qcom,gpucc.txt b/Doc=
umentation/devicetree/bindings/clock/qcom,gpucc.txt
> new file mode 100644
> index 0000000..93752db
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,gpucc.txt
> @@ -0,0 +1,18 @@
> +Qualcomm Graphics Clock & Reset Controller Binding
> +--------------------------------------------------
> +
> +Required properties :
> +- compatible : shall contain "qcom,sdm845-gpucc".
> +- reg : shall contain base register location and length.
> +- #clock-cells : from common clock binding, shall contain 1.
> +- #reset-cells : from common reset binding, shall contain 1.
> +- #power-domain-cells : from generic power domain binding, shall contain=
 1.
> +
> +Example:
> +       gpucc: clock-controller@5090000 {
> +               compatible =3D "qcom,sdm845-gpucc";
> +               reg =3D <0x5090000 0x9000>;
> +               #clock-cells =3D <1>;
> +               #reset-cells =3D <1>;
> +               #power-domain-cells =3D <1>;

I would expect to see the xo clk here as a clocks and clock-names
property. I added it myself and applied to clk-next.
