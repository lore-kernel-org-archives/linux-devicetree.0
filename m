Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190807181301.15326-2-tdas@codeaurora.org>
References: <20190807181301.15326-1-tdas@codeaurora.org> <20190807181301.15326-2-tdas@codeaurora.org>
From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v1 1/2] clk: qcom: Add DT bindings for SC7180 gcc clock controller
Date: Wed, 07 Aug 2019 15:14:41 -0700
Message-Id: <20190807221442.01F8D2173C@mail.kernel.org>
Cc: David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, Taniya Das <tdas@codeaurora.org>
List-ID: <devicetree@vger.kernel.org>

Quoting Taniya Das (2019-08-07 11:13:00)
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.txt b/Docum=
entation/devicetree/bindings/clock/qcom,gcc.txt
> index 8661c3cd3ccf..18d95467cb36 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc.txt
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc.txt
> @@ -23,6 +23,7 @@ Required properties :
>                         "qcom,gcc-sdm630"
>                         "qcom,gcc-sdm660"
>                         "qcom,gcc-sdm845"
> +                       "qcom,gcc-sc7180"
>=20
>  - reg : shall contain base register location and length
>  - #clock-cells : shall contain 1

Can you please list the clk inputs that you're expecting now? Similar to
what Vinod did for the other most recent GCC driver. We should probably
convert this binding to YAML.
