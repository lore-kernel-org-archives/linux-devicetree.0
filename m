From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom: Fix the xo parent in gpucc example
Date: Wed, 28 Nov 2018 13:26:05 -0800
Message-ID: <154344036587.88331.13059372833537829634@swboyd.mtv.corp.google.com>
References: <20181128185743.75328-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181128185743.75328-1-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, Taniya Das <tdas@codeaurora.org>, "Kristian H . Kristensen" <hoegsberg@chromium.org>, Jordan Crouse <jcrouse@codeaurora.org>, Amit Nischal <anischal@codeaurora.org>, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Douglas Anderson (2018-11-28 10:57:42)
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gpucc.txt b/Doc=
umentation/devicetree/bindings/clock/qcom,gpucc.txt
> index 9d0358cc08b4..4e5215ef1acd 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gpucc.txt
> +++ b/Documentation/devicetree/bindings/clock/qcom,gpucc.txt
> @@ -17,6 +17,6 @@ Example:
>                 #clock-cells =3D <1>;
>                 #reset-cells =3D <1>;
>                 #power-domain-cells =3D <1>;
> -               clocks =3D <&xo_board>;
> +               clocks =3D <&rpmhcc RPMH_CXO_CLK>;

I don't think it really matters, but ok whatever. Don't mind me
shuffling patches over here.

Applied to clk-next.
