From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH] arm64: dts: msm: add PDC device bindings for sdm845
Date: Wed, 15 Aug 2018 08:28:02 -0700
Message-ID: <153434688280.37448.5200368407995060713@swboyd.mtv.corp.google.com>
References: <20180814173058.26143-1-ilina@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180814173058.26143-1-ilina@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, bjorn.andersson@linaro.org
Cc: marc.zyngier@arm.com, rplsssn@codeaurora.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, rnayak@codeaurora.org, devicetree@vger.kernel.org, david.brown@linaro.org, evgreen@chromium.org, dianders@chromium.org, Lina Iyer <ilina@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Quoting Lina Iyer (2018-08-14 10:30:58)
> Add PDC interrupt controller device bindings for SDM845.
> =

> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> =

> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/q=
com/sdm845.dtsi
> index 24e254efb9d1..399bfbd52c5b 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -1106,6 +1106,15 @@
>                         };
>                 };
>  =

> +               pdc: interrupt-controller@b220000 {

Please sort this by unit address within the SoC node.

> +                       compatible =3D "qcom,sdm845-pdc";
> +                       reg =3D <0xb220000 0x30000>;
> +                       qcom,pdc-ranges =3D <0 512 94>, <94 641 15>, <115=
 662 7>;
> +                       #interrupt-cells =3D <2>;
> +                       interrupt-parent =3D <&intc>;
> +                       interrupt-controller;
> +               };
> +
>                 timer@17c90000 {
>                         #address-cells =3D <1>;
>                         #size-cells =3D <1>;
