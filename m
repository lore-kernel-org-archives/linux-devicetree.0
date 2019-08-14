From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: clock: Document SM8150 rpmh-clock compatible
Date: Wed, 14 Aug 2019 10:18:22 -0700
Message-ID: <20190814171823.839C4206C2@mail.kernel.org>
References: <20190814122958.4981-1-vkoul@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190814122958.4981-1-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Vinod Koul (2019-08-14 05:29:57)
> Document the SM8150 rpmh-clock compatible for rpmh clock controller
> found on SM8150 platforms.
>=20
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt b/=
Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt
> index 3c007653da31..82dee80cdbf3 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt
> +++ b/Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt
> @@ -6,7 +6,9 @@ some Qualcomm Technologies Inc. SoCs. It accepts clock re=
quests from
>  other hardware subsystems via RSC to control clocks.
> =20
>  Required properties :
> -- compatible : shall contain "qcom,sdm845-rpmh-clk"
> +- compatible : must be one of:
> +              "qcom,sdm845-rpmh-clk"
> +              "qcom,sm8150-rpmh-clk"
> =20

Can it take a 'clocks' property to get the board clock?
