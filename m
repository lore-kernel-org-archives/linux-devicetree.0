From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH] arm64: dts: sdm845: Add video nodes
Date: Wed, 26 Jun 2019 14:32:40 -0700
Message-ID: <5d13e479.1c69fb81.dd08b.b1e4@mx.google.com>
References: <1561550047-19600-1-git-send-email-amasule@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1561550047-19600-1-git-send-email-amasule@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org, mark.rutland@arm.com, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, mgottam@codeaurora.org, vgarodia@codeaurora.org, Aniket Masule <amasule@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Quoting Aniket Masule (2019-06-26 04:54:07)
> This adds video nodes to sdm845 based on the examples
> in the bindings.
>=20
> Signed-off-by: Malathi Gottam <mgottam@codeaurora.org>

There should be a From: line with this person's name in the email if
they're the author. Otherwise this sign-off chain doesn't make sense and
it should most likely have a Co-developed-by tag instead.

> Signed-off-by: Aniket Masule <amasule@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/q=
com/sdm845.dtsi
> index fcb9330..ff94cfa 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -2437,6 +2437,36 @@
>                                 <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>;
>                         iommus =3D <&apps_smmu 0x0040 0x1>;
>                 };
> +
> +               video-codec@aa00000 {

This needs to be sorted by address. It doesn't come after 18800000 (the
address of the node above).

> +                       compatible =3D "qcom,sdm845-venus";
> +                       reg =3D <0x0aa00000 0xff000>;
> +                       interrupts =3D <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
