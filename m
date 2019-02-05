From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v1 2/4] dt-bindings: clock: Add support for the MSM8998 mmcc
Date: Tue, 05 Feb 2019 14:02:23 -0800
Message-ID: <154940414347.169292.9150834270087697417@swboyd.mtv.corp.google.com>
References: <1548866102-30224-1-git-send-email-jhugo@codeaurora.org> <1548866159-30304-1-git-send-email-jhugo@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548866159-30304-1-git-send-email-jhugo@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org
Cc: marc.w.gonzalez@free.fr, andy.gross@linaro.org, david.brown@linaro.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jeffrey Hugo <jhugo@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Quoting Jeffrey Hugo (2019-01-30 08:35:59)
> Document the multimedia clock controller found on MSM8998
>=20
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,mmcc.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/qcom,mmcc.txt b/Docu=
mentation/devicetree/bindings/clock/qcom,mmcc.txt
> index 8b0f784..ae85bca 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,mmcc.txt
> +++ b/Documentation/devicetree/bindings/clock/qcom,mmcc.txt
> @@ -10,11 +10,18 @@ Required properties :
>                         "qcom,mmcc-msm8960"
>                         "qcom,mmcc-msm8974"
>                         "qcom,mmcc-msm8996"
> +                       "qcom,mmcc-msm8998"
> =20
>  - reg : shall contain base register location and length
>  - #clock-cells : shall contain 1
>  - #reset-cells : shall contain 1
> =20
> +For MSM8998 only:
> +       - clocks: a list of phandles and clock-specifier pairs,
> +                 one for each entry in clock-names.
> +       - clock-names: "xo" for the xo clock,
> +                      "gpll0" for the global pll 0 clock.

Wouldn't the DSI plls also be listed here? And anything else that is
external to this clock controller?
