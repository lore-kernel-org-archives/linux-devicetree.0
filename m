From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 1/5] arm64: dts: qcom: sdm845: Add unit name to soc node
Date: Tue, 23 Jul 2019 07:50:05 -0700
Message-ID: <5d371e9d.1c69fb81.8d9f4.1ac0@mx.google.com>
References: <20190722123422.4571-1-vkoul@kernel.org> <20190722123422.4571-2-vkoul@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190722123422.4571-2-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Vinod Koul (2019-07-22 05:34:18)
> We get a warning about missing unit name for soc node, so add it.
>=20
> arch/arm64/boot/dts/qcom/sdm845.dtsi:623.11-2814.4: Warning (unit_address=
_vs_reg): /soc: node has a reg or ranges property, but no unit name
>=20
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/q=
com/sdm845.dtsi
> index 601cfb078bd5..e81f4a6d08ce 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -620,7 +620,7 @@
>                 method =3D "smc";
>         };
> =20
> -       soc: soc {
> +       soc: soc@0 {

This is kinda sad, but ok. Maybe you can apply this fix to at least all
the qcom boards then.

>                 #address-cells =3D <2>;
>                 #size-cells =3D <2>;
>                 ranges =3D <0 0 0 0 0x10 0>;
