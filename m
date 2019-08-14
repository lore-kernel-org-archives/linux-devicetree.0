From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 03/22] arm64: dts: qcom: sm8150: add tlmm node
Date: Wed, 14 Aug 2019 10:01:04 -0700
Message-ID: <20190814170105.027C42063F@mail.kernel.org>
References: <20190814125012.8700-1-vkoul@kernel.org> <20190814125012.8700-4-vkoul@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190814125012.8700-4-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, sibis@codeaurora.org, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Vinod Koul (2019-08-14 05:49:53)
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---

Add some commit text? Or just squash with the first patch? Not sure why
it's a different commit.

>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/q=
com/sm8150.dtsi
> index cd9fcadaeacb..5f2f21270e2d 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -189,6 +189,21 @@
>                         };
>                 };
> =20
> +               tlmm: pinctrl@3100000 {
> +                       compatible =3D "qcom,sm8150-pinctrl";
> +                       reg =3D <0x03100000 0x300000>,
> +                             <0x03500000 0x300000>,
> +                             <0x03900000 0x300000>,
> +                             <0x03D00000 0x300000>;

Please don't use capitalized hex characters.

> +                       reg-names =3D "west", "east", "north", "south";
> +                       interrupts =3D <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> +                       gpio-ranges =3D <&tlmm 0 0 175>;
> +                       gpio-controller;
> +                       #gpio-cells =3D <2>;
> +                       interrupt-controller;
> +                       #interrupt-cells =3D <2>;
> +               };
> +
